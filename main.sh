#!/bin/bash

NUM_GPUS="$1"
MYHOMEDIR="${HOME}"
CONFIG_FILE="${MYHOMEDIR}/katago-benchmark/${NUM_GPUS}gpus.cfg"

echo "Installing Katago..."

~/katago-benchmark/install-packages.sh

echo "Done!"

echo "Running initial benchmark..."

mkdir ~/katago-benchmark/results

# run initial benchmark
~/KataGo/cpp/katago benchmark -model ~/kata1-b28c512nbt-s8476434688-d4668249792.bin.gz -config "$CONFIG_FILE" >> ~/katago-benchmark/results/benchmark.log

echo "Done!"

echo "Running game analysis..."

# run game analysis

# first pass
~/katago-benchmark/analyze.sh $1 >> ~/katago-benchmark/results/game-analysis1.log

# second pass
~/katago-benchmark/analyze.sh $1 >> ~/katago-benchmark/results/game-analysis2.log

echo "Done!"

