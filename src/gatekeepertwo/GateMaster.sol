// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GatekeeperTwo} from "src/gatekeepertwo/GatekeeperTwo.sol";
import {Script, console2} from "forge-std/Script.sol";

contract GatemasterTwo {
    GatekeeperTwo internal gk;

    function calculateGateKey() public view returns (bytes8) {
        uint64 senderHash = uint64(
            bytes8(keccak256(abi.encodePacked(address(this))))
        );
        uint64 gateKey = senderHash ^ type(uint64).max;
        return bytes8(gateKey);
    }

    constructor(address _gk) {
        gk = GatekeeperTwo(_gk);
        gk.enter(calculateGateKey());
    }
}
