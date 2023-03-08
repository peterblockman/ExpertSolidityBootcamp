// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

/*
interface Isolution {
    function solution(uint256 value) external;
}
*/

contract Level_4_Solution {
        
    function solution(uint256 value) external {
        assembly {
            sstore(0x3, value)
        }
    }
}