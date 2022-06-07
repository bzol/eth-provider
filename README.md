# My Files:
- desk/app/eth-provider.hoon
- desk/sur/eth-provider.hoon
- desk/ted/eth-provider.hoon


# Using:
- desk/lib/ethio.hoon
- desk/lib/ethereum.hoon

# Tests
|rein %base [& %eth-test] [& %eth-provider]
:eth-provider &provider-action [%set-provider ['http://localhost:8545' %.n ~]]
:eth-provider &provider-action [%set-client ~nut]
:eth-test &start-eth-action ~
