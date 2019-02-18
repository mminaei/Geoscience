object Form1: TForm1
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Mohr Circle Drawer'
  ClientHeight = 466
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 97
    Top = 0
    Width = 519
    Height = 466
    Align = alClient
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 97
    Height = 466
    Align = alLeft
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = 'Sigma 1'
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 38
      Height = 13
      Caption = 'Sigma 3'
    end
    object Button1: TButton
      Left = 8
      Top = 144
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 8
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Draw'
      TabOrder = 2
      OnClick = Button2Click
    end
    object ESBFloatEdit1: TESBFloatEdit
      Left = 8
      Top = 24
      Width = 73
      Height = 21
      TabOrder = 0
      TrimTrailingZeroes = True
      Scale = 1.000000000000000000
    end
    object ESBFloatEdit2: TESBFloatEdit
      Left = 8
      Top = 72
      Width = 73
      Height = 21
      TabOrder = 1
      TrimTrailingZeroes = True
      Scale = 1.000000000000000000
    end
    object Button3: TButton
      Left = 8
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Clear'
      TabOrder = 4
      OnClick = Button3Click
    end
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = '*.bmp'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 8
    Top = 232
  end
end
