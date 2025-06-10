#!/bin/bash

# Get CPU temperature - try to find AMD k10temp Tctl value, which appears to be the CPU temp on this system
temp=$(sensors | grep -A 0 'Tctl:' | head -n 1 | awk '{print $2}' | sed 's/[^0-9.]//g')

# If not found, try other common CPU temp formats
if [ -z "$temp" ]; then
    # Try to find Core 0 (common on Intel systems)
    temp=$(sensors | grep -A 0 'Core 0' | awk '{print $3}' | sed 's/[^0-9.]//g')
    
    # If still not found, try CPUTIN from nct sensor
    if [ -z "$temp" ]; then
        temp=$(sensors | grep -A 0 'CPUTIN:' | awk '{print $2}' | sed 's/[^0-9.]//g')
    fi
fi

# Format the output
if [ -n "$temp" ]; then
    # Format to whole number with no decimal places
    formatted_temp=$(printf "%.0f" "$temp")
    echo "{\"text\": \"${formatted_temp}°C\", \"tooltip\": \"CPU Temperature: ${formatted_temp}°C\"}"
else
    echo "{\"text\": \"N/A\", \"tooltip\": \"Could not read CPU temperature\"}"
fi
