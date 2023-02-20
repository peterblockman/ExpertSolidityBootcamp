1. Create a Solidity contract with one function. The solidity function should return the amount of ETH that was passed to it, and the function body should be written in assembly
```
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract RefundEthYul {
     function refundEthYul() external payable {
       assembly {
            let value := callvalue()
            if iszero(value) {
                revert(0, 0)
            }

            let fmp := mload(0x40)

            let success := call(
                // g: gas limit
                21000, 
                // a: address
                caller(), 
                // v: value sent in
                value, 
                // in: starting position of the input in memory
                fmp, 
                // insize
                0x0, 
                // out:  starting memory location that should store the return data from the call
                fmp,
                //outsize
                0x0
            )
            
            if iszero(success) {
                revert(fmp, 0)
            }
       }
    }

    function refundEth() external payable {
        require(msg.value > 0, "No Eth to refund");
        (bool sent,) = msg.sender.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
```

2.  Do you know what this code is doing ?
This code does:
- Spawn the constructor (current contract)
- Copy the current running code
- Create a contract (1st contract)
- Create another contract (2nd contract)
- Destroy the current contract and send all remaining ether to the 2nd contract
```
theMemoryHex = 00...601e8060093d393df368601e8060093d393df35952383d59396009380160173d828234f050f0ff0000


[00]	PUSH9	601e8060093d393df3
[0a]	MSIZE	 stack: | 601e8060093d393df3 | --> Get the current size of active memory
[0b]	MSTORE	stack: | 0 | 601e8060093d393df3 | 


[0c]	CODESIZE	stack: | | -  memory: | 00...601e8060093d393df3 |--> Get code size (30)
[0d]	RETURNDATASIZE	stack: | 1e | -  memory: | 00...601e8060093d393df3 | --> Return data size of the last call (0)
[0e]	MSIZE	 stack: | 0| 1e | -  memory: | 00...601e8060093d393df3 | 
[0f]	CODECOPY	 stack: | 20 | 0| 1e | -  memory: | 00...601e8060093d393df3 |  --> Copy the current running code

[10]	PUSH1	09 stack: | | -  memory: | theMemoryHex | 
[12]	CODESIZE stack: | 9 | -  memory: | theMemoryHex | 
[13]	ADD	stack: | 1e | 9 | -  memory: | theMemoryHex | 
[14]	PUSH1	17 stack: | 27 | -  memory: | theMemoryHex | 
[16]	RETURNDATASIZE	stack: | 17 | 27 | -  memory: | theMemoryHex | 
[17]	DUP3 stack: | 0 | 17 | 27 | -  memory: | theMemoryHex | 
[18]	DUP3	stack: | 27 | 0 | 17 | 27 | -  memory: | theMemoryHex | 
[19]	CALLVALUE	stack: | 17 | 27 | 0 | 17 | 27 | -  memory: | theMemoryHex | 
[1a]	CREATE	stack:| 0 | 17 | 27 | 0 | 17 | 27 | -  memory: | theMemoryHex | --> creates a new contract, return an address
[1b]	POP	stack:| 43a61f3f4c73ea0d444c5c1c1a8544067a86219b | 0 | 17 | 27 | -  memory: | theMemoryHex | 
[1c]	CREATE	stack: | 0 | 17 | 27 | -  memory: | theMemoryHex | 
[1d]	SELFDESTRUCT stack: |3fa89944e11022fc67d12a9d2bf35ebe1164f7ef| -  memory: | theMemoryHex | 

```

3. Explain what the following code is doing in the Yul ERC20 contract
