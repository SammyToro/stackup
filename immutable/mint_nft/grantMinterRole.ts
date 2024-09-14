import { getDefaultProvider, Wallet } from 'ethers'; // ethers v5
import { Provider, TransactionResponse } from '@ethersproject/providers'; // ethers v5
import { ERC721Client } from '@imtbl/contracts';

const CONTRACT_ADDRESS = '0x0b3ee7d40d8fe6bd1dc877f931cd2bfcc4b72d77';
const PRIVATE_KEY = '442bbe19832fbd15f8903633972cb7e932b0b0dcda54638ae02ad8e56212a3ba';
const provider = getDefaultProvider('https://rpc.testnet.immutable.com');

const grantMinterRole = async (
  provider: Provider
): Promise<TransactionResponse> => {
  // Bound contract instance
  const contract = new ERC721Client(CONTRACT_ADDRESS);
  // The wallet of the intended signer of the mint request
  const wallet = new Wallet(PRIVATE_KEY, provider);

  // Give the wallet minter role access
  const populatedTransaction = await contract.populateGrantMinterRole(
    wallet.address, {
  maxPriorityFeePerGas: 100e9,
  maxFeePerGas: 150e9
}
  );
  const result = await wallet.sendTransaction(populatedTransaction);
  return result;
};

grantMinterRole(provider);