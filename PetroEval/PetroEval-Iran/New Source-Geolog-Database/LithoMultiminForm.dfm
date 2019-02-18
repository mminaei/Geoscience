object Lithology_Multimin_Form: TLithology_Multimin_Form
  Left = 219
  Top = 357
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Lithology Identification'
  ClientHeight = 220
  ClientWidth = 374
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
    Top = 179
    Width = 374
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 202
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      Default = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 285
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
    Top = 0
    Width = 177
    Height = 179
    Align = alLeft
    Caption = 'Select Lithologies'
    TabOrder = 1
    object CheckBox1: TCheckBox
      Left = 8
      Top = 24
      Width = 73
      Height = 17
      Caption = 'Sandstone'
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 49
      Width = 73
      Height = 17
      Caption = 'Shale'
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 75
      Width = 73
      Height = 17
      Caption = 'Limestone'
      TabOrder = 2
    end
    object CheckBox4: TCheckBox
      Left = 8
      Top = 100
      Width = 73
      Height = 17
      Caption = 'Water'
      TabOrder = 3
    end
    object CheckBox5: TCheckBox
      Left = 8
      Top = 126
      Width = 73
      Height = 17
      Caption = 'Oil'
      TabOrder = 4
    end
    object CheckBox6: TCheckBox
      Left = 8
      Top = 152
      Width = 73
      Height = 17
      Caption = 'Anhydrite'
      TabOrder = 5
      Visible = False
    end
    object Button3: TButton
      Left = 86
      Top = 24
      Width = 75
      Height = 17
      Caption = 'Properties'
      TabOrder = 6
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 86
      Top = 49
      Width = 75
      Height = 17
      Caption = 'Properties'
      TabOrder = 7
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 86
      Top = 75
      Width = 75
      Height = 17
      Caption = 'Properties'
      TabOrder = 8
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 86
      Top = 100
      Width = 75
      Height = 17
      Caption = 'Properties'
      TabOrder = 9
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 86
      Top = 126
      Width = 75
      Height = 17
      Caption = 'Properties'
      TabOrder = 10
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 86
      Top = 152
      Width = 75
      Height = 17
      Caption = 'Properties'
      TabOrder = 11
      Visible = False
      OnClick = Button8Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 177
    Top = 0
    Width = 197
    Height = 179
    Align = alClient
    Caption = 'Select Tracks'
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 47
      Height = 13
      Caption = 'DT (us/ft)'
    end
    object Label2: TLabel
      Left = 8
      Top = 49
      Width = 68
      Height = 13
      Caption = 'RHOB (g/cm3)'
    end
    object Label3: TLabel
      Left = 8
      Top = 75
      Width = 57
      Height = 13
      Caption = 'Gamma Ray'
    end
    object Label4: TLabel
      Left = 8
      Top = 100
      Width = 18
      Height = 13
      Caption = 'PEF'
    end
    object Label5: TLabel
      Left = 8
      Top = 126
      Width = 49
      Height = 13
      Caption = 'Resistivity'
    end
    object Label6: TLabel
      Left = 8
      Top = 152
      Width = 24
      Height = 13
      Caption = 'NPHI'
    end
    object ComboBox1: TComboBox
      Left = 80
      Top = 20
      Width = 110
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object ComboBox2: TComboBox
      Left = 80
      Top = 45
      Width = 110
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
    object ComboBox3: TComboBox
      Left = 80
      Top = 71
      Width = 110
      Height = 21
      ItemHeight = 13
      TabOrder = 2
    end
    object ComboBox4: TComboBox
      Left = 80
      Top = 96
      Width = 110
      Height = 21
      ItemHeight = 13
      TabOrder = 3
    end
    object ComboBox5: TComboBox
      Left = 79
      Top = 122
      Width = 110
      Height = 21
      ItemHeight = 13
      TabOrder = 4
    end
    object ComboBox6: TComboBox
      Left = 79
      Top = 148
      Width = 110
      Height = 21
      ItemHeight = 13
      TabOrder = 5
    end
  end
end
