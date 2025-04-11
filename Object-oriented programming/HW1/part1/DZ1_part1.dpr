program DZ1_part1;

uses
  Vcl.Forms,
  MainForm_Unit in 'MainForm_Unit.pas' {MainForm},
  Stairs in 'Stairs.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
