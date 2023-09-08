// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Yul {
    uint256 private _value;

    event NewValue(uint256 NewValue);

    function store(uint256 newValue) public {
        _value = newValue;
        emit NewValue(newValue);
    }   

    function retrieve() public view returns (uint256) {
        return _value;
    }

    function retrieve1() public view returns (uint256) {
        assembly {
            let v := sload(0x00)
            mstore(0x80,v)
            return(0x80,0x20)
        }
    }
}