object Form1: TForm1
  Left = 217
  Top = 170
  Width = 247
  Height = 216
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 48
    Width = 50
    Height = 13
    Caption = #1090#1080#1087' '#1090#1077#1089#1090#1072
  end
  object btn1: TButton
    Left = 16
    Top = 72
    Width = 97
    Height = 25
    Caption = #1074#1099#1073#1088#1072#1090#1100
    TabOrder = 0
  end
  object btn2: TButton
    Left = 120
    Top = 72
    Width = 97
    Height = 25
    Caption = #1085#1072#1087#1080#1089#1072#1090#1100
    TabOrder = 1
  end
  object cbb1: TComboBox
    Left = 16
    Top = 24
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = #1071#1047#1067#1050
    Items.Strings = (
      'english'
      #1088#1091#1089#1089#1082#1080#1081)
  end
  object mm1: TMainMenu
    Left = 16
    Top = 112
    object menu1: TMenuItem
      Caption = 'menu'
      object testconst1: TMenuItem
        Caption = 'Test Const.'
      end
      object dict1: TMenuItem
        Caption = 'Dictionary'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
      end
    end
    object help1: TMenuItem
      Caption = 'help'
      object help2: TMenuItem
        Caption = 'help'
      end
      object about1: TMenuItem
        Caption = 'about'
      end
    end
  end
end
