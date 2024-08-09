#!/bin/bash

# Function to organize files in a given directory
organize_files() {
  local dir="$1"
  cd "$dir" || return
  
  folders=('Image_Files' 'Docs' 'Audio_Files' 'Video_Files' 'PDFs' 'Scripts' 'Compressed_Files')
  # Create Folders if they don't already exist
  # a better way than writing them out manually
  subdir="${dir##*/}"
  if ! [[ ${folders[@]} =~ "$subdir"  ]]
  then
       for folder in "${folders[@]}"
  	do 
           mkdir -p "$folder"
         done
    fi
  
  
  #mkdir -p Image_Files Docs Audio_Files Video_Files PDFs Scripts Compressed_Files

  # move Image Files to image folders and supress error msgs
  mv *.png *.jpg *.jpeg *.tif *.tiff *.bpm *.gif *.eps *.raw Image_Files 2>/dev/null

  #Docs Files 
  mv *.doc *.docx *.txt Docs 2>/dev/null

  # Audio Files
  mv *.mp3 *.m4a *.flac *.aac *.ogg *.wav Audio_Files 2>/dev/null

  # Video Files 
  mv *.mp4 *.mov *.avi *.mpg *.mpeg *.webm *.mpv *.mp2 *.wmv *.mkv Video_Files 2>/dev/null

  # PDFs 
  mv *.pdf PDFs 2>/dev/null

  # Scripts
  mv *.py *.rb *.sh Scripts 2>/dev/null

  # Compressed Files
  mv *.rar *.zip *.gz Compressed_Files 2>/dev/null

  # Move the organizing script itself back to the parent folder after going one level down
  if [[ "$dir" == "." ]]; then
    mv organize.sh .. 2>/dev/null
  fi

  cd - > /dev/null
}

# Organize files in the parent directory
organize_files "$1"

# Organize files in the first-level subdirectories
for subdir in "$1"/*; do
  if [[ -d "$subdir" ]]; then
    organize_files "$subdir"

    echo "All done organizing your messy '$subdir' folder"

  fi
done

echo "All done organizing your messy messy '$1' folder"


