// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {MagicNum} from "src/magicnumber/MagicNumber.sol";

contract MagicNumberScript is Script {
    MagicNum internal magicnumber;

    function setUp() public virtual {
        magicnumber = MagicNum(0x540226e70157408442A1765fbEC71dEd5a60f0Ab);
    }

    function run() public virtual {
        vm.startBroadcast();
        /**
            To copy code, we need to use the CODECOPY(t, f, s) opcode which takes 3 arguments.

                t: The destination offset where the code will be in memory. Let's save this to 0x00 offset.
                f: This is the current position of the runtime opcode which is not known as of now.
                s: This is the size of the runtime code in bytes, i.e., 602a60805260206080f3 - 10 bytes long.

            1. 0x60 - PUSH1 --> PUSH(0x0a) --> 0x600a (`s=0x0a` or 10 bytes)
            2. 0x60 - PUSH1 --> PUSH(0x??) --> 0x60?? (`f` - This is not known yet)
            3. 0x60 - PUSH1 --> PUSH(0x00) --> 0x6000 (`t=0x00` - arbitrary chosen memory location)
            4. 0x39 - CODECOPY --> CODECOPY --> 0x39 (Calling the CODECOPY with all the arguments)

            Now, to return the runtime opcode to the EVM:

            1. 0x60 - PUSH1 --> PUSH(0x0a) --> 0x600a (Size of opcode is 10 bytes)
            2. 0x60 - PUSH1 --> PUSH(0x00) --> 0x6000 (Value was stored in slot 0x00)
            3. 0xf3 - RETURN --> RETURN --> 0xf3 (Return value at p=0x00 slot and of size s=0x0a)
        */
        bytes
            memory code = "\x60\x0a\x60\x0c\x60\x00\x39\x60\x0a\x60\x00\xf3\x60\x2a\x60\x80\x52\x60\x20\x60\x80\xf3";
        address solver;

        assembly {
            solver := create(0, add(code, 0x20), mload(code))
        }
        magicnumber.setSolver(solver);
        vm.stopBroadcast();
    }
}
