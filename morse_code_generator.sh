#!/bin/bash

# Morse code dictionary
declare -A morse=(
    ["A"]=".-" ["B"]="-..." ["C"]="-.-." ["D"]="-.." ["E"]="."
    ["F"]="..-." ["G"]="--." ["H"]="...." ["I"]=".." ["J"]=".---"
    ["K"]="-.-" ["L"]=".-.." ["M"]="--" ["N"]=".-" ["O"]="---"
    ["P"]=".--." ["Q"]="--.-" ["R"]=".-." ["S"]="..." ["T"]="-"
    ["U"]="..-" ["V"]="...-" ["W"]=".--" ["X"]="-..-" ["Y"]="-.--"
    ["Z"]="--.." ["0"]="-----" ["1"]=".----" ["2"]="..---" ["3"]="...--"
    ["4"]="....-" ["5"]="....." ["6"]="-...." ["7"]="--..." ["8"]="---.."
    ["9"]="----."
)

# Function to convert text to Morse code
to_morse() {
    local input=$1
    local output=""
    # Convert input to uppercase
    input=$(echo "$input" | tr '[:lower:]' '[:upper:]')
    
    # Process each character
    for ((i=0; i<${#input}; i++)); do
        char="${input:$i:1}"
        if [[ -n "${morse[$char]}" ]]; then
            output+="${morse[$char]} "
        else
            output+="? "
        fi
    done
    echo "$output"
}

# Check if input is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <text_to_convert>"
    exit 1
fi

# Convert input text to Morse code
result=$(to_morse "$1")
echo "Input: $1"
echo "Morse code: $result"
