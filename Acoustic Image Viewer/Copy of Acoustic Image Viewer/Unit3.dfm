object Form3: TForm3
  Left = 621
  Top = 99
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Kalman Filter Settings'
  ClientHeight = 119
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 76
    Height = 13
    Caption = 'Filter Exponent :'
    Transparent = True
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 33
    Height = 13
    Caption = 'Mode :'
    Transparent = True
  end
  object Label3: TLabel
    Left = 8
    Top = 32
    Width = 132
    Height = 13
    Caption = 'Size of Teching Sequence :'
    Transparent = True
  end
  object ComboBox1: TComboBox
    Left = 160
    Top = 52
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Items.Strings = (
      'Recursive'
      'Moving Average')
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 88
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 232
    Top = 88
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object ESBPosEdit1: TESBPosEdit
    Left = 160
    Top = 4
    Width = 81
    Height = 21
    BoundsEnabled = True
    TabOrder = 3
    BoundUpper = 10
  end
  object ESBPosEdit2: TESBPosEdit
    Left = 160
    Top = 28
    Width = 81
    Height = 21
    TabOrder = 4
  end
end
