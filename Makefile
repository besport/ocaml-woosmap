NAME=woosmap
PACKAGE=-package gen_js_api,js_of_ocaml
all:
	ocamlfind gen_js_api/gen_js_api $(NAME).mli
	ocamlfind ocamlc -c $(PACKAGE) woosmap_converter.ml $(NAME).mli
	ocamlfind ocamlc -c -package gen_js_api.ppx $(PACKAGE) woosmap_converter.ml $(NAME).ml
	ocamlfind ocamlc -a -package gen_js_api.ppx -o $(NAME).cma $(NAME).cmo
	ocamlfind ocamlc -a -package gen_js_api.ppx -o woosmap_converter.cma woosmap_converter.cmo

install: all
	ocamlfind install ocaml-googlemaps META *.cma *.cmi

mrproper:
	rm -rf maps *.cmi *.cmo *.cma

clean:
	rm -rf $(NAME) $(NAME).ml *.cmi *.cmo *.cma
