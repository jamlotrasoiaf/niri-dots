#!/bin/bash
# needs sox and keyfinder_cli

input="$1"
orig=$(keyfinder-cli "$input" | awk '{print $2}')
declare -A toD=( ["C"]=2 ["C#"]=1 ["D"]=0 ["D#"]=-1 ["E"]=-2 ["F"]=-3 ["F#"]=-4 \
                ["G"]=5 ["G#"]=4 ["A"]=7 ["A#"]=6 ["B"]=3 )
shift=${toD[$orig]}
echo "Original key: $orig → shift ${shift} semitones to D Major"
sox "$input" "${input%.wav}_Dmaj.wav" pitch $((shift*100))
