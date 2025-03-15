// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract Tenary {
    uint256 public result;

    function main(uint256 a, uint256 b, uint256 c) external {
        assembly {
            // your code here
            // store `10` in the storage variable `result` if a > b,
            // else if b > c, store `20`,
            // else, store `30`
            if gt(a, b) { // a > b
                sstore(result.slot, 0x0a)
                return(0, 0)
            }
            if gt(b, c) { // b > c
                sstore(result.slot, 0x14)
                return(0, 0)
            }
            // else
            sstore(result.slot, 0x1e)
        }
    }
}
