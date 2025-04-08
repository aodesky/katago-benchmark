#!/bin/bash

~/katago-benchmark/install-packages.sh

# run initial benchmark
~/KataGo/cpp/katago benchmark -model ~/kata1-b28c512nbt-s8476434688-d4668249792.bin.gz -config ~/2gpus.cfg >> ~/katago-benchmark/results/benchmark.log

# run game analysis
~/katago-benchmark/analyze.sh >> ~/katago-benchmark/results/game-analysis.log

