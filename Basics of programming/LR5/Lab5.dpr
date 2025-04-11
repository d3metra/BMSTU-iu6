program Lab5;
{$APPTYPE CONSOLE}
uses
  System.SysUtils;

var n,i,j:integer; x:real;
    A:array[1..10,1..10] of real;
begin
writeln ('Введите значение - размерность матрицы:');
readln (n);
writeln ('Введите построчно элементы матрицы:');
for i:=1 to n do
   begin
        for j:=1 to n do
           read (a[i,j]);
        readln;
   end;
writeln ('Полученная матрица:');
for i:=1 to n do
   begin
        for j:=1 to n do
           write (a[i,j]:8:3);
        writeln;
   end;
for i:=1 to n do
   begin
        j:=1;
        while j<=(n div 2) do
              begin
                   x:=a[i,j];
                   a[i,j]:=a[i,n+1-j];
                   a[i,n+1-j]:=x;
                   j:=j+1;
              end;

   end;
writeln ('Повёрнутая матрица:');
for i:=1 to n do
   begin
        for j:=1 to n do
           write (a[i,j]:8:3);
        writeln;
   end;
readln;
end.
