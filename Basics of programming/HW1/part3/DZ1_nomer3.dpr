Program DZ1_nomer3;
{$APPTYPE CONSOLE}
Uses SysUtils;
Var eps, x, S, absolut: real;
    k:integer;
Begin
Writeln ('Рассчитать сумму ряда с точностью до:');
Readln (eps);
S:=0;
k:=0;
Repeat
k:=k+1;
x:=1/sqr(k)/sqr(k+1);
S:=S+x;
Until abs(S - (sqr(pi)/3 - 3)) <= eps;
Writeln ('Сумма ряда: ', S:20:16, '     Кол-во итераций: ', k);
absolut:=abs(S - (sqr(pi)/3 - 3));                     {absolut - абсолютная погрешность}
Writeln ('Абсолютная погрешность:',absolut:20:16);     {Для наглядности вывожу значение абсолютной погрешности}
Readln;
End.
