unit Country_objects;

interface
  type TCountry = object
    private name: shortstring;
            ter: single;
            popul: integer;
    public  procedure init(st: shortstring; a: single; b: integer);
            procedure print;
            function popul_density: single;
  end;

implementation
  procedure TCountry.init;
    begin
      name := st;
      ter := a;
      popul := b;
    end;

  procedure TCountry.print;
    begin
      writeln ('�������� ������: ', name);
      writeln ('������� ����������(��. ��): ', ter:10:2);
      writeln ('����������� ��������� (���.): ', popul:7);
    end;

  function TCountry.popul_density;
    begin
      result := popul/ter;
    end;
end.
