
1. What are the advantages and disadvantages of the 256 bit word length in the EVM?

    **Advantages**:

    - Better Security: 256-bit word length makes it harder for attackers to exploit vulnerabilities and perform certain attacks. (e.g., overflow attacks)

    - Better performance for certain computations: some computations types can be processed more efficiently as 256-bit values like cryptography and hashing.

    - Better compatibility: many cryptographic standards and protocols use 256-bit word length, so using them in the EVM can make it easier to integrate with other systems.

    **Disadvantages**:

    - Increase gas costs: performing operations on larger words (256 bits) requires more computational resources resulting in higher gas costs.

    - Increase storage requirements: storing 256-bit words requires more storage space than smaller words such as 64-bit words. This can make it harder to scale, and running nodes can be costly.

    - Increase complexity: The larger the word length the more complex and error-prone the system is

2. What would happen if the implementation of a precompiled contract varied between Ethereum clients ?

    it would result in different outcomes for the same operation violating the consensus mechanism of the Ethereum network. This may cause chain split.

3. Using Remix write a simple contract that uses a memory variable, then using the
debugger step through the function and inspect the memory.