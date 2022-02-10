object Form1: TForm1
  Left = 262
  Top = 137
  BorderStyle = bsToolWindow
  Caption = 'english'
  ClientHeight = 199
  ClientWidth = 210
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000BBBBBBBBBBB0000000000000000000BBBBBBBBBBBBBBBB000000000000
    000BBBB0000000000BBBB000000000000BBBB00000000000000BBBB000000000
    BBBB0000000000000000BBBB00000000BB00000000000000000000BB0000000B
    B0000000000000000000000BB00000BBB0000000000000000000000BBB0000BB
    000000000000000000000000BB000BB00000000000000000000000000BB00BB0
    0000000000000000000000000BB00BB00000000000000000000000000BB00BB0
    0000000000000000000000000BB00B000000000000000000000000000BB00BB0
    0000000000000000000000000BB00BB00000000000000000000000000BB00BB0
    0000000000000000000000000BB00BB00000000000000000000000000BB000BB
    000000000000000000000000BB0000BBB0000000000000000000000BBB00000B
    B0000000000000000000000BB0000000BB00000000000000000000BB00000000
    BBBB0000000000000000BBBB000000000BBBB00000000000000BBBB000000000
    000BBBB0000000000BBBB000000000000000BBBBBBBBBBBBBBBB000000000000
    000000BBBBBBBBBBBB0000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFC007FFFF0000FFFE1FF87FF87FFE1FF0FFFF0FF3FFFFCFE7FF
    FFE7C7FFFC63CFFFFBB39FFFFFB99FFFFCB1980DDB399BFDDBB9BBFDDBB99BFD
    DBB99BFDDB39980CDCB99BFD3FF9CBFFFFF3C3FFFFE3E00FFFE7F3FFFFCFF0FF
    FF0FF87FFE1FFE1FF87FFF0000FFFFC003FFFFFFFFFFFFFFFFFFFFFFFFFF}
  Menu = mm1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 24
    Top = 40
    Width = 3
    Height = 13
  end
  object lbl2: TLabel
    Left = 24
    Top = 16
    Width = 73
    Height = 13
    Caption = #1074#1072#1096' '#1089#1083'.'#1079#1072#1087#1072#1089': '
    Visible = False
  end
  object lbl3: TLabel
    Left = 104
    Top = 16
    Width = 6
    Height = 13
    Caption = '0'
    Visible = False
  end
  object lbl4: TLabel
    Left = 24
    Top = 16
    Width = 76
    Height = 13
    Caption = #1074#1099#1073#1077#1088#1080#1090#1077' '#1090#1077#1089#1090
  end
  object btn1: TButton
    Left = 24
    Top = 72
    Width = 161
    Height = 49
    Caption = #1085#1072#1095#1072#1090#1100
    TabOrder = 0
    OnClick = btn1Click
  end
  object edt2: TEdit
    Left = 24
    Top = 64
    Width = 161
    Height = 21
    TabOrder = 1
    Visible = False
  end
  object btn2: TButton
    Left = 24
    Top = 96
    Width = 43
    Height = 25
    Caption = #1086#1082
    TabOrder = 2
    Visible = False
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 110
    Top = 96
    Width = 75
    Height = 25
    Caption = #1085#1077' '#1079#1085#1072#1102
    TabOrder = 3
    Visible = False
    OnClick = btn3Click
  end
  object cbb1: TComboBox
    Left = 24
    Top = 40
    Width = 161
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = #1074#1099#1073#1088#1072#1090#1100
    Items.Strings = (
      #1075#1083#1072#1075#1086#1083#1099
      #1089#1091#1097#1077#1089#1090#1074#1080#1090#1077#1083#1100#1085#1099#1077
      '')
  end
  object mm1: TMainMenu
    Left = 24
    Top = 128
    object menu1: TMenuItem
      Caption = 'menu'
      object EndTest1: TMenuItem
        Caption = 'EndTest'
        OnClick = EndTest1Click
      end
      object exit1: TMenuItem
        Caption = 'Exit'
        OnClick = exit1Click
      end
    end
    object heip1: TMenuItem
      Caption = 'help'
      object about1: TMenuItem
        Caption = 'about'
        OnClick = about1Click
      end
      object help1: TMenuItem
        Caption = 'help'
        OnClick = help1Click
      end
    end
  end
  object tmr1: TTimer
    Interval = 1
    OnTimer = tmr1Timer
    Left = 56
    Top = 128
  end
end
