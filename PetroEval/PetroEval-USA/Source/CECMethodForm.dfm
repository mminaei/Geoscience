object CECMethod_Form: TCECMethod_Form
  Left = 521
  Top = 183
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'CEC Method'
  ClientHeight = 521
  ClientWidth = 495
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
  object GroupBox1: TGroupBox
    Left = 1
    Top = 0
    Width = 246
    Height = 120
    Caption = 'Porosity (V/V)'
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
      TabOrder = 2
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
      TabOrder = 3
    end
    object Button1: TButton
      Left = 112
      Top = 24
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 248
    Top = 0
    Width = 246
    Height = 120
    Caption = 'Shaly-Sand Formation Resistivity Factor, F*'
    TabOrder = 1
    object Label3: TLabel
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
    object Label4: TLabel
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
    object RadioButton3: TRadioButton
      Left = 8
      Top = 58
      Width = 97
      Height = 17
      Caption = 'Constant value:'
      TabOrder = 2
      OnClick = RadioButton3Click
    end
    object RadioButton4: TRadioButton
      Left = 8
      Top = 28
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
      Top = 56
      Width = 121
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 3
    end
    object Button2: TButton
      Left = 112
      Top = 24
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 1
    Top = 120
    Width = 246
    Height = 120
    Caption = 'Cation Exchange Capacity, CEC (meq/100 g)'
    TabOrder = 2
    object Label5: TLabel
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
    object Label6: TLabel
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
    object RadioButton5: TRadioButton
      Left = 8
      Top = 58
      Width = 97
      Height = 17
      Caption = 'Constant value:'
      TabOrder = 2
      OnClick = RadioButton5Click
    end
    object RadioButton6: TRadioButton
      Left = 8
      Top = 28
      Width = 97
      Height = 17
      Caption = 'From logs:'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton6Click
    end
    object Edit3: TEdit
      Left = 112
      Top = 56
      Width = 121
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 3
    end
    object Button3: TButton
      Left = 112
      Top = 24
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 248
    Top = 120
    Width = 246
    Height = 120
    Caption = 'Formation Temperature ('#176'F)'
    TabOrder = 3
    object Label7: TLabel
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
    object Label8: TLabel
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
    object RadioButton7: TRadioButton
      Left = 8
      Top = 58
      Width = 97
      Height = 17
      Caption = 'Constant value:'
      TabOrder = 2
      OnClick = RadioButton7Click
    end
    object RadioButton8: TRadioButton
      Left = 8
      Top = 28
      Width = 97
      Height = 17
      Caption = 'From logs:'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton8Click
    end
    object Edit4: TEdit
      Left = 112
      Top = 56
      Width = 121
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 3
    end
    object Button4: TButton
      Left = 112
      Top = 24
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 1
      OnClick = Button4Click
    end
  end
  object GroupBox5: TGroupBox
    Left = 1
    Top = 240
    Width = 246
    Height = 120
    Caption = 'Rw (ohmm)'
    TabOrder = 4
    object Label9: TLabel
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
    object Label10: TLabel
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
    object RadioButton9: TRadioButton
      Left = 8
      Top = 58
      Width = 97
      Height = 17
      Caption = 'Constant value:'
      TabOrder = 2
      OnClick = RadioButton9Click
    end
    object RadioButton10: TRadioButton
      Left = 8
      Top = 28
      Width = 97
      Height = 17
      Caption = 'From logs:'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton10Click
    end
    object Edit5: TEdit
      Left = 112
      Top = 56
      Width = 121
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 3
    end
    object Button5: TButton
      Left = 112
      Top = 24
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 1
      OnClick = Button5Click
    end
  end
  object GroupBox6: TGroupBox
    Left = 248
    Top = 240
    Width = 246
    Height = 120
    Caption = 'Rt (ohmm)'
    TabOrder = 5
    object Label11: TLabel
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
    object Label12: TLabel
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
    object RadioButton11: TRadioButton
      Left = 8
      Top = 58
      Width = 97
      Height = 17
      Caption = 'Constant value:'
      TabOrder = 2
      OnClick = RadioButton11Click
    end
    object RadioButton12: TRadioButton
      Left = 8
      Top = 28
      Width = 97
      Height = 17
      Caption = 'From logs:'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton12Click
    end
    object Edit6: TEdit
      Left = 112
      Top = 56
      Width = 121
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 3
    end
    object Button6: TButton
      Left = 112
      Top = 24
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 1
      OnClick = Button6Click
    end
  end
  object GroupBox7: TGroupBox
    Left = 1
    Top = 360
    Width = 246
    Height = 120
    Caption = 'Matrix Density (g/cm3)'
    TabOrder = 6
    object Label13: TLabel
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
    object Label14: TLabel
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
    object RadioButton13: TRadioButton
      Left = 8
      Top = 58
      Width = 97
      Height = 17
      Caption = 'Constant value:'
      TabOrder = 2
      OnClick = RadioButton13Click
    end
    object RadioButton14: TRadioButton
      Left = 8
      Top = 28
      Width = 97
      Height = 17
      Caption = 'From logs:'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton14Click
    end
    object Edit7: TEdit
      Left = 112
      Top = 56
      Width = 121
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 3
    end
    object Button7: TButton
      Left = 112
      Top = 24
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 1
      OnClick = Button7Click
    end
  end
  object GroupBox8: TGroupBox
    Left = 248
    Top = 360
    Width = 246
    Height = 120
    Caption = 'Shaly-Sand Saturation Exponent, n*'
    Enabled = False
    TabOrder = 7
    Visible = False
    object Label15: TLabel
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
    object Label16: TLabel
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
    object RadioButton15: TRadioButton
      Left = 8
      Top = 58
      Width = 97
      Height = 17
      Caption = 'Constant value:'
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = RadioButton15Click
    end
    object RadioButton16: TRadioButton
      Left = 8
      Top = 28
      Width = 97
      Height = 17
      Caption = 'From logs:'
      TabOrder = 0
      OnClick = RadioButton16Click
    end
    object Edit8: TEdit
      Left = 112
      Top = 56
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '2'
    end
    object Button8: TButton
      Left = 112
      Top = 24
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 1
      OnClick = Button8Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 480
    Width = 495
    Height = 41
    Align = alBottom
    TabOrder = 8
    object Button9: TButton
      Left = 322
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      Default = True
      TabOrder = 0
      OnClick = Button9Click
    end
    object Button10: TButton
      Left = 405
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = Button10Click
    end
  end
end
