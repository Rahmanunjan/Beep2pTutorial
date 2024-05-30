// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract Decryption {
    // Mapping to store the private keys of users
    mapping(address => bytes) private privateKeys;

    // Function to generate and set the private key for a user
    function setprivateKey(bytes memory _privateKey) public {
        privateKeys[msg.sender] = _privateKey;
    }

    // Function to decrypt a message using the recipient's private key
    function decryptMessage(bytes memory _encryptedMesssage) public view returns (string memory) {
        require(privateKeys[msg.sender].length > 0, "Private key not set");

        // Decrypt the message using the recipient's private key (pseudocode)
        string memory decryptedMessage = decrypt(_encryptedMessage, privateKeys[msg.sender]);

        return decryptedMessage;
    }
}