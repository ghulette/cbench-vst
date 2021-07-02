# To build this, you must have installed:
#  VST, CompCert, Flocq, Gappa
# These should be in Coq's user-contrib, in the standard place
# where the "Coq Platform" opam install will put them,
# starting with Coq Platform release 8.12.0.

CLIGHTGEN=clightgen

target: subsume_sqrt1.vo

%.vo: %.v
	coqc $*.v

sqrt1.v: sqrt1.c
	$(CLIGHTGEN) -normalize $<

from_g.v: sqrt1.g
	gappa -Bcoq sqrt1.g > from_g.v

sqrt1_f.vo: sqrt1_f.v float_lemmas.vo
sqrt1_f_correct.vo: sqrt1_f_correct.v sqrt1_f.vo from_g.vo

verif_sqrt1.vo: verif_sqrt1.v sqrt1.vo sqrt1_f.vo
subsume_sqrt1.vo: subsume_sqrt1.v verif_sqrt1.vo sqrt1_f_correct.vo

clean:
	rm -f *.vo *.vo? *.o .*.aux *.glob from_g.v sqrt1.v
