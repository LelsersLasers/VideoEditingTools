#!/bin/bash

# Check if the required arguments are provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <input_file.mp4> <timestamp>"
  echo "Example: $0 video.mp4 00:05:30"
  exit 1
fi

# Assign input arguments to variables
INPUT_FILE=$1
TIMESTAMP=$2

# Get the file name without extension and the file extension
FILENAME=$(basename -- "$INPUT_FILE")
BASENAME="${FILENAME%.*}"

# Output file names
OUTPUT_FILE_1="${BASENAME}_part1.mp4"
OUTPUT_FILE_2="${BASENAME}_part2.mp4"

# Use ffmpeg to split the video at the provided timestamp
# First part (from 0 to the timestamp)
ffmpeg -i "$INPUT_FILE" -t "$TIMESTAMP" -c copy "$OUTPUT_FILE_1"

# Second part (from the timestamp to the end)
ffmpeg -i "$INPUT_FILE" -ss "$TIMESTAMP" -c copy "$OUTPUT_FILE_2"

echo "Splitting complete."
echo "First part saved as $OUTPUT_FILE_1"
echo "Second part saved as $OUTPUT_FILE_2"

