module github.com/traefik/plugindemowasm-http-call

go 1.22.3

toolchain go1.22.4

require (
	github.com/http-wasm/http-wasm-guest-tinygo v0.4.0
	github.com/stealthrocket/net v0.2.1
)

replace github.com/http-wasm/http-wasm-guest-tinygo => github.com/traefik/http-wasm-guest-tinygo v0.0.0-20240913140402-af96219ffea5
