%% python3 popper.py examples/reverse-higher-order
%% BEST PROG 108:
% f(A,B):-fold(inv1,C,A,B),empty(C).
% inv1(A,B,C):-tail(C,A),head(C,B).
%% Precision:1.00, Recall:1.00, TP:4, FN:0, TN:5, FP:0

enable_pi.

max_vars(5).
max_body(5).
max_clauses(2).

head_pred(f,2).
body_pred(head,2).
body_pred(tail,2).
%body_pred(my_append,3).
body_pred(empty,1).

body_pred(fold,4,ho).

type(f,(list,list)).
type(head,(list,element)).
type(tail,(list,list)).
%type(my_append,(list,element,list)).
type(empty,(list,)).

type(fold,((list,element,list),list,list,list)).

direction(f,(in,out)).
direction(head,(in,out)).
direction(tail,(out,in)).
%direction(my_append,(in,in,out)).
direction(empty,(out,)).

direction(fold,((in,in,out),in,in,out)).
