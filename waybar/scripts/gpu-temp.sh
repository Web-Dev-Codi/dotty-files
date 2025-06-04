#!/bin/bash

# Check if nvtop is installed
if ! command -v nvtop &> /dev/null; then
    echo '{"text": "nvtop not found", "tooltip": "Install nvtop", "class": "error"}'
    exit 1
fi

# Use sensors command to get GPU temperature directly
if command -v sensors &> /dev/null; then
    # Try to get temperature from AMD GPU
    GPU_TEMP=$(sensors | grep -A 4 amdgpu | grep edge: | grep -oP '\+\d+.\d*' | grep -oP '\d+' | head -n 1)
    
    if [ -z "$GPU_TEMP" ]; then
        # Try NVIDIA GPU format if AMD not found
        GPU_TEMP=$(sensors | grep -A 4 nvidia | grep temp1: | grep -oP '\+\d+.\d*' | grep -oP '\d+' | head -n 1)
    fi
    
    if [ -n "$GPU_TEMP" ]; then
        # Determine class based on temperature
        if [ "$GPU_TEMP" -lt 60 ]; then
            CLASS="cool"
        elif [ "$GPU_TEMP" -lt 80 ]; then
            CLASS="normal"
        else
            CLASS="hot"
        fi
        
        # Output in format waybar expects
        echo "{\"text\": \"${GPU_TEMP}°C\", \"tooltip\": \"GPU: ${GPU_TEMP}°C\", \"class\": \"$CLASS\"}"
        exit 0
    fi
fi

# Fallback to using nvtop if sensors didn't work
TEMP_FILE=$(mktemp)

# Run nvtop with minimal output and capture to file
nvtop --no-color -s 1 > "$TEMP_FILE" 2>&1 &
NVTOP_PID=$!

# Wait briefly for data
sleep 1.5

# Kill nvtop process
kill $NVTOP_PID &>/dev/null

# Extract temperature from captured output
GPU_TEMP=$(cat "$TEMP_FILE" | grep -oP '\d+(?=°C)' | head -n 1)
rm "$TEMP_FILE"

if [ -z "$GPU_TEMP" ]; then
    echo '{"text": "No Data", "tooltip": "Could not get GPU temperature", "class": "no-data"}'
    exit 0
fi

# Determine class based on temperature
if [ "$GPU_TEMP" -lt 60 ]; then
    CLASS="cool"
elif [ "$GPU_TEMP" -lt 80 ]; then
    CLASS="normal"
else
    CLASS="hot"
fi

# Output in format waybar expects
echo "{\"text\": \"${GPU_TEMP}°C\", \"tooltip\": \"GPU: ${GPU_TEMP}°C\", \"class\": \"$CLASS\"}"
