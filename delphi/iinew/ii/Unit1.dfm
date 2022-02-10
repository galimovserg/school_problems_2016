object Form1: TForm1
  Left = 585
  Top = 93
  Width = 710
  Height = 582
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pb1: TPaintBox
    Left = 16
    Top = 16
    Width = 553
    Height = 409
    Cursor = crHandPoint
    OnMouseDown = pb1MouseDown
    OnMouseMove = pb1MouseMove
    OnMouseUp = pb1MouseUp
  end
  object lbl5: TLabel
    Left = 136
    Top = 0
    Width = 16
    Height = 13
    Caption = 'lbl5'
  end
  object pnl1: TPanel
    Left = 584
    Top = 0
    Width = 81
    Height = 473
    TabOrder = 0
    object lbl1: TLabel
      Left = 0
      Top = 8
      Width = 34
      Height = 13
      Caption = 'object:'
    end
    object lbl2: TLabel
      Left = 0
      Top = 184
      Width = 33
      Height = 13
      Caption = 'action:'
    end
    object edt1: TEdit
      Left = 0
      Top = 440
      Width = 57
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '100'
    end
    object ud1: TUpDown
      Left = 56
      Top = 440
      Width = 17
      Height = 25
      Max = 200
      Position = 100
      TabOrder = 1
      OnClick = ud1Click
    end
    object btn1: TBitBtn
      Left = 0
      Top = 24
      Width = 75
      Height = 33
      Caption = 'rect'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btn1Click
    end
    object btn4: TBitBtn
      Left = 0
      Top = 64
      Width = 75
      Height = 33
      Caption = 'pixel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btn4Click
    end
    object btn6: TBitBtn
      Left = 0
      Top = 104
      Width = 75
      Height = 33
      Caption = 'polygon'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btn6Click
    end
    object btn8: TBitBtn
      Left = 0
      Top = 200
      Width = 75
      Height = 33
      Caption = 'drawing'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btn8Click
    end
    object btn2: TBitBtn
      Left = 0
      Top = 240
      Width = 75
      Height = 33
      Caption = 'move'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = btn2Click
    end
    object btn5: TBitBtn
      Left = 0
      Top = 280
      Width = 75
      Height = 33
      Caption = 'delete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = btn5Click
    end
    object btn3: TBitBtn
      Left = 0
      Top = 320
      Width = 75
      Height = 33
      Caption = 'arm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = btn3Click
    end
    object btn9: TBitBtn
      Left = 0
      Top = 360
      Width = 75
      Height = 33
      Caption = 'fill'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = btn9Click
    end
    object btn11: TBitBtn
      Left = 0
      Top = 408
      Width = 75
      Height = 25
      Caption = 'btn11'
      TabOrder = 10
      OnClick = btn11Click
    end
    object btn14: TBitBtn
      Left = 0
      Top = 144
      Width = 75
      Height = 33
      Caption = 'circle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = btn14Click
    end
  end
  object pnl2: TPanel
    Left = 16
    Top = 432
    Width = 329
    Height = 89
    TabOrder = 1
    object shp1: TShape
      Left = 72
      Top = 32
      Width = 25
      Height = 25
    end
    object shp2: TShape
      Left = 192
      Top = 32
      Width = 25
      Height = 25
    end
    object lbl3: TLabel
      Left = 16
      Top = 0
      Width = 27
      Height = 13
      Caption = 'Brush'
    end
    object lbl4: TLabel
      Left = 136
      Top = 0
      Width = 18
      Height = 13
      Caption = 'Pen'
    end
    object btn7: TButton
      Left = 16
      Top = 16
      Width = 49
      Height = 25
      Caption = 'Color'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btn7Click
    end
    object btn10: TBitBtn
      Left = 136
      Top = 16
      Width = 49
      Height = 25
      Caption = 'Color'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btn10Click
    end
    object btn12: TBitBtn
      Left = 16
      Top = 48
      Width = 49
      Height = 25
      Caption = 'Style'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object btn13: TBitBtn
      Left = 136
      Top = 48
      Width = 49
      Height = 25
      Caption = 'style'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object dlgColor1: TColorDialog
    Color = clCream
    Left = 304
    Top = 472
  end
  object mm1: TMainMenu
    Left = 72
    object menu1: TMenuItem
      Caption = 'menu'
      object load1: TMenuItem
        Caption = 'open'
        OnClick = load1Click
      end
      object save1: TMenuItem
        Caption = 'save'
        OnClick = save1Click
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
    Left = 360
    Top = 480
  end
  object dlgOpen1: TOpenDialog
    Left = 392
    Top = 440
  end
  object dlgColor2: TColorDialog
    Left = 304
    Top = 432
  end
  object tmr1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = tmr1Timer
    Left = 352
    Top = 432
  end
end
