
## Assembly 1

1. Look at the example of init code in today's notes. See [gist](https://gist.github.com/extropyCoder/4243c0f90e6a6e97006a31f5b9265b94)
When we do the CODECOPY operation, what are we overwriting ?
(debugging this in Remix might help here)

    CODECOPY copies the current running smart contract code to memory. It overwrites the free memory pointer
    ```
    026 PUSH1 b6  - 

    028 DUP1  - |b6|

    029 PUSH2 0027  - |b6|b6|

    032 PUSH1 00  - |0027|b6|b6|

    034 CODECOPY  - |00|0027|b6|b6|
    ```
    `CODECOPY` takes three parameters:
    - destOffset: The target address (i.e. offset) in memory: 00 
    - offset: byte offset in the code to copy: 0027  (39 decimal)
    - size: the number of bytes to copy: b6 (182 decimal)

    It copies 182 bytes of the code starting from position 39 to address 0x0 in memory.

2. Could the answer to Q1 allow an optimisation ?
    Since there aren't any hashing functions or dynamic arrays being used or initialized in the smart contract after the codecopy, it overwrites the first 4 reserved words of the EVM memory as an optimization.

    So, instead of starting from the memory offset obtained from the free memory pointer, which would consume more gas by taking 5 x 32 bytes from 0x80, the contract safely overwrites existing data in memory and starts writing from 0, thereby using only 182 bytes of memory.

3. Can you trigger a revert in the init code in Remix ?

    Yes, by include some Eth to the smart contract deploy transaction.

4. Write some Yul to

	- Add 0x07 to 0x08

	- store the result at the next free memory location.

	- (optional) write this again in opcodes
    Solidity
    ```
    // SPDX-License-Identifier: MIT

    pragma  solidity  0.8.18;

    contract YulAdd {

        function add()  external  pure {

            assembly{
                let curFMP := mload(0x40)
                // store the value
                mstore(curFMP, add(0x07,  0x08))
                // update the memory pointer by 32 bytes
                mstore(0x40, add(curFMP, 0x20))
            }	

        }

    }
    ```
    Opcodes
    ```
    PUSH1 0x08 

    PUSH1 0x07 - |0x08|

    058 ADD - |0x07|0x08|

    059 PUSH1 0x40 |0xf|

    061 MLOAD |0x40|0xf|

    062 MSTORE |0x80|0xf|
    ```

5.  Can you think of a situation where the opcode EXTCODECOPY is used ?
    Many contracts need to perform checks on a contract’s bytecode, but do not necessarily need the bytecode itself. For instance, a contract may want to check if another contract’s bytecode is one of a set of permitted implementations, or it may perform analyses on code and whitelist any contract with matching bytecode if the analysis passes.
    https://eips.ethereum.org/EIPS/eip-1052

6. Complete the assembly exercises in this repo

    [Exercises](https://github.com/ExtropyIO/ExpertSolidityBootcamp)

    If you want to use gitpod, this is the format

    https://gitpod.io/#https://github.com/ExtropyIO/ExpertSolidityBootcamp
