program DZ2_nomer3;
{$APPTYPE CONSOLE}

uses System.SysUtils;

var a: array [1..100] of longint;
    mnoj, cifra: set of 1..9;
    n, i, cnt: integer; b: longint;

begin
{Ввод последовательности целых  чисел}
write ('Введите n<=100 - кол-во чисел в грядущей последовательности: ');
readln (n);
for i := 1 to n do
   read (a[i]);
readln;

{Проверка введённых чисел}
writeln ('Числа последовательности, содержащие в своей десятичной ' +
         'записи цифры 2, 3, 6 и не содержащие цифры 1, 7, 9:');
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
  then writeln ('В последовательности нет чисел, удовлетворяющих данному условию')
  else writeln ('В введённой последовательности ', cnt, ' числа(ел), удовлетворяющих условию');
readln;
end.
