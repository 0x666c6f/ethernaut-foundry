// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import {Token} from "src/token/Token.sol";

contract TokenTransferer {
    Token internal token = Token(0x0A53a9d89A2EFdd6475102E6F26e91239A0de5e4);

    function transfer(address _to, uint _value) public returns (bool) {
        return token.transfer(_to, _value);
    }
}
