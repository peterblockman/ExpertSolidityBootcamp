// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

/*
interface Isolution {
    function solution(uint256 value) external;
}
*/

contract Level_3_Solution {
        

function solution(address addr) external view returns (uint256 codeSize) {

        // Implement your solution here.
        assembly {
            codeSize := extcodesize(addr)
        }

    }

}