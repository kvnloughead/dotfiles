SCRIPT_DIR="$HOME/.scripts"

# loop through all the files in the directory
for file in "$SCRIPT_DIR"/*.sh; do
  # check if the file exists and is readable
  if [[ -r "$file" && "$file" != "$SCRIPT_DIR/index.sh" ]]; then
    # source the file
    source "$file"
  fi
done
