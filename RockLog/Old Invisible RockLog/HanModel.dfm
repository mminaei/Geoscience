object Han_Model: THan_Model
  Left = 194
  Top = 141
  BorderStyle = bsDialog
  Caption = 'Han'#39's Model Parameters'
  ClientHeight = 120
  ClientWidth = 217
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
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 97
    Height = 73
    Caption = 'Method'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Clay'
      'Porosity')
    ParentFont = False
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object RadioGroup2: TRadioGroup
    Left = 112
    Top = 8
    Width = 97
    Height = 73
    Caption = 'Clay Volume'
    ItemIndex = 0
    Items.Strings = (
      '> 25 %'
      '< 25 %')
    TabOrder = 1
  end
  object Button1: TButton
    Left = 56
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Ok'
    Default = True
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = Button2Click
  end
end
