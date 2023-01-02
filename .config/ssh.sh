loadssh() {
	eval "$(ssh-agent -s)" >/dev/null
	ssh-add ~/.ssh/id_ed25519  2>/dev/null # my key
	ssh-add ~/.ssh/practicum-key  2>/dev/null # doppleganger key
}
