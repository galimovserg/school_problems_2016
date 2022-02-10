object Form1: TForm1
  Left = 1016
  Top = 1
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 192
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mmo1: TMemo
    Left = 0
    Top = 24
    Width = 329
    Height = 153
    TabOrder = 0
  end
  object tmr1: TTimer
    Interval = 1
    OnTimer = tmr1Timer
    Left = 8
    Top = 168
  end
end
