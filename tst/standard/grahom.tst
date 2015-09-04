#############################################################################
##
#W  standard/grahom.tst
#Y  Copyright (C) 2015                                   Wilfred A. Wilson
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##
gap> START_TEST("Digraphs package: standard/grahom.tst");
gap> LoadPackage("digraphs", false);;

#
gap> DIGRAPHS_StartTest();

#T# HomomorphismDigraphsFinder: checking errors and robustness
gap> HomomorphismDigraphsFinder(0, 0, 0, 0, 0, 0, 0, 0);
Error, Function Calls: number of arguments must be 9 (not 8)
gap> HomomorphismDigraphsFinder(0, 0, 0, 0, 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 1st and 2nd arguments <gr1> and <gr2> must be digraphs,
gap> gr1 := ChainDigraph(2);;
gap> gr2 := CompleteDigraph(3);;
gap> HomomorphismDigraphsFinder(0, gr2, 0, 0, 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 1st and 2nd arguments <gr1> and <gr2> must be digraphs,
gap> HomomorphismDigraphsFinder(gr1, 0, 0, 0, 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 1st and 2nd arguments <gr1> and <gr2> must be digraphs,
gap> HomomorphismDigraphsFinder(gr1, gr2, 0, 0, 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 3rd argument <hook> has to be a function with 2 arguments,
gap> HomomorphismDigraphsFinder(gr2, gr1, 0, 0, 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 3rd argument <hook> has to be a function with 2 arguments,
gap> gr1 := CompleteDigraph(2);;
gap> HomomorphismDigraphsFinder(gr1, gr2, 0, 0, 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 3rd argument <hook> has to be a function with 2 arguments,
gap> HomomorphismDigraphsFinder(gr1, gr2, IsTournament, 0, 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 3rd argument <hook> has to be a function with 2 arguments,
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, 0, 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 4th argument <user_param> must be a list,
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, "a", 0, 0, 0, 0, 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 5th argument <limit> has to be a positive integer or infinity,
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, "a", "a", 0, 0, 0, 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 5th argument <limit> has to be a positive integer or infinity,
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, "a", 1, 0, 0, 0, 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 6th argument <hint> has to be a positive integer or fail,
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, "a", 1, 1, 0, 0, 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 7th argument <isinjective> has to be a true or false,
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, "a", infinity, fail, 0, 0, 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 7th argument <isinjective> has to be a true or false,
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, "a", infinity, 2, true, 0, 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 8th argument <image> has to be a duplicate-free list of vertices of the
2nd argument <gr2>,
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, [], 1, 1, true, [1, []], 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 8th argument <image> has to be a duplicate-free list of vertices of the
2nd argument <gr2>,
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, [], 1, 1, true, [[], []], 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 8th argument <image> has to be a duplicate-free list of vertices of the
2nd argument <gr2>,
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, [], 1, 1, true, [0, 1], 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 8th argument <image> has to be a duplicate-free list of vertices of the
2nd argument <gr2>,
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, [], 1, 1, true, [4, 4], 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 8th argument <image> has to be a duplicate-free list of vertices of the
2nd argument <gr2>,
gap> HomomorphismDigraphsFinder(gr2, gr1, fail, [], 1, 1, true, [3], 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 8th argument <image> has to be a duplicate-free list of vertices of the
2nd argument <gr2>,
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, [], 1, 1, true, [3], 0);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 9th argument <map> must be a list of vertices of the 8th argument <image>
which is no longer than the number of vertices of the 1st argument <gr1>,
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, [], 1, 1, true, [3], [1 .. 4]);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 9th argument <map> must be a list of vertices of the 8th argument <image>
which is no longer than the number of vertices of the 1st argument <gr1>,
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, [], 1, 1, true, [], [1, 2, 3, 2]);
Error, Digraphs: HomomorphismDigraphsFinder: usage,
the 9th argument <map> must be a list of vertices of the 8th argument <image>
which is no longer than the number of vertices of the 1st argument <gr1>,
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, [], 1, 1, true, [1], [1]);
[  ]
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, [], 1, 2, true, [1, 2], [1]);
[ IdentityTransformation ]
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, [], 1, 3, false, [1, 2], [1]);
[  ]
gap> HomomorphismDigraphsFinder(gr2, gr1, fail, [], 1, 3, false, [1, 2], [1]);
[  ]
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, [], 1, 1, false, [], []);
[  ]
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, [], 1, 1, false, [1, 2], []);
[  ]
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, [], 1, 1, false, [1, 2], []);
[  ]
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, [], 1, 2, false, [1], []);
[  ]
gap> HomomorphismDigraphsFinder(gr1, gr1, fail, [], 1, 2, false, [1, 2], []);
[ IdentityTransformation ]
gap> gr := CompleteDigraph(513);;
gap> HomomorphismDigraphsFinder(gr, gr, fail, [], 1, fail, false, [1 .. 513], []);
Error, Digraphs: HomomorphismDigraphsFinder: error,
not yet implemented for digraphs with more than 512 vertices,

#T# GeneratorsOfEndomorphismMonoid: checking errors and robustness
gap> gr := ChainDigraph(2);
<digraph with 2 vertices, 1 edge>
gap> GeneratorsOfEndomorphismMonoid();
Error, Digraphs: GeneratorsOfEndomorphismMonoid: usage,
this function takes at least one argument,
gap> GeneratorsOfEndomorphismMonoid(Group(()));
Error, Digraphs: GeneratorsOfEndomorphismMonoid: usage,
the 1st argument <digraph> must be a digraph,
gap> GeneratorsOfEndomorphismMonoid(gr);
[ IdentityTransformation ]
gap> gr := DigraphTransitiveClosure(CompleteDigraph(2));
<digraph with 2 vertices, 4 edges>
gap> DigraphHasLoops(gr);
true
gap> GeneratorsOfEndomorphismMonoid(gr);
[ Transformation( [ 2, 1 ] ), IdentityTransformation, 
  Transformation( [ 1, 1 ] ) ]
gap> gr := EmptyDigraph(2);
<digraph with 2 vertices, 0 edges>
gap> GeneratorsOfEndomorphismMonoid(gr, Group(()), Group((1, 2)));
[ Transformation( [ 2, 1 ] ), IdentityTransformation, 
  Transformation( [ 1, 1 ] ) ]
gap> gr := EmptyDigraph(2);;
gap> GeneratorsOfEndomorphismMonoid(gr, Group(()));
[ Transformation( [ 2, 1 ] ), IdentityTransformation, 
  Transformation( [ 1, 1 ] ) ]
gap> gr := EmptyDigraph(2);;
gap> GeneratorsOfEndomorphismMonoid(gr, 1);
[ Transformation( [ 2, 1 ] ) ]
gap> gr := EmptyDigraph(2);;
gap> GeneratorsOfEndomorphismMonoid(gr, 2);
[ Transformation( [ 2, 1 ] ), IdentityTransformation ]
gap> gr := EmptyDigraph(2);;
gap> GeneratorsOfEndomorphismMonoidAttr(gr);;
gap> GeneratorsOfEndomorphismMonoid(gr, 4) = last;
true
gap> gens := GeneratorsOfEndomorphismMonoid(gr, 3);
[ Transformation( [ 2, 1 ] ), IdentityTransformation, 
  Transformation( [ 1, 1 ] ) ]
gap> IsFullTransformationSemigroup(Semigroup(gens));
true
gap> Size(Semigroup(gens));
4

#T# DigraphColoring and DigraphColouring: checking errors and robustness
gap> gr := Digraph([[2, 2], []]);
<multidigraph with 2 vertices, 2 edges>
gap> DigraphColouring(gr, 1);
Error, Digraphs: DigraphColoring: usage,
the 1st argument <digraph> must not be a  multidigraph,
gap> gr := EmptyDigraph(3);
<digraph with 3 vertices, 0 edges>
gap> DigraphColoring(gr, 4);
fail
gap> DigraphColoring(gr, 3);
IdentityTransformation
gap> DigraphColoring(gr, 2);
Transformation( [ 1, 2, 1 ] )
gap> DigraphColoring(gr, 1);
Transformation( [ 1, 1, 1 ] )
gap> gr := CompleteDigraph(3);
<digraph with 3 vertices, 6 edges>
gap> DigraphColoring(gr, 1);
fail
gap> DigraphColoring(gr, 2);
fail
gap> DigraphColoring(gr, 3);
IdentityTransformation

#T# DigraphMonomorphism
gap> gr1 := EmptyDigraph(1);;
gap> DigraphMonomorphism(gr1, gr1);
IdentityTransformation
gap> gr2 := EmptyDigraph(2);;
gap> DigraphMonomorphism(gr2, gr1);
fail
gap> DigraphMonomorphism(gr1, gr2);
IdentityTransformation
gap> DigraphMonomorphism(CompleteDigraph(2), Digraph([[2],[1,3],[2]]));
IdentityTransformation

# 
gap> gr := Digraph([[2,3], [], [], [5], [], []]);;
gap> gr := DigraphSymmetricClosure(gr);;
gap> x := [];;
gap> GRAPH_HOMOS(gr, gr, fail, x, fail, fail, false, [1..6], fail, fail);
[ IdentityTransformation, Transformation( [ 1, 2, 3, 4, 5, 1 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 2 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 3 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 4 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 5 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 4 ] ), Transformation( [ 1, 2, 3, 1, 2 ] ),
  Transformation( [ 1, 2, 3, 1, 2, 1 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 2 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 3 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 4 ] ), Transformation( [ 1, 2, 3, 1, 3 ] ),
  Transformation( [ 1, 2, 3, 1, 3, 1 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 2 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 3 ] ), 
  Transformation( [ 1, 2, 3, 2, 1, 4 ] ), Transformation( [ 1, 2, 3, 2, 1 ] ),
  Transformation( [ 1, 2, 3, 2, 1, 1 ] ), 
  Transformation( [ 1, 2, 3, 2, 1, 2 ] ), 
  Transformation( [ 1, 2, 3, 2, 1, 3 ] ), 
  Transformation( [ 1, 2, 3, 3, 1, 4 ] ), Transformation( [ 1, 2, 3, 3, 1 ] ),
  Transformation( [ 1, 2, 3, 3, 1, 1 ] ), 
  Transformation( [ 1, 2, 3, 3, 1, 2 ] ), 
  Transformation( [ 1, 2, 3, 3, 1, 3 ] ), 
  Transformation( [ 1, 2, 2, 3, 1, 4 ] ), Transformation( [ 1, 2, 2, 3, 1 ] ),
  Transformation( [ 1, 2, 2, 3, 1, 1 ] ), 
  Transformation( [ 1, 2, 2, 3, 1, 2 ] ), 
  Transformation( [ 1, 2, 2, 3, 1, 3 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 3 ] ), Transformation( [ 1, 2, 2 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 1 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 2 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 4 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 5 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 4 ] ), Transformation( [ 1, 2, 2, 1, 3 ] ),
  Transformation( [ 1, 2, 2, 1, 3, 1 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 2 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 3 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 3 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 4 ] ), Transformation( [ 1, 2, 2, 1, 2 ] ),
  Transformation( [ 1, 2, 2, 1, 2, 1 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 2 ] ), 
  Transformation( [ 1, 2, 2, 2, 1, 3 ] ), 
  Transformation( [ 1, 2, 2, 2, 1, 4 ] ), Transformation( [ 1, 2, 2, 2, 1 ] ),
  Transformation( [ 1, 2, 2, 2, 1, 1 ] ), 
  Transformation( [ 1, 2, 2, 2, 1, 2 ] ), 
  Transformation( [ 2, 1, 1, 3, 1, 4 ] ), Transformation( [ 2, 1, 1, 3, 1 ] ),
  Transformation( [ 2, 1, 1, 3, 1, 1 ] ), 
  Transformation( [ 2, 1, 1, 3, 1, 2 ] ), 
  Transformation( [ 2, 1, 1, 3, 1, 3 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 3 ] ), Transformation( [ 2, 1, 1 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 1 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 2 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 4 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 5 ] ), 
  Transformation( [ 2, 1, 1, 1, 3, 4 ] ), Transformation( [ 2, 1, 1, 1, 3 ] ),
  Transformation( [ 2, 1, 1, 1, 3, 1 ] ), 
  Transformation( [ 2, 1, 1, 1, 3, 2 ] ), 
  Transformation( [ 2, 1, 1, 1, 3, 3 ] ), 
  Transformation( [ 2, 1, 1, 1, 2, 3 ] ), 
  Transformation( [ 2, 1, 1, 1, 2, 4 ] ), Transformation( [ 2, 1, 1, 1, 2 ] ),
  Transformation( [ 2, 1, 1, 1, 2, 1 ] ), 
  Transformation( [ 2, 1, 1, 1, 2, 2 ] ), 
  Transformation( [ 2, 1, 1, 2, 1, 3 ] ), 
  Transformation( [ 2, 1, 1, 2, 1, 4 ] ), Transformation( [ 2, 1, 1, 2, 1 ] ),
  Transformation( [ 2, 1, 1, 2, 1, 1 ] ), 
  Transformation( [ 2, 1, 1, 2, 1, 2 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 3 ] ), Transformation( [ 4, 5, 5, 1, 2 ] ),
  Transformation( [ 4, 5, 5, 1, 2, 1 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 2 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 4 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 5 ] ), 
  Transformation( [ 4, 5, 5, 2, 1, 3 ] ), Transformation( [ 4, 5, 5, 2, 1 ] ),
  Transformation( [ 4, 5, 5, 2, 1, 1 ] ), 
  Transformation( [ 4, 5, 5, 2, 1, 2 ] ), 
  Transformation( [ 4, 5, 5, 2, 1, 4 ] ), 
  Transformation( [ 4, 5, 5, 2, 1, 5 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 1 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 2 ] ), Transformation( [ 4, 5, 5, 4, 5 ] ),
  Transformation( [ 4, 5, 5, 4, 5, 4 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 5 ] ), 
  Transformation( [ 4, 5, 5, 5, 4, 1 ] ), 
  Transformation( [ 4, 5, 5, 5, 4, 2 ] ), Transformation( [ 4, 5, 5, 5, 4 ] ),
  Transformation( [ 4, 5, 5, 5, 4, 4 ] ), 
  Transformation( [ 4, 5, 5, 5, 4, 5 ] ) ]
gap> Length(x);
100
gap> DIGRAPH_HOMOS(gr, gr, fail, x, fail, fail, false, [1..6], fail, fail);
[ IdentityTransformation, Transformation( [ 1, 2, 3, 4, 5, 1 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 2 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 3 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 4 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 5 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 4 ] ), Transformation( [ 1, 2, 3, 1, 2 ] ),
  Transformation( [ 1, 2, 3, 1, 2, 1 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 2 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 3 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 4 ] ), Transformation( [ 1, 2, 3, 1, 3 ] ),
  Transformation( [ 1, 2, 3, 1, 3, 1 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 2 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 3 ] ), 
  Transformation( [ 1, 2, 3, 2, 1, 4 ] ), Transformation( [ 1, 2, 3, 2, 1 ] ),
  Transformation( [ 1, 2, 3, 2, 1, 1 ] ), 
  Transformation( [ 1, 2, 3, 2, 1, 2 ] ), 
  Transformation( [ 1, 2, 3, 2, 1, 3 ] ), 
  Transformation( [ 1, 2, 3, 3, 1, 4 ] ), Transformation( [ 1, 2, 3, 3, 1 ] ),
  Transformation( [ 1, 2, 3, 3, 1, 1 ] ), 
  Transformation( [ 1, 2, 3, 3, 1, 2 ] ), 
  Transformation( [ 1, 2, 3, 3, 1, 3 ] ), 
  Transformation( [ 1, 2, 2, 3, 1, 4 ] ), Transformation( [ 1, 2, 2, 3, 1 ] ),
  Transformation( [ 1, 2, 2, 3, 1, 1 ] ), 
  Transformation( [ 1, 2, 2, 3, 1, 2 ] ), 
  Transformation( [ 1, 2, 2, 3, 1, 3 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 3 ] ), Transformation( [ 1, 2, 2 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 1 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 2 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 4 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 5 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 4 ] ), Transformation( [ 1, 2, 2, 1, 3 ] ),
  Transformation( [ 1, 2, 2, 1, 3, 1 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 2 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 3 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 3 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 4 ] ), Transformation( [ 1, 2, 2, 1, 2 ] ),
  Transformation( [ 1, 2, 2, 1, 2, 1 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 2 ] ), 
  Transformation( [ 1, 2, 2, 2, 1, 3 ] ), 
  Transformation( [ 1, 2, 2, 2, 1, 4 ] ), Transformation( [ 1, 2, 2, 2, 1 ] ),
  Transformation( [ 1, 2, 2, 2, 1, 1 ] ), 
  Transformation( [ 1, 2, 2, 2, 1, 2 ] ), 
  Transformation( [ 2, 1, 1, 3, 1, 4 ] ), Transformation( [ 2, 1, 1, 3, 1 ] ),
  Transformation( [ 2, 1, 1, 3, 1, 1 ] ), 
  Transformation( [ 2, 1, 1, 3, 1, 2 ] ), 
  Transformation( [ 2, 1, 1, 3, 1, 3 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 3 ] ), Transformation( [ 2, 1, 1 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 1 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 2 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 4 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 5 ] ), 
  Transformation( [ 2, 1, 1, 1, 3, 4 ] ), Transformation( [ 2, 1, 1, 1, 3 ] ),
  Transformation( [ 2, 1, 1, 1, 3, 1 ] ), 
  Transformation( [ 2, 1, 1, 1, 3, 2 ] ), 
  Transformation( [ 2, 1, 1, 1, 3, 3 ] ), 
  Transformation( [ 2, 1, 1, 1, 2, 3 ] ), 
  Transformation( [ 2, 1, 1, 1, 2, 4 ] ), Transformation( [ 2, 1, 1, 1, 2 ] ),
  Transformation( [ 2, 1, 1, 1, 2, 1 ] ), 
  Transformation( [ 2, 1, 1, 1, 2, 2 ] ), 
  Transformation( [ 2, 1, 1, 2, 1, 3 ] ), 
  Transformation( [ 2, 1, 1, 2, 1, 4 ] ), Transformation( [ 2, 1, 1, 2, 1 ] ),
  Transformation( [ 2, 1, 1, 2, 1, 1 ] ), 
  Transformation( [ 2, 1, 1, 2, 1, 2 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 3 ] ), Transformation( [ 4, 5, 5, 1, 2 ] ),
  Transformation( [ 4, 5, 5, 1, 2, 1 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 2 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 4 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 5 ] ), 
  Transformation( [ 4, 5, 5, 2, 1, 3 ] ), Transformation( [ 4, 5, 5, 2, 1 ] ),
  Transformation( [ 4, 5, 5, 2, 1, 1 ] ), 
  Transformation( [ 4, 5, 5, 2, 1, 2 ] ), 
  Transformation( [ 4, 5, 5, 2, 1, 4 ] ), 
  Transformation( [ 4, 5, 5, 2, 1, 5 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 1 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 2 ] ), Transformation( [ 4, 5, 5, 4, 5 ] ),
  Transformation( [ 4, 5, 5, 4, 5, 4 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 5 ] ), 
  Transformation( [ 4, 5, 5, 5, 4, 1 ] ), 
  Transformation( [ 4, 5, 5, 5, 4, 2 ] ), Transformation( [ 4, 5, 5, 5, 4 ] ),
  Transformation( [ 4, 5, 5, 5, 4, 4 ] ), 
  Transformation( [ 4, 5, 5, 5, 4, 5 ] ), IdentityTransformation, 
  Transformation( [ 1, 2, 3, 4, 5, 1 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 2 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 3 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 4 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 5 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 4 ] ), Transformation( [ 1, 2, 3, 1, 2 ] ),
  Transformation( [ 1, 2, 3, 1, 2, 1 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 2 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 3 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 4 ] ), Transformation( [ 1, 2, 3, 1, 3 ] ),
  Transformation( [ 1, 2, 3, 1, 3, 1 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 2 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 3 ] ), 
  Transformation( [ 1, 2, 3, 2, 1, 4 ] ), Transformation( [ 1, 2, 3, 2, 1 ] ),
  Transformation( [ 1, 2, 3, 2, 1, 1 ] ), 
  Transformation( [ 1, 2, 3, 2, 1, 2 ] ), 
  Transformation( [ 1, 2, 3, 2, 1, 3 ] ), 
  Transformation( [ 1, 2, 3, 3, 1, 4 ] ), Transformation( [ 1, 2, 3, 3, 1 ] ),
  Transformation( [ 1, 2, 3, 3, 1, 1 ] ), 
  Transformation( [ 1, 2, 3, 3, 1, 2 ] ), 
  Transformation( [ 1, 2, 3, 3, 1, 3 ] ), 
  Transformation( [ 1, 2, 2, 3, 1, 4 ] ), Transformation( [ 1, 2, 2, 3, 1 ] ),
  Transformation( [ 1, 2, 2, 3, 1, 1 ] ), 
  Transformation( [ 1, 2, 2, 3, 1, 2 ] ), 
  Transformation( [ 1, 2, 2, 3, 1, 3 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 3 ] ), Transformation( [ 1, 2, 2 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 1 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 2 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 4 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 5 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 4 ] ), Transformation( [ 1, 2, 2, 1, 3 ] ),
  Transformation( [ 1, 2, 2, 1, 3, 1 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 2 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 3 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 3 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 4 ] ), Transformation( [ 1, 2, 2, 1, 2 ] ),
  Transformation( [ 1, 2, 2, 1, 2, 1 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 2 ] ), 
  Transformation( [ 1, 2, 2, 2, 1, 3 ] ), 
  Transformation( [ 1, 2, 2, 2, 1, 4 ] ), Transformation( [ 1, 2, 2, 2, 1 ] ),
  Transformation( [ 1, 2, 2, 2, 1, 1 ] ), 
  Transformation( [ 1, 2, 2, 2, 1, 2 ] ), 
  Transformation( [ 2, 1, 1, 3, 1, 4 ] ), Transformation( [ 2, 1, 1, 3, 1 ] ),
  Transformation( [ 2, 1, 1, 3, 1, 1 ] ), 
  Transformation( [ 2, 1, 1, 3, 1, 2 ] ), 
  Transformation( [ 2, 1, 1, 3, 1, 3 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 3 ] ), Transformation( [ 2, 1, 1 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 1 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 2 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 4 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 5 ] ), 
  Transformation( [ 2, 1, 1, 1, 3, 4 ] ), Transformation( [ 2, 1, 1, 1, 3 ] ),
  Transformation( [ 2, 1, 1, 1, 3, 1 ] ), 
  Transformation( [ 2, 1, 1, 1, 3, 2 ] ), 
  Transformation( [ 2, 1, 1, 1, 3, 3 ] ), 
  Transformation( [ 2, 1, 1, 1, 2, 3 ] ), 
  Transformation( [ 2, 1, 1, 1, 2, 4 ] ), Transformation( [ 2, 1, 1, 1, 2 ] ),
  Transformation( [ 2, 1, 1, 1, 2, 1 ] ), 
  Transformation( [ 2, 1, 1, 1, 2, 2 ] ), 
  Transformation( [ 2, 1, 1, 2, 1, 3 ] ), 
  Transformation( [ 2, 1, 1, 2, 1, 4 ] ), Transformation( [ 2, 1, 1, 2, 1 ] ),
  Transformation( [ 2, 1, 1, 2, 1, 1 ] ), 
  Transformation( [ 2, 1, 1, 2, 1, 2 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 3 ] ), Transformation( [ 4, 5, 5, 1, 2 ] ),
  Transformation( [ 4, 5, 5, 1, 2, 1 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 2 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 4 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 5 ] ), 
  Transformation( [ 4, 5, 5, 2, 1, 3 ] ), Transformation( [ 4, 5, 5, 2, 1 ] ),
  Transformation( [ 4, 5, 5, 2, 1, 1 ] ), 
  Transformation( [ 4, 5, 5, 2, 1, 2 ] ), 
  Transformation( [ 4, 5, 5, 2, 1, 4 ] ), 
  Transformation( [ 4, 5, 5, 2, 1, 5 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 1 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 2 ] ), Transformation( [ 4, 5, 5, 4, 5 ] ),
  Transformation( [ 4, 5, 5, 4, 5, 4 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 5 ] ), 
  Transformation( [ 4, 5, 5, 5, 4, 1 ] ), 
  Transformation( [ 4, 5, 5, 5, 4, 2 ] ), Transformation( [ 4, 5, 5, 5, 4 ] ),
  Transformation( [ 4, 5, 5, 5, 4, 4 ] ), 
  Transformation( [ 4, 5, 5, 5, 4, 5 ] ) ]
gap> Length(x);
200
gap> x{[1..100]} = x{[101..200]};
true

#
gap> gr := Digraph([[2,3], [], [], [5], [], []]);
<digraph with 6 vertices, 3 edges>
gap> DIGRAPH_HOMOS(gr, gr, fail, [], fail, fail, false, [1..5], fail, fail);
[ Transformation( [ 1, 2, 3, 4, 5, 1 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 2 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 3 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 4 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 5 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 4 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 5 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 1 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 2 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 3 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 4 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 5 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 1 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 2 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 3 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 3 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 1 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 2 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 4 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 5 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 4 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 5 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 1 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 2 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 3 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 3 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 4 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 5 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 1 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 2 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 3 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 1 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 2 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 4 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 5 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 1 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 2 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 4 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 5 ] ) ]
gap> Length(last);
39

#
gap> gr := Digraph([[2,3], [], [], [5], [], []]);
<digraph with 6 vertices, 3 edges>
gap> DIGRAPH_HOMOS(gr, gr, fail, [], fail, fail, false, [1..6], fail, fail);
[ IdentityTransformation, Transformation( [ 1, 2, 3, 4, 5, 1 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 2 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 3 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 4 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 5 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 4 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 5 ] ), Transformation( [ 1, 2, 3, 1, 2 ] ),
  Transformation( [ 1, 2, 3, 1, 2, 1 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 2 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 3 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 4 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 5 ] ), Transformation( [ 1, 2, 3, 1, 3 ] ),
  Transformation( [ 1, 2, 3, 1, 3, 1 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 2 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 3 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 3 ] ), Transformation( [ 1, 2, 2 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 1 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 2 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 4 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 5 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 4 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 5 ] ), Transformation( [ 1, 2, 2, 1, 3 ] ),
  Transformation( [ 1, 2, 2, 1, 3, 1 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 2 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 3 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 3 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 4 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 5 ] ), Transformation( [ 1, 2, 2, 1, 2 ] ),
  Transformation( [ 1, 2, 2, 1, 2, 1 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 2 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 3 ] ), Transformation( [ 4, 5, 5, 1, 2 ] ),
  Transformation( [ 4, 5, 5, 1, 2, 1 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 2 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 4 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 5 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 1 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 2 ] ), Transformation( [ 4, 5, 5, 4, 5 ] ),
  Transformation( [ 4, 5, 5, 4, 5, 4 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 5 ] ) ]
gap> Length(last);
47

#
gap> gr := Digraph([[2,3], [], [], [5], [], []]);
<digraph with 6 vertices, 3 edges>
gap> gr := DigraphSymmetricClosure(gr);
<digraph with 6 vertices, 6 edges>
gap> DIGRAPH_HOMOS(gr, gr, fail, [], fail, fail, false, [1..6], fail, fail);
[ IdentityTransformation, Transformation( [ 1, 2, 3, 4, 5, 1 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 2 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 3 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 4 ] ), 
  Transformation( [ 1, 2, 3, 4, 5, 5 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 4 ] ), Transformation( [ 1, 2, 3, 1, 2 ] ),
  Transformation( [ 1, 2, 3, 1, 2, 1 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 2 ] ), 
  Transformation( [ 1, 2, 3, 1, 2, 3 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 4 ] ), Transformation( [ 1, 2, 3, 1, 3 ] ),
  Transformation( [ 1, 2, 3, 1, 3, 1 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 2 ] ), 
  Transformation( [ 1, 2, 3, 1, 3, 3 ] ), 
  Transformation( [ 1, 2, 3, 2, 1, 4 ] ), Transformation( [ 1, 2, 3, 2, 1 ] ),
  Transformation( [ 1, 2, 3, 2, 1, 1 ] ), 
  Transformation( [ 1, 2, 3, 2, 1, 2 ] ), 
  Transformation( [ 1, 2, 3, 2, 1, 3 ] ), 
  Transformation( [ 1, 2, 3, 3, 1, 4 ] ), Transformation( [ 1, 2, 3, 3, 1 ] ),
  Transformation( [ 1, 2, 3, 3, 1, 1 ] ), 
  Transformation( [ 1, 2, 3, 3, 1, 2 ] ), 
  Transformation( [ 1, 2, 3, 3, 1, 3 ] ), 
  Transformation( [ 1, 2, 2, 3, 1, 4 ] ), Transformation( [ 1, 2, 2, 3, 1 ] ),
  Transformation( [ 1, 2, 2, 3, 1, 1 ] ), 
  Transformation( [ 1, 2, 2, 3, 1, 2 ] ), 
  Transformation( [ 1, 2, 2, 3, 1, 3 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 3 ] ), Transformation( [ 1, 2, 2 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 1 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 2 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 4 ] ), 
  Transformation( [ 1, 2, 2, 4, 5, 5 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 4 ] ), Transformation( [ 1, 2, 2, 1, 3 ] ),
  Transformation( [ 1, 2, 2, 1, 3, 1 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 2 ] ), 
  Transformation( [ 1, 2, 2, 1, 3, 3 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 3 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 4 ] ), Transformation( [ 1, 2, 2, 1, 2 ] ),
  Transformation( [ 1, 2, 2, 1, 2, 1 ] ), 
  Transformation( [ 1, 2, 2, 1, 2, 2 ] ), 
  Transformation( [ 1, 2, 2, 2, 1, 3 ] ), 
  Transformation( [ 1, 2, 2, 2, 1, 4 ] ), Transformation( [ 1, 2, 2, 2, 1 ] ),
  Transformation( [ 1, 2, 2, 2, 1, 1 ] ), 
  Transformation( [ 1, 2, 2, 2, 1, 2 ] ), 
  Transformation( [ 2, 1, 1, 3, 1, 4 ] ), Transformation( [ 2, 1, 1, 3, 1 ] ),
  Transformation( [ 2, 1, 1, 3, 1, 1 ] ), 
  Transformation( [ 2, 1, 1, 3, 1, 2 ] ), 
  Transformation( [ 2, 1, 1, 3, 1, 3 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 3 ] ), Transformation( [ 2, 1, 1 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 1 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 2 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 4 ] ), 
  Transformation( [ 2, 1, 1, 4, 5, 5 ] ), 
  Transformation( [ 2, 1, 1, 1, 3, 4 ] ), Transformation( [ 2, 1, 1, 1, 3 ] ),
  Transformation( [ 2, 1, 1, 1, 3, 1 ] ), 
  Transformation( [ 2, 1, 1, 1, 3, 2 ] ), 
  Transformation( [ 2, 1, 1, 1, 3, 3 ] ), 
  Transformation( [ 2, 1, 1, 1, 2, 3 ] ), 
  Transformation( [ 2, 1, 1, 1, 2, 4 ] ), Transformation( [ 2, 1, 1, 1, 2 ] ),
  Transformation( [ 2, 1, 1, 1, 2, 1 ] ), 
  Transformation( [ 2, 1, 1, 1, 2, 2 ] ), 
  Transformation( [ 2, 1, 1, 2, 1, 3 ] ), 
  Transformation( [ 2, 1, 1, 2, 1, 4 ] ), Transformation( [ 2, 1, 1, 2, 1 ] ),
  Transformation( [ 2, 1, 1, 2, 1, 1 ] ), 
  Transformation( [ 2, 1, 1, 2, 1, 2 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 3 ] ), Transformation( [ 4, 5, 5, 1, 2 ] ),
  Transformation( [ 4, 5, 5, 1, 2, 1 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 2 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 4 ] ), 
  Transformation( [ 4, 5, 5, 1, 2, 5 ] ), 
  Transformation( [ 4, 5, 5, 2, 1, 3 ] ), Transformation( [ 4, 5, 5, 2, 1 ] ),
  Transformation( [ 4, 5, 5, 2, 1, 1 ] ), 
  Transformation( [ 4, 5, 5, 2, 1, 2 ] ), 
  Transformation( [ 4, 5, 5, 2, 1, 4 ] ), 
  Transformation( [ 4, 5, 5, 2, 1, 5 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 1 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 2 ] ), Transformation( [ 4, 5, 5, 4, 5 ] ),
  Transformation( [ 4, 5, 5, 4, 5, 4 ] ), 
  Transformation( [ 4, 5, 5, 4, 5, 5 ] ), 
  Transformation( [ 4, 5, 5, 5, 4, 1 ] ), 
  Transformation( [ 4, 5, 5, 5, 4, 2 ] ), Transformation( [ 4, 5, 5, 5, 4 ] ),
  Transformation( [ 4, 5, 5, 5, 4, 4 ] ), 
  Transformation( [ 4, 5, 5, 5, 4, 5 ] ) ]
gap> Length(last);
100

# loops1
gap> gr := Digraph([[], [2]]);
<digraph with 2 vertices, 1 edge>
gap> GeneratorsOfEndomorphismMonoid(gr);
[ IdentityTransformation, Transformation( [ 2, 2 ] ) ]

# loops2
gap> gr := Digraph([[2], [], [3]]);
<digraph with 3 vertices, 2 edges>
gap> GeneratorsOfEndomorphismMonoid(gr);
[ IdentityTransformation, Transformation( [ 3, 3, 3 ] ) ]

# loops3
gap> gr := Digraph([[2], [1], [3]]);
<digraph with 3 vertices, 3 edges>
gap> GeneratorsOfEndomorphismMonoid(gr);
[ Transformation( [ 2, 1 ] ), IdentityTransformation, 
  Transformation( [ 3, 3, 3 ] ) ]

#T# HomomorphismDigraphsFinder: finding monomorphisms
gap> gr1 := Digraph([[], [1]]);;
gap> gr1 := DigraphSymmetricClosure(gr1);;
gap> gr2 := Digraph([[], [1], [1, 3]]);;
gap> gr2 := DigraphSymmetricClosure(gr2);;
gap> HomomorphismDigraphsFinder(gr1, gr2, fail, [], infinity, fail, true,
> [1,2,3], []);
[ IdentityTransformation, Transformation( [ 1, 3 ] ), 
  Transformation( [ 2, 1 ] ), Transformation( [ 3, 1 ] ) ]

#T# DIGRAPHS_UnbindVariables
gap> Unbind(gr);
gap> Unbind(gr1);
gap> Unbind(gr2);

#E#
gap> STOP_TEST("Digraphs package: standard/grahom.tst");