index.html: Main.hs
	stack build && stack exec abanico > $@
