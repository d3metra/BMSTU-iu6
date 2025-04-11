Program Lab3_do;
{$APPTYPE CONSOLE}
uses
  System.SysUtils;

var x, x1, x2, n: integer;
Begin
x1:=-9;
x2:=-9;
n:=2;
repeat
  n:=n+1;
  x:=x1+x2+12;
  x1:=x2;
  x2:=x;
until x>0;
Writeln ('ћинимальное положительное число последовательности - ', x);
Writeln ('≈го пор€дковый номер - ', n);
Readln;
End.
