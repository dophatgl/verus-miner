#!/usr/bin/bash
#root is ccminer repo
cd ccminer
# File to store the input
INPUT_FILE="../user_input.txt"

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

# Print the values to verify
echo "Pool Number: $POOL_NUMBER"
echo "Minning server: $MINING_SERVER"
echo "Wallet Address: $WALLET_ADDRESS"
echo "Device ID: $DEVICE_ID"
echo "Number of Threads: $NUMBER_THREADS"


#setup param
#URL="stratum+tcp://$MINING_SERVER.luckpool.net:$POOL_NUMBER"
URL="stratum+tcp://sg.vipor.net:5045"
ADDR="$WALLET_ADDRESS.$DEVICE_ID}"
echo "run verus ccminer program!"
echo "user info: WALLET_ADDRESS $WALLET_ADDRESS.$DEVICE_ID, POOL: $POOL_NUMBER, NUMBER_THREAD $NUMBER_THREADS, MINING_SERVER $MINING_SERVER"
./ccminer -a verus -o "$URL" -u "$ADDR" -p x -t "$NUMBER_THREADS"
