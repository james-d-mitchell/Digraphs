#############################################################################
##
#W  extreme/cliques.tst
#Y  Copyright (C) 2024                                   James D. Mitchell
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##
gap> START_TEST("Digraphs package: extreme/cliques.tst");
gap> LoadPackage("digraphs", false);;

#
gap> DIGRAPHS_StartTest();

gap> DigraphFromGraph6String("~??~J\\zyknMxze~F~R~j^yz~X~|r~zj~zV~|l~~]^~yr}^Em^nHu|~Ir~ndi~zxrN~^Ky}~{Zl^~wzj^~wlr~~{\
N[~~~Pnl~~yd}v~~if|n~~R^jv~~Q~fn~~k^}V~~zJ~i~~~[^}Z~~|h~}N~~wKpnz{^wUW||u|{hF}MN~zGq{nL~vxIfiq~~^`idzzjn~CiU~{l~~\
DKZ]~M~~gfsj~|L~y`}RN~fn~Oncn~xf~{XdNfh~~~yR{[N~xv~xbFrVN~n~|`~oN~~B~~ON_@~w?~pPAF_ON}EN{`G`opJfR^N?aCnK`fJ\\~@CH\
UVAZ[f~aCHK[E]~dVw");
gap> Length(DigraphCliquesReps(D));


#  DIGRAPHS_UnbindVariables
gap> Unbind(D);
gap> Unbind(c);
gap> Unbind(cliques);
gap> Unbind(f);
gap> Unbind(gr);
gap> Unbind(lim);
gap> Unbind(out);

#
gap> DIGRAPHS_StopTest();
gap> STOP_TEST("Digraphs package: standard/cliques.tst", 0);
