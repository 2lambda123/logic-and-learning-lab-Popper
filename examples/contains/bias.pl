%% checks whether a list contrains either 6 or 9
%% f(V0):- head(V0,V1),c_6(V1).
%% f(V0):- head(V0,V1),c_9(V1).
%% f(V0):- tail(V0,V1),f(V1).

enable_recursion.
max_clauses(3).

head_pred(f,1).
body_pred(c_0,1).
body_pred(c_1,1).
body_pred(c_10,1).
body_pred(c_2,1).
body_pred(c_3,1).
body_pred(c_4,1).
body_pred(c_5,1).
body_pred(c_6,1).
body_pred(c_7,1).
body_pred(c_8,1).
body_pred(c_9,1).
body_pred(decrement,2).
body_pred(empty,1).
body_pred(even,1).
body_pred(geq,2).
body_pred(head,2).
body_pred(odd,1).
body_pred(one,1).
body_pred(tail,2).
body_pred(zero,1).

direction(c_0,(in,)).
direction(c_1,(in,)).
direction(c_10,(in,)).
direction(c_2,(in,)).
direction(c_3,(in,)).
direction(c_4,(in,)).
direction(c_5,(in,)).
direction(c_6,(in,)).
direction(c_7,(in,)).
direction(c_8,(in,)).
direction(c_9,(in,)).
direction(cons,(in,in,out)).
direction(decrement,(in,out)).
direction(element,(in,out)).
direction(empty,(in,)).
direction(even,(in,)).
direction(f,(in,)).
direction(geq,(in,in)).
direction(head,(in,out)).
direction(increment,(in,out)).
direction(odd,(in,)).
direction(one,(in,)).
direction(sum,(in,in,out)).
direction(tail,(in,out)).
direction(zero,(out,)).

type(c_0,(element,)).
type(c_1,(element,)).
type(c_10,(element,)).
type(c_2,(element,)).
type(c_3,(element,)).
type(c_4,(element,)).
type(c_5,(element,)).
type(c_6,(element,)).
type(c_7,(element,)).
type(c_8,(element,)).
type(c_9,(element,)).
type(cons,(element,list,list)).
type(decrement,(element,element)).
type(element,(list,element)).
type(empty,(list,)).
type(even,(element,)).
type(f,(list,)).
type(geq,(element,element)).
type(head,(list,element)).
type(increment,(element,element)).
type(odd,(element,)).
type(one,(element,)).
type(sum,(element,element,element)).
type(tail,(list,list)).
type(zero,(element,)).
