#!/bin/bash
# Script to update remaining "usei" references to "unos" in local-cosmos directory

# Files with remaining "usei" references (from the search results)
files=(
    "local-cosmos/x/feegrant/client/testutil/suite.go"
    "local-cosmos/x/distribution/simulation/operations_test.go"
    "local-cosmos/x/distribution/keeper/grpc_query_test.go"
    "local-cosmos/x/distribution/keeper/keeper_test.go"
    "local-cosmos/x/authz/simulation/genesis.go"
    "local-cosmos/x/authz/simulation/operations_test.go"
    "local-cosmos/x/bank/types/send_authorization_test.go"
    "local-cosmos/x/auth/legacy/v043/store_test.go"
    "local-cosmos/x/bank/keeper/keeper_test.go"
    "local-cosmos/x/auth/ante/feegrant_test.go"
    "local-cosmos/x/auth/ante/testutil_test.go"
)

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "Updating $file..."
        # Replace Coin("usei" with Coin("unos"
        sed -i 's/Coin("usei"/Coin("unos"/g' "$file"
        sed -i 's/NewCoin("usei"/NewCoin("unos"/g' "$file"
        sed -i 's/NewInt64Coin("usei"/NewInt64Coin("unos"/g' "$file"
        sed -i 's/NewDecCoinFromDec("usei"/NewDecCoinFromDec("unos"/g' "$file"
        sed -i 's/NewInt64DecCoin("usei"/NewInt64DecCoin("unos"/g' "$file"
    else
        echo "File not found: $file"
    fi
done

echo "Update complete!"
