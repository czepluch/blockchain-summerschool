contract Token { function transfer(address receiver, uint amount ){} }

contract Crowdsale {
    address public beneficiary;
    uint public fundingGoal;
    uint public amountRaised;
    uint public deadline;
    uint public price;
    bool public fundingGoalReached = false;
    mapping(address => uint256) public balanceOf;
    Token public tokenReward;
    bool crowdsaleClosed = false;
    event GoalReached(address beneficiary, uint amountRaised);
    event FundTransfer(address backer, uint amount, bool isContribution);


    /* initializing function */
    function Crowdsale(
        address ifSuccessfulSendTo,
        uint fundingGoalInEthers,
        uint durationInMinutes,
        uint etherCostOfEachToken,
        Token addressOfTokenUsedAsReward) 
    {
        beneficiary = ifSuccessfulSendTo; // set the beneficiary
        fundingGoal = fundingGoalInEthers * 1 ether; // set the funding goal
        deadline = now + durationInMinutes * 1 minutes; // set the deadline
        price = etherCostOfEachToken * 1 ether; // set the token price
        tokenReward = Token(addressOfTokenUsedAsReward); // set the address of the already deployed token contract
    }

    // empty function without name is the default function that is called whenever anyone sends funds to it
    function () {
        if (crowdsaleClosed) throw;
        uint amount = msg.value;
        balanceOf[msg.sender] += amount;
        amountRaised += amount;
        tokenReward.transfer(msg.sender, amount / price);
    }

    modifier afterDeadline() {
        if (now < deadline) 
            throw;
        _
    }

    function checkGoalReached() afterDeadline {
        if (amountRaised >= fundingGoal) {
            fundingGoalReached = true;
            GoalReached(beneficiary, amountRaised);
        }
        crowdsaleClosed = true;
    }

    function safeWithdrawal() afterDeadline {
        if (!fundingGoalReached) {
            uint amount = balanceOf[msg.sender];
            balanceOf[msg.sender] = 0;
            if (amount > 0) {
                if (msg.sender.send(amount)) {
                    FundTransfer(msg.sender, amount, false);
                } else {
                    balanceOf[msg.sender] = amount;
                }
            }
        }

        if (fundingGoalReached && beneficiary == msg.sender) {
            if (beneficiary.send(amountRaised)) {
                FundTransfer(beneficiary, amountRaised, false);
            } else {
                //If we fail to send the funds to beneficiary, unlock funders balance
                fundingGoalReached = false;
            }
        }
    }
}
