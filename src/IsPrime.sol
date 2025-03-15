// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract IsPrime {
    function main(uint256 x) external pure returns (bool) {
        assembly {
            // your code here
            // return true if x is a prime number, else false
            // 1. check if the number is a multiple of 2 or 3
            // 2. loop from 5 to x / 2 to see if it is divisible
            // 3. increment the loop by 2 to skip the even numbers

            if eq(x, 1) {
                // not a prime
                mstore(0x00, 0x0)
                return(0x00, 0x20)
            }

            if eq(x, 2) {
                // is a prime
                mstore(0x00, 0x1)
                return(0x00, 0x20)
            }

            if eq(x, 3) {
                // is a prime
                mstore(0x00, 0x1)
                return(0x00, 0x20)
            }

            if iszero(mod(x, 2)) {
                // divisible by 2 - not a prime
                mstore(0x00, 0x0)
                return(0x00, 0x20)
            }

            if iszero(mod(x, 3)) {
                // divisible by 3 - not a prime
                mstore(0x00, 0x0)
                return(0x00, 0x20)
            }

            let half_of_x := div(x, 2)
            for { let i := 5 } lt(i, half_of_x) { i := add(i, 2) } {
                if iszero(mod(x, i)) {
                    // divisible by i - not a prime
                    mstore(0x00, 0x0)
                    return(0x00, 0x20)
                }
            }
            // is a prime
            mstore(0x00, 0x1)
            return(0x00, 0x20)
        }
    }
}
