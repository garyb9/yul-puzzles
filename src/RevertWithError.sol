// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract RevertWithError {
    function main() external pure {
        // revert the function with an error of type `Error(string)`
        // use "RevertRevert" as error message
        // Hint: The error type is a predefined four bytes. See https://www.rareskills.io/post/try-catch-solidity

        bytes4 selector = 0x08c379a0; // keccak256("Error(string)")

        assembly {
            mstore(0x00, selector) //- Store the function selector for `Error(string)`
            mstore(0x04, 0x20) //- Store the offset to the error message string
            mstore(0x24, 0xc) //- Store the length of the error message string
            mstore(0x44, "RevertRevert") //- Store the actual error message
            revert(0x00, 0x64) //- Trigger the revert revert(StartingMemorySlot, totalMemorySize)
        }
    }
}
