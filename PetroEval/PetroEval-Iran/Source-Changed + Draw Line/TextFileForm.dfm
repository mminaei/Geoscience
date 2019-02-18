object TextFile_Form: TTextFile_Form
  Left = 252
  Top = 125
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Text File Properties'
  ClientHeight = 111
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ScreenSnap = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 20
    Width = 40
    Height = 13
    Caption = 'Delimiter'
    Transparent = True
  end
  object Label2: TLabel
    Left = 16
    Top = 52
    Width = 113
    Height = 13
    Caption = 'Number of Lines to Skip'
  end
  object Label4: TLabel
    Left = 221
    Top = 20
    Width = 107
    Height = 13
    Caption = 'Depth Column Number'
  end
  object Label5: TLabel
    Left = 78
    Top = 84
    Width = 51
    Height = 13
    Caption = 'Depth Unit'
  end
  object Label6: TLabel
    Left = 280
    Top = 52
    Width = 48
    Height = 13
    Caption = 'Null Value'
  end
  object ComboBox1: TComboBox
    Left = 136
    Top = 16
    Width = 73
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = 'Comma'
    Items.Strings = (
      'Comma'
      'Space'
      'Tab')
  end
  object Edit1: TEdit
    Left = 136
    Top = 48
    Width = 73
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 256
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Ok'
    Default = True
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 336
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Edit3: TEdit
    Left = 336
    Top = 16
    Width = 73
    Height = 21
    TabOrder = 3
    Text = '1'
  end
  object Edit4: TEdit
    Left = 136
    Top = 80
    Width = 73
    Height = 21
    TabOrder = 2
    Text = 'M'
  end
  object Edit5: TEdit
    Left = 336
    Top = 48
    Width = 73
    Height = 21
    TabOrder = 4
    Text = '-999.25'
  end
end
