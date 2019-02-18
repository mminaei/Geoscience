object Kh_Form: TKh_Form
  Left = 750
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Horizontal Permeability Estimation'
  ClientHeight = 311
  ClientWidth = 504
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 504
    Height = 270
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Kozeny'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 246
        Height = 120
        Caption = 'Calculate permeability by:'
        TabOrder = 0
        object Label5: TLabel
          Left = 24
          Top = 64
          Width = 26
          Height = 13
          Caption = '(Svp)'
        end
        object Label6: TLabel
          Left = 24
          Top = 96
          Width = 30
          Height = 13
          Caption = '(Svgr)'
        end
        object RadioButton1: TRadioButton
          Left = 8
          Top = 16
          Width = 113
          Height = 17
          Caption = 'Grain radius'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton1Click
        end
        object RadioButton2: TRadioButton
          Left = 8
          Top = 48
          Width = 228
          Height = 17
          Caption = 'Specific surface area per unit pore volume'
          TabOrder = 1
          OnClick = RadioButton2Click
        end
        object RadioButton3: TRadioButton
          Left = 8
          Top = 80
          Width = 228
          Height = 17
          Caption = 'Specific surface area per unit grain volume'
          TabOrder = 2
          OnClick = RadioButton3Click
        end
      end
      object GroupBox2: TGroupBox
        Left = 248
        Top = 0
        Width = 246
        Height = 120
        Caption = 'Properties'
        TabOrder = 1
        object LabeledEdit1: TLabeledEdit
          Left = 8
          Top = 36
          Width = 225
          Height = 21
          EditLabel.Width = 84
          EditLabel.Height = 13
          EditLabel.Caption = 'Grain Radius (cm)'
          TabOrder = 0
        end
        object LabeledEdit3: TLabeledEdit
          Left = 8
          Top = 84
          Width = 225
          Height = 21
          EditLabel.Width = 89
          EditLabel.Height = 13
          EditLabel.Caption = 'Pore Shape Factor'
          TabOrder = 1
          Text = '2.5'
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 121
        Width = 246
        Height = 120
        Caption = 'Porosity'
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
        object RadioButton4: TRadioButton
          Left = 8
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Constant value:'
          TabOrder = 1
          OnClick = RadioButton4Click
        end
        object RadioButton5: TRadioButton
          Left = 8
          Top = 28
          Width = 97
          Height = 17
          Caption = 'From logs:'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton5Click
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
        object Button4: TButton
          Left = 112
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Select'
          TabOrder = 3
          OnClick = Button4Click
        end
      end
      object GroupBox13: TGroupBox
        Left = 248
        Top = 121
        Width = 246
        Height = 120
        Caption = 'Tortuosity (Tau)'
        TabOrder = 3
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
        object RadioButton6: TRadioButton
          Left = 8
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Constant value:'
          TabOrder = 1
          OnClick = RadioButton6Click
        end
        object RadioButton7: TRadioButton
          Left = 8
          Top = 28
          Width = 97
          Height = 17
          Caption = 'From logs:'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton7Click
        end
        object Edit2: TEdit
          Left = 112
          Top = 56
          Width = 121
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
        end
        object Button5: TButton
          Left = 112
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Select'
          TabOrder = 3
          OnClick = Button5Click
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Kozeny-Carman'
      ImageIndex = 1
      object GroupBox8: TGroupBox
        Left = 0
        Top = 120
        Width = 494
        Height = 57
        Caption = 'J1 Value'
        TabOrder = 0
        object Button1: TButton
          Left = 275
          Top = 18
          Width = 75
          Height = 25
          Caption = 'Calculate'
          TabOrder = 0
          Visible = False
          OnClick = Button1Click
        end
        object CheckBox1: TCheckBox
          Left = 152
          Top = 22
          Width = 121
          Height = 17
          Caption = 'Calculate from logs'
          TabOrder = 1
          OnClick = CheckBox1Click
        end
        object LabeledEdit4: TEdit
          Left = 8
          Top = 20
          Width = 121
          Height = 21
          TabOrder = 2
        end
      end
      object GroupBox6: TGroupBox
        Left = 0
        Top = 0
        Width = 246
        Height = 120
        Caption = 'Effective Porosity'
        TabOrder = 1
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
        object RadioButton16: TRadioButton
          Left = 8
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Constant value:'
          TabOrder = 1
          OnClick = RadioButton16Click
        end
        object RadioButton17: TRadioButton
          Left = 8
          Top = 28
          Width = 97
          Height = 17
          Caption = 'From logs:'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton17Click
        end
        object Edit7: TEdit
          Left = 112
          Top = 56
          Width = 121
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
        end
        object Button10: TButton
          Left = 112
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Select'
          TabOrder = 3
          OnClick = Button10Click
        end
      end
      object GroupBox7: TGroupBox
        Left = 248
        Top = 0
        Width = 246
        Height = 120
        Caption = 'Specific surface area per unit grain volume(Svgr)'
        TabOrder = 2
        object Label17: TLabel
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
        object Label18: TLabel
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
        object RadioButton18: TRadioButton
          Left = 8
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Constant value:'
          TabOrder = 1
          OnClick = RadioButton18Click
        end
        object RadioButton19: TRadioButton
          Left = 8
          Top = 28
          Width = 97
          Height = 17
          Caption = 'From logs:'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton19Click
        end
        object Edit8: TEdit
          Left = 112
          Top = 56
          Width = 121
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
        end
        object Button11: TButton
          Left = 112
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Select'
          TabOrder = 3
          OnClick = Button11Click
        end
      end
      object GroupBox11: TGroupBox
        Left = 0
        Top = 177
        Width = 246
        Height = 120
        Caption = 'J-Function'
        TabOrder = 3
        Visible = False
        object Label19: TLabel
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
        object Label20: TLabel
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
        object RadioButton20: TRadioButton
          Left = 8
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Constant value:'
          TabOrder = 1
          OnClick = RadioButton20Click
        end
        object RadioButton21: TRadioButton
          Left = 8
          Top = 28
          Width = 97
          Height = 17
          Caption = 'From logs:'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton21Click
        end
        object Edit9: TEdit
          Left = 112
          Top = 56
          Width = 121
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
        end
        object Button12: TButton
          Left = 112
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Select'
          TabOrder = 3
          OnClick = Button12Click
        end
      end
      object GroupBox12: TGroupBox
        Left = 248
        Top = 177
        Width = 246
        Height = 120
        Caption = 'Water Saturation'
        TabOrder = 4
        Visible = False
        object Label21: TLabel
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
        object Label22: TLabel
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
        object RadioButton22: TRadioButton
          Left = 8
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Constant value:'
          TabOrder = 1
          OnClick = RadioButton22Click
        end
        object RadioButton23: TRadioButton
          Left = 8
          Top = 28
          Width = 97
          Height = 17
          Caption = 'From logs:'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton23Click
        end
        object Edit10: TEdit
          Left = 112
          Top = 56
          Width = 121
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
        end
        object Button13: TButton
          Left = 112
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Select'
          TabOrder = 3
          OnClick = Button13Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Schlumberger-Doll Research'
      ImageIndex = 2
      object GroupBox14: TGroupBox
        Left = 0
        Top = 0
        Width = 246
        Height = 120
        Caption = 'NMR Porosity'
        TabOrder = 0
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
        object RadioButton8: TRadioButton
          Left = 8
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Constant value:'
          TabOrder = 1
          OnClick = RadioButton8Click
        end
        object RadioButton9: TRadioButton
          Left = 8
          Top = 28
          Width = 97
          Height = 17
          Caption = 'From logs:'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton9Click
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
        object Button6: TButton
          Left = 112
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Select'
          TabOrder = 3
          OnClick = Button6Click
        end
      end
      object GroupBox15: TGroupBox
        Left = 248
        Top = 0
        Width = 246
        Height = 120
        Caption = 'Log Mean Relaxation Time (msec)'
        TabOrder = 1
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
        object RadioButton10: TRadioButton
          Left = 8
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Constant value:'
          TabOrder = 1
          OnClick = RadioButton10Click
        end
        object RadioButton11: TRadioButton
          Left = 8
          Top = 28
          Width = 97
          Height = 17
          Caption = 'From logs:'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton11Click
        end
        object Edit4: TEdit
          Left = 112
          Top = 56
          Width = 121
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
        end
        object Button7: TButton
          Left = 112
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Select'
          TabOrder = 3
          OnClick = Button7Click
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Coates-Denoo'
      ImageIndex = 3
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 246
        Height = 120
        Caption = 'Porosity'
        TabOrder = 0
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
        object RadioButton12: TRadioButton
          Left = 8
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Constant value:'
          TabOrder = 1
          OnClick = RadioButton12Click
        end
        object RadioButton13: TRadioButton
          Left = 8
          Top = 28
          Width = 97
          Height = 17
          Caption = 'From logs:'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton13Click
        end
        object Edit5: TEdit
          Left = 112
          Top = 56
          Width = 121
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
        end
        object Button8: TButton
          Left = 112
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Select'
          TabOrder = 3
          OnClick = Button8Click
        end
      end
      object GroupBox5: TGroupBox
        Left = 248
        Top = 0
        Width = 246
        Height = 120
        Caption = 'Irreducible Water Saturation (%)'
        TabOrder = 1
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
        object RadioButton14: TRadioButton
          Left = 8
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Constant value:'
          TabOrder = 1
          OnClick = RadioButton14Click
        end
        object RadioButton15: TRadioButton
          Left = 8
          Top = 28
          Width = 97
          Height = 17
          Caption = 'From logs:'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton15Click
        end
        object Edit6: TEdit
          Left = 112
          Top = 56
          Width = 121
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
        end
        object Button9: TButton
          Left = 112
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Select'
          TabOrder = 3
          OnClick = Button9Click
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 270
    Width = 504
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button2: TButton
      Left = 335
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      Default = True
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 415
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
end
