% add two feature: one feature to represent the singular and plur; the other feature to represents the type of the NP
bot sub [cat, count_feature, type].
    cat sub [det, p, pp, s, has_count].
        has_count sub [v, vp, np, n] intro [count:count_feature].
        np sub [] intro [type:type].
    count_feature sub [sg, pl]. 
    type sub [pronoun, other].

% consider only fido as pronoun
% other NPs like the dog or the dog with biscuits will be considered as type other 

% only a plur noun can form an NP without starting with a det
n_pp__np rule
    (np, count:Count, type:other) ===>
    cat> (n, count:(Count, pl)),
    cat> pp.

% det can be followed by both plur and singular
det_n_pp__np rule
    (np, count:Count, type:other) ===>
    cat> det,
    cat> (n, count:Count),
    cat> pp.

det_n__np rule
    (np, count:Count, type:other) ===>
    cat> det,
    cat> (n, count:Count).

% only a plur noun can form an NP without starting with a det
n__np rule
    (np, count:Count, type:other) ===>
    cat> (n, count:(Count, pl)).

% the count of np in this rule does not really matter
p_np__pp rule
    pp ===>
    cat> p,
    cat> (np).

% the count of verb represents the count of the VP
v_np__vp rule
    (vp, count:Count) ===>
    cat> (v, count:Count),
    cat> (np).

% the count of np and the count of vp should match
np_vp__s rule
    s ===>
    cat> (np, count:Count),
    cat> (vp, count:Count).


% Lexicon in alphabetic order.

biscuits ---> (n, count:pl).

dog ---> (n, count:sg).

feed ---> (v, count:pl).

feeds ---> (v, count:sg).

fido ---> (np, count:sg, type:pronoun).

puppies ---> (n, count:pl).

the ---> det.

with ---> p.