program DZ1_part2;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  Letters in 'Letters.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
