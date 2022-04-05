" Vim syntax file for SIWE (Sign-In with Ethereum) messages
" Language: siwe
" Version: 1.0.0
" Maintainer: Charles E. Lehner <charles.lehner@spruceid.com>
" Last Change: 2022-03-30
"
" EIP-4361: Sign-In with Ethereum (SIWE): https://eips.ethereum.org/EIPS/eip-4361

if exists("b:current_syntax")
  finish
endif

syn match siweWantSignin '^[^ ]* wants you to sign in with your Ethereum account:\n' contains=siweDomain nextgroup=siweAddress
syn match siweDomain '^[^ ]*' contained
syn match siweAddress '^0x[a-fA-F0-9]*\n\n' contained nextgroup=siweStatement,siweURIKeyword
syn match siweStatement '.*\n\n' contained nextgroup=siweURIKeyword

syn match siweURIKeyword '^URI: ' contained nextgroup=siweURIValue
syn match siweURIValue '[^ ]*\n' contained nextgroup=siweVersionKeyword

syn match siweVersionKeyword '^Version: ' contained nextgroup=siweVersionValue
syn match siweVersionValue '\d*\n' contained nextgroup=siweChainIdKeyword

syn match siweChainIdKeyword '^Chain ID: ' contained nextgroup=siweChainIdValue
syn match siweChainIdValue '\d*\n' contained nextgroup=siweNonceKeyword

syn match siweNonceKeyword '^Nonce: ' contained nextgroup=siweNonceValue
syn match siweNonceValue '[a-zA-Z0-9]\{8,\}\n' contained nextgroup=siweIssuedAtKeyword

syn match siweIssuedAtKeyword '^Issued At: ' contained nextgroup=siweIssuedAtValue
syn match siweIssuedAtValue '\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d\d.*\n' contained nextgroup=siweExpirationTimeKeyword,siweNotBeforeKeyword,siweRequestIdKeyword,siweResourcesKeyword

" expiration-time, not-before, request-id, and resources
" are all optional but must occur in order.
syn match siweExpirationTimeKeyword '^Expiration Time: ' contained nextgroup=siweExpirationTimeValue
syn match siweExpirationTimeValue '\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d\d.*\n' contained nextgroup=siweNotBeforeKeyword,siweRequestIdKeyword,siweResourcesKeyword

syn match siweNotBeforeKeyword '^Not Before: ' contained nextgroup=siweNotBeforeValue
syn match siweNotBeforeValue '\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d\d.*\n' contained nextgroup=siweRequestIdKeyword,siweResourcesKeyword

syn match siweRequestIdKeyword '^Request ID: ' contained nextgroup=siweRequestIdValue
syn match siweRequestIdValue '.*\n' contained nextgroup=siweResourcesKeyword

syn match siweResourcesKeyword '^Resources:\n' contained nextgroup=siweResourceListItem
syn match siweResourceListItem '^- ' nextgroup=siweResource contained
syn match siweResource '.*\n' nextgroup=siweResourceListItem contained

hi def link siweWantSignin Constant
hi def link siweDomain Identifier
hi def link siweAddress Identifier
hi def link siweStatement String
hi def link siweURIKeyword Keyword
hi def link siweURIValue Identifier
hi def link siweVersionKeyword Keyword
hi def link siweVersionValue Number
hi def link siweChainIdKeyword Keyword
hi def link siweChainIdValue Number
hi def link siweNonceKeyword Keyword
hi def link siweNonceValue String
hi def link siweIssuedAtKeyword Keyword
hi def link siweIssuedAtValue String
hi def link siweExpirationTimeKeyword Keyword
hi def link siweExpirationTimeValue String
hi def link siweNotBeforeKeyword Keyword
hi def link siweNotBeforeValue String
hi def link siweRequestIdKeyword Keyword
hi def link siweRequestIdValue Identifier
hi def link siweResourcesKeyword Keyword
hi def link siweResourceListItem Operator
hi def link siweResource Identifier

let b:current_syntax = "siwe"
