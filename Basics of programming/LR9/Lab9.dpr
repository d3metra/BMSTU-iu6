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
//Cоздание списка и последующий его вывод
  writeln ('Введите не менее 2ух вещественных чисел' +
                ' (для завершения списка введите "End"):');
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
  writeln ('Исходный список:');
  q :=first;
  repeat
     write (q^.num:7:5, '    ');
     q := q^.p;
  until q = nil;
  writeln;

//Вывод отрицательных чисел
  writeln ('Отрицательные числа данного списка:');
  q := first;
  repeat
     if q^.num < 0
       then  write (q^.num:7:5, '    ');
     q := q^.p;
  until q = nil;
  writeln;

//Вывод неотрицательных чисел
  writeln ('Неотрицательные числа данного списка:');
  q := first;
  repeat
     if q^.num >= 0
       then write (q^.num:7:5, '    ');
     q := q^.p;
  until q = nil;
  readln;

//Освобождение памяти
  while first <> nil do
     begin
        q := first^.p;
        dispose (first);
        first := q;
     end;

end.
