// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract keccakX {
    function main(uint256 x) external pure returns (bytes32) {
        assembly {
            // your code here
            // return the keccak hash of x
            // Hint: use keccak256(offset, size)
            // Hint: you need to put x in memory first
            mstore(0x00, x) // put x in 0x00, 32 bytes since uint256
            mstore(0x20, keccak256(0x00, 0x20)) // put the hash in the next 32 bytes
            return(0x20, 0x40) // return the next memory 32 bytes slot
        }
    }
}
