object Form1: TForm1
  Left = 483
  Top = 145
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
  object btn1: TButton
    Left = 192
    Top = 16
    Width = 75
    Height = 25
    Caption = 'save'
    TabOrder = 0
    OnClick = btn1Click
  end
  object edt1: TEdit
    Left = 64
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edt1'
  end
  object mmo1: TMemo
    Left = 56
    Top = 56
    Width = 129
    Height = 89
    Lines.Strings = (
      'mmo1')
    TabOrder = 2
  end
  object btn2: TButton
    Left = 192
    Top = 56
    Width = 75
    Height = 25
    Caption = 'open'
    TabOrder = 3
    OnClick = btn2Click
  end
  object idhtpsrvr1: TIdHTTPServer
    Bindings = <>
    CommandHandlers = <>
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    Left = 536
    Top = 16
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
    Left = 648
    Top = 48
  end
end
