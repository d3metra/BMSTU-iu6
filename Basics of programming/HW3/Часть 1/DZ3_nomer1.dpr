program DZ3_nomer1;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  Country_objects in 'D:\Programms\Delphi\Country_objects.pas';

var C: TCountry;
    st: shortstring; a: single; b: integer;

begin
  write ('������� �������� ������: ');
  readln (st);
  write ('������� ������� ����������(��. ��): ');
  readln (a);
  write ('������� ����������� ���������(���.): ');
  readln (b);
  C.init (st, a, b);
  writeln ('�������� ����� �������:');
  C.print;
  writeln ('��������� ���������(���/��. ��): ', C.popul_density:6:3);
  readln;
end.
