object Porosity_Form: TPorosity_Form
  Left = 1016
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Porosity'
  ClientHeight = 480
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
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 0
    Width = 246
    Height = 81
    Align = alTop
    Caption = 'Calculate From:'
    ItemIndex = 0
    Items.Strings = (
      'Sonic Log (DT of P-wave)'
      'Density Log'
      'Neutron-Density Porosity Logs')
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 439
    Width = 246
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button2: TButton
      Left = 157
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 77
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      Default = True
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 257
    Width = 246
    Height = 120
    Align = alTop
    Caption = 'Lithology'
    TabOrder = 2
    object LabeledEdit1: TLabeledEdit
      Left = 112
      Top = 52
      Width = 105
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Matrix DT'
      EditLabel.Font.Charset = GREEK_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      EditLabel.Transparent = True
      LabelPosition = lpLeft
      TabOrder = 0
      Text = '49'
    end
    object LabeledEdit2: TLabeledEdit
      Left = 112
      Top = 84
      Width = 105
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = 'Fluid DT   '
      EditLabel.Font.Charset = GREEK_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      EditLabel.Transparent = True
      LabelPosition = lpLeft
      TabOrder = 1
      Text = '189'
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 20
      Width = 105
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      OnChange = ComboBox1Change
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 81
    Width = 246
    Height = 88
    Align = alTop
    Caption = 'DT of P-wave'
    TabOrder = 3
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
    object ComboBox2: TComboBox
      Left = 112
      Top = 24
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      OnChange = ComboBox2Change
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 169
    Width = 246
    Height = 88
    Align = alTop
    Caption = 'Corrected Neutron Porosity'
    Enabled = False
    TabOrder = 4
    object RadioButton3: TRadioButton
      Left = 8
      Top = 58
      Width = 97
      Height = 17
      Caption = 'Constant value:'
      Enabled = False
      TabOrder = 1
      OnClick = RadioButton3Click
    end
    object RadioButton4: TRadioButton
      Left = 8
      Top = 28
      Width = 97
      Height = 17
      Caption = 'From logs:'
      Checked = True
      Enabled = False
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton4Click
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
    object ComboBox3: TComboBox
      Left = 112
      Top = 24
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      OnChange = ComboBox3Change
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 377
    Width = 246
    Height = 64
    Align = alTop
    Caption = 'Output Curve'
    TabOrder = 5
    object Label1: TLabel
      Left = 112
      Top = 32
      Width = 4
      Height = 13
      Caption = '.'
    end
    object Edit2: TEdit
      Left = 8
      Top = 24
      Width = 97
      Height = 21
      TabOrder = 0
    end
    object Edit4: TEdit
      Left = 120
      Top = 24
      Width = 49
      Height = 21
      TabOrder = 1
    end
  end
end
