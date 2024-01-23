// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import "src/force/ForceDestructor.sol";

contract ForceScript is Script {
    function setUp() public virtual {}

    function run() public virtual {
        vm.startBroadcast();
        ForceDestructor(0xC4A7620F8C7Bb3d0c9C71B7ABF23679970e3D5f4).destroy{
            value: 10000
        }();
        vm.stopBroadcast();
    }
}
