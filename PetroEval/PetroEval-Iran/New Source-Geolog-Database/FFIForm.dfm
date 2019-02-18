object FFI_Form: TFFI_Form
  Left = 962
  Top = 131
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Free Fluid Index'
  ClientHeight = 251
  ClientWidth = 245
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ScreenSnap = True
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 105
    Width = 245
    Height = 105
    Align = alTop
    Caption = 'Irreducible Water Saturation (V/V)'
    TabOrder = 0
    object Label2: TLabel
      Left = 112
      Top = 80
      Width = 28
      Height = 13
      Caption = 'NONE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 80
      Width = 68
      Height = 13
      Caption = 'Selected Log: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object RadioButton3: TRadioButton
      Left = 8
      Top = 20
      Width = 97
      Height = 17
      Caption = 'From logs:'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton3Click
    end
    object RadioButton4: TRadioButton
      Left = 8
      Top = 50
      Width = 97
      Height = 17
      Caption = 'Constant value:'
      TabOrder = 1
      OnClick = RadioButton4Click
    end
    object Edit2: TEdit
      Left = 112
      Top = 48
      Width = 121
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 2
    end
    object Button4: TButton
      Left = 112
      Top = 16
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 3
      OnClick = Button4Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 210
    Width = 245
    Height = 41
    Align = alClient
    TabOrder = 1
    object Button1: TButton
      Left = 74
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      Default = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 157
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 245
    Height = 105
    Align = alTop
    Caption = 'Porosity (V/V)'
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 80
      Width = 68
      Height = 13
      Caption = 'Selected Log: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 112
      Top = 80
      Width = 28
      Height = 13
      Caption = 'NONE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RadioButton1: TRadioButton
      Left = 8
      Top = 50
      Width = 97
      Height = 17
      Caption = 'Constant value:'
      TabOrder = 1
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 20
      Width = 97
      Height = 17
      Caption = 'From logs:'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton2Click
    end
    object Edit1: TEdit
      Left = 112
      Top = 48
      Width = 121
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 2
    end
    object Button3: TButton
      Left = 112
      Top = 16
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 3
      OnClick = Button3Click
    end
  end
end
