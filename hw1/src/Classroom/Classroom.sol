// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
contract StudentV1 {
    // Note: You can declare some state variable

    bool public code = false;

    function register() external returns (uint256) {
        if (!code) { 
            code = true; 
            return 10000;
        } else { 
            code = false; 
            return 123;
        }
    }
}


/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 {
    function register() external view returns (uint256) {
        // TODO: please add your implementaiton here
        if (!IClassroomV2(msg.sender).isEnrolled()) {
            return 10000;
        } else {
            return 123;
        }
    }
}

/* Problem 3 Interface & Contract */

contract StudentV3 {
    
    uint256 public gasCost = 0;
    function register() external view returns (uint256) {

        uint256 remainingGas = gasleft();
        // uint256 gasCost = remainingGas;

        if (remainingGas > 9999 wei) {
            return 10000; 
        } else {
            
            return 123; 
        }
    }
}
