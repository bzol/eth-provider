# My Files:
- desk/app/eth-provider.hoon
- desk/sur/eth-provider.hoon
- desk/ted/eth-provider.hoon
- desk/lib/eth-provider.hoon


# Using:
- desk/lib/ethio.hoon
- desk/lib/ethereum.hoon

# Setting up client to provider tests
|rein %base [& %eth-test] [& %eth-provider]
:eth-provider &provider-action [%set-local 'http://localhost:8545']
:eth-provider &provider-action [%set-provider ['http://localhost:8545' %.n ~]]
:eth-provider &provider-action [%set-client ~nut]
:eth-test &start-eth-action ~

TODO: documentaiton
# How to test
## Test files
./geth.sh: starts ethereum node for testing
./desk/ted/tests/eth-provider.hoon: tests the eth-provider
./desk/ted/tests/integration.hoon: tests the integration of eth-provider to the codebase
./node: for generating transactions to test the send-txs integration point
