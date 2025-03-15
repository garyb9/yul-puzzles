// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract LengthOfDynamicArray {
    function main(uint256[] memory x) external pure returns (uint256 length) {
        assembly {
            // your code here
            // return the length of array `x`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
            // the length will be the first memory slot of the array: 0x80
            length := mload(x) // store length of x at 0x00, and return the first 32 bytes
        }
    }
}
