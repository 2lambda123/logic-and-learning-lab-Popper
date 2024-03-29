%% check whether a list is sorted
%% f(V0):- tail(V0,V2),tail(V2,V1),empty(V1).
%% f(V0):- head(V0,V2),tail(V0,V1),head(V1,V3),geq(V3,V2),f(V1).

max_vars(5).
max_body(5).

enable_recursion.

head_pred(f,1).
body_pred(head,2).
body_pred(tail,2).
body_pred(increment,2).
body_pred(decrement,2).
body_pred(geq,2).
body_pred(empty,1).
body_pred(even,1).
body_pred(odd,1).
body_pred(one,1).
body_pred(zero,1).

type(f,(list,)).
type(head,(list,element)).
type(tail,(list,list)).
type(increment,(element,element)).
type(decrement,(element,element)).
type(geq,(element,element)).
type(empty,(list,)).
type(even,(element,)).
type(odd,(element,)).
type(one,(element,)).
type(zero,(element,)).

direction(f,(in,)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(increment,(in,out)).
direction(decrement,(in,out)).
direction(geq,(in,in)).
direction(empty,(in,)).
direction(even,(in,)).
direction(odd,(in,)).
direction(one,(in,)).
direction(zero,(out,)).