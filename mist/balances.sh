#!/bin/bash

# List of your addresses
ADDRESSES="
    1EEiGRU3P88CeMhEYGsQBmzxknw3gtpncTE76jx7Y58mE
    1EVr6MCWgucwQqQukA4HZimondaRjwouDPmcqsB2g5Jt6
    "

SUM=0

echo Balances:
for ADDR in $ADDRESSES
do
    BALANCE=$(curl -s https://mainnet-backend.alephium.org/addresses/$ADDR | jq ".balance" | tr -d '"')
    FORMATTED_BALANCE=$(echo "scale=5; $BALANCE / 1000000000000000000" | bc)
    echo $ADDR: $FORMATTED_BALANCE

    SUM=$(echo "$SUM + $FORMATTED_BALANCE" | bc)
done

echo "---"
echo "Total: "$SUM
