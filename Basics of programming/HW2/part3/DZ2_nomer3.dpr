program DZ2_nomer3;
{$APPTYPE CONSOLE}

uses System.SysUtils;

var a: array [1..100] of longint;
    mnoj, cifra: set of 1..9;
    n, i, cnt: integer; b: longint;

begin
{���� ������������������ �����  �����}
write ('������� n<=100 - ���-�� ����� � �������� ������������������: ');
readln (n);
for i := 1 to n do
   read (a[i]);
readln;

{�������� �������� �����}
writeln ('����� ������������������, ���������� � ����� ���������� ' +
         '������ ����� 2, 3, 6 � �� ���������� ����� 1, 7, 9:');
cnt := 0;
for i:= 1 to n do
   begin
        mnoj := [ ];
        b := abs(a[i]);
        while b > 9 do
             begin
                  mnoj := mnoj + [b mod 10];
                  b := b div 10;
             end;
        mnoj := mnoj + [b];
        if ([2,3,6] <= mnoj) and not([1,7,9] <= mnoj)
          then begin
                    cnt := cnt + 1;
                    write (a[i], '       ');
               end;
   end;
writeln;
if cnt = 0
  then writeln ('� ������������������ ��� �����, ��������������� ������� �������')
  else writeln ('� �������� ������������������ ', cnt, ' �����(��), ��������������� �������');
readln;
end.
