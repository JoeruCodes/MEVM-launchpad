import { type Chain } from "viem";
import * as chains from "viem/chains";

export type ScaffoldConfig = {
  targetNetworks: readonly chains.Chain[];
  pollingInterval: number;
  alchemyApiKey: string;
  walletConnectProjectId: string;
  onlyLocalBurnerWallet: boolean;
  walletAutoConnect: boolean;
};

export const mevm = {
  id: 30730,
  name: "M1 MEVM",
  nativeCurrency: { name: "Move", symbol: "MOVE", decimals: 18 },
  rpcUrls: {
    default: {
      http: ["https://mevm.devnet.m1.movementlabs.xyz"],
    },
    public: {
      http: ["https://mevm.devnet.m1.movementlabs.xyz"],
    },
  },
  blockExplorers: {
    etherscan: { name: "Arbiscan", url: "https://explorer.mevm.devnet.m1.movementlabs.xyz" },
    default: { name: "Arbiscan", url: "https://explorer.mevm.devnet.m1.movementlabs.xyz" },
  },
  contracts: {
    multicall3: {
      address: "0xD67Eca381AAbd0c049554f5714E7d8C21864c560",
      blockCreated: 500,
    },
  },
} as const satisfies Chain;

const scaffoldConfig = {
  targetNetworks: [mevm],
  pollingInterval: 30000,
  alchemyApiKey: process.env.NEXT_PUBLIC_ALCHEMY_API_KEY || "oKxs-03sij-U_N0iOlrSsZFr29-IqbuF",
  walletConnectProjectId: process.env.NEXT_PUBLIC_WALLET_CONNECT_PROJECT_ID || "3a8170812b534d0ff9d794f19a901d64",
  onlyLocalBurnerWallet: true,
  walletAutoConnect: true,
} as const satisfies ScaffoldConfig;
export default scaffoldConfig;
