contract Token
{
    address public owner;

    // The balance of everyone
    mapping (address => uint) public balances;

    mapping (address => bool) public blacklisted;


    // Constructor - we're a millionaire!
    function Token() {
        owner = msg.sender;
        balances[msg.sender] = 1000000;
    }

    function blacklist(address _addr) {
        if(msg.sender != owner)
            return;
        blacklisted[_addr] = true;
    }

    function transfer(uint _amount, address _dest) {
        if(blacklisted[msg.sender])
            return;
        if(balances[msg.sender] >= _amount) {
            balances[msg.sender] -= _amount;
            balances[_dest] += _amount;
        }
    }

}
