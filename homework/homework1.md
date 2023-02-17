
1. Why is client diversity important for Ethereum ?

- Bugs: If there are many different clients, a bug in one client won't affect the whole network, making it more robust.

- Resilience to attacks: If an attacker targets one client, the other clients won't be affected, making it harder for the attacker to succeed.

- Proof-of-stake finality: If a bug affects a consensus client with over 33% of the Ethereum nodes, it could prevent transactions from being trusted, which would be bad for the apps built on Ethereum.

- Shared responsibility: If there is only one client that dominates, it puts too much responsibility on the developers of that client, which is not good for the health of the network.
Source: https://ethereum.org/en/developers/docs/nodes-and-clients/client-diversity/#client-diversity-importance

2. What information is held for an Ethereum account ?
-   `nonce` - a counter that indicates the number of transactions sent from an externally-owned account or the number of contracts created by a contract account.
-   `balance` -shows the number of wei (the smallest denomination of ETH) owned by the address.
-  `codeHash` - refers to the code of an account on the Ethereum virtual machine (EVM) and cannot be changed. For EOA, it is the hash of an empty string.
-   `storageRoot` also known as the storage hash, is a 256-bit hash of the root node of a Merkle Patricia trie that encodes the storage contents of the account. It's empty by default.
3. Where is the full Ethereum state held ?
It is stored off-chain using the Merkel Patricia Trie data structure. Each validator node on the Ethereum network keep a copy of the current world state.
4. What is a replay attack ? which 2 pieces of information can prevent it ?
A replay attack can only copy an existing transaction from the new forked blockchain and make an identical one in the old blockchain (or the other way around). ([source](https://www.exodus.com/support/article/168-what-is-a-replay-attack#:~:text=A%20replay%20attack%20is%20an,be%20valid%20across%20both%20chains.))
We can prevent the attack by two factors:
- The `nonce` ensures that each transaction can be executed only once per account.
-  The `timestamp` allows nodes on the network to determine whether a transaction is too old to be considered valid.
5. In a contract how do we know who called a view function?

    `msg.sender`