object Form1: TForm1
  Left = 4
  Top = 146
  Width = 960
  Height = 415
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
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pb1: TPaintBox
    Left = 8
    Top = 16
    Width = 921
    Height = 401
    Cursor = crHandPoint
    OnMouseDown = pb1MouseDown
    OnMouseMove = pb1MouseMove
  end
  object lbl1: TLabel
    Left = 224
    Top = 0
    Width = 16
    Height = 13
    Caption = 'lbl1'
  end
  object mm1: TMainMenu
    Left = 80
    Top = 16
    object menu1: TMenuItem
      Caption = 'menu'
      object load1: TMenuItem
        Caption = 'open'
        OnClick = load1Click
      end
      object exit1: TMenuItem
        Caption = 'exit'
        OnClick = exit1Click
      end
    end
    object run1: TMenuItem
      Caption = 'run'
      object run2: TMenuItem
        Caption = 'run'
        OnClick = run2Click
      end
    end
  end
  object dlgSave1: TSaveDialog
    Left = 192
    Top = 16
  end
  object dlgOpen1: TOpenDialog
    Left = 152
    Top = 16
  end
  object tmr1: TTimer
    Enabled = False
    Interval = 30
    OnTimer = tmr1Timer
    Left = 112
    Top = 16
  end
  object tmr2: TTimer
    Left = 232
    Top = 16
  end
  object idhtp1: TIdHTTP
    MaxLineLength = 255
    MaxLineAction = maException
    AllowCookies = True
    RedirectMaximum = 1
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 272
    Top = 16
  end
end
