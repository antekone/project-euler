% project euler #1 in Erlang by antekone
% http://anadoxin.org/blog
%
% usage:
%
% $ erl -compile p1.erl && erl -noshell -s p1 problem1

-module(p1).
-export([problem1/0]).

problem1_gen(UpTo) -> lists:foldl(fun(Z, Sum) ->
                                      Z + Sum
                              end, 0, [X || X <- lists:seq(0, UpTo), (X rem 3 =:= 0) or (X rem 5 =:= 0)]).

problem1() -> io:fwrite("~p\n", [problem1_gen(999)]),
              init:stop().
