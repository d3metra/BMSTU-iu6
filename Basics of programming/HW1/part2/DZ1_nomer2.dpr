Program DZ1_nomer2;
{$APPTYPE CONSOLE}
Var x, f: real;
Begin
Writeln ('Введите значение аргумента функции:');
Readln (x);
Writeln ('x = ', x:15:7);
if x<2
    then f:=x
    else if x<=3
             then f:=2
             else f:=-x+5;
Writeln ('f(',x:15:7,') =', f:15:7);
Readln;
End.
