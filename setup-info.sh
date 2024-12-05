#!/bin/bash

# File to store the input
INPUT_FILE="user_input.txt"

# Function to save input to a file
save_input() {
    echo "POOL_NUMBER=$POOL_NUMBER" > $INPUT_FILE
    echo "MINING_SERVER=$MINING_SERVER" >> $INPUT_FILE
    echo "WALLET_ADDRESS=$WALLET_ADDRESS" >> $INPUT_FILE
    echo "DEVICE_ID=$DEVICE_ID" >> $INPUT_FILE
    echo "NUMBER_THREADS=$NUMBER_THREADS" >> $INPUT_FILE
}

# Function to load input from a file
load_input() {
    if [ -f $INPUT_FILE ]; then
        source $INPUT_FILE
    else
        POOL_NUMBER=""
        WALLET_ADDRESS=""
        DEVICE_ID=""
        NUMBER_THREADS=""
        MINING_SERVER=""
    fi
}

# Load previous input if available
load_input

# Prompt the user for the pool number with a default value
DEFAULT_MINING_SERVER=${MINING_SERVER:-"ap"}
read -p "Enter the mining server [default: $DEFAULT_MINING_SERVER | value (ap|eu|na)]: " MINING_SERVER
MINING_SERVER=${MINING_SERVER:-$DEFAULT_MINING_SERVER}

# Prompt the user for the pool number with a default value
DEFAULT_POOL_NUMBER=${POOL_NUMBER:-"3956"}
read -p "Enter the pool number [default: $DEFAULT_POOL_NUMBER]: " POOL_NUMBER
POOL_NUMBER=${POOL_NUMBER:-$DEFAULT_POOL_NUMBER}

# Prompt the user for the wallet address with a default value
DEFAULT_WALLET_ADDR=${WALLET_ADDRESS:-"REcrmrkTvDLXTTzuTWpLnCABBzAjoWfNYx"}
read -p "Enter the wallet address [default: $DEFAULT_WALLET_ADDR]: " WALLET_ADDRESS
WALLET_ADDRESS=${WALLET_ADDRESS:-$DEFAULT_WALLET_ADDR}

# Prompt the user for the device id with a default value
DEFAULT_DEVICE_ID=${DEVICE_ID:-$(whoami)}
read -p "Enter the device id [default: $DEFAULT_DEVICE_ID]: " DEVICE_ID
DEVICE_ID=${DEVICE_ID:-$DEFAULT_DEVICE_ID}

# Prompt the user for the number of threads with a default value
DEFAULT_THREADS=${NUMBER_THREADS:-"7"}
read -p "Enter the number of threads [default: $DEFAULT_THREADS]: " NUMBER_THREADS
NUMBER_THREADS=${NUMBER_THREADS:-$DEFAULT_THREADS}

# Print the values to verify
echo "Pool Number: $POOL_NUMBER"
echo "Mining Server: $MINING_SERVER"
echo "Wallet Address: $WALLET_ADDRESS"
echo "Device ID: $DEVICE_ID"
echo "Number of Threads: $NUMBER_THREADS"

# Save the input for the next session
save_input
