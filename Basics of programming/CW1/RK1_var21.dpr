program RK1_var21;
{$APPTYPE CONSOLE}
uses
  System.SysUtils;

var n,i: integer; s:real;
begin
 writeln ('Введите n - кол-во сомножителей');
 readln (n);
 s:=1;
 for i:=1 to n do
    if i mod 2 = 0
      then s:=s*i/(i+1)
      else s:=s*(i+1)/i;
 writeln ('Произведение первых ', n, ' сомножителей: ', s:8:6);
 readln;
end.

