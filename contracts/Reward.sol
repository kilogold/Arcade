// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import '@openzeppelin/contracts/access/Ownable.sol';

abstract contract Reward is Ownable
{
    bool public isRedeemed;
    uint public price;
    function grant(address receiver) virtual public onlyOwner {}
}