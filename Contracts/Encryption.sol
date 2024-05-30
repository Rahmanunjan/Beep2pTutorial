// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract Encryption {
    // Mapping to store the public keyss of users
    mapping(address => bytes) public publicKeys;

    // Event to emit when a new public key is set
    event PublicKeySet(address indexed userAddress, bytes publicKey);

    // Function to generate and set the public key for a user
    function setPublicKey(bytes memory _publicKey) public {
        publicKeys[msg.sender] = _publicKey;

        emit PublicKeySet(msg.sender, _publicKey);
    }

    // Function to encrypt a message using the recipient's public key
    function encryptMessage(address _recipient, string memory _message) public view returns (bytes memory) {
        require(publicKeys[_recipient].length > 0, "Recipient's public key not set");

        // Encrypt the message using the recipient's public key (pseudocode)
        bytes memory encryptedMessage = encrypt(_message, publicKeys[_recipient]);

        return encryptedMessage;
    }
}

