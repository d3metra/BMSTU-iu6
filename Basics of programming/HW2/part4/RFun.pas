unit RFun;

interface
   type func = function (x: real): real;
   procedure ROOT(f: func);

implementation
   procedure ROOT;
   var a, b, c: real;
   begin
      a := 0.0001;
      while f(a)*f(a + 0.1) > 0 do
           a := a + 0.1;
      b := a + 0.1;
      repeat
            c := (a + b) / 2;
            if f(a)*f(c) <= 0
              then b := c
              else a := c;
      until abs(f(c)) <= 0.001;
      writeln ('x = ', c:5:3);
   end;
end.

