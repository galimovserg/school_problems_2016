object Form1: TForm1
  Left = 132
  Top = 153
  Width = 867
  Height = 582
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
  object lbl1: TLabel
    Left = 536
    Top = 16
    Width = 18
    Height = 33
    Caption = 'N'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 536
    Top = 64
    Width = 15
    Height = 33
    Caption = 'P'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 552
    Top = 192
    Width = 48
    Height = 13
    Caption = #1087#1086#1083#1091#1095#1077#1085#1086
  end
  object lbl4: TLabel
    Left = 704
    Top = 192
    Width = 50
    Height = 13
    Caption = #1074#1099#1073#1088#1072#1085#1085#1086
  end
  object pb1: TPaintBox
    Left = 0
    Top = 0
    Width = 505
    Height = 505
    OnClick = pb1Click
    OnContextPopup = pb1ContextPopup
    OnMouseMove = pb1MouseMove
  end
  object lbl5: TLabel
    Left = 536
    Top = 104
    Width = 15
    Height = 33
    Caption = 'S'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl6: TLabel
    Left = 368
    Top = 512
    Width = 16
    Height = 13
    Caption = 'lbl6'
  end
  object btn1: TButton
    Left = 688
    Top = 16
    Width = 75
    Height = 25
    Caption = #1057#1058#1056#1054#1048#1058#1068
    TabOrder = 0
    OnClick = btn1Click
  end
  object edt1: TEdit
    Left = 560
    Top = 16
    Width = 121
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '10'
  end
  object edt2: TEdit
    Left = 560
    Top = 64
    Width = 121
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = '0'
  end
  object mmo1: TMemo
    Left = 696
    Top = 216
    Width = 137
    Height = 233
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object mmo2: TMemo
    Left = 552
    Top = 216
    Width = 145
    Height = 233
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object edt3: TEdit
    Left = 560
    Top = 104
    Width = 121
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = '0'
  end
  object btn2: TButton
    Left = 552
    Top = 456
    Width = 145
    Height = 25
    Caption = #1089#1090#1088#1086#1080#1090#1100' '#1087#1086' '#1084#1072#1089#1089#1080#1074#1091
    TabOrder = 6
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 704
    Top = 456
    Width = 129
    Height = 25
    Caption = #1086#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 7
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 664
    Top = 480
    Width = 33
    Height = 25
    Caption = 'dr'
    TabOrder = 8
    OnClick = btn4Click
  end
  object btn5: TButton
    Left = 704
    Top = 480
    Width = 33
    Height = 25
    Caption = 'dr'
    TabOrder = 9
    OnClick = btn5Click
  end
  object pm1: TPopupMenu
    Left = 512
    Top = 304
    object N1: TMenuItem
      Caption = #1075#1076#1077' '#1103'?'
    end
    object N2: TMenuItem
      Caption = #1079#1072#1082#1088#1072#1089#1080#1090#1100
    end
  end
end
