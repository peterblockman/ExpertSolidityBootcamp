Try outthe Solidity Template or the Foundry Template
1. Start a new project using the Solidity Template
2. Make a fork of mainnet from the command line (you may need to setup an Infura
or Alchemy account)
    ```
    npx hardhat node --fork https://eth-mainnet.alchemyapi.io/v2/<key>
    ```
    Ref: https://hardhat.org/hardhat-network/docs/guides/forking-other-networks

3. Query the mainnet using the command line to retrieve a property such as latest
block number.
    ```
    const latestBlock = await hre.ethers.provider.getBlock("latest")

    ```
4. Is this valid solidity ?
    ![valid-sol](/assets/img/valid-sol.png)

    Yes, functions can be passed as parameters. There is function types in solidity.
    https://docs.soliditylang.org/en/v0.8.17/types.html#function-types