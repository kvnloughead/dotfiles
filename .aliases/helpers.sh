sort_string() {
  echo $1 | grep -o . | sort | tr -d '\n'
}

# makes backup of file in the cwd, preserving the extension
# turns foo.baz.ext into foo.baz.bak.ext
bak() {
  FILENAME=$1
  echo "${FILENAME%.*}".bak."${FILENAME##*.}"
}

# Makes prompt "anonymous" by showing only $
anon() { 
  PS1="$ "
}

loadssh() {
	eval "$(ssh-agent -s)" >/dev/null
	ssh-add ~/.ssh/id_ed25519  2>/dev/null # my key
	ssh-add ~/.ssh/practicum-key  2>/dev/null # doppleganger key
}
