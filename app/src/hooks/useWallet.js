import { useState, useCallback, useEffect } from 'react';
import { ethers } from 'ethers';

const BSC_MAINNET = {
  chainId: '0x38',
  chainName: 'BNB Smart Chain',
  nativeCurrency: { name: 'BNB', symbol: 'BNB', decimals: 18 },
  rpcUrls: ['https://bsc-dataseed.binance.org/'],
  blockExplorerUrls: ['https://bscscan.com/'],
};

export function useWallet() {
  const [account, setAccount] = useState(null);
  const [connecting, setConnecting] = useState(false);

  const getSigner = useCallback(async () => {
    if (!window.ethereum) return null;
    const provider = new ethers.BrowserProvider(window.ethereum);
    return provider.getSigner();
  }, []);

  const signMessage = useCallback(async (message) => {
    const signer = await getSigner();
    if (!signer) throw new Error('Wallet not connected');
    return signer.signMessage(message);
  }, [getSigner]);

  const connectWallet = useCallback(async () => {
    if (!window.ethereum) {
      alert('Please install MetaMask or a BSC-compatible wallet');
      return null;
    }

    setConnecting(true);
    try {
      const accounts = await window.ethereum.request({
        method: 'eth_requestAccounts',
      });

      try {
        await window.ethereum.request({
          method: 'wallet_switchEthereumChain',
          params: [{ chainId: BSC_MAINNET.chainId }],
        });
      } catch (switchError) {
        if (switchError.code === 4902) {
          await window.ethereum.request({
            method: 'wallet_addEthereumChain',
            params: [BSC_MAINNET],
          });
        }
      }

      setAccount(accounts[0]);
      localStorage.setItem('walletAccount', accounts[0]);
      return accounts[0];
    } catch (err) {
      console.error('Wallet connection failed:', err);
      return null;
    } finally {
      setConnecting(false);
    }
  }, []);

  const disconnectWallet = useCallback(() => {
    setAccount(null);
    localStorage.removeItem('walletAccount');
  }, []);

  useEffect(() => {
    const saved = localStorage.getItem('walletAccount');
    if (saved) setAccount(saved);

    if (window.ethereum) {
      const handleAccountsChanged = (accounts) => {
        if (accounts.length === 0) {
          disconnectWallet();
        } else {
          setAccount(accounts[0]);
          localStorage.setItem('walletAccount', accounts[0]);
        }
      };

      window.ethereum.on('accountsChanged', handleAccountsChanged);
      return () => {
        window.ethereum.removeListener('accountsChanged', handleAccountsChanged);
      };
    }
  }, [disconnectWallet]);

  return { account, connecting, connectWallet, disconnectWallet, signMessage };
}
