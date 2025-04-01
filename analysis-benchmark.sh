#!/bin/bash

# Configuration
KATAGO_CMD=(
    /home/KataGo/cpp/katago analysis
    -model /home/KataGo/kata1-b28c512nbt-s8476434688-d4668249792.bin.gz
    -config /home/KataGo/analysis_example.cfg
)

GAME_JSON="/home/game.json"
OUTPUT_LINES=294

# Run Katago with JSON piped directly
JSON_CONTENT="$(jq -c . "$GAME_JSON")"

# Start timing
start_time=$(date +%s.%N)

# Execute Katago and pipe JSON content immediately
echo "$JSON_CONTENT" | stdbuf -oL "${KATAGO_CMD[@]}" | head -n "$OUTPUT_LINES"

# End timing
end_time=$(date +%s.%N)

# Calculate elapsed time
elapsed=$(echo "$end_time - $start_time" | bc)
printf "Elapsed time: %.3f seconds\n" "$elapsed"

