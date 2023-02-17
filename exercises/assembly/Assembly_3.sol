pragma solidity ^0.8.4;

contract SubOverflow {
    // Modify this function so that on overflow it returns the value 0
    // otherwise it should return x - y
    function subtract(uint256 x, uint256 y) public pure returns (uint256) {
        // Write assembly code that handles overflows
        uint256 diff;
        bool success;

        assembly {
            diff := sub(x, y)
            // overflow when x < y or diff > x
            let isOverflow := or(lt(x, y),gt(diff, x))
            if iszero(isOverflow) {
               success := true
            }
        }

        if(success){
            return diff;
        } 
        return 0;
    }
}
