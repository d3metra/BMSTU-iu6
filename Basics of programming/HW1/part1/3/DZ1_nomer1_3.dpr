Program DZ1_nomer1_3;
{$APPTYPE CONSOLE}
uses
  System.SysUtils;

Var x, S, absolut, otnos: extended;
Begin
Writeln ('Введите значение переменной x');
Readln (x);
S:=sqr(sin(x))+sqr(cos(x));
Writeln ('S =', S:20:16);
absolut:=abs(1 - S);                 {absolut - абсолютная погрешность}
otnos:=absolut/abs(S-absolut);       {otnos - относительная погрешность}
Writeln ('Абсолютная погрешность:', absolut:20:16, '     Относительная погрешность:', otnos:20:16);
Readln;
End.
