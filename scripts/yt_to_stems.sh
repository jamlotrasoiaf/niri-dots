#!/bin/bash

# === CONFIGURABLE ===
OUTPUT_DIR="./separated_tracks"
STEMS="vocals"        # or use "all" for 4 stems
DEM_MODEL="htdemucs"
DEVICE="cpu"          # or "cuda" if you have a GPU

# === CHECKS ===
if ! command -v yt-dlp &> /dev/null; then
    echo "❌ yt-dlp not found. Install it with: sudo pacman -S yt-dlp"
    exit 1
fi

if ! command -v demucs &> /dev/null; then
    echo "❌ demucs not found. Activate your env or install it with: pip install demucs"
    exit 1
fi

if [ $# -eq 0 ]; then
    echo "Usage: $0 <YouTube URL>"
    exit 1
fi

# === STEP 1: Download MP3 ===
echo "🎵 Downloading MP3 from YouTube..."
yt-dlp -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s" "$1"

# Get filename (assumes the newest .mp3 in directory is what was just downloaded)
MP3_FILE=$(ls -t *.mp3 | head -n1)

if [ ! -f "$MP3_FILE" ]; then
    echo "❌ Failed to download MP3."
    exit 1
fi

echo "✅ Downloaded: $MP3_FILE"

# === STEP 2: Run Demucs ===
echo "🎧 Running Demucs separation..."
demucs "$MP3_FILE" -o "$OUTPUT_DIR" -n "$DEM_MODEL" --two-stems "$STEMS" -d "$DEVICE"

echo "✅ Separation complete! Output at: $OUTPUT_DIR/$DEM_MODEL/$(basename "$MP3_FILE" .mp3)/"

# === DONE ===
