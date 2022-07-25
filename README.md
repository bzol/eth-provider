# Link to eth-provider grant
- https://urbit.org/grants/eth-provider

# Eth-provider Files
- desk/app/eth-provider.hoon
- desk/sur/eth-provider.hoon
- desk/ted/eth-provider.hoon
- desk/lib/eth-provider.hoon
- desk/mar/ethout.hoon

# Using these libraries:
- desk/lib/ethio.hoon
- desk/lib/ethereum.hoon

# How To Test

## Test Files
- ./geth.sh: starts ethereum node for testing
- ./desk/ted/tests/eth-provider.hoon: tests the eth-provider
- ./desk/ted/tests/integration.hoon: tests the integration of eth-provider to the codebase
- ./node: for generating transactions to test the send-txs integration point

## Test locally
- start eth-provider with `|rein %base [& %eth-provider]`
- set ethereum endpoint: `:eth-provider &provider-action [%set-local 'http://localhost:8545']`
- (optional) start local ethereum node `./geth.sh`
- run `-tests-integration ~` or `-tests-eth-provider ~`

## Testing client->provider

### Set ~zod up
- start eth-provider with `|rein %base [& %eth-provider]`
- set ~zod ship as client: `:eth-provider &provider-action [%set-client ~nut]`

### Set ~nut up
- create ~nut fake ship
- replace %base desk with ./desk folder
- start eth-provider with `|rein %base [& %eth-provider]`
-set ~nut ship as provider: `set :eth-provider &provider-action [%set-provider ['http://localhost:8545' %.n ~]]`

### Run
- run `-tests-integration ~` or `-tests-eth-provider ~` on ~zod


# Integration Point Files
## Integration Point Files : Integration Points in File, Integration Points Tested
## Files that have eth-provider integrations, and info on how many endpoints they have and how many of them are tested
- ted/eth/get-timestamps.hoon : 1,1
- ted/eth/get-tx-receipts.hoon : 1,1
- ted/eth/send-txs.hoon : 2,0
- ted/roller/send.hoon : 3,1
- ted/roller/nonce.hoon : 1,1
- ted/eth/read-contract.hoon : 1,1
- ted/claz/prep-command.hoon : 4,1
- ted/eth-watcher.hoon : 5 (2 deprecated),1

# Notes
- the send-txs integration test currently fails, probably because we are not sending the correct raw transaction 
- Certain integration points in some files are not reached when running the tests
