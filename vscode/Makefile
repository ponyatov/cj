# src
M += $(wildcard *.ml)
D += $(wildcard dune*)

# extension
.PHONY: run extension
run: extension
extension: /tmp/extension.byte
/tmp/extension.byte: $(M) $(D)
	ocamlfind ocamlc \
		-package js_of_ocaml -package js_of_ocaml-ppx -linkpkg \
			-o $@ $(M)

# format
.PHONY: format
format: /tmp/format_ml
/tmp/format_ml: $(M)
	dune fmt ; touch $@

# install
.PHONY: install update
install:
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.txt`
	opam update
	opam install -y . --deps-only
ref:
gz:
