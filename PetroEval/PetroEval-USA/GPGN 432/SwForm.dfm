object Sw_Form: TSw_Form
  Left = 592
  Top = 198
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Water Saturation'
  ClientHeight = 311
  ClientWidth = 511
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
    Top = 270
    Width = 511
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button5: TButton
      Left = 338
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      Default = True
      TabOrder = 0
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 421
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = Button6Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 511
    Height = 270
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    object TabSheet2: TTabSheet
      Caption = 'Archie'
      ImageIndex = 1
      object GroupBox8: TGroupBox
        Left = 0
        Top = 120
        Width = 246
        Height = 120
        Caption = 'Porosity'
        TabOrder = 0
        object Edit3: TEdit
          Left = 112
          Top = 56
          Width = 121
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 0
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
          TabOrder = 2
          TabStop = True
          OnClick = RadioButton2Click
        end
        object ComboBox1: TComboBox
          Left = 112
          Top = 24
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 3
          OnChange = ComboBox1Change
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 0
        Width = 246
        Height = 120
        Caption = 'Rw (Ohmm)'
        TabOrder = 1
        object RadioButton9: TRadioButton
          Left = 8
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Constant value:'
          TabOrder = 1
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
          TabOrder = 2
        end
        object ComboBox5: TComboBox
          Left = 112
          Top = 24
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 3
          OnChange = ComboBox5Change
        end
      end
      object GroupBox6: TGroupBox
        Left = 248
        Top = 0
        Width = 253
        Height = 120
        Caption = 'Rt (Ohmm)'
        TabOrder = 2
        object RadioButton11: TRadioButton
          Left = 8
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Constant value:'
          TabOrder = 1
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
          TabOrder = 2
        end
        object ComboBox6: TComboBox
          Left = 112
          Top = 24
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 3
          OnChange = ComboBox6Change
        end
      end
      object GroupBox19: TGroupBox
        Left = 248
        Top = 120
        Width = 253
        Height = 120
        Caption = 'Exponents'
        TabOrder = 3
        object Label1: TLabel
          Left = 16
          Top = 36
          Width = 61
          Height = 13
          Caption = 'Constant (a)'
        end
        object Label2: TLabel
          Left = 16
          Top = 60
          Width = 124
          Height = 13
          Caption = 'Compaction Exponent (m)'
        end
        object Label3: TLabel
          Left = 16
          Top = 84
          Width = 116
          Height = 13
          Caption = 'Saturation Exponent (n)'
        end
        object Edit2: TEdit
          Left = 152
          Top = 32
          Width = 73
          Height = 21
          TabOrder = 0
          Text = '1'
        end
        object Edit1: TEdit
          Left = 152
          Top = 56
          Width = 73
          Height = 21
          TabOrder = 1
          Text = '2'
        end
        object Edit15: TEdit
          Left = 152
          Top = 80
          Width = 73
          Height = 21
          TabOrder = 2
          Text = '2'
        end
      end
    end
  end
end
