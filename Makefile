# var
MODULE = $(notdir $(CURDIR))

# tool
CURL = curl -L -o

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

# doc
.PHONY: doc
doc: doc/098646-01.pdf

doc/098646-01.pdf:
	$(CURL) $@ https://www.tup.com.cn/upload/books/yz/098646-01.pdf

# install
.PHONY: install update
install: doc ref gz tools
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.txt`
	opam update
	opam install -y . --deps-only
ref: \
	ref/tools/README.md
gz:

ref/tools/README.md:
	git clone -o gitee -b dponyatov git@gitee.com:dponyatov/cj-tools.git ref/tools
