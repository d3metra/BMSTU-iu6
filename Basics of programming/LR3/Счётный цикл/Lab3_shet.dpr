Program Lab3_shet;
{$APPTYPE CONSOLE}
uses
  System.SysUtils;

var x, x1, x2, n:integer;
Begin
x1:=-9;
x2:=-9;
for n:=3 to 100 do
      begin
        x:=x1+x2+12;
        x1:=x2;
        x2:=x;
        if x>0 then break;
      end;
Writeln ('ћинимальное положительное число последовательности - ', x);
Writeln ('≈го пор€дковый номер - ', n);
Readln;
End.
