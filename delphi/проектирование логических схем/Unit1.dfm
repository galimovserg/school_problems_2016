object Form1: TForm1
  Left = -131
  Top = 319
  Width = 1010
  Height = 506
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
  OnPaint = FormPaint
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pb1: TPaintBox
    Left = 0
    Top = 0
    Width = 753
    Height = 417
    OnMouseDown = pb1MouseDown
    OnMouseMove = pb1MouseMove
    OnMouseUp = pb1MouseUp
  end
  object pnl1: TPanel
    Left = 688
    Top = 0
    Width = 265
    Height = 417
    TabOrder = 0
    object pnl2: TPanel
      Left = 16
      Top = 32
      Width = 113
      Height = 257
      TabOrder = 0
      object lbl1: TLabel
        Left = 16
        Top = 8
        Width = 39
        Height = 13
        Caption = 'objects:'
      end
      object btn1: TBitBtn
        Left = 16
        Top = 32
        Width = 75
        Height = 25
        Caption = 'Or'
        TabOrder = 0
        OnClick = btn1Click
      end
      object btn2: TBitBtn
        Left = 16
        Top = 64
        Width = 75
        Height = 25
        Caption = 'And'
        TabOrder = 1
        OnClick = btn2Click
      end
      object btn3: TBitBtn
        Left = 16
        Top = 96
        Width = 75
        Height = 25
        Caption = 'Button'
        TabOrder = 2
        OnClick = btn3Click
      end
      object btn4: TBitBtn
        Left = 16
        Top = 128
        Width = 75
        Height = 25
        Caption = 'Label'
        TabOrder = 3
        OnClick = btn4Click
      end
      object btn10: TBitBtn
        Left = 16
        Top = 160
        Width = 75
        Height = 25
        Caption = 'Xor'
        TabOrder = 4
        OnClick = btn10Click
      end
      object btn11: TBitBtn
        Left = 16
        Top = 192
        Width = 75
        Height = 25
        Caption = 'Not'
        TabOrder = 5
        OnClick = btn11Click
      end
      object btn12: TBitBtn
        Left = 16
        Top = 224
        Width = 75
        Height = 25
        Caption = 'T -RS'
        TabOrder = 6
        OnClick = btn12Click
      end
    end
    object pnl3: TPanel
      Left = 136
      Top = 32
      Width = 113
      Height = 193
      TabOrder = 1
      object lbl2: TLabel
        Left = 16
        Top = 8
        Width = 31
        Height = 13
        Caption = 'acton:'
      end
      object btn8: TBitBtn
        Left = 16
        Top = 32
        Width = 75
        Height = 25
        Caption = 'create'
        TabOrder = 0
        OnClick = btn8Click
      end
      object btn5: TBitBtn
        Left = 16
        Top = 64
        Width = 75
        Height = 25
        Caption = 'move'
        TabOrder = 1
        OnClick = btn5Click
      end
      object btn6: TBitBtn
        Left = 16
        Top = 96
        Width = 75
        Height = 25
        Caption = 'delete'
        TabOrder = 2
        OnClick = btn6Click
      end
      object btn7: TBitBtn
        Left = 16
        Top = 128
        Width = 75
        Height = 25
        Caption = 'conect'
        TabOrder = 3
        OnClick = btn7Click
      end
      object btn9: TBitBtn
        Left = 16
        Top = 160
        Width = 75
        Height = 25
        Caption = 'see'
        TabOrder = 4
        OnClick = btn9Click
      end
    end
    object btn13: TButton
      Left = 224
      Top = 0
      Width = 27
      Height = 25
      Caption = 'X'
      TabOrder = 2
      OnClick = btn13Click
    end
  end
  object stat1: TStatusBar
    Left = 0
    Top = 428
    Width = 994
    Height = 19
    Panels = <>
  end
  object dlgOpen1: TOpenDialog
    FilterIndex = 0
    Left = 960
    Top = 320
  end
  object dlgSave1: TSaveDialog
    Left = 864
    Top = 328
  end
  object mm1: TMainMenu
    Left = 824
    Top = 328
    object menu1: TMenuItem
      Caption = 'menu'
      object save1: TMenuItem
        Caption = 'save'
        OnClick = save1Click
      end
      object open1: TMenuItem
        Caption = 'open'
        OnClick = open1Click
      end
      object exit1: TMenuItem
        Caption = 'exit'
        OnClick = exit1Click
      end
    end
    object projekt1: TMenuItem
      Caption = 'project'
      object PANELS1: TMenuItem
        Caption = 'PANELS'
        OnClick = PANELS1Click
      end
    end
  end
end
