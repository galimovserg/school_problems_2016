object Form3: TForm3
  Left = 210
  Top = 171
  BorderStyle = bsDialog
  Caption = #1085#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 262
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 160
    Top = 200
    Width = 18
    Height = 13
    Caption = #1074#1082#1083
  end
  object shp1: TShape
    Left = 128
    Top = 32
    Width = 25
    Height = 25
  end
  object shp2: TShape
    Left = 128
    Top = 64
    Width = 25
    Height = 25
  end
  object shp3: TShape
    Left = 128
    Top = 96
    Width = 25
    Height = 25
  end
  object btn1: TButton
    Left = 32
    Top = 32
    Width = 81
    Height = 25
    Caption = #1094#1074#1077#1090' '#1092#1086#1085#1072
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 32
    Top = 64
    Width = 81
    Height = 25
    Caption = #1094#1074#1077#1090' '#1083#1080#1085#1080#1081' 1'
    TabOrder = 1
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 32
    Top = 96
    Width = 81
    Height = 25
    Caption = #1094#1074#1077#1090' '#1083#1080#1085#1080#1081' 2'
    TabOrder = 2
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 32
    Top = 128
    Width = 121
    Height = 25
    Caption = #1088#1072#1079#1084#1077#1088' '#1090#1077#1082#1089#1090#1072' '#1074' '#1094#1077#1087#1080
    TabOrder = 3
  end
  object btn5: TButton
    Left = 80
    Top = 224
    Width = 97
    Height = 25
    Caption = #1089#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    OnClick = btn5Click
  end
  object btn6: TButton
    Left = 32
    Top = 192
    Width = 97
    Height = 25
    Caption = #1074#1099#1072#1074#1085#1080#1074#1072#1085#1080#1077
    TabOrder = 5
  end
  object edt1: TEdit
    Left = 160
    Top = 128
    Width = 49
    Height = 21
    TabOrder = 6
    Text = '10'
  end
  object btn7: TButton
    Left = 32
    Top = 160
    Width = 121
    Height = 25
    Caption = #1090#1086#1083#1097#1080#1085#1072' '#1083#1080#1085#1080#1081
    TabOrder = 7
  end
  object edt2: TEdit
    Left = 160
    Top = 160
    Width = 49
    Height = 21
    TabOrder = 8
    Text = '0'
  end
  object dlgColor1: TColorDialog
    Left = 176
    Top = 32
  end
  object dlgColor2: TColorDialog
    Left = 176
    Top = 56
  end
  object dlgColor3: TColorDialog
    Left = 176
    Top = 88
  end
end
