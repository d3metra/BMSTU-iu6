program Lab8;
{$APPTYPE CONSOLE}

uses
  System.SysUtils;

type zap = record
              Book: string[50];
              Avtor: string[50];
              Data: word
           end;
var F: file of zap;
    G: text;
    z: zap;
    i, n: integer;

begin
//Создание исходного файла F с записями//
write ('Введите - кол-во записей в файле F: ');
readln (n);
assign (F, 'F.dat');
rewrite (F);
for i := 1 to n do
   begin
        writeln ('Запись ', i);
        with z do
            begin
                 write ('Название книги: ');
                 readln (Book);
                 write ('Автор книги: ');
                 readln (Avtor);
                 write ('Год издания книги: ');
                 readln (Data)
            end;
        write (f,z);
   end;

//Вывод записей, содержащихся в файле F//
writeln ('Данные файла F:');
reset (F);
i := 0;
while not EOF(F) do
     begin
          i := i + 1;
          read (F,z);
          writeln ('(', i, ')  ', z.Book, '    ', z.Avtor, '   ', z.Data);
     end;

//Создание файла G//
assign (G, 'G.txt');
rewrite (G);
for i := 1 to n do
   begin
        seek(F, filesize(F) - i);
        read (F, z);
        writeln (G, z.book);
   end;
close (F);

//Вывод данных, содержащихся в файле G//
writeln ('Данные файла G:');
reset (G);
while not EOF(G) do
     begin
          readln (G, z.Book);
          write (z.Book, '   ');
     end;
close (G);
readln;
end.
