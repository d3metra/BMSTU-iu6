program Lab4;
{$APPTYPE CONSOLE}
uses System.SysUtils;
var a:array[1..10] of real;
    i,n,t1,t2:integer; min,r:real;
begin
writeln ('������� ���������� 10-�� �����');
for i:=1 to 10 do read (a[i]);
readln;
writeln ('���������� ������ ��������� �����');
for i:=1 to 10 do write ('    a[',i,']=', a[i]:8:3);
writeln;
t1:=1;
t2:=2;
min:=abs(a[1]-a[2]);
for i:=1 to 9 do
    for n:=i+1 to 10 do
        begin
             if i<>n
               then r:=abs(a[i]-a[n]);
             if r<min
               then begin
                        min:=r;
                        t1:=i;
                        t2:=n;
                    end;
        end;
writeln ('���������� ����� ������� ', t1,' � ',t2,' ����������� -', min:8:3);
writeln ('���������� ����� ',t1,' � ',t2,' �������������� ����� ', a[t1]:8:3, '    ', a[t2]:8:3);
readln;
end.
