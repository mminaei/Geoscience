object PHI_Select_Form: TPHI_Select_Form
  Left = 487
  Top = 231
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Porosity Track'
  ClientHeight = 102
  ClientWidth = 180
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ScreenSnap = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 61
    Width = 180
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 6
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      Default = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 180
    Height = 61
    Align = alClient
    Caption = 'Select Porosity Log (V/V)'
    TabOrder = 0
    object ComboBox1: TComboBox
      Left = 16
      Top = 24
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
  end
end
