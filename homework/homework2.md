
Solidity
1. Write a function that will delete items (one at a time) from a dynamic array without
leaving gaps in the array. You should assume that the items to be deleted are chosen
at random, and try to do this in a gas efficient manner.
For example imagine your array has 12 items and you need to delete the items at
indexes 8, 2 and 7.
The final array will then have items {0,1,3,4,5,6,9,10,11}

```
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract RemoveArrayItem {
    uint256[] public arr = [1, 2, 3, 4, 5];

    function remove(uint256 idx) external {
        require(idx >= 0 && idx < arr.length, "index out of bound");

        arr[idx] = arr[arr.length - 1];

        arr.pop();
    }

    function removeAndKeepOrder(uint256 idx) external {
        require(idx >= 0 && idx < arr.length, "index out of bound");
        
        for (uint256 i = idx; i < arr.length - 1; ++i) {
            arr[i] = arr[i + 1];
        }

        arr.pop();
    }

  
}
```