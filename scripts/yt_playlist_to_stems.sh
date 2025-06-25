#!/bin/sh

# === CONFIG ===
OUTPUT_DIR="./separated_playlist"
STEMS="vocals"           # Options: vocals | all
DEM_MODEL="htdemucs"
DEVICE="cpu"

# === CHECKS ===
if ! command -v yt-dlp &> /dev/null; then
    echo "❌ yt-dlp not found. Install it: sudo pacman -S yt-dlp"
    exit 1
fi

if ! command -v demucs &> /dev/null; then
    echo "❌ demucs not found. Activate your env or run: pip install demucs"
    exit 1
fi

if [ $# -eq 0 ]; then
    echo "Usage: $0 <YouTube playlist URL>"
    exit 1
fi

PLAYLIST_URL="$1"

# === STEP 1: Download all audio files ===
echo "🎵 Downloading entire playlist as MP3s..."
yt-dlp -x --audio-format mp3 --audio-quality 0 -o "%(playlist_index)s - %(title)s.%(ext)s" "$PLAYLIST_URL"

if [ $? -ne 0 ]; then
    echo "❌ Failed to download playlist."
    exit 1
fi

# === STEP 2: Process each MP3 ===
echo "🎧 Running Demucs on all MP3s..."

mkdir -p "$OUTPUT_DIR"

for file in *.mp3; do
    echo "🔍 Processing: $file"
    demucs "$file" -o "$OUTPUT_DIR" -n "$DEM_MODEL" --two-stems "$STEMS" -d "$DEVICE"
    echo "✅ Done: $file"
done

echo "🎉 Batch separation complete! Check output in: $OUTPUT_DIR/$DEM_MODEL/"

