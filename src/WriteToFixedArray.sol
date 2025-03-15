// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToFixedArray {
    uint256[5] writeHere;

    function main(uint256[5] memory x) external {
        assembly {
            // your code here
            // store the values in the fixed array `x` in the storage variable `writeHere`
            // Hint: https://www.rareskills.io/post/solidity-dynamic

            let data := x // pointer directly to the first element of the fixed array
            
            // iterate exactly 5 times
            for { let i := 0 } lt(i, 5) { i := add(i, 1) } {
                let element := mload(add(data, mul(i, 0x20)))
                sstore(add(writeHere.slot, i), element)
            }
        }
    }

    function getter() external view returns (uint256[5] memory) {
        return writeHere;
    }
}
