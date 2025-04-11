program Lab9;

uses
  System.SysUtils;

type pnt = ^element;
     element = record
                num: real;
                p: pnt;
               end;

var first, q: pnt;
    st: shortstring;
    code: integer;

begin
//C������� ������ � ����������� ��� �����
  writeln ('������� �� ����� 2�� ������������ �����' +
                ' (��� ���������� ������ ������� "End"):');
  readln (st);
  new (first);
  val (st, first^.num, code);
  q := first;
  readln (st);
  while st <> 'End' do
     begin
        new (q^.p);
        q := q^.p;
        val (st, q^.num, code);
        readln (st)
     end;
  q^.p := nil;
  writeln ('�������� ������:');
  q :=first;
  repeat
     write (q^.num:7:5, '    ');
     q := q^.p;
  until q = nil;
  writeln;

//����� ������������� �����
  writeln ('������������� ����� ������� ������:');
  q := first;
  repeat
     if q^.num < 0
       then  write (q^.num:7:5, '    ');
     q := q^.p;
  until q = nil;
  writeln;

//����� ��������������� �����
  writeln ('��������������� ����� ������� ������:');
  q := first;
  repeat
     if q^.num >= 0
       then write (q^.num:7:5, '    ');
     q := q^.p;
  until q = nil;
  readln;

//������������ ������
  while first <> nil do
     begin
        q := first^.p;
        dispose (first);
        first := q;
     end;

end.
