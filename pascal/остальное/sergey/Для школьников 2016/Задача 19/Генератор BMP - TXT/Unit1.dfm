object Form1: TForm1
  Left = 192
  Top = 124
  BorderStyle = bsDialog
  Caption = #1043#1077#1085#1077#1088#1072#1090#1086#1088' '#1076#1083#1103' '#1079#1072#1076#1072#1095#1080' '#8470'6'
  ClientHeight = 86
  ClientWidth = 209
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 9
    Top = 11
    Width = 193
    Height = 41
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1092#1072#1081#1083' '#1090#1077#1089#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object ProgressBar1: TProgressBar
    Left = 1
    Top = 69
    Width = 209
    Height = 17
    TabOrder = 0
  end
  object OpenDialog1: TOpenDialog
    Filter = #1058#1086#1095#1077#1095#1085#1099#1081' '#1088#1080#1089#1091#1085#1086#1082' *.bmp|*.bmp'
  end
end
