object FR_Form: TFR_Form
  Left = 1018
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Formation Resistivity Factor'
  ClientHeight = 309
  ClientWidth = 254
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
  object Panel1: TPanel
    Left = 0
    Top = 268
    Width = 254
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 90
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      Default = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 173
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 254
    Height = 268
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Porosity'
      object GroupBox2: TGroupBox
        Left = 0
        Top = 120
        Width = 246
        Height = 120
        Align = alClient
        Caption = 'Equations'
        TabOrder = 0
        object ComboBox1: TComboBox
          Left = 8
          Top = 20
          Width = 105
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Text = 'General Form'
          OnChange = ComboBox1Change
          Items.Strings = (
            'General Form'
            'Average Sands'
            'Shaly Sands'
            'Carbonates'
            'Humble'
            'Modified Humble')
        end
        object LabeledEdit2: TLabeledEdit
          Left = 128
          Top = 52
          Width = 33
          Height = 21
          EditLabel.Width = 114
          EditLabel.Height = 13
          EditLabel.Caption = 'Cementation Factor (m)'
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 1
          Text = '2'
        end
        object LabeledEdit1: TLabeledEdit
          Left = 128
          Top = 84
          Width = 33
          Height = 21
          EditLabel.Width = 114
          EditLabel.Height = 13
          EditLabel.Caption = 'Constant Value (a)        '
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 2
          Text = '1'
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 246
        Height = 120
        Align = alTop
        Caption = 'Porosity (V/V)'
        TabOrder = 1
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
          TabOrder = 1
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
      Caption = 'Resistivity'
      ImageIndex = 1
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 246
        Height = 120
        Align = alTop
        Caption = 'Ro (Ohmm)'
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
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 120
        Width = 246
        Height = 120
        Align = alClient
        Caption = 'Rw (Ohmm)'
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
    end
  end
end
