object Form4: TForm4
  Left = 275
  Top = 59
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Low-Pass Filter Settings'
  ClientHeight = 184
  ClientWidth = 326
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
    Left = 16
    Top = 8
    Width = 56
    Height = 13
    Caption = 'Bandwidth :'
  end
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 109
    Height = 13
    Caption = 'Frequency Resolution :'
  end
  object Label3: TLabel
    Left = 16
    Top = 56
    Width = 33
    Height = 13
    Caption = 'Mode :'
  end
  object Label4: TLabel
    Left = 16
    Top = 80
    Width = 55
    Height = 13
    Caption = 'Overshoot :'
  end
  object Label5: TLabel
    Left = 16
    Top = 104
    Width = 128
    Height = 13
    Caption = 'Subtraction Noise Degree :'
  end
  object Label6: TLabel
    Left = 16
    Top = 128
    Width = 96
    Height = 13
    Caption = 'Supression Degree :'
  end
  object ESBPosEdit2: TESBPosEdit
    Left = 168
    Top = 28
    Width = 81
    Height = 21
    BoundsEnabled = True
    TabOrder = 0
    BoundLower = 1
    BoundUpper = 10
  end
  object ComboBox1: TComboBox
    Left = 168
    Top = 52
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Items.Strings = (
      'Low-Pass Filter'
      'None Filtering'
      'Subtraction Noise')
  end
  object ComboBox2: TComboBox
    Left = 168
    Top = 76
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Items.Strings = (
      'True'
      'False')
  end
  object ComboBox3: TComboBox
    Left = 168
    Top = 100
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      'Large'
      'Medium'
      'Small')
  end
  object ComboBox4: TComboBox
    Left = 168
    Top = 124
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Items.Strings = (
      'Large'
      'Medium'
      'Small')
  end
  object BitBtn1: TBitBtn
    Left = 160
    Top = 152
    Width = 75
    Height = 25
    TabOrder = 5
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 240
    Top = 152
    Width = 75
    Height = 25
    TabOrder = 6
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object ESBPosEdit1: TESBPosFloatEdit
    Left = 168
    Top = 4
    Width = 81
    Height = 21
    BoundsEnabled = True
    TabOrder = 7
    TrimTrailingZeroes = True
    Scale = 1
    AsFloat = 0.1
    BoundUpper = 1
  end
end
