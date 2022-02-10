object Form1: TForm1
  Left = 204
  Top = 155
  BorderStyle = bsDialog
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089#1083#1086#1074#1072' '#1076#1083#1103' '#1079#1072#1076#1072#1095#1080' '#8470'5'
  ClientHeight = 237
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 1
    Top = 1
    Width = 600
    Height = 200
  end
  object SpeedButton2: TSpeedButton
    Left = 8
    Top = 205
    Width = 81
    Height = 30
    Caption = #1054#1090#1082#1088#1099#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton2Click
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.txt|*.txt'
    Left = 16
    Top = 24
  end
end
