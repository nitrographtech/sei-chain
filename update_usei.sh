#!/bin/bash
# Script to update all "usei" references to "unos" in local-cosmos directory

# Files with "usei" that need updating (from the search results)
files=(
    "local-cosmos/x/staking/simulation/operations_test.go"
    "local-cosmos/x/staking/simulation/genesis_test.go"
    "local-cosmos/x/staking/genesis_test.go"
    "local-cosmos/x/staking/client/testutil/suite.go"
    "local-cosmos/x/params/types/subspace_test.go"
    "local-cosmos/x/params/types/table_test.go"
    "local-cosmos/x/mint/simulation/genesis_test.go"
    "local-cosmos/x/params/keeper/keeper_test.go"
    "local-cosmos/x/mint/client/testutil/suite.go"
    "local-cosmos/x/mint/client/rest/grpc_query_test.go"
    "local-cosmos/x/gov/types/msgs_test.go"
    "local-cosmos/x/gov/client/testutil/suite.go"
    "local-cosmos/x/gov/genesis_test.go"
    "local-cosmos/x/distribution/types/fee_pool_test.go"
    "local-cosmos/x/distribution/legacy/v034/types.go"
    "local-cosmos/x/distribution/keeper/querier_test.go"
    "local-cosmos/x/distribution/client/testutil/suite.go"
    "local-cosmos/x/auth/vesting/types/vesting_account_test.go"
    "local-cosmos/x/bank/types/key_test.go"
    "local-cosmos/x/bank/legacy/v040/migrate_test.go"
    "local-cosmos/x/auth/legacy/v040/migrate_test.go"
    "local-cosmos/x/auth/client/testutil/suite.go"
    "local-cosmos/x/authz/client/testutil/tx.go"
    "local-cosmos/types/dec_coin_test.go"
    "local-cosmos/types/utils_test.go"
    "local-cosmos/types/coin_test.go"
    "local-cosmos/x/accesscontrol/keeper/keeper_test.go"
)

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "Updating $file..."
        # Replace "usei" with "unos" only in string literals (inside quotes)
        sed -i 's/"usei"/"unos"/g' "$file"
        sed -i "s/'usei'/'unos'/g" "$file"
        # Also handle cases where it appears in backticks
        sed -i 's/`usei`/`unos`/g' "$file"
    else
        echo "File not found: $file"
    fi
done

echo "Update complete!"
