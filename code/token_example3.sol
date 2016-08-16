contract Token
{
    address public owner;

    // The balance of everyone
    mapping (address => uint) public balances;

    mapping (address => bool) public blacklisted;

    modifier isOwner {
        if (msg.sender != owner)
            return;
        _
    }

    modifier notBlacklisted {
        if (blacklisted[msg.sender])
            throw;
        _
    }

    modifier atLeast(uint amount) {
        if (balances[msg.sender] < amount)
            throw;
        _
    }

    // Constructor - we're a millionaire!
    function Token() {
        owner = msg.sender;
        balances[msg.sender] = 1000000;
    }

    function blacklist(address _addr) isOwner {
        blacklisted[_addr] = true;
    }

    function transfer(uint _amount, address _dest) notBlacklisted atLeast(_amount) {
        balances[msg.sender] -= _amount;
        balances[_dest] += _amount;
    }

    // Voting function with atLeast 1000 tokens
    /*function vote(uint _opinion) atLeast(1000) {*/
        /*votes[msg.sender] = _opinion;*/
    /*}*/

}
