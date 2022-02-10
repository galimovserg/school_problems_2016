object Form1: TForm1
  Left = 290
  Top = 71
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 462
  ClientWidth = 606
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDefault
  ScreenSnap = True
  Visible = True
  OnClick = FormClick
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 424
    Top = 40
    Width = 27
    Height = 13
    Caption = 'koord'
  end
  object lbl2: TLabel
    Left = 536
    Top = 160
    Width = 15
    Height = 33
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 584
    Top = 120
    Width = 15
    Height = 33
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btn1: TButton
    Left = 424
    Top = 8
    Width = 75
    Height = 25
    Caption = #1079#1072#1075#1088#1091#1079#1080#1090#1100
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 424
    Top = 120
    Width = 153
    Height = 25
    Caption = #1089#1095#1080#1090#1072#1090#1100' '#1087#1083#1086#1097#1072#1076#1100' '#1082#1086#1084#1085#1072#1090#1099'='
    TabOrder = 1
    OnClick = btn2Click
  end
  object edt1: TEdit
    Left = 424
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object edt2: TEdit
    Left = 424
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '0'
  end
  object btn4: TButton
    Left = 424
    Top = 160
    Width = 105
    Height = 25
    Caption = #1089#1095#1080#1090#1072#1090#1100' '#1082#1086#1084#1085#1072#1090#1099'='
    TabOrder = 4
    OnClick = btn4Click
  end
  object tmr1: TTimer
    Enabled = False
    OnTimer = tmr1Timer
    Left = 544
    Top = 280
  end
end
