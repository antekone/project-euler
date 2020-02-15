(*
   project euler problem #2
   http://anadoxin.org/blog

   $ fpc 2.pas
   $ ./2
*)

program euler2;

function getfib(n: UInt32): UInt32;
begin
    if (n = 0) or (n = 1) then
        getfib := 1
    else
        getfib := getfib(n - 1) + getfib(n - 2)
end;

var
    f, sum, i: UInt32;
begin
    i := 0;
    sum := 0;
    f := 0;

    while(f < 4000000) do
    begin
        i := i + 1;
        f := getfib(i);

        if (f mod 2 = 0) then
            sum := sum + f;
    end;

    writeln(sum);
end.
