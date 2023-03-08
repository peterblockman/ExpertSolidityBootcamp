// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

interface Isolution5 {
    function solution(bytes32 b, bytes32 ex, bytes32 mod) external returns (bytes32 result);
}

contract Level_5_Solution is Isolution5 {
    function solution(bytes32 b, bytes32 ex, bytes32 mod) external returns (bytes32 result) {
        bytes32 _mod = mod;
        assembly {
            let pointer := mload(0x40)

            mstore(pointer, 0x20)
            mstore(add(pointer, 0x20), 0x20)
            mstore(add(pointer, 0x40), 0x20)

            mstore(add(pointer, 0x60), b)
            mstore(add(pointer, 0x80), ex)
            mstore(add(pointer, 0xa0), _mod)

            let success := call(gas(), 0x05, 0x0, pointer, 0xc0, pointer, 0x20)
            switch success
            case 0 {
                revert(0x0, 0x0)
            } default {
                result := mload(pointer)
            }
        }
    }
}