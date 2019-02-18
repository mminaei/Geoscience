object DT_Selection: TDT_Selection
  Left = 775
  Top = 177
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'DT Selection'
  ClientHeight = 412
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 371
    Width = 245
    Height = 41
    Align = alBottom
    TabOrder = 3
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
  object GroupBox5: TGroupBox
    Left = 0
    Top = 306
    Width = 245
    Height = 65
    Align = alBottom
    Caption = 'Output Measurment Units'
    TabOrder = 4
    object Label6: TLabel
      Left = 8
      Top = 20
      Width = 38
      Height = 13
      Caption = 'P-Wave'
      Transparent = True
    end
    object Label7: TLabel
      Left = 143
      Top = 20
      Width = 38
      Height = 13
      Caption = 'S-Wave'
      Transparent = True
    end
    object ComboBox3: TComboBox
      Left = 8
      Top = 36
      Width = 80
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'KM/S'
      OnChange = ComboBox3Change
      Items.Strings = (
        'KM/S'
        'FT/S')
    end
    object ComboBox4: TComboBox
      Left = 140
      Top = 36
      Width = 80
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'KM/S'
      OnChange = ComboBox4Change
      Items.Strings = (
        'KM/S'
        'FT/S')
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 245
    Height = 105
    Align = alTop
    Caption = 'DT of P-Wave'
    TabOrder = 0
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
  object GroupBox2: TGroupBox
    Left = 0
    Top = 105
    Width = 245
    Height = 136
    Align = alTop
    Caption = 'DT of S-Wave'
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 110
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
    object Label8: TLabel
      Left = 112
      Top = 110
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
    object RadioButton3: TRadioButton
      Left = 8
      Top = 80
      Width = 97
      Height = 17
      Caption = 'Constant value:'
      TabOrder = 1
      OnClick = RadioButton3Click
    end
    object RadioButton4: TRadioButton
      Left = 8
      Top = 50
      Width = 97
      Height = 17
      Caption = 'From logs:'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton4Click
    end
    object Edit2: TEdit
      Left = 112
      Top = 76
      Width = 121
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 2
    end
    object Button4: TButton
      Left = 112
      Top = 46
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 3
      OnClick = Button4Click
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 20
      Width = 105
      Height = 17
      Caption = 'No DT of S-wave'
      TabOrder = 4
      OnClick = CheckBox1Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 241
    Width = 245
    Height = 65
    Align = alClient
    Caption = 'Input Measurment Units'
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 20
      Width = 38
      Height = 13
      Caption = 'P-Wave'
      Transparent = True
    end
    object Label5: TLabel
      Left = 140
      Top = 20
      Width = 38
      Height = 13
      Caption = 'S-Wave'
      Transparent = True
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 36
      Width = 80
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'US/FT'
      OnChange = ComboBox1Change
      Items.Strings = (
        'US/FT'
        'US/M')
    end
    object ComboBox2: TComboBox
      Left = 140
      Top = 36
      Width = 80
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'US/FT'
      OnChange = ComboBox2Change
      Items.Strings = (
        'US/FT'
        'US/M')
    end
  end
end
