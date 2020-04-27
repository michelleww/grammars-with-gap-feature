:- ale_flag(subtypecover,_,off).
:- discontiguous sub/2,intro/2.

bot sub [mood, tense, sem, cat, pos, verbal, nominal, list].

    % parts of speech
    pos sub [n, p, v, det, toinf].
        n sub [].
        p sub [].
        v sub [].
        det sub [].
        toinf sub [].   % infinitival to

    % phrasal categories
    cat sub [vproj, np].
        vproj sub [inf_clause, s, vp] intro [mood:mood].
            inf_clause intro [mood:infinitive].
            s intro [mood:indicative].
            vp intro [mood:indicative].
        np sub [].

        verbal sub [v, vproj] intro [vsem:v_sem].
        nominal sub [n, np] intro [nsem:n_sem].
    
    % mood and tense for verbs
    tense sub [past, present].
        past sub [].    
        present sub [].

    mood sub [indicative, infinitive].
        indicative intro [tense:tense].
        infinitive sub [].

    % semantics for verbs and nouns
    sem sub [v_sem, n_sem].

        % semantics for nouns
        n_sem sub [student, teacher].
            student sub [].
            teacher sub [].

        % semantics for verbs 
        % introduce tense as features to obtain the rule for 'to + present tense'
        % choose to use subcat
        v_sem sub [try, appear, promise, expect, sleep]
              intro [vtense:tense, subcat:list].     % This should not be empty!  Fill in features for this and
                            % the following subtypes:

            % introduce roles for each verbs based on the assignment description.
            % introduce agent and theme for try
            try sub [] intro [try_agent:n_sem, try_theme:v_sem].

            % introduce theme for appear
            appear sub [] intro [appear_theme:v_sem].

            % introduce agent and theme and beneficiary for promise. No prefix for beneficiary since only promise has this role.
            promise sub [] intro [promise_agent:n_sem, promise_theme:v_sem, beneficiary:n_sem].

            % introduce agent and theme for expect
            expect sub [] intro [expect_agent:n_sem, expect_theme:v_sem].

            % introduce experiencer for sleep. No prefix for experiencer since only sleep has this role.
            sleep sub [] intro [experiencer:n_sem].

    % added for subcat
    list sub [e_list,ne_list].
        ne_list intro [hd:bot,tl:list].

% Rules

% basic rule for NP
det_n__np rule
    (np, nsem:N) ===>
    cat> det,
    cat> (n, nsem:N).

% basic rule for s
np_vp__s rule
    s ===>
    cat> (np, nsem:A),
    cat> (vp, vsem:(subcat:[(np, nsem:A)|_])).

% rules for infinitive clause : to + vp or to + v
toinf_v__inf_clause rule
    (inf_clause, vsem:(subcat:[(np, nsem:A), (inf_clause, vsem:Inf)], vtense:present))===>
    cat> toinf,
    cat> (v, vsem:(subcat:[(np, nsem:A)|_]), vsem:(Inf, vtense:present)).

toinf_vp__inf_clause rule
    (inf_clause, vsem:(subcat:[(np, nsem:A), (inf_clause, vsem:Inf)]))===>
    cat> toinf,
    cat> (vp, vsem:(subcat:[(np, nsem:A), (inf_clause, vsem:Inf)], vtense:present)).

% rules for vp: v + infinitive clasue (for try and appear)  or  v + NP + infinitive clasue(for promise and expect)

% note that here assumes try and appear can be followed directly by 'to'
v_try_inf_clause__vp rule
    (vp, vsem:(subcat:[(np, nsem:A), (inf_clause, vsem:T)], vtense:Tense)) ===>
    cat> (v, vsem:(try, subcat:[(np, nsem:A), (inf_clause, vsem:Inf)]), vsem:(T, vtense:Tense)),
    cat> (inf_clause, vsem:(subcat:[(np, nsem:A), (inf_clause, vsem:Inf)])).

v_appear_inf_clause__vp rule
    (vp, vsem:(subcat:[(np, nsem:A), (inf_clause, vsem:T)], vtense:Tense)) ===>
    cat> (v, vsem:(appear, subcat:[(np, nsem:A), (inf_clause, vsem:Inf)]), vsem:(T, vtense:Tense)),
    cat> (inf_clause, vsem:(subcat:[(np, nsem:A), (inf_clause, vsem:Inf)])).
    
% note that here assumes for promise and expect, there should be NP in the middle
v_promise_np_inf_clause__vp rule
    (vp, vsem:(subcat:[(np, nsem:A), (inf_clause, vsem:T)], vtense:Tense)) ===>
    cat> (v, vsem:(promise, subcat:[(np, nsem:A), (inf_clause, vsem:Inf), (np, nsem:C)]), vsem:(T, vtense:Tense)),
    cat> (np, nsem:C),
    cat> (inf_clause, vsem:(subcat:[(np, nsem:A), (inf_clause, vsem:Inf)])).

v_expect_np_inf_clause__vp rule
    (vp, vsem:(subcat:[(np, nsem:A), (inf_clause, vsem:T)], vtense:Tense)) ===>
    cat> (v, vsem:(expect, subcat:[(np, nsem:A), (inf_clause, vsem:Inf), (np, nsem:C)]), vsem:(T, vtense:Tense)),
    cat> (np, nsem:C),
    cat> (inf_clause, vsem:(subcat:[(np, nsem:C), (inf_clause, vsem:Inf)])).

% recursive rule 
vp_inf_clause__vp rule
    (vp, vsem:(vtense:Tense, subcat:[(np, nsem:A), (inf_clause, vsem:Inf)])) ===>
    cat> (vp,vsem:(vtense:Tense, subcat:[(np, nsem:A), (inf_clause, vsem:subcat:[(np, nsem:A), (inf_clause, vsem:Inf)])])),
    cat> (inf_clause, vsem:(subcat:[(np, nsem:A), (inf_clause, vsem:Inf)])).


% Lexicon
% two form for each verb
appear ---> (v, vsem:(appear, 

                    vtense:present,

                    appear_theme: B,

                    subcat:[(np, nsem:A), (inf_clause, vsem:B)])).   

appeared ---> (v, vsem:(appear, 

                    vtense:past,

                    appear_theme: B,

                    subcat:[(np, nsem:A), (inf_clause, vsem:B)])).   

expect ---> (v, vsem:(expect, 

                    vtense:present,

                    expect_agent:A,

                    expect_theme: B,

                    subcat:[(np, nsem:A), (inf_clause, vsem:B), (np,nsem:C)])).

expected ---> (v, vsem:(expect, 

                    vtense:past,

                    expect_agent:A,

                    expect_theme: B,    

                    subcat:[(np, nsem:A), (inf_clause, vsem:B),(np,nsem:C)])).

promise ---> (v, vsem:(promise, 

                    vtense:present,

                    promise_agent:A,

                    promise_theme: B,

                    beneficiary:C,

                    subcat:[(np, nsem:A), (inf_clause, vsem:B),(np, nsem:C)])).

promised ---> (v, vsem:(promise, 

                    vtense:past,

                    promise_agent:A,

                    promise_theme: B,

                    beneficiary:C,

                    subcat:[(np, nsem:A), (inf_clause, vsem:B), (np, nsem:C)])).



sleep ---> (v, vsem:(sleep,

                    experiencer:A,

                    vtense:present,

                    subcat:[(np,nsem:A)])).

slept ---> (v, vsem:(sleep,

                    experiencer:A,

                    vtense:past,

                    subcat:[(np,nsem:A)])).

student ---> (n, nsem: student).

teacher ---> (n, nsem: teacher).

the ---> det.

to ---> toinf.

tried ---> (v, vsem:(try, 

                    vtense:past,

                    try_agent: A,

                    try_theme: B,

                    subcat:[(np, nsem:A), (inf_clause, vsem:B)])).   

try ---> (v, vsem:(try, 
                    vtense:present,

                    try_agent: A,

                    try_theme: B,

                    subcat:[(np, nsem:A), (inf_clause, vsem:B)])).                    