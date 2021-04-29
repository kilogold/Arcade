from brownie import accounts, Wrapped_ERC20PresetMinterPauser, TicketShop

def main():

    mainAcct = accounts[0]
    ctrTIX = Wrapped_ERC20PresetMinterPauser.deploy("Ticket", "TIX", {'from': mainAcct}, publish_source=False)
    ctrQRT = Wrapped_ERC20PresetMinterPauser.deploy("Quarter", "QRT", {'from': mainAcct}, publish_source=False)
    ctrTicketShop = TicketShop.deploy(ctrTIX, ctrQRT, [], {'from': mainAcct}, publish_source=False)