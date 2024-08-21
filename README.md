# Instructions

1. **Update the Deployer Private Key:**
   - Edit the `packages/foundry/.env` file and change the deployer private key.

2. **Ensure Token Availability:**
   - Verify that the deployer private key account has been faucetted with MOVE tokens to cover gas fees.

3. **Run the Following Commands:**
   ```bash
   yarn install
   yarn deploy --network mevm
   yarn start