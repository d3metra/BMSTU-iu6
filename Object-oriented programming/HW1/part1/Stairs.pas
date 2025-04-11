unit Stairs;

interface

uses Graphics, Vcl.ExtCtrls;

type stl = (Up, Down);

type TStairs = class
     private
       Image: TImage;
       x, y: integer;
       style: stl;
       first_point: boolean;
     public
       constructor Create (img: TImage);
       procedure Draw (ax, ay: integer); virtual;
       procedure ChangeStyleUp ();
       procedure ChangeStyleDown ();
       procedure FirstPoint ();
     end;

type TArrowStairs = class (TStairs)
     public
       procedure DrawningArrow (ax, ay: integer);
       procedure Draw (ax, ay: integer); override;
end;

implementation

  constructor TStairs.Create;
  begin
    inherited Create;
    Image := img;
    first_point := true;
  end;

  procedure TStairs.Draw;
  begin
    if first_point
      then begin
             Image.Canvas.MoveTo (ax, ay);
             x := ax; y := ay;
             first_point := false;
           end
      else begin
             case style of
               Up: begin
                     if y > ay
                       then begin Image.Canvas.LineTo (x, ay); Image.Canvas.LineTo (ax, ay); end
                       else begin Image.Canvas.LineTo (ax, y); Image.Canvas.LineTo (ax, ay); end;
                   end;
               Down: begin
                       if y > ay
                         then begin Image.Canvas.LineTo (ax, y); Image.Canvas.LineTo (ax, ay); end
                         else begin Image.Canvas.LineTo (x, ay); Image.Canvas.LineTo (ax, ay); end;
                     end;
             end;
             x := ax; y:= ay;
           end;
  end;

  procedure TStairs.FirstPoint;
  begin
    first_point := true;
  end;

  procedure TStairs.ChangeStyleUp;
  begin
    style := up;
  end;

  procedure TStairs.ChangeStyleDown;
  begin
    style := down;
  end;

  procedure TArrowStairs.DrawningArrow;
  begin
    case style of
      Up: begin
            if y > ay
              then if x > ax
                     then begin
                            Image.Canvas.LineTo (ax+8, ay-5);
                            Image.Canvas.MoveTo (ax, ay);
                            Image.Canvas.LineTo (ax+8, ay+5);
                          end
                     else begin
                            Image.Canvas.LineTo (ax-8, ay-5);
                            Image.Canvas.MoveTo (ax, ay);
                            Image.Canvas.LineTo (ax-8, ay+5);
                          end
              else begin
                     Image.Canvas.LineTo (ax-5, ay-8);
                     Image.Canvas.MoveTo (ax, ay);
                     Image.Canvas.LineTo (ax+5, ay-8);
                   end;
              Image.Canvas.MoveTo (ax, ay);
          end;
      Down: begin
              if y > ay
                then begin
                       Image.Canvas.LineTo (ax-5, ay+8);
                       Image.Canvas.MoveTo (ax, ay);
                       Image.Canvas.LineTo (ax+5, ay+8);
                     end
                else if x > ax
                       then begin
                              Image. Canvas.LineTo (ax+8, ay-5);
                              Image.Canvas.MoveTo (ax, ay);
                              Image. Canvas.LineTo (ax+8, ay+5);
                            end
                       else begin
                              Image. Canvas.LineTo (ax-8, ay-5);
                              Image.Canvas.MoveTo (ax, ay);
                              Image. Canvas.LineTo (ax-8, ay+5);
                            end;
              Image.Canvas.MoveTo (ax, ay);
            end;
    end;
  end;

  procedure TArrowStairs.Draw;
  begin
    if first_point
      then begin
             Image.Canvas.MoveTo (ax, ay);
             x := ax; y := ay;
             first_point := false;
           end
      else begin
             case style of
               Up: begin
                     if y > ay
                       then begin
                              Image.Canvas.LineTo (x, ay);
                              Image.Canvas.LineTo (ax, ay);
                              DrawningArrow (ax, ay);
                            end
                       else begin
                              Image.Canvas.LineTo (ax, y);
                              Image.Canvas.LineTo (ax, ay);
                              DrawningArrow (ax, ay);
                            end;
                   end;
               Down: begin
                       if y > ay
                         then begin
                                Image.Canvas.LineTo (ax, y);
                                Image.Canvas.LineTo (ax, ay);
                                DrawningArrow (ax, ay);
                              end
                         else begin
                                Image.Canvas.LineTo (x, ay);
                                Image.Canvas.LineTo (ax, ay);
                                DrawningArrow (ax, ay);
                              end;
                     end;
             end;
             x := ax; y:= ay;
           end;
  end;
end.
