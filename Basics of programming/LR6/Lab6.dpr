program Lab6;
{$APPTYPE CONSOLE}
uses System.SysUtils;
var st:string[40]; i,n,a,l,lmax:integer;
begin
writeln ('������� ������ (�� 40 ��������)');
readln (st);
writeln ('���������� ������: ', st);
n:=length(st);
l:=0;
lmax:=0;
for i:=1 to n do
   if (st[i]=' ') or (st[i]=',') or (st[i]='.')
     then if l>lmax
         then begin
                   lmax:=l;
                   l:=0;
                   a:=i;
              end
         else l:=0
     else l:=l+1;
writeln ('����� ������������ �����: ', copy(st,a-lmax,lmax));
delete (st,a-lmax,lmax);
writeln ('����������������� ������: ',st);
readln;
end.
