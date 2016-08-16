contract Token {

    // The balance of everyone
    mapping (address => uint) public balances;


    // Constructor - we're a millionaire!
    function Token() {
        balances[msg.sender] = 1000000;
    }

    modifier at_least(uint x) {
        if (balances[msg.sender] < x)
            return;
        _
    }

    function transfer(uint _amount, address _dest) at_least(_amount) {
        balances[msg.sender] -= _amount;
        balances[_dest] += _amount;
    }

}


contract TokenTest is Token {

    address constant EMPTY_ACCOUNT = 0xDEADBEA7;

    function atLeastTester(uint _amount) at_least(_amount) constant private returns (bool) {
        return true;
    }

    function testAtLeastSuccess() returns (bool) {
        balances[msg.sender] = 1000;
        return atLeastTester(1000);
    }

    function testAtLeastFailBalanceTooLow() returns (bool) {
        balances[msg.sender] = 999;
        return !atLeastTester(1000);
    }

    // Test transferring to account with no money, then check their balance.
    function testTransfer() returns (bool) {
        balances[msg.sender] = 500;
        balances[EMPTY_ACCOUNT] = 0;
        transfer(500, EMPTY_ACCOUNT);
        return balances[msg.sender] == 0 && balances[EMPTY_ACCOUNT] == 500;
    }

    // Test transferring to account with no money, then check their balance.
    function testTransferFailBalanceTooLow() returns (bool) {
        balances[msg.sender] = 500;
        balances[EMPTY_ACCOUNT] = 0;
        transfer(600, EMPTY_ACCOUNT);
        return balances[msg.sender] == 500 && balances[EMPTY_ACCOUNT] == 0;
    }

}
