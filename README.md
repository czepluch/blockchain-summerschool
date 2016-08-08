# List of prerequisites for the summer school

In order to not waste a lot of the limited time we have during the week, here is a list of requirements that we would like for you as a participant to have installed prior to the summer school.

For general help and support with the following steps prior to the start of the summer school, please join this [gitter channel](https://gitter.im/blockchain-summer-school/support) and ask your questions.

As previously mentioned it is highly recommended that all students run either Linux or OSX for the summer school. If you run Windows, please install Ubuntu in a VM and follow the steps below.

Please note that support for students that have not followed the instructions below, when the lectures start, will be of lower priority.

- Download the latest Ethereum Wallet application [HERE](https://github.com/ethereum/mist/releases). At the time of writing latest version is 8.1.


- Once the wallet application is installed, you should start syncing the Ethereum test-net blockchain. When you run the application for the first time you will be prompted about which network to run. Please choose the test-net since that is the one we will be using during the summer school. Be advised that syncing might take several hours.
Once you're synced you can ask in the [gitter channel](https://gitter.im/blockchain-summer-school/support) for some test ether or use this [faucet](http://faucet.ma.cx:3000/).


- Next up we need to install the Solidity compiler called `solc`. This is done by following [these guidelines](http://solidity.readthedocs.io/en/latest/installing-solidity.html#building-from-source). If you build the binary file, move the `solc` file in to `/usr/local/bin`.


- [Install truffle](http://truffle.readthedocs.io/en/latest/getting_started/installation/) following these instructions.


- [Install geth](https://github.com/ethereum/go-ethereum/wiki/Building-Ethereum). This is not necessary, but nice to have. You don't need to sync here, since you already did this when installing the wallet.


- Please do also have a text editor of your choice installed, preferably with Solidity syntax highlighting. You can also choose to use [Browser Solidity](https://ethereum.github.io/browser-solidity).
