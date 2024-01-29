// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Vault} from "src/vault/Vault.sol";

contract VaultScript is Script {
    Vault internal vault;

    function setUp() public virtual {
        vault = Vault(0x9BbffB0A586457DfFE08182ce6a7A6B7d1D58035);
    }

    function run() public virtual {
        vm.startBroadcast();
        //get password from vault contract storage slot 1
        /**
            > cast storage 0x9BbffB0A586457DfFE08182ce6a7A6B7d1D58035 1 --rpc-url $RPC_URL
            ➜ 0x412076657279207374726f6e67207365637265742070617373776f7264203a29
        */
        vault.unlock(
            0x412076657279207374726f6e67207365637265742070617373776f7264203a29
        );
        vm.stopBroadcast();
    }
}
