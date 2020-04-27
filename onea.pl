bot sub [s, lexical, phrase].
    phrase sub [vpsg, vppl, pp, npsg, nppl, np].
    lexical sub [nprp, npl, vpl, vsg, det, nsg, p].

nppl__np rule
    np ===>
    cat> nppl.

npsg__np rule
    np ===>
    cat> npsg.

npl_pp__nppl rule
    nppl ===>
    cat> npl,
    cat> pp.

npl__nppl rule
    nppl ===>
    cat> npl.

det_npl_pp__nppl rule
    nppl ===>
    cat> det,
    cat> npl,
    cat> pp.

det_npl__nppl rule
    nppl ===>
    cat> det,
    cat> npl.

det_nsg_pp__npsg rule
    npsg ===>
    cat> det,
    cat> nsg,
    Cat> pp.

det_nsg__npsg rule
    npsg ===>
    cat> det,
    cat> nsg.

nprp__npsg rule
    npsg ===>
    cat> nprp.

p_np__pp rule
    pp ===>
    cat> p,
    cat> np.

vpl_np__vppl rule
    vppl ===>
    cat> vpl,
    cat> np.

vsg_np__vpsg rule
    vpsg ===>
    cat> vsg,
    cat> np.

nppl_vppl__s rule
    s ===>
    cat> nppl,
    cat> vppl.

npsg_vpsg__s rule
    s ===>
    cat> npsg,
    cat> vpsg.
    

biscuits ---> npl.

dog ---> nsg.

feed ---> vpl.

feeds ---> vsg.

fido ---> nprp.

puppies ---> npl.

the ---> det.

with ---> p.