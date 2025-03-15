// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract MaxOfArray {
    function main(uint256[] memory arr) external pure returns (uint256) {
        assembly {
            // your code here
            // return the maximum value in the array
            // revert if array is empty
            let length := mload(arr) // load length of array
            if iszero(length) { revert(0, 0) } // simple revert
            // array not empty
            let max := 0
            let data := add(arr, 0x20) // pointer to the first element

            for { let i := 0 } lt(i, length) { i := add(i, 1) } {
                let element := mload(add(data, mul(i, 0x20)))

                switch lt(max, element)
                case 1 { max := element }
            }

            mstore(0x0, max)
            return(0x0, 0x20)
        }
    }
}
