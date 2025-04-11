program Database;

uses
  Vcl.Forms,
  MainForm_unit in 'MainForm_unit.pas' {MainForm},
  WriteForm_unit in 'WriteForm_unit.pas' {WriteForm},
  SearchForm_unit in 'SearchForm_unit.pas' {SearchForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TWriteForm, WriteForm);
  Application.CreateForm(TSearchForm, SearchForm);
  Application.Run;
end.
