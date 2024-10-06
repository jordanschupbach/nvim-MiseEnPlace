cxx-run:
	make -C lua/cxx run

lua-test:
	busted ./test/playmodule_spec.lua
