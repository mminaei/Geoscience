object Vp_Selection: TVp_Selection
  Left = 385
  Top = 268
  BorderStyle = bsDialog
  Caption = 'Vp Selection'
  ClientHeight = 227
  ClientWidth = 246
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 186
    Width = 246
    Height = 41
    Align = alBottom
    TabOrder = 0
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
  object GroupBox2: TGroupBox
    Left = 0
    Top = 120
    Width = 246
    Height = 66
    Align = alBottom
    Caption = 'Measurment Units'
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 20
      Width = 31
      Height = 13
      Caption = 'Input'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 128
      Top = 20
      Width = 39
      Height = 13
      Caption = 'Output'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 36
      Width = 105
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'KM/S'
      OnChange = ComboBox1Change
      Items.Strings = (
        'KM/S'
        'FT/S')
    end
    object ComboBox2: TComboBox
      Left = 128
      Top = 36
      Width = 105
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'KM/S'
      OnChange = ComboBox2Change
      Items.Strings = (
        'KM/S'
        'FT/S')
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 246
    Height = 120
    Align = alClient
    Caption = 'P-Wave Velocity'
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 88
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
    object Label2: TLabel
      Left = 112
      Top = 88
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
      Top = 58
      Width = 97
      Height = 17
      Caption = 'Constant value:'
      TabOrder = 1
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 28
      Width = 97
      Height = 17
      Caption = 'From logs:'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton2Click
    end
    object Edit3: TEdit
      Left = 112
      Top = 56
      Width = 121
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 2
    end
    object Button3: TButton
      Left = 112
      Top = 24
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 3
      OnClick = Button3Click
    end
  end
end
