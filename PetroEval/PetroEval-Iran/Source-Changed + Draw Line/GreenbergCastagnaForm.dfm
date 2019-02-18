object Greenberg_Castagna_Form: TGreenberg_Castagna_Form
  Left = 474
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Greenberg-Castagna'
  ClientHeight = 347
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 246
    Height = 145
    Align = alTop
    Caption = 'P-Wave Velocity'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
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
    object Edit1: TEdit
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
    object ComboBox1: TComboBox
      Left = 8
      Top = 108
      Width = 153
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = 'KM/S'
      OnChange = ComboBox1Change
      Items.Strings = (
        'KM/S'
        'FT/S')
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 306
    Width = 246
    Height = 41
    Align = alBottom
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
  object GroupBox2: TGroupBox
    Left = 0
    Top = 145
    Width = 246
    Height = 111
    Align = alClient
    Caption = 'Component Percentages (%)'
    TabOrder = 2
    object LabeledEdit1: TLabeledEdit
      Left = 12
      Top = 35
      Width = 97
      Height = 21
      EditLabel.Width = 51
      EditLabel.Height = 13
      EditLabel.Caption = 'Sandstone'
      TabOrder = 0
    end
    object LabeledEdit2: TLabeledEdit
      Left = 136
      Top = 35
      Width = 97
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = 'Limestone'
      TabOrder = 1
    end
    object LabeledEdit3: TLabeledEdit
      Left = 12
      Top = 80
      Width = 97
      Height = 21
      EditLabel.Width = 41
      EditLabel.Height = 13
      EditLabel.Caption = 'Dolomite'
      TabOrder = 2
    end
    object LabeledEdit4: TLabeledEdit
      Left = 136
      Top = 80
      Width = 97
      Height = 21
      EditLabel.Width = 26
      EditLabel.Height = 13
      EditLabel.Caption = 'Shale'
      TabOrder = 3
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 256
    Width = 246
    Height = 50
    Align = alBottom
    Caption = 'Output measurment Unit'
    TabOrder = 3
    object ComboBox2: TComboBox
      Left = 8
      Top = 20
      Width = 153
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'KM/S'
      OnChange = ComboBox2Change
      Items.Strings = (
        'KM/S'
        'FT/S')
    end
  end
end
