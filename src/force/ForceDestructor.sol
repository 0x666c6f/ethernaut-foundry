// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceDestructor {
    function destroy() public payable {
        selfdestruct(
            payable(address(0xCaa446a9F88466Ef2C65079aB966Cb858E7Db60F))
        );
    }
}
