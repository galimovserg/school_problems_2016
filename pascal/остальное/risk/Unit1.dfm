object Form1: TForm1
  Left = 202
  Top = 417
  VertScrollBar.Visible = False
  AlphaBlendValue = 250
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 559
  ClientWidth = 965
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  Visible = True
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 186
    Height = 24
    Caption = #1090#1077#1082#1091#1097#1077#1077' '#1076#1077#1081#1089#1090#1074#1080#1077':  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 200
    Top = 8
    Width = 131
    Height = 24
    Caption = #1087#1086#1076#1082#1088#1077#1087#1083#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object pb1: TPaintBox
    Left = 0
    Top = 0
    Width = 945
    Height = 513
    OnClick = pb1Click
  end
  object shp1: TShape
    Left = 464
    Top = 8
    Width = 41
    Height = 49
    Brush.Color = clRed
  end
  object btn1: TButton
    Left = 624
    Top = 8
    Width = 121
    Height = 49
    Caption = #1075#1086#1090#1086#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btn1Click
  end
  object edt1: TEdit
    Left = 504
    Top = 8
    Width = 81
    Height = 48
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '1'
  end
  object btn2: TButton
    Left = 584
    Top = 8
    Width = 41
    Height = 25
    Caption = '^'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 584
    Top = 32
    Width = 41
    Height = 25
    Caption = 'v'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btn3Click
  end
  object mm1: TMainMenu
    Left = 8
    Top = 32
    object menu1: TMenuItem
      Caption = 'menu'
      object begin1: TMenuItem
        Caption = 'begin'
        OnClick = begin1Click
      end
      object exit1: TMenuItem
        Caption = 'exit'
        OnClick = exit1Click
      end
      object info1: TMenuItem
        Caption = 'info'
      end
    end
    object help1: TMenuItem
      Caption = 'help'
    end
  end
  object tmr1: TTimer
    Interval = 1
    Left = 56
    Top = 32
  end
end
