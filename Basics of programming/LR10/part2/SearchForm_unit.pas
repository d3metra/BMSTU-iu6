unit SearchForm_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, MainForm_unit;

type
  TSearchForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Edit1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  end;

var
  SearchForm: TSearchForm;

implementation

{$R *.dfm}

  procedure TSearchForm.Edit1Click(Sender: TObject);
    begin
      Edit1.clear;
      Label2.hide; Edit2.hide;
      Label3.hide; Edit3.hide;
      Label4.hide; Edit4.hide;
    end;

  procedure TSearchForm.Button1Click(Sender: TObject);
  var z: zap;
      str: shortstring;
      key: boolean;
    begin
      key := false;
      str := Edit1.text;
      reset (F);
      while not EOF(F) do
        begin
          read (F,z);
          if z.surname = str
            then begin
                   key := true;
                   Edit2.text := z.name;
                   Edit3.text := z.phn_num;
                   Edit4.text := z.address;
                   Label2.show; Edit2.show;
                   Label3.show; Edit3.show;
                   Label4.show; Edit4.show;
                   break;
                 end;
        end;
      if not key
        then Edit1.text := '������ �� �������';
    end;

  procedure TSearchForm.Button2Click(Sender: TObject);
    begin
      closefile (F);
      SearchForm.hide;
    end;
end.
