object Form1: TForm1
  Left = 186
  Top = 63
  Width = 639
  Height = 581
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 32
    Top = 200
    Width = 190
    Height = 13
    Caption = #1074#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1072#1074#1080#1083#1100#1085#1099#1081'('#1099#1077') '#1086#1090#1074#1077#1090'('#1099'):'
  end
  object pnl1: TPanel
    Left = 24
    Top = 16
    Width = 577
    Height = 177
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 8
      Width = 60
      Height = 16
      Caption = #1079#1072#1076#1072#1095#1072' '#8470
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 80
      Top = 5
      Width = 9
      Height = 25
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object mmo1: TMemo
      Left = 0
      Top = 32
      Width = 577
      Height = 137
      Lines.Strings = (
        #1079#1076#1077#1089#1100' '#1085#1072#1093#1086#1076#1103#1090#1089#1103' '#1090#1077#1082#1089#1090' '#1079#1072#1076#1072#1095#1080)
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 0
    end
  end
  object pnl2: TPanel
    Left = 32
    Top = 224
    Width = 185
    Height = 121
    Color = clWhite
    TabOrder = 1
    OnClick = pnl2Click
    object mmo2: TMemo
      Left = 0
      Top = 16
      Width = 185
      Height = 89
      Lines.Strings = (
        #1086#1090#1074#1077#1090' 1')
      TabOrder = 0
      OnClick = mmo2Click
    end
  end
  object pnl3: TPanel
    Left = 224
    Top = 224
    Width = 185
    Height = 121
    Color = clWhite
    TabOrder = 2
    OnClick = pnl3Click
    object mmo3: TMemo
      Left = 0
      Top = 16
      Width = 185
      Height = 89
      Lines.Strings = (
        #1086#1090#1074#1077#1090' 2')
      TabOrder = 0
      OnClick = mmo3Click
    end
  end
  object pnl4: TPanel
    Left = 416
    Top = 224
    Width = 185
    Height = 121
    Color = clWhite
    TabOrder = 3
    OnClick = pnl4Click
    object mmo4: TMemo
      Left = 0
      Top = 16
      Width = 185
      Height = 89
      Lines.Strings = (
        #1086#1090#1074#1077#1090' 3')
      TabOrder = 0
      OnClick = mmo4Click
    end
  end
  object pnl5: TPanel
    Left = 32
    Top = 352
    Width = 185
    Height = 121
    Color = clWhite
    TabOrder = 4
    OnClick = pnl5Click
    object mmo5: TMemo
      Left = 0
      Top = 16
      Width = 185
      Height = 89
      Lines.Strings = (
        #1086#1090#1074#1077#1090' 4')
      TabOrder = 0
      OnClick = mmo5Click
    end
  end
  object pnl6: TPanel
    Left = 224
    Top = 352
    Width = 185
    Height = 121
    Color = clWhite
    TabOrder = 5
    OnClick = pnl6Click
    object mmo6: TMemo
      Left = 0
      Top = 16
      Width = 185
      Height = 89
      Lines.Strings = (
        #1086#1090#1074#1077#1090' 5')
      TabOrder = 0
      OnClick = mmo6Click
    end
  end
  object pnl7: TPanel
    Left = 416
    Top = 352
    Width = 185
    Height = 121
    Color = clWhite
    TabOrder = 6
    OnClick = pnl7Click
    object mmo7: TMemo
      Left = 0
      Top = 16
      Width = 185
      Height = 89
      Lines.Strings = (
        #1086#1090#1074#1077#1090' 6')
      TabOrder = 0
      OnClick = mmo7Click
    end
  end
  object btn1: TButton
    Left = 168
    Top = 488
    Width = 161
    Height = 25
    Caption = #1076#1072#1083#1077#1077
    TabOrder = 7
  end
  object btn2: TButton
    Left = 336
    Top = 488
    Width = 161
    Height = 25
    Caption = #1085#1077' '#1079#1085#1072#1102
    TabOrder = 8
  end
  object mm1: TMainMenu
    Left = 24
    Top = 488
    object menu1: TMenuItem
      Caption = 'menu'
      object exit1: TMenuItem
        Caption = 'exit'
      end
    end
  end
end
