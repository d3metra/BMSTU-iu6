Program DZ1_nomer1_3;
{$APPTYPE CONSOLE}
uses
  System.SysUtils;

Var x, S, absolut, otnos: extended;
Begin
Writeln ('������� �������� ���������� x');
Readln (x);
S:=sqr(sin(x))+sqr(cos(x));
Writeln ('S =', S:20:16);
absolut:=abs(1 - S);                 {absolut - ���������� �����������}
otnos:=absolut/abs(S-absolut);       {otnos - ������������� �����������}
Writeln ('���������� �����������:', absolut:20:16, '     ������������� �����������:', otnos:20:16);
Readln;
End.
