object Form1: TForm1
  Left = 201
  Top = 214
  BorderStyle = bsDialog
  Caption = #1043#1077#1085#1077#1088#1072#1090#1086#1088' '#1076#1083#1103' '#1079#1072#1076#1072#1095#1080' '#8470'5'
  ClientHeight = 304
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 1
    Top = 1
    Width = 600
    Height = 200
  end
  object Label1: TLabel
    Left = 8
    Top = 210
    Width = 41
    Height = 16
    Caption = #1058#1077#1082#1089#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 234
    Width = 217
    Height = 30
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1089#1090' '#1085#1072' '#1088#1080#1089#1091#1085#1082#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object Label2: TLabel
    Left = 272
    Top = 211
    Width = 89
    Height = 16
    Caption = #1056#1072#1079#1073#1088#1086#1089' '#1087#1086' '#1061':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 272
    Top = 257
    Width = 90
    Height = 16
    Caption = #1056#1072#1079#1073#1088#1086#1089' '#1087#1086' Y:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 422
    Top = 211
    Width = 107
    Height = 16
    Caption = #1056#1072#1079#1084#1077#1088' '#1096#1088#1080#1092#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 422
    Top = 256
    Width = 126
    Height = 16
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1096#1088#1080#1092#1090#1072'::'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton2: TSpeedButton
    Left = 8
    Top = 269
    Width = 217
    Height = 30
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1092#1072#1081#1083' '#1090#1077#1089#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton2Click
  end
  object Edit1: TEdit
    Left = 52
    Top = 208
    Width = 173
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 304
    Top = 228
    Width = 57
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Text = '0'
  end
  object Edit3: TEdit
    Left = 304
    Top = 275
    Width = 57
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    Text = '0'
  end
  object UpDown1: TUpDown
    Left = 361
    Top = 228
    Width = 16
    Height = 24
    Associate = Edit2
    TabOrder = 3
  end
  object UpDown2: TUpDown
    Left = 361
    Top = 275
    Width = 16
    Height = 24
    Associate = Edit3
    TabOrder = 4
  end
  object ComboBox1: TComboBox
    Left = 488
    Top = 229
    Width = 62
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 5
    Text = '48'
    Items.Strings = (
      '10'
      '12'
      '14'
      '18'
      '22'
      '28'
      '32'
      '38'
      '48'
      '72'
      '100')
  end
  object ComboBox2: TComboBox
    Left = 424
    Top = 274
    Width = 169
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 6
  end
end
