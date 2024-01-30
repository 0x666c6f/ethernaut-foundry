// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GatekeeperOne} from "src/gatekeeperone/GatekeeperOne.sol";
import {Script, console2} from "forge-std/Script.sol";

contract GatemasterOne {
    constructor(address _gk) {
        gk = GatekeeperOne(_gk);
    }

    GatekeeperOne internal gk;

    function enter(bytes8 _gateKey, uint256 _gas) external {
        console2.log(gasleft());
        gk.enter{gas: _gas}(_gateKey);
        console2.log(gasleft());
    }
}
