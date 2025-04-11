program DZ3_nomer2;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  Pyramid_objects in 'D:\Programms\Delphi\Pyramid_objects.pas';

var Pr: Pyramid; TPr: TrPyramid;
    h, S1, S2: real;

begin
//Работа со стандартной пирамидой
  write ('Введите высоту и площадь нижнего основания пирамиды: ');
  read (h, S1);
  writeln ('//Стандартная пирамида//');
  Pr.init (h, S1);
  Pr.print;
  writeln ('Объём пирамиды: ', Pr.volume:7:2);

//Работа с усеченной пирамидой
  write ('Введите высоту, площади нижнего и верхнего оснований: ');
  read (h, S1, S2);
  writeln ('//Усеченная пирамида//');
  TPr.init (h, S1, S2);
  TPr.print;
  writeln ('Объём пирамиды: ', TPr.volume:7:2);
  readln; readln;
end.
