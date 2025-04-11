Program Lab2;
{$APPTYPE CONSOLE}
Var X,Y: Real;
Begin
Writeln ('Введите координаты точки (X;Y):');
Readln (X,Y);
if (Y >= 0) and (Y <= X+1) and ((X+1)*(X+1)+Y*Y <= 1)
    then Writeln ('Точка принадлежит заштрихованной области')
    else Writeln ('Точка не принадлежит заштрихованной области');
Readln;
End.
