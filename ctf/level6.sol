// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

interface Isolution6 {
    function solution(
      bytes32 messageHash, 
      uint8 v, 
      bytes32 r, 
      bytes32 s
      ) external pure returns (address signer);
}

contract Level_6_Solution is Isolution6 {
        function solution(
            bytes32 messageHash,
            uint8 v,
            bytes32 r,
            bytes32 s
        ) external pure returns (address signer) {
            bytes32 prefixedHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", messageHash));
            signer = ecrecover(prefixedHash, v, r, s);
        }
    
}