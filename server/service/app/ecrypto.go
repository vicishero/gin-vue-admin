package app

import (
	"math/big"
	"strings"

	"github.com/ethereum/go-ethereum/crypto"
)

func ecRecover(message, signatureHex string) (string, error) {
	sig := strings.TrimPrefix(signatureHex, "0x")
	sigBytes, err := hexToBytes(sig)
	if err != nil || len(sigBytes) != 65 {
		return "", err
	}

	// go-ethereum SigToPub expects recovery id 0-3; ethers.js returns 27/28
	if sigBytes[64] >= 27 {
		sigBytes[64] -= 27
	}

	msgHash := eip191Hash(message)

	pubKey, err := crypto.SigToPub(msgHash, sigBytes)
	if err != nil {
		return "", err
	}

	return crypto.PubkeyToAddress(*pubKey).Hex(), nil
}

func eip191Hash(message string) []byte {
	prefix := "\x19Ethereum Signed Message:\n" + itoa(len(message))
	data := append([]byte(prefix), []byte(message)...)
	return crypto.Keccak256Hash(data).Bytes()
}

func hexToBytes(hex string) ([]byte, error) {
	hex = strings.TrimPrefix(hex, "0x")
	bytes := make([]byte, len(hex)/2)
	for i := 0; i < len(hex); i += 2 {
		b := new(big.Int)
		_, ok := b.SetString(hex[i:i+2], 16)
		if !ok {
			return nil, errInvalidHex
		}
		bytes[i/2] = byte(b.Int64())
	}
	return bytes, nil
}

func itoa(n int) string {
	if n == 0 {
		return "0"
	}
	digits := "0123456789"
	result := ""
	for n > 0 {
		result = string(digits[n%10]) + result
		n /= 10
	}
	return result
}

type errStr string

func (e errStr) Error() string { return string(e) }

var errInvalidHex = errStr("invalid hex string")
