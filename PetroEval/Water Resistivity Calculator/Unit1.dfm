object Form1: TForm1
  Left = 309
  Top = 231
  BorderStyle = bsDialog
  Caption = 'Water Resistivity Calculator'
  ClientHeight = 282
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 297
    Height = 57
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 8
    Top = 112
    Width = 297
    Height = 113
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 8
    Top = 240
    Width = 156
    Height = 13
    Caption = 'Milad Razavi            8351022'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 8
    Top = 256
    Width = 155
    Height = 13
    Caption = 'Pouyan Ebrahimi    8351001'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object LabeledEdit1: TLabeledEdit
    Left = 16
    Top = 32
    Width = 137
    Height = 21
    EditLabel.Width = 49
    EditLabel.Height = 13
    EditLabel.Caption = 'Csp (ppm)'
    EditLabel.Transparent = True
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 112
    Top = 76
    Width = 89
    Height = 25
    Caption = 'Calculate'
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object LabeledEdit4: TLabeledEdit
    Left = 16
    Top = 192
    Width = 137
    Height = 21
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = 'Rw @ 25 '#176'C'
    EditLabel.Transparent = True
    ReadOnly = True
    TabOrder = 4
  end
  object LabeledEdit5: TLabeledEdit
    Left = 160
    Top = 192
    Width = 137
    Height = 21
    EditLabel.Width = 137
    EditLabel.Height = 13
    EditLabel.Caption = 'Rw @ reservoir temperature'
    EditLabel.Transparent = True
    ReadOnly = True
    TabOrder = 5
  end
  object LabeledEdit2: TLabeledEdit
    Left = 160
    Top = 32
    Width = 137
    Height = 21
    EditLabel.Width = 132
    EditLabel.Height = 13
    EditLabel.Caption = 'Reservoir temperature ('#176'C)'
    EditLabel.Transparent = True
    TabOrder = 1
  end
  object LabeledEdit3: TLabeledEdit
    Left = 16
    Top = 144
    Width = 137
    Height = 21
    EditLabel.Width = 56
    EditLabel.Height = 13
    EditLabel.Caption = 'Csm (mol/L)'
    EditLabel.Transparent = True
    ReadOnly = True
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 224
    Top = 240
    Width = 83
    Height = 33
    TabOrder = 6
    Kind = bkClose
  end
  object XPManifest1: TXPManifest
    Left = 280
    Top = 72
  end
end
