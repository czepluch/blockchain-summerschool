## Introduction

* Start syncing

* Who am I?
    ITU bachelor in SW
    Bachelor about Blockchain application areas together with Nikolaj
    Intern at Ethereum (EthDev)
    Developer / Consultant at brainbot technologies

* What qualifies me to stand here?
    Less general computer science knowledge
    Specific Blockchain and Ethereum knowledge
    Wrote most of the smart contracts for the Raiden Network

* Disclaimer
    Ask all the questions that you want!
    Different levels of expertise

## Teaching goals

"On the Blockchain, no one knows you're a fridge" - Richard Brown

* Introduction to development tools
    The wallet
        Quick tour
            Create account
            Make transfer
    Truffle
        Development environment for DApps
        Testing framework
    solc
        Show how to compile
        Show how to check gas usage
        --optimize
    geth
        Quick show of the console
    Broswer-solidity
        Quick show of it with a simple contract

* Introduction to smart contracts
    What is a smart contract?
        A piece of code that lives on the blockchain
        Has an address on the blockchain like an account
        Public available fields
        Functions that can be invoked
        Can call other functions
    What can a smart contract be used for?
        TODO

* Introduction to Solidity
    Information
        Turing Complete
        Compiles to EVM bytecode
    Functions and standard modifiers
        Call vs Transaction
            Call is used when reading the state and making non-state-changing computations
            Transactions is a signed transaction sent by a user to a contract or external account that tries to change the world state.
        constant
            Signal to the compiler that the function does not change the world state
            Not yet enforced by the Solidity compiler
        public and external
            Public is default.
            External is very much the same. Only difference is how the contract that contains the functions call them.
        internal
            Essentially the same as protected.
            Can be called from functions in same contract or contracts that extend it.
        private
            Function can only be called from functions within the same contract.
    Modifiers
        See example
        Concepts
            Pre-conditions
            The body
            Post-conditions
        Simply put, COP has just one main aim:
            Function bodies should have no conditional paths.
        Complications
            Cannot return custom error messages
        Why use custom modifiers?
            **Potential bugs hide when the programmer believes a conditional (and thus the state it projects onto) means one thing when in fact it means something subtly different.**
            Easier to test
    Events
        See example
        Triggered in a function
        Clients can listen for events and trigger other functions on events
        `indexed` keyword can be used. It is possible to filter for specific values of indexed arguments in the user interface.
        All non-indexed arguments will be stored in the data part of the log.
    Testing
        Unit tests
        See example
        tester.py

    Limitations
        TODO

* Live coding of a token contract putting the above into practice
