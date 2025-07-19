// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Create a smart contract that allows users to register and update their profile information ( name, age, email etc).

// Functions: Create register(), updateProfile(), getProfile()

// Requirements:
// Use a struct named User
// Store data in state variables
// Include public getter function
// Validate that user cannot register twice
// Add a view function to fetch user info
// Track registration timestamp using uint

contract UserProfile {
    // Define the User struct
    struct User {
        string name;
        uint age;
        string email;
        bool exists;
        uint registeredAt;
    }

    
    mapping(address => User) private users;

    // Function to register a new user
    function register(string memory _name, uint _age, string memory _email) public {
        require(!users[msg.sender].exists, "User already registered");

        users[msg.sender] = User({
            name: _name,
            age: _age,
            email: _email,
            exists: true,
            registeredAt: block.timestamp
        });
    }

    // Function to update user profile
    function updateProfile(string memory _name, uint _age, string memory _email) public {
        require(users[msg.sender].exists, "User not registered");

        users[msg.sender].name = _name;
        users[msg.sender].age = _age;
        users[msg.sender].email = _email;
    }

    // Function to get user profile
    function getProfile() public view returns (string memory, uint, string memory, uint) {
        require(users[msg.sender].exists, "User not registered");

        User memory user = users[msg.sender];
        return (user.name, user.age, user.email, user.registeredAt);
    }
}
