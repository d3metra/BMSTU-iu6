object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #1050#1072#1083#1103#1082#1072'-'#1084#1072#1083#1103#1082#1072
  ClientHeight = 487
  ClientWidth = 824
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object ImageOut: TImage
    Left = 8
    Top = 160
    Width = 808
    Height = 319
    Cursor = crCross
    Stretch = True
    OnMouseDown = ImageOutMouseDown
  end
  object LineStyle: TLabel
    Left = 16
    Top = 6
    Width = 156
    Height = 34
    Caption = #1057#1090#1080#1083#1100' '#1083#1080#1085#1080#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Zigzag: TLabel
    Left = 16
    Top = 46
    Width = 118
    Height = 25
    Caption = #1058#1080#1087' '#1079#1080#1075#1079#1072#1075#1072':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Line: TLabel
    Left = 16
    Top = 77
    Width = 104
    Height = 25
    Caption = #1058#1080#1087' '#1083#1080#1085#1080#1080':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StairsStyle: TLabel
    Left = 384
    Top = 6
    Width = 201
    Height = 34
    Caption = #1057#1090#1080#1083#1100' '#1083#1077#1089#1090#1085#1080#1094#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object UpStyleButton: TButton
    Left = 140
    Top = 46
    Width = 81
    Height = 25
    Caption = #1042#1077#1088#1093#1085#1080#1081
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = UpStyleButtonClick
  end
  object DawnStyleButton: TButton
    Left = 227
    Top = 46
    Width = 75
    Height = 25
    Caption = #1053#1080#1078#1085#1080#1081
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = DawnStyleButtonClick
  end
  object SolidStyleButton: TButton
    Left = 120
    Top = 77
    Width = 106
    Height = 25
    Caption = #1057#1087#1083#1086#1096#1085#1072#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = SolidStyleButtonClick
  end
  object DashStyleButton: TButton
    Left = 232
    Top = 77
    Width = 113
    Height = 25
    Caption = #1055#1091#1085#1082#1090#1080#1088#1085#1072#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = DashStyleButtonClick
  end
  object DotStyleButton: TButton
    Left = 120
    Top = 108
    Width = 106
    Height = 25
    Caption = #1058#1086#1095#1077#1095#1085#1072#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = DotStyleButtonClick
  end
  object DashdotStyleButton: TButton
    Left = 232
    Top = 108
    Width = 113
    Height = 25
    Caption = #1064#1090#1088#1080#1093#1087#1091#1085#1082#1090#1080#1088
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = DashdotStyleButtonClick
  end
  object StairsStyleButton1: TButton
    Left = 384
    Top = 46
    Width = 81
    Height = 25
    Caption = '-------------'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = StairsStyleButton1Click
  end
  object StairsStyleButton2: TButton
    Left = 504
    Top = 46
    Width = 81
    Height = 25
    Caption = '------------>'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = StairsStyleButton2Click
  end
  object ExitButton: TButton
    Left = 724
    Top = 98
    Width = 92
    Height = 35
    Caption = #1042#1099#1093#1086#1076
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = ExitButtonClick
  end
  object ClearButton: TButton
    Left = 724
    Top = 57
    Width = 92
    Height = 35
    Caption = #1054#1095#1080#1089#1090#1082#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = ClearButtonClick
  end
end
