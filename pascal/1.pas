{
    project euler #1 in pascal by antekone
    http://anadoxin.org/blog

    usage:

    $ fpc 1.pas
    $ ./1
}

program euler1;
var
    sum, i: UInt32;

begin
    sum := 0;

    for i := 0 to 999 do
        if (i mod 3 = 0) or (i mod 5 = 0) then
            sum := sum + i;

    writeln(sum)
end.
