Require Import VST.floyd.proofauto.
Require Import qsort3.
Instance CompSpecs : compspecs. make_compspecs prog. Defined.
Definition Vprog : varspecs. mk_varspecs prog. Defined.

Require Import float_lemmas.
Require Import Permutation.

Definition quicksort_spec :=
 DECLARE _quicksort
  WITH base: val, N: Z, al: list val
  PRE  [ _base_ptr OF tptr tdouble, _total_elems OF tint] 
    PROP(N=Zlength al; N <=Z.min Int.max_signed (Ptrofs.max_signed / sizeof tdouble); Forall def_float al)
    LOCAL(temp _base_ptr base; temp _total_elems (Vint (Int.repr N)))
    SEP(data_at Ews (tarray tdouble N) al base)
  POST [ tvoid ]
    EX bl: list val,
     PROP(Permutation al bl; sorted (f_cmp Cle) bl) 
     LOCAL ()
    SEP(data_at Ews (tarray tdouble N) bl base).

Definition main_spec :=
 DECLARE _main
  WITH gv : globals
  PRE  [] main_pre prog nil gv
  POST [ tint ]  
     PROP() 
     LOCAL (temp ret_temp (Vint (Int.repr 0)))
     SEP(TT).

Definition Gprog : funspecs :=
        ltac:(with_library prog [quicksort_spec]).
