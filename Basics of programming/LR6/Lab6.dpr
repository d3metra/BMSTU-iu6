program Lab6;
{$APPTYPE CONSOLE}
uses System.SysUtils;
var st:string[40]; i,n,a,l,lmax:integer;
begin
writeln ('Введите строку (до 40 символов)');
readln (st);
writeln ('Полученная строка: ', st);
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
writeln ('Слово максимальной длины: ', copy(st,a-lmax,lmax));
delete (st,a-lmax,lmax);
writeln ('Отредактированная строка: ',st);
readln;
end.
