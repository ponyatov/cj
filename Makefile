# var
MODULE = $(notdir $(CURDIR))

# src
M += $(wildcard src/*.ml test/*.ml)
D += $(wildcard dune*) $(wildcard src/dune*)
S += $(wildcard lib/*.cj)
C += $(wildcard src/*.c*)
H += $(wildcard inc/*.h*)

# all
.PHONY: all run
all: $(M) $(D) $(S)
	dune build src/$(MODULE).exe
run: $(M) $(D) $(S)
	dune exec src/$(MODULE).exe $(S)

# format
.PHONY: format
format: tmp/format_ml
tmp/format_ml: $(M) $(D) .ocamlformat
	dune fmt ; touch $@

.ocamlformat:
	echo "version=`ocamlformat --version`" > $@
	echo "profile=default"                >> $@

# install
.PHONY: install update
install:
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.txt`
	opam update
	opam install -y . --deps-only

.PHONY: tools
tools: tools/README.md
tools/README.md:
	git clone -o gitee -b master git@gitee.com:dponyatov/cj-tools.git tools
