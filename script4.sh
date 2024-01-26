
# Function to display metadata using ExifTool
display_metadata() {
    echo "Metadata for file: $1"
    exiftool "$1"
}

# Function to display media information using Mediainfo
display_media_info() {
    echo "Media information for file: $1"
    mediainfo "$1"
}

# Function to analyze images for steganography using Strings
analyze_steganography() {
    echo "Analyzing image for steganography: $1"
    strings "$1" | grep -i "secret"  # Modify this line based on specific steganography indicators
}

# Main script

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

directory="$1"

if [ ! -d "$directory" ]; then
    echo "Error: Directory not found."
    exit 1
fi

echo "Analyzing files in directory: $directory"

for file in "$directory"/*; do
    if [ -f "$file" ]; then
        echo "-----------------------------------"
        echo "File: $file"

        # Check the file type and perform corresponding actions
        case "$(file -b --mime-type "$file")" in ("image/"*)
                display_metadata "$file"
                display_media_info "$file"
                analyze_steganography "$file";;"video/"* | "audio/"*)
                display_metadata "$file"
                display_media_info "$file";;"application/pdf")
                display_metadata "$file";;"text/plain")
                # Add specific actions for text files if needed
                echo "Text file detected. No specific analysis performed.";;*)
                echo "Unsupported file type: $file";;
        esac
    fi
done
