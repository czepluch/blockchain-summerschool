contract GuardedFunctionExample1 {

    uint public data = 1;

    function guardedFunction(uint _data) {
        if(_data == 0)
            throw;
        data = _data;
    }

}


contract GuardedFunctionExample2 {

    uint public data = 1;

    function guardedFunction(uint _data) {
        check(_data);
        data = _data;
    }

    function check(uint _data) private {
        if (_data == 0)
            throw;
    }

}


contract GuardedFunctionExample3 {

    uint public data = 1;

    modifier checked(uint _data) {
        if (_data == 0)
            throw;
        _
    }

    function guardedFunction(uint _data) checked(_data) {
        data = _data;
    }

}
