unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TMainForm = class(TForm)
    ImageOut: TImage;
    BeginButton: TButton;
    EndButton: TButton;
    ExitButton: TButton;
    SpeedButton: TUpDown;
    Timer: TTimer;
    Move: TLabel;
    Speed: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BeginButtonClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure EndButtonClick(Sender: TObject);
    procedure SpeedButtonClick(Sender: TObject; Button: TUDBtnType);
    procedure ExitButtonClick(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

uses Letters;

var x: integer;
    O: TO_let;
    C: TC_let;
    Q: TQ_let;

{$R *.dfm}

  procedure TMainForm.FormCreate(Sender: TObject);
  begin
   ImageOut.Canvas.FillRect(ImageOut.Canvas.ClipRect);
   ImageOut.Canvas.Pen.Width := 3;
   x := 1;
   O := TO_let.Create(50, round((ImageOut.Height-100)/2), ImageOut, downward);
   C := TC_let.Create(300, round((ImageOut.Height-100)/2), ImageOut, upward);
   Q := TQ_let.Create(550, round((ImageOut.Height-100)/2), ImageOut, downward);
  end;

  procedure TMainForm.BeginButtonClick(Sender: TObject);
  begin
    Timer.Enabled := true;
  end;

  procedure TMainForm.EndButtonClick(Sender: TObject);
  begin
    Timer.Enabled := false;
  end;

  procedure TMainForm.SpeedButtonClick(Sender: TObject; Button: TUDBtnType);
  begin
    x := strtoint (Edit1.Text);
  end;

  procedure TMainForm.TimerTimer(Sender: TObject);
  var code: integer;
  begin
    O.Move (trunc(x));
    C.Move (trunc(x));
    Q.Move (trunc(x));
  end;

  procedure TMainForm.ExitButtonClick(Sender: TObject);
  begin
    close;
  end;

  initialization

  finalization
  O.Free;
  C.Free;
  Q.Free;
end.
