object Form1: TForm1
  Left = 193
  Top = 152
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edt1: TEdit
    Left = 104
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edt1'
  end
  object btn1: TButton
    Left = 104
    Top = 120
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 1
    OnClick = btn1Click
  end
  object mmo1: TMemo
    Left = 96
    Top = 160
    Width = 185
    Height = 89
    Lines.Strings = (
      'mmo1'
      'rhththht'
      'ththhhhhhhhh'
      'thhhhhhhhhhhhhh'
      'thhhhhhhhhhhhhhhh'
      'thhhhhhhhhhhhhhhhh'
      'thfdddddddddd')
    TabOrder = 2
  end
  object idhtp1: TIdHTTP
    MaxLineAction = maException
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 392
    Top = 24
  end
end
