pragma solidity ^0.8.4;

contract Intro {
    function intro() public pure returns (uint16) {
        uint256 mol = 420;

        // Yul assembly magic happens within assembly{} section
        assembly {
            // stack variables are instantiated with
            // let variable_name := VALßUE
            let myVar := mol
            // instantiate a stack variable that holds the value of mol
            // To return it needs to be stored in memory
            let freeMemPointer := mload(0x40)
            // with command mstore(MEMORY_LOCATION, STACK_VARIABLE)
            mstore(freeMemPointer, myVar)
            // update the free memory pointer
            mstore(0x40, add(freeMemPointer, 0x20))
            // to return you need to specify address and the size from the starting point
            return(freeMemPointer, 0x20)
        }
    }
}
