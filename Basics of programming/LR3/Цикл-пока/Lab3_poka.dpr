Program Lab3_poka;
{$APPTYPE CONSOLE}
uses
  System.SysUtils;

var x,x1,x2,n: integer;
Begin
x1:= -9;
x2:= -9;
x:=x2;
n:=2;
while x<=0 do
          begin
            n:=n+1;
            x:=x1+x2+12;
            x1:=x2;
            x2:=x;
          end;
Writeln ('ћинимальное положительное число последовательности - ', x);
Writeln ('≈го пор€дковый номер - ', n);
Readln;
End.
