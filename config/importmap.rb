# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "bootstrap", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@solana/buffer-layout-utils", to: "https://ga.jspm.io/npm:@solana/buffer-layout-utils@0.2.0/lib/cjs/index.js"
pin "bignumber.js", to: "https://ga.jspm.io/npm:bignumber.js@9.1.1/bignumber.js"
pin "@solana/wallet-adapter-base", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-base@0.9.18/lib/esm/index.js"
pin "@solana/wallet-adapter-wallets", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-wallets@0.19.3/lib/esm/index.js"
pin "#build/esm/decodePacket.js", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/@empty.js"
pin "#build/esm/encodePacket.js", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/@empty.js"
pin "#build/esm/globalThis.js", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/@empty.js"
pin "#build/esm/transports/websocket-constructor.js", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/@empty.js"
pin "#build/esm/transports/xmlhttprequest.js", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/@empty.js"
pin "#esm/src/hashes/sha2.js", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/@empty.js"
pin "@apocentre/alias-sampling", to: "https://ga.jspm.io/npm:@apocentre/alias-sampling@0.5.3/index.js"
pin "@blocto/sdk", to: "https://ga.jspm.io/npm:@blocto/sdk@0.2.22/dist/blocto-sdk.umd.js"
pin "@fractalwagmi/popup-connection", to: "https://ga.jspm.io/npm:@fractalwagmi/popup-connection@1.0.13/dist/esm/index.js"
pin "@fractalwagmi/solana-wallet-adapter", to: "https://ga.jspm.io/npm:@fractalwagmi/solana-wallet-adapter@0.0.3/dist/esm/index.js"
pin "@jnwng/walletconnect-solana", to: "https://ga.jspm.io/npm:@jnwng/walletconnect-solana@0.1.4/lib/esm/index.js"
pin "@keystonehq/bc-ur-registry", to: "https://ga.jspm.io/npm:@keystonehq/bc-ur-registry@0.5.0/dist/index.js"
pin "@keystonehq/bc-ur-registry-sol", to: "https://ga.jspm.io/npm:@keystonehq/bc-ur-registry-sol@0.3.1/dist/index.js"
pin "@keystonehq/sdk", to: "https://ga.jspm.io/npm:@keystonehq/sdk@0.13.1/dist/index.js"
pin "@keystonehq/sol-keyring", to: "https://ga.jspm.io/npm:@keystonehq/sol-keyring@0.3.1/dist/index.js"
pin "@ledgerhq/devices", to: "https://ga.jspm.io/npm:@ledgerhq/devices@6.27.1/lib-es/index.js"
pin "@ledgerhq/devices/lib/hid-framing", to: "https://ga.jspm.io/npm:@ledgerhq/devices@6.27.1/lib/hid-framing.js"
pin "@ledgerhq/errors", to: "https://ga.jspm.io/npm:@ledgerhq/errors@6.10.0/lib-es/index.js"
pin "@ledgerhq/hw-transport", to: "https://ga.jspm.io/npm:@ledgerhq/hw-transport@6.27.1/lib-es/Transport.js"
pin "@ledgerhq/hw-transport-webhid", to: "https://ga.jspm.io/npm:@ledgerhq/hw-transport-webhid@6.27.1/lib-es/TransportWebHID.js"
pin "@ledgerhq/logs", to: "https://ga.jspm.io/npm:@ledgerhq/logs@6.10.0/lib-es/index.js"
pin "@ngraveio/bc-ur", to: "https://ga.jspm.io/npm:@ngraveio/bc-ur@1.1.6/dist/index.js"
pin "@particle-network/auth", to: "https://ga.jspm.io/npm:@particle-network/auth@0.5.6/lib/index.js"
pin "@particle-network/solana-wallet", to: "https://ga.jspm.io/npm:@particle-network/solana-wallet@0.5.6/lib/index.js"
pin "@project-serum/sol-wallet-adapter", to: "https://ga.jspm.io/npm:@project-serum/sol-wallet-adapter@0.2.6/dist/cjs/index.js"
pin "@socket.io/component-emitter", to: "https://ga.jspm.io/npm:@socket.io/component-emitter@3.1.0/index.mjs"
pin "@solana/wallet-adapter-alpha", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-alpha@0.1.5/lib/esm/index.js"
pin "@solana/wallet-adapter-avana", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-avana@0.1.8/lib/esm/index.js"
pin "@solana/wallet-adapter-backpack", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-backpack@0.1.9/lib/esm/index.js"
pin "@solana/wallet-adapter-bitkeep", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-bitkeep@0.3.14/lib/esm/index.js"
pin "@solana/wallet-adapter-bitpie", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-bitpie@0.5.13/lib/esm/index.js"
pin "@solana/wallet-adapter-blocto", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-blocto@0.5.17/lib/esm/index.js"
pin "@solana/wallet-adapter-brave", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-brave@0.1.12/lib/esm/index.js"
pin "@solana/wallet-adapter-clover", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-clover@0.4.14/lib/esm/index.js"
pin "@solana/wallet-adapter-coin98", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-coin98@0.5.15/lib/esm/index.js"
pin "@solana/wallet-adapter-coinbase", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-coinbase@0.1.13/lib/esm/index.js"
pin "@solana/wallet-adapter-coinhub", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-coinhub@0.3.13/lib/esm/index.js"
pin "@solana/wallet-adapter-exodus", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-exodus@0.1.13/lib/esm/index.js"
pin "@solana/wallet-adapter-fractal", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-fractal@0.1.1/lib/esm/index.js"
pin "@solana/wallet-adapter-glow", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-glow@0.1.13/lib/esm/index.js"
pin "@solana/wallet-adapter-huobi", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-huobi@0.1.10/lib/esm/index.js"
pin "@solana/wallet-adapter-hyperpay", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-hyperpay@0.1.9/lib/esm/index.js"
pin "@solana/wallet-adapter-keystone", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-keystone@0.1.7/lib/esm/index.js"
pin "@solana/wallet-adapter-krystal", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-krystal@0.1.7/lib/esm/index.js"
pin "@solana/wallet-adapter-ledger", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-ledger@0.9.20/lib/esm/index.js"
pin "@solana/wallet-adapter-mathwallet", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-mathwallet@0.9.13/lib/esm/index.js"
pin "@solana/wallet-adapter-neko", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-neko@0.2.7/lib/esm/index.js"
pin "@solana/wallet-adapter-nightly", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-nightly@0.1.10/lib/esm/index.js"
pin "@solana/wallet-adapter-nufi", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-nufi@0.1.11/lib/esm/index.js"
pin "@solana/wallet-adapter-onto", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-onto@0.1.2/lib/esm/index.js"
pin "@solana/wallet-adapter-particle", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-particle@0.1.5/lib/esm/index.js"
pin "@solana/wallet-adapter-phantom", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-phantom@0.9.17/lib/esm/index.js"
pin "@solana/wallet-adapter-safepal", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-safepal@0.5.13/lib/esm/index.js"
pin "@solana/wallet-adapter-saifu", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-saifu@0.1.10/lib/esm/index.js"
pin "@solana/wallet-adapter-salmon", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-salmon@0.1.9/lib/esm/index.js"
pin "@solana/wallet-adapter-sky", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-sky@0.1.10/lib/esm/index.js"
pin "@solana/wallet-adapter-slope", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-slope@0.5.16/lib/esm/index.js"
pin "@solana/wallet-adapter-solflare", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-solflare@0.6.18/lib/esm/index.js"
pin "@solana/wallet-adapter-sollet", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-sollet@0.11.12/lib/esm/index.js"
pin "@solana/wallet-adapter-solong", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-solong@0.9.13/lib/esm/index.js"
pin "@solana/wallet-adapter-spot", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-spot@0.1.10/lib/esm/index.js"
pin "@solana/wallet-adapter-strike", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-strike@0.1.7/lib/esm/index.js"
pin "@solana/wallet-adapter-tokenary", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-tokenary@0.1.7/lib/esm/index.js"
pin "@solana/wallet-adapter-tokenpocket", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-tokenpocket@0.4.14/lib/esm/index.js"
pin "@solana/wallet-adapter-torus", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-torus@0.11.23/lib/esm/index.js"
pin "@solana/wallet-adapter-trust", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-trust@0.1.8/lib/esm/index.js"
pin "@solana/wallet-adapter-unsafe-burner", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-unsafe-burner@0.1.2/lib/esm/index.js"
pin "@solana/wallet-adapter-walletconnect", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-walletconnect@0.1.7/lib/esm/index.js"
pin "@solana/wallet-adapter-xdefi", to: "https://ga.jspm.io/npm:@solana/wallet-adapter-xdefi@0.1.2/lib/esm/index.js"
pin "@solflare-wallet/sdk", to: "https://ga.jspm.io/npm:@solflare-wallet/sdk@1.1.0/lib/esm/index.js"
pin "@stablelib/binary", to: "https://ga.jspm.io/npm:@stablelib/binary@1.0.1/lib/binary.js"
pin "@stablelib/chacha", to: "https://ga.jspm.io/npm:@stablelib/chacha@1.0.1/lib/chacha.js"
pin "@stablelib/chacha20poly1305", to: "https://ga.jspm.io/npm:@stablelib/chacha20poly1305@1.0.1/lib/chacha20poly1305.js"
pin "@stablelib/constant-time", to: "https://ga.jspm.io/npm:@stablelib/constant-time@1.0.1/lib/constant-time.js"
pin "@stablelib/ed25519", to: "https://ga.jspm.io/npm:@stablelib/ed25519@1.0.3/lib/ed25519.js"
pin "@stablelib/hash", to: "https://ga.jspm.io/npm:@stablelib/hash@1.0.1/lib/hash.js"
pin "@stablelib/hkdf", to: "https://ga.jspm.io/npm:@stablelib/hkdf@1.0.1/lib/hkdf.js"
pin "@stablelib/hmac", to: "https://ga.jspm.io/npm:@stablelib/hmac@1.0.1/lib/hmac.js"
pin "@stablelib/int", to: "https://ga.jspm.io/npm:@stablelib/int@1.0.1/lib/int.js"
pin "@stablelib/poly1305", to: "https://ga.jspm.io/npm:@stablelib/poly1305@1.0.1/lib/poly1305.js"
pin "@stablelib/random", to: "https://ga.jspm.io/npm:@stablelib/random@1.0.1/lib/random.js"
pin "@stablelib/sha256", to: "https://ga.jspm.io/npm:@stablelib/sha256@1.0.1/lib/sha256.js"
pin "@stablelib/sha512", to: "https://ga.jspm.io/npm:@stablelib/sha512@1.0.1/lib/sha512.js"
pin "@stablelib/wipe", to: "https://ga.jspm.io/npm:@stablelib/wipe@1.0.1/lib/wipe.js"
pin "@stablelib/x25519", to: "https://ga.jspm.io/npm:@stablelib/x25519@1.0.2/lib/x25519.js"
pin "@strike-protocols/solana-wallet-adapter", to: "https://ga.jspm.io/npm:@strike-protocols/solana-wallet-adapter@0.1.7/lib/esm/index.mjs"
pin "@toruslabs/base-controllers", to: "https://ga.jspm.io/npm:@toruslabs/base-controllers@2.2.6/dist/baseControllers.esm.js"
pin "@toruslabs/broadcast-channel", to: "https://ga.jspm.io/npm:@toruslabs/broadcast-channel@6.1.0/dist/esbrowser/index.js"
pin "@toruslabs/eccrypto", to: "https://ga.jspm.io/npm:@toruslabs/eccrypto@1.1.8/browser.js"
pin "@toruslabs/http-helpers", to: "https://ga.jspm.io/npm:@toruslabs/http-helpers@3.2.0/dist/httpHelpers.esm.js"
pin "@toruslabs/metadata-helpers", to: "https://ga.jspm.io/npm:@toruslabs/metadata-helpers@3.0.0/dist/metadataHelpers.esm.js"
pin "@toruslabs/openlogin-jrpc", to: "https://ga.jspm.io/npm:@toruslabs/openlogin-jrpc@2.6.0/dist/openloginJrpc.esm.js"
pin "@toruslabs/openlogin-utils", to: "https://ga.jspm.io/npm:@toruslabs/openlogin-utils@2.1.0/dist/openloginUtils.esm.js"
pin "@toruslabs/solana-embed", to: "https://ga.jspm.io/npm:@toruslabs/solana-embed@0.3.0/dist/solanaEmbed.esm.js"
pin "@walletconnect/browser-utils", to: "https://ga.jspm.io/npm:@walletconnect/browser-utils@1.8.0/dist/esm/index.js"
pin "@walletconnect/core", to: "https://ga.jspm.io/npm:@walletconnect/core@2.0.0-rc.3/dist/index.es.js"
pin "@walletconnect/environment", to: "https://ga.jspm.io/npm:@walletconnect/environment@1.0.0/dist/cjs/index.js"
pin "@walletconnect/events", to: "https://ga.jspm.io/npm:@walletconnect/events@1.0.0/dist/esm/index.js"
pin "@walletconnect/heartbeat", to: "https://ga.jspm.io/npm:@walletconnect/heartbeat@1.0.0/dist/cjs/index.js"
pin "@walletconnect/jsonrpc-provider", to: "https://ga.jspm.io/npm:@walletconnect/jsonrpc-provider@1.0.5/dist/esm/index.js"
pin "@walletconnect/jsonrpc-types", to: "https://ga.jspm.io/npm:@walletconnect/jsonrpc-types@1.0.1/dist/esm/index.js"
pin "@walletconnect/jsonrpc-utils", to: "https://ga.jspm.io/npm:@walletconnect/jsonrpc-utils@1.0.3/dist/esm/index.js"
pin "@walletconnect/jsonrpc-ws-connection", to: "https://ga.jspm.io/npm:@walletconnect/jsonrpc-ws-connection@1.0.3/dist/esm/index.js"
pin "@walletconnect/keyvaluestorage", to: "https://ga.jspm.io/npm:@walletconnect/keyvaluestorage@1.0.0/dist/cjs/browser/index.js"
pin "@walletconnect/logger", to: "https://ga.jspm.io/npm:@walletconnect/logger@1.0.1/dist/cjs/index.js"
pin "@walletconnect/qrcode-modal", to: "https://ga.jspm.io/npm:@walletconnect/qrcode-modal@1.8.0/dist/cjs/index.js"
pin "@walletconnect/relay-api", to: "https://ga.jspm.io/npm:@walletconnect/relay-api@1.0.6/dist/esm/index.js"
pin "@walletconnect/relay-auth", to: "https://ga.jspm.io/npm:@walletconnect/relay-auth@1.0.3/dist/esm/index.js"
pin "@walletconnect/safe-json", to: "https://ga.jspm.io/npm:@walletconnect/safe-json@1.0.0/dist/esm/index.js"
pin "@walletconnect/sign-client", to: "https://ga.jspm.io/npm:@walletconnect/sign-client@2.0.0-rc.3/dist/index.es.js"
pin "@walletconnect/time", to: "https://ga.jspm.io/npm:@walletconnect/time@1.0.1/dist/cjs/index.js"
pin "@walletconnect/types", to: "https://ga.jspm.io/npm:@walletconnect/types@2.0.0-rc.3/dist/index.es.js"
pin "@walletconnect/utils", to: "https://ga.jspm.io/npm:@walletconnect/utils@2.0.0-rc.3/dist/index.es.js"
pin "@walletconnect/window-getters", to: "https://ga.jspm.io/npm:@walletconnect/window-getters@1.0.0/dist/cjs/index.js"
pin "@walletconnect/window-metadata", to: "https://ga.jspm.io/npm:@walletconnect/window-metadata@1.0.0/dist/cjs/index.js"
pin "assert", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/assert.js"
pin "base64url", to: "https://ga.jspm.io/npm:base64url@3.0.1/index.js"
pin "bowser", to: "https://ga.jspm.io/npm:bowser@2.11.0/es5.js"
pin "brorand", to: "https://ga.jspm.io/npm:brorand@1.1.0/index.js"
pin "bs58check", to: "https://ga.jspm.io/npm:bs58check@2.1.2/index.js"
pin "cbor-sync", to: "https://ga.jspm.io/npm:cbor-sync@1.0.4/main.js"
pin "cipher-base", to: "https://ga.jspm.io/npm:cipher-base@1.0.4/index.js"
pin "copy-to-clipboard", to: "https://ga.jspm.io/npm:copy-to-clipboard@3.3.2/index.js"
pin "crc", to: "https://ga.jspm.io/npm:crc@3.8.0/lib/index.js"
pin "create-hash", to: "https://ga.jspm.io/npm:create-hash@1.2.0/browser.js"
pin "crypto-js", to: "https://ga.jspm.io/npm:crypto-js@4.1.1/index.js"
pin "decode-uri-component", to: "https://ga.jspm.io/npm:decode-uri-component@0.2.0/index.js"
pin "detect-browser", to: "https://ga.jspm.io/npm:detect-browser@5.3.0/es/index.js"
pin "dijkstrajs", to: "https://ga.jspm.io/npm:dijkstrajs@1.0.2/dijkstra.js"
pin "elliptic", to: "https://ga.jspm.io/npm:elliptic@6.5.4/lib/elliptic.js"
pin "end-of-stream", to: "https://ga.jspm.io/npm:end-of-stream@1.4.4/index.js"
pin "engine.io-client", to: "https://ga.jspm.io/npm:engine.io-client@6.2.3/build/esm/index.js"
pin "engine.io-parser", to: "https://ga.jspm.io/npm:engine.io-parser@5.0.4/build/esm/index.js"
pin "eth-rpc-errors", to: "https://ga.jspm.io/npm:eth-rpc-errors@4.0.2/dist/index.js"
pin "ethereum-cryptography/keccak", to: "https://ga.jspm.io/npm:ethereum-cryptography@0.1.3/keccak.js"
pin "ethereum-cryptography/secp256k1", to: "https://ga.jspm.io/npm:ethereum-cryptography@0.1.3/secp256k1.js"
pin "ethereumjs-util", to: "https://ga.jspm.io/npm:ethereumjs-util@7.1.5/dist.browser/index.js"
pin "events", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/events.js"
pin "exenv", to: "https://ga.jspm.io/npm:exenv@1.2.2/index.js"
pin "fast-deep-equal", to: "https://ga.jspm.io/npm:fast-deep-equal@3.1.3/index.js"
pin "fast-safe-stringify", to: "https://ga.jspm.io/npm:fast-safe-stringify@2.1.1/index.js"
pin "filter-obj", to: "https://ga.jspm.io/npm:filter-obj@1.1.0/index.js"
pin "fs", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/fs.js"
pin "hash-base", to: "https://ga.jspm.io/npm:hash-base@3.1.0/index.js"
pin "hash.js", to: "https://ga.jspm.io/npm:hash.js@1.1.7/lib/hash.js"
pin "hmac-drbg", to: "https://ga.jspm.io/npm:hmac-drbg@1.0.1/lib/hmac-drbg.js"
pin "inherits", to: "https://ga.jspm.io/npm:inherits@2.0.4/inherits_browser.js"
pin "is-stream", to: "https://ga.jspm.io/npm:is-stream@2.0.1/index.js"
pin "isarray", to: "https://ga.jspm.io/npm:isarray@2.0.5/index.js"
pin "jsbi", to: "https://ga.jspm.io/npm:jsbi@3.2.5/dist/jsbi-umd.js"
pin "json-rpc-random-id", to: "https://ga.jspm.io/npm:json-rpc-random-id@1.0.1/index.js"
pin "json-stable-stringify", to: "https://ga.jspm.io/npm:json-stable-stringify@1.0.1/index.js"
pin "jsonify", to: "https://ga.jspm.io/npm:jsonify@0.0.1/index.js"
pin "keccak", to: "https://ga.jspm.io/npm:keccak@3.0.2/js.js"
pin "localStorage", to: "https://ga.jspm.io/npm:localStorage@1.0.4/lib/localStorage.js"
pin "lodash", to: "https://ga.jspm.io/npm:lodash@4.17.21/lodash.js"
pin "lodash.isequal", to: "https://ga.jspm.io/npm:lodash.isequal@4.5.0/index.js"
pin "lodash.merge", to: "https://ga.jspm.io/npm:lodash.merge@4.6.2/index.js"
pin "loglevel", to: "https://ga.jspm.io/npm:loglevel@1.8.0/lib/loglevel.js"
pin "lru-cache", to: "https://ga.jspm.io/npm:lru-cache@5.1.1/index.js"
pin "md5.js", to: "https://ga.jspm.io/npm:md5.js@1.3.5/index.js"
pin "minimalistic-assert", to: "https://ga.jspm.io/npm:minimalistic-assert@1.0.1/index.js"
pin "minimalistic-crypto-utils", to: "https://ga.jspm.io/npm:minimalistic-crypto-utils@1.0.1/lib/utils.js"
pin "multiformats/basics", to: "https://ga.jspm.io/npm:multiformats@9.9.0/esm/src/basics.js"
pin "object-assign", to: "https://ga.jspm.io/npm:object-assign@4.1.1/index.js"
pin "oblivious-set", to: "https://ga.jspm.io/npm:oblivious-set@1.1.1/dist/es/index.js"
pin "once", to: "https://ga.jspm.io/npm:once@1.4.0/once.js"
pin "pino", to: "https://ga.jspm.io/npm:pino@6.7.0/browser.js"
pin "preact", to: "https://ga.jspm.io/npm:preact@10.4.1/dist/preact.module.js"
pin "preact/compat", to: "https://ga.jspm.io/npm:preact@10.4.1/compat/dist/compat.module.js"
pin "preact/hooks", to: "https://ga.jspm.io/npm:preact@10.4.1/hooks/dist/hooks.module.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/process-production.js"
pin "prop-types", to: "https://ga.jspm.io/npm:prop-types@15.8.1/index.js"
pin "pump", to: "https://ga.jspm.io/npm:pump@3.0.0/index.js"
pin "qr.js/lib/ErrorCorrectLevel", to: "https://ga.jspm.io/npm:qr.js@0.0.0/lib/ErrorCorrectLevel.js"
pin "qr.js/lib/QRCode", to: "https://ga.jspm.io/npm:qr.js@0.0.0/lib/QRCode.js"
pin "qrcode", to: "https://ga.jspm.io/npm:qrcode@1.4.4/lib/browser.js"
pin "qrcode.react", to: "https://ga.jspm.io/npm:qrcode.react@1.0.1/lib/index.js"
pin "qrcode/lib/utils/buffer.js", to: "https://ga.jspm.io/npm:qrcode@1.4.4/lib/utils/typedarray-buffer.js"
pin "query-string", to: "https://ga.jspm.io/npm:query-string@7.1.1/index.js"
pin "quick-format-unescaped", to: "https://ga.jspm.io/npm:quick-format-unescaped@4.0.4/index.js"
pin "randombytes", to: "https://ga.jspm.io/npm:randombytes@2.1.0/browser.js"
pin "react", to: "https://ga.jspm.io/npm:react@16.13.1/index.js"
pin "react-dom", to: "https://ga.jspm.io/npm:react-dom@16.13.1/index.js"
pin "react-lifecycles-compat", to: "https://ga.jspm.io/npm:react-lifecycles-compat@3.0.4/react-lifecycles-compat.cjs.js"
pin "react-modal", to: "https://ga.jspm.io/npm:react-modal@3.16.1/lib/index.js"
pin "react-qr-reader", to: "https://ga.jspm.io/npm:react-qr-reader@2.2.1/lib/index.js"
pin "readable-stream", to: "https://ga.jspm.io/npm:readable-stream@3.6.0/readable-browser.js"
pin "readable-stream/lib/internal/streams/from.js", to: "https://ga.jspm.io/npm:readable-stream@3.6.0/lib/internal/streams/from-browser.js"
pin "readable-stream/lib/internal/streams/stream.js", to: "https://ga.jspm.io/npm:readable-stream@3.6.0/lib/internal/streams/stream-browser.js"
pin "ripemd160", to: "https://ga.jspm.io/npm:ripemd160@2.0.2/index.js"
pin "rlp", to: "https://ga.jspm.io/npm:rlp@2.2.7/dist.browser/index.js"
pin "rtcpeerconnection-shim", to: "https://ga.jspm.io/npm:rtcpeerconnection-shim@1.2.15/rtcpeerconnection.js"
pin "rxjs", to: "https://ga.jspm.io/npm:rxjs@6.6.7/index.js"
pin "safe-json-utils", to: "https://ga.jspm.io/npm:safe-json-utils@1.1.1/dist/cjs/index.js"
pin "salmon-adapter-sdk", to: "https://ga.jspm.io/npm:salmon-adapter-sdk@1.1.0/lib/esm/index.js"
pin "scheduler", to: "https://ga.jspm.io/npm:scheduler@0.19.1/index.js"
pin "sdp", to: "https://ga.jspm.io/npm:sdp@2.12.0/sdp.js"
pin "secp256k1", to: "https://ga.jspm.io/npm:secp256k1@4.0.3/elliptic.js"
pin "semver", to: "https://ga.jspm.io/npm:semver@6.3.0/semver.js"
pin "sha.js", to: "https://ga.jspm.io/npm:sha.js@2.4.11/index.js"
pin "socket.io-client", to: "https://ga.jspm.io/npm:socket.io-client@4.5.3/build/esm/index.js"
pin "socket.io-parser", to: "https://ga.jspm.io/npm:socket.io-parser@4.2.1/build/esm/index.js"
pin "split-on-first", to: "https://ga.jspm.io/npm:split-on-first@1.1.0/index.js"
pin "stream", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/stream.js"
pin "strict-uri-encode", to: "https://ga.jspm.io/npm:strict-uri-encode@2.0.0/index.js"
pin "string_decoder", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/string_decoder.js"
pin "toggle-selection", to: "https://ga.jspm.io/npm:toggle-selection@1.0.6/index.js"
pin "tslib", to: "https://ga.jspm.io/npm:tslib@2.4.0/tslib.es6.js"
pin "uint8arrays", to: "https://ga.jspm.io/npm:uint8arrays@3.1.0/esm/src/index.js"
pin "uint8arrays/concat", to: "https://ga.jspm.io/npm:uint8arrays@3.1.0/esm/src/concat.js"
pin "uint8arrays/from-string", to: "https://ga.jspm.io/npm:uint8arrays@3.1.0/esm/src/from-string.js"
pin "uint8arrays/to-string", to: "https://ga.jspm.io/npm:uint8arrays@3.1.0/esm/src/to-string.js"
pin "util", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/util.js"
pin "util-deprecate", to: "https://ga.jspm.io/npm:util-deprecate@1.0.2/browser.js"
pin "warning", to: "https://ga.jspm.io/npm:warning@4.0.3/warning.js"
pin "webrtc-adapter", to: "https://ga.jspm.io/npm:webrtc-adapter@7.7.1/dist/adapter_core.js"
pin "wrappy", to: "https://ga.jspm.io/npm:wrappy@1.0.2/wrappy.js"
pin "yallist", to: "https://ga.jspm.io/npm:yallist@3.1.1/yallist.js"
pin "@solana/web3.js", to: "https://ga.jspm.io/npm:@solana/web3.js@1.73.0/lib/index.browser.esm.js"
pin "@babel/runtime/helpers/asyncToGenerator", to: "https://ga.jspm.io/npm:@babel/runtime@7.20.7/helpers/asyncToGenerator.js"
pin "@babel/runtime/helpers/classCallCheck", to: "https://ga.jspm.io/npm:@babel/runtime@7.20.7/helpers/classCallCheck.js"
pin "@babel/runtime/helpers/createClass", to: "https://ga.jspm.io/npm:@babel/runtime@7.20.7/helpers/createClass.js"
pin "@babel/runtime/helpers/getPrototypeOf", to: "https://ga.jspm.io/npm:@babel/runtime@7.20.7/helpers/getPrototypeOf.js"
pin "@babel/runtime/helpers/inherits", to: "https://ga.jspm.io/npm:@babel/runtime@7.20.7/helpers/inherits.js"
pin "@babel/runtime/helpers/interopRequireDefault", to: "https://ga.jspm.io/npm:@babel/runtime@7.20.7/helpers/interopRequireDefault.js"
pin "@babel/runtime/helpers/possibleConstructorReturn", to: "https://ga.jspm.io/npm:@babel/runtime@7.20.7/helpers/possibleConstructorReturn.js"
pin "@babel/runtime/helpers/typeof", to: "https://ga.jspm.io/npm:@babel/runtime@7.20.7/helpers/typeof.js"
pin "@babel/runtime/regenerator", to: "https://ga.jspm.io/npm:@babel/runtime@7.20.7/regenerator/index.js"
pin "@noble/ed25519", to: "https://ga.jspm.io/npm:@noble/ed25519@1.7.1/lib/esm/index.js"
pin "@noble/hashes/crypto", to: "https://ga.jspm.io/npm:@noble/hashes@1.1.5/esm/cryptoBrowser.js"
pin "@noble/hashes/hmac", to: "https://ga.jspm.io/npm:@noble/hashes@1.1.5/esm/hmac.js"
pin "@noble/hashes/sha256", to: "https://ga.jspm.io/npm:@noble/hashes@1.1.5/esm/sha256.js"
pin "@noble/hashes/sha3", to: "https://ga.jspm.io/npm:@noble/hashes@1.1.5/esm/sha3.js"
pin "@noble/hashes/sha512", to: "https://ga.jspm.io/npm:@noble/hashes@1.1.5/esm/sha512.js"
pin "@noble/secp256k1", to: "https://ga.jspm.io/npm:@noble/secp256k1@1.7.0/lib/esm/index.js"
pin "@solana/buffer-layout", to: "https://ga.jspm.io/npm:@solana/buffer-layout@4.0.1/lib/Layout.js"
pin "base-x", to: "https://ga.jspm.io/npm:base-x@3.0.9/src/index.js"
pin "base64-js", to: "https://ga.jspm.io/npm:base64-js@1.5.1/index.js"
pin "bigint-buffer", to: "https://ga.jspm.io/npm:bigint-buffer@1.1.5/dist/browser.js"
pin "bn.js", to: "https://ga.jspm.io/npm:bn.js@5.2.1/lib/bn.js"
pin "borsh", to: "https://ga.jspm.io/npm:borsh@0.7.0/lib/index.js"
pin "bs58", to: "https://ga.jspm.io/npm:bs58@4.0.1/index.js"
pin "buffer", to: "https://ga.jspm.io/npm:buffer@6.0.1/index.js"
pin "crypto", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/crypto.js"
pin "eventemitter3", to: "https://ga.jspm.io/npm:eventemitter3@4.0.7/index.js"
pin "ieee754", to: "https://ga.jspm.io/npm:ieee754@1.2.1/index.js"
pin "jayson/lib/client/browser", to: "https://ga.jspm.io/npm:jayson@3.7.0/lib/client/browser/index.js"
pin "rpc-websockets", to: "https://ga.jspm.io/npm:rpc-websockets@7.5.0/dist/index.browser.js"
pin "safe-buffer", to: "https://ga.jspm.io/npm:safe-buffer@5.2.1/index.js"
pin "superstruct", to: "https://ga.jspm.io/npm:superstruct@0.14.2/lib/index.es.js"
pin "text-encoding-utf-8", to: "https://ga.jspm.io/npm:text-encoding-utf-8@1.0.2/lib/encoding.lib.js"
pin "uuid", to: "https://ga.jspm.io/npm:uuid@8.3.2/dist/esm-browser/index.js"
pin "@babel/core", to: "https://ga.jspm.io/npm:@babel/core@7.20.7/lib/index.js"
pin "#lib/config/files/index.js", to: "https://ga.jspm.io/npm:@babel/core@7.20.7/lib/config/files/index-browser.js"
pin "#lib/config/resolve-targets.js", to: "https://ga.jspm.io/npm:@babel/core@7.20.7/lib/config/resolve-targets-browser.js"
pin "#lib/transform-file.js", to: "https://ga.jspm.io/npm:@babel/core@7.20.7/lib/transform-file-browser.js"
pin "#node.js", to: "https://ga.jspm.io/npm:browserslist@4.21.4/browser.js"
pin "@ampproject/remapping", to: "https://ga.jspm.io/npm:@ampproject/remapping@2.2.0/dist/remapping.mjs"
pin "@babel/code-frame", to: "https://ga.jspm.io/npm:@babel/code-frame@7.18.6/lib/index.js"
pin "@babel/compat-data/native-modules", to: "https://ga.jspm.io/npm:@babel/compat-data@7.20.10/native-modules.js"
pin "@babel/compat-data/plugins", to: "https://ga.jspm.io/npm:@babel/compat-data@7.20.10/plugins.js"
pin "@babel/generator", to: "https://ga.jspm.io/npm:@babel/generator@7.20.7/lib/index.js"
pin "@babel/helper-compilation-targets", to: "https://ga.jspm.io/npm:@babel/helper-compilation-targets@7.20.7/lib/index.js"
pin "@babel/helper-environment-visitor", to: "https://ga.jspm.io/npm:@babel/helper-environment-visitor@7.18.9/lib/index.js"
pin "@babel/helper-function-name", to: "https://ga.jspm.io/npm:@babel/helper-function-name@7.19.0/lib/index.js"
pin "@babel/helper-hoist-variables", to: "https://ga.jspm.io/npm:@babel/helper-hoist-variables@7.18.6/lib/index.js"
pin "@babel/helper-module-imports", to: "https://ga.jspm.io/npm:@babel/helper-module-imports@7.18.6/lib/index.js"
pin "@babel/helper-module-transforms", to: "https://ga.jspm.io/npm:@babel/helper-module-transforms@7.20.11/lib/index.js"
pin "@babel/helper-simple-access", to: "https://ga.jspm.io/npm:@babel/helper-simple-access@7.20.2/lib/index.js"
pin "@babel/helper-split-export-declaration", to: "https://ga.jspm.io/npm:@babel/helper-split-export-declaration@7.18.6/lib/index.js"
pin "@babel/helper-string-parser", to: "https://ga.jspm.io/npm:@babel/helper-string-parser@7.19.4/lib/index.js"
pin "@babel/helper-validator-identifier", to: "https://ga.jspm.io/npm:@babel/helper-validator-identifier@7.19.1/lib/index.js"
pin "@babel/helper-validator-option", to: "https://ga.jspm.io/npm:@babel/helper-validator-option@7.18.6/lib/index.js"
pin "@babel/helpers", to: "https://ga.jspm.io/npm:@babel/helpers@7.20.7/lib/index.js"
pin "@babel/highlight", to: "https://ga.jspm.io/npm:@babel/highlight@7.18.6/lib/index.js"
pin "@babel/parser", to: "https://ga.jspm.io/npm:@babel/parser@7.20.7/lib/index.js"
pin "@babel/template", to: "https://ga.jspm.io/npm:@babel/template@7.20.7/lib/index.js"
pin "@babel/traverse", to: "https://ga.jspm.io/npm:@babel/traverse@7.20.10/lib/index.js"
pin "@babel/types", to: "https://ga.jspm.io/npm:@babel/types@7.20.7/lib/index.js"
pin "@jridgewell/gen-mapping", to: "https://ga.jspm.io/npm:@jridgewell/gen-mapping@0.1.1/dist/gen-mapping.umd.js"
pin "@jridgewell/resolve-uri", to: "https://ga.jspm.io/npm:@jridgewell/resolve-uri@3.1.0/dist/resolve-uri.umd.js"
pin "@jridgewell/set-array", to: "https://ga.jspm.io/npm:@jridgewell/set-array@1.1.2/dist/set-array.umd.js"
pin "@jridgewell/sourcemap-codec", to: "https://ga.jspm.io/npm:@jridgewell/sourcemap-codec@1.4.14/dist/sourcemap-codec.umd.js"
pin "@jridgewell/trace-mapping", to: "https://ga.jspm.io/npm:@jridgewell/trace-mapping@0.3.17/dist/trace-mapping.umd.js"
pin "ansi-styles", to: "https://ga.jspm.io/npm:ansi-styles@3.2.1/index.js"
pin "browserslist", to: "https://ga.jspm.io/npm:browserslist@4.21.4/index.js"
pin "caniuse-lite/dist/unpacker/agents", to: "https://ga.jspm.io/npm:caniuse-lite@1.0.30001441/dist/unpacker/agents.js"
pin "chalk", to: "https://ga.jspm.io/npm:chalk@2.4.2/index.js"
pin "color-convert", to: "https://ga.jspm.io/npm:color-convert@1.9.3/index.js"
pin "color-name", to: "https://ga.jspm.io/npm:color-name@1.1.3/index.js"
pin "convert-source-map", to: "https://ga.jspm.io/npm:convert-source-map@1.9.0/index.js"
pin "debug", to: "https://ga.jspm.io/npm:debug@4.3.4/src/browser.js"
pin "electron-to-chromium/versions", to: "https://ga.jspm.io/npm:electron-to-chromium@1.4.284/versions.js"
pin "escape-string-regexp", to: "https://ga.jspm.io/npm:escape-string-regexp@1.0.5/index.js"
pin "gensync", to: "https://ga.jspm.io/npm:gensync@1.0.0-beta.2/index.js"
pin "globals", to: "https://ga.jspm.io/npm:globals@11.12.0/index.js"
pin "js-tokens", to: "https://ga.jspm.io/npm:js-tokens@4.0.0/index.js"
pin "jsesc", to: "https://ga.jspm.io/npm:jsesc@2.5.2/jsesc.js"
pin "ms", to: "https://ga.jspm.io/npm:ms@2.1.2/index.js"
pin "node-releases/data/processed/envs.json", to: "https://ga.jspm.io/npm:node-releases@2.0.8/data/processed/envs.json.js"
pin "node-releases/data/release-schedule/release-schedule.json", to: "https://ga.jspm.io/npm:node-releases@2.0.8/data/release-schedule/release-schedule.json.js"
pin "path", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/path.js"
pin "supports-color", to: "https://ga.jspm.io/npm:supports-color@5.5.0/browser.js"
pin "to-fast-properties", to: "https://ga.jspm.io/npm:to-fast-properties@2.0.0/index.js"
pin "@solana/spl-token", to: "https://ga.jspm.io/npm:@solana/spl-token@0.1.8/lib/index.browser.esm.js"
pin "@metaplex-foundation/mpl-token-metadata", to: "https://ga.jspm.io/npm:@metaplex-foundation/mpl-token-metadata@2.5.2/dist/src/mpl-token-metadata.js"
pin "@metaplex-foundation/beet", to: "https://ga.jspm.io/npm:@metaplex-foundation/beet@0.7.1/dist/cjs/src/beet.js"
pin "@metaplex-foundation/beet-solana", to: "https://ga.jspm.io/npm:@metaplex-foundation/beet-solana@0.4.0/dist/cjs/src/beet-solana.js"
pin "@metaplex-foundation/cusper", to: "https://ga.jspm.io/npm:@metaplex-foundation/cusper@0.0.2/dist/src/cusper.js"
pin "ansicolors", to: "https://ga.jspm.io/npm:ansicolors@0.3.2/ansicolors.js"
pin "@metaplex-foundation/mpl-core", to: "https://ga.jspm.io/npm:@metaplex-foundation/mpl-core@0.6.1/dist/src/mpl-core.js"
pin "@metaplex-foundation/mpl-candy-machine", to: "https://ga.jspm.io/npm:@metaplex-foundation/mpl-candy-machine@5.0.0/dist/src/mpl-candy-machine.js"
pin "@project-serum/anchor", to: "https://ga.jspm.io/npm:@project-serum/anchor@0.26.0/dist/browser/index.js"
pin "@coral-xyz/borsh", to: "https://ga.jspm.io/npm:@coral-xyz/borsh@0.26.0/dist/index.js"
pin "buffer-layout", to: "https://ga.jspm.io/npm:buffer-layout@1.2.2/lib/Layout.js"
pin "camelcase", to: "https://ga.jspm.io/npm:camelcase@6.3.0/index.js"
pin "js-sha256", to: "https://ga.jspm.io/npm:js-sha256@0.9.0/src/sha256.js"
pin "pako", to: "https://ga.jspm.io/npm:pako@2.1.0/dist/pako.esm.mjs"
pin "@babel/runtime/helpers/defineProperty", to: "https://ga.jspm.io/npm:@babel/runtime@7.20.7/helpers/esm/defineProperty.js"
