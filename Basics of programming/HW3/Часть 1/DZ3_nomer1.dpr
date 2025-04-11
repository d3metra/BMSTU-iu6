program DZ3_nomer1;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  Country_objects in 'D:\Programms\Delphi\Country_objects.pas';

var C: TCountry;
    st: shortstring; a: single; b: integer;

begin
  write ('¬ведите название страны: ');
  readln (st);
  write ('¬ведите площадь территории(кв. км): ');
  readln (a);
  write ('¬ведите численность населени€(тыс.): ');
  readln (b);
  C.init (st, a, b);
  writeln ('«начение полей объекта:');
  C.print;
  writeln ('ѕлотность населени€(чел/кв. км): ', C.popul_density:6:3);
  readln;
end.
