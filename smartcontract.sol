// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Authentication {
    // Store user addresses
    mapping(address => bool) public registeredUsers;

    // Event emitted when a user registers or logs in
    event UserAuthenticated(address user, bool isNewUser);

    // Function to handle login or signup
    function authenticate() public {
        bool isNewUser = false;

        if (!registeredUsers[msg.sender]) {
            registeredUsers[msg.sender] = true;
            isNewUser = true;
        }

        emit UserAuthenticated(msg.sender, isNewUser);
    }

    // Check if a user is registered
    function isUserRegistered(address user) public view returns (bool) {
        return registeredUsers[user];
    }
}
