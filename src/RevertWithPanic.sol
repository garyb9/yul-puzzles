// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract RevertWithPanic {
    function main() external pure {
        assembly {
            // your code here
            // revert the function with an error of type `Panic(uint256)`
            // use "0x01" as error code
            // Hint: The error type is built-in and cannot be re-defined. See https://www.rareskills.io/post/try-catch-solidity

            mstore(0x00, 0x4e487b7100000000000000000000000000000000000000000000000000000000) // padded selector
            mstore(0x04, 0x1) // uint256 arg

            revert(0x00, 0x24) // 4 bytes selector + 32 bytes uint256 = 36 (0x24) bytes total
        }
    }
}
