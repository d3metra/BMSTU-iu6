Program DZ1_nomer3;
{$APPTYPE CONSOLE}
Uses SysUtils;
Var eps, x, S, absolut: real;
    k:integer;
Begin
Writeln ('���������� ����� ���� � ��������� ��:');
Readln (eps);
S:=0;
k:=0;
Repeat
k:=k+1;
x:=1/sqr(k)/sqr(k+1);
S:=S+x;
Until abs(S - (sqr(pi)/3 - 3)) <= eps;
Writeln ('����� ����: ', S:20:16, '     ���-�� ��������: ', k);
absolut:=abs(S - (sqr(pi)/3 - 3));                     {absolut - ���������� �����������}
Writeln ('���������� �����������:',absolut:20:16);     {��� ����������� ������ �������� ���������� �����������}
Readln;
End.
