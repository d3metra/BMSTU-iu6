program Culc;

uses
  Vcl.Forms,
  C_unit in 'C_unit.pas' ;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
