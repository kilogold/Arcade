// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import '../contracts/Reward.sol';
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '@openzeppelin/contracts/utils/structs/EnumerableSet.sol';


contract TicketShop
{
    IERC20 ctrTicket;
    IERC20 ctrQuarter;

    using EnumerableSet for EnumerableSet.AddressSet;
    EnumerableSet.AddressSet private availableRewards;

    constructor(address ctrTicketIn, address ctrQuarterIn, address[] memory initalRewards)
    {
        ctrTicket = IERC20(ctrTicketIn);
        ctrQuarter = IERC20(ctrQuarterIn);
        
        for(uint i = 0; i < initalRewards.length; ++i)
        {
            availableRewards.add(initalRewards[i]);
        }
    }

    function RequestReward(address reward) public
    {
        require(availableRewards.contains(reward));
        
        Reward instance = Reward(reward);

        require(ctrTicket.balanceOf(msg.sender) >= instance.price());
        require(ctrTicket.transferFrom(msg.sender, address(this), instance.price()));

        instance.grant(msg.sender);
    }
}