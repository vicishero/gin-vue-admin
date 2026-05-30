package config

type Bsc struct {
	DefaultRpcUrl       string `mapstructure:"default-rpc-url" json:"defaultRpcUrl" yaml:"default-rpc-url"`
	ChainId             int    `mapstructure:"chain-id" json:"chainId" yaml:"chain-id"`
	SyncIntervalSeconds int    `mapstructure:"sync-interval-seconds" json:"syncIntervalSeconds" yaml:"sync-interval-seconds"`
}
