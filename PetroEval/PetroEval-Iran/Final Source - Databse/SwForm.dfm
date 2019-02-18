object Sw_Form: TSw_Form
  Left = 761
  Top = 68
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Water Saturation'
  ClientHeight = 452
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
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 411
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
    Height = 411
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Simandoux'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 246
        Height = 120
        Caption = 'Rw (Ohmm)'
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
      object GroupBox2: TGroupBox
        Left = 248
        Top = 0
        Width = 253
        Height = 120
        Caption = 'Rt (Ohmm)'
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
      object GroupBox3: TGroupBox
        Left = 0
        Top = 120
        Width = 246
        Height = 120
        Caption = 'Bulk Porosity (V/V)'
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
        object Button1: TButton
          Left = 112
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Select'
          TabOrder = 3
          OnClick = Button1Click
        end
      end
      object GroupBox4: TGroupBox
        Left = 248
        Top = 120
        Width = 253
        Height = 120
        Caption = 'Shale Volume (%)'
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
          TabOrder = 1
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
          TabOrder = 2
        end
        object Button2: TButton
          Left = 112
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Select'
          TabOrder = 3
          OnClick = Button2Click
        end
      end
      object GroupBox18: TGroupBox
        Left = 0
        Top = 240
        Width = 503
        Height = 105
        Caption = 'Equations'
        TabOrder = 4
        object LabeledEdit10: TLabeledEdit
          Left = 360
          Top = 52
          Width = 121
          Height = 21
          EditLabel.Width = 145
          EditLabel.Height = 13
          EditLabel.Caption = 'Shaly Beds Resistivity (Ohmm)'
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 0
        end
        object LabeledEdit11: TLabeledEdit
          Left = 136
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
        object LabeledEdit12: TLabeledEdit
          Left = 136
          Top = 76
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
        object ComboBox3: TComboBox
          Left = 8
          Top = 20
          Width = 105
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 3
          Text = 'General Form'
          OnChange = ComboBox3Change
          Items.Strings = (
            'General Form'
            'Average Sands'
            'Shaly Sands'
            'Carbonates'
            'Humble'
            'Modified Humble')
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Archie'
      ImageIndex = 1
      object GroupBox8: TGroupBox
        Left = 0
        Top = 120
        Width = 246
        Height = 120
        Caption = 'Formation Resistivity Factor'
        TabOrder = 0
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
          TabOrder = 1
          OnClick = RadioButton15Click
        end
        object RadioButton16: TRadioButton
          Left = 8
          Top = 28
          Width = 97
          Height = 17
          Caption = 'From logs:'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton16Click
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
      object GroupBox5: TGroupBox
        Left = 0
        Top = 0
        Width = 246
        Height = 120
        Caption = 'Rw (Ohmm)'
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
      object GroupBox6: TGroupBox
        Left = 248
        Top = 0
        Width = 253
        Height = 120
        Caption = 'Rt (Ohmm)'
        TabOrder = 2
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
      object GroupBox19: TGroupBox
        Left = 248
        Top = 120
        Width = 253
        Height = 120
        Caption = 'Saturation Exponent (n)'
        TabOrder = 3
        object Edit15: TEdit
          Left = 16
          Top = 24
          Width = 217
          Height = 21
          TabOrder = 0
          Text = '2'
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Shaly Sandstone'
      ImageIndex = 2
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 503
        Height = 383
        ActivePage = TabSheet5
        Align = alClient
        TabOrder = 0
        object TabSheet5: TTabSheet
          Caption = 'Laminar Shale'
          object GroupBox9: TGroupBox
            Left = 0
            Top = 239
            Width = 495
            Height = 116
            Align = alBottom
            Caption = 'Equations'
            TabOrder = 0
            object ComboBox1: TComboBox
              Left = 8
              Top = 22
              Width = 105
              Height = 21
              ItemHeight = 13
              ItemIndex = 0
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
              Left = 144
              Top = 54
              Width = 33
              Height = 21
              EditLabel.Width = 114
              EditLabel.Height = 13
              EditLabel.Caption = 'Constant Value (a)        '
              EditLabel.Transparent = True
              LabelPosition = lpLeft
              TabOrder = 1
              Text = '1'
            end
            object LabeledEdit1: TLabeledEdit
              Left = 144
              Top = 78
              Width = 33
              Height = 21
              EditLabel.Width = 114
              EditLabel.Height = 13
              EditLabel.Caption = 'Cementation Factor (m)'
              EditLabel.Transparent = True
              LabelPosition = lpLeft
              TabOrder = 2
              Text = '2'
            end
            object LabeledEdit3: TLabeledEdit
              Left = 360
              Top = 54
              Width = 33
              Height = 21
              EditLabel.Width = 116
              EditLabel.Height = 13
              EditLabel.Caption = 'Saturation Exponent (n)'
              EditLabel.Transparent = True
              LabelPosition = lpLeft
              TabOrder = 3
              Text = '2'
            end
            object LabeledEdit5: TLabeledEdit
              Left = 360
              Top = 78
              Width = 121
              Height = 21
              EditLabel.Width = 145
              EditLabel.Height = 13
              EditLabel.Caption = 'Shaly Beds Resistivity (Ohmm)'
              EditLabel.Transparent = True
              LabelPosition = lpLeft
              TabOrder = 4
            end
          end
          object GroupBox10: TGroupBox
            Left = 0
            Top = 0
            Width = 246
            Height = 120
            Caption = 'Rw (Ohmm)'
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
            object RadioButton13: TRadioButton
              Left = 8
              Top = 58
              Width = 97
              Height = 17
              Caption = 'Constant value:'
              TabOrder = 1
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
          object GroupBox11: TGroupBox
            Left = 248
            Top = 0
            Width = 246
            Height = 120
            Caption = 'Rt (Ohmm)'
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
            object RadioButton17: TRadioButton
              Left = 8
              Top = 58
              Width = 97
              Height = 17
              Caption = 'Constant value:'
              TabOrder = 1
              OnClick = RadioButton17Click
            end
            object RadioButton18: TRadioButton
              Left = 8
              Top = 28
              Width = 97
              Height = 17
              Caption = 'From logs:'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = RadioButton18Click
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
          object GroupBox12: TGroupBox
            Left = 0
            Top = 120
            Width = 246
            Height = 120
            Caption = 'Bulk Porosity (V/V)'
            TabOrder = 3
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
            object RadioButton19: TRadioButton
              Left = 8
              Top = 58
              Width = 97
              Height = 17
              Caption = 'Constant value:'
              TabOrder = 1
              OnClick = RadioButton19Click
            end
            object RadioButton20: TRadioButton
              Left = 8
              Top = 28
              Width = 97
              Height = 17
              Caption = 'From logs:'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = RadioButton20Click
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
          object GroupBox7: TGroupBox
            Left = 248
            Top = 120
            Width = 246
            Height = 120
            Caption = 'Shale Volume (%)'
            TabOrder = 4
            object Label27: TLabel
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
            object Label28: TLabel
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
            object RadioButton27: TRadioButton
              Left = 8
              Top = 58
              Width = 97
              Height = 17
              Caption = 'Constant value:'
              TabOrder = 1
              OnClick = RadioButton27Click
            end
            object RadioButton28: TRadioButton
              Left = 8
              Top = 28
              Width = 97
              Height = 17
              Caption = 'From logs:'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = RadioButton28Click
            end
            object Edit14: TEdit
              Left = 112
              Top = 56
              Width = 121
              Height = 21
              Color = clBtnFace
              Enabled = False
              TabOrder = 2
            end
            object Button16: TButton
              Left = 112
              Top = 24
              Width = 121
              Height = 25
              Caption = 'Select'
              TabOrder = 3
              OnClick = Button16Click
            end
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'Dispersed Shale'
          ImageIndex = 1
          object GroupBox16: TGroupBox
            Left = 591
            Top = 0
            Width = 199
            Height = 281
            Caption = 'Density Porosity'
            TabOrder = 0
            object ScrollBox7: TScrollBox
              Left = 2
              Top = 15
              Width = 195
              Height = 264
              HorzScrollBar.Visible = False
              VertScrollBar.Smooth = True
              VertScrollBar.Tracking = True
              Align = alClient
              Color = 16513514
              ParentColor = False
              TabOrder = 0
            end
          end
          object GroupBox17: TGroupBox
            Left = 0
            Top = 239
            Width = 495
            Height = 116
            Align = alBottom
            Caption = 'Equations'
            TabOrder = 1
            object ComboBox2: TComboBox
              Left = 8
              Top = 22
              Width = 105
              Height = 21
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 0
              Text = 'General Form'
              OnChange = ComboBox2Change
              Items.Strings = (
                'General Form'
                'Average Sands'
                'Shaly Sands'
                'Carbonates'
                'Humble'
                'Modified Humble')
            end
            object LabeledEdit6: TLabeledEdit
              Left = 144
              Top = 54
              Width = 33
              Height = 21
              EditLabel.Width = 114
              EditLabel.Height = 13
              EditLabel.Caption = 'Constant Value (a)        '
              EditLabel.Transparent = True
              LabelPosition = lpLeft
              TabOrder = 1
              Text = '1'
            end
            object LabeledEdit7: TLabeledEdit
              Left = 144
              Top = 78
              Width = 33
              Height = 21
              EditLabel.Width = 114
              EditLabel.Height = 13
              EditLabel.Caption = 'Cementation Factor (m)'
              EditLabel.Transparent = True
              LabelPosition = lpLeft
              TabOrder = 2
              Text = '2'
            end
            object LabeledEdit8: TLabeledEdit
              Left = 320
              Top = 54
              Width = 33
              Height = 21
              EditLabel.Width = 116
              EditLabel.Height = 13
              EditLabel.Caption = 'Saturation Exponent (n)'
              EditLabel.Transparent = True
              LabelPosition = lpLeft
              TabOrder = 3
              Text = '2'
            end
          end
          object GroupBox13: TGroupBox
            Left = 0
            Top = 0
            Width = 246
            Height = 120
            Caption = 'Rw (Ohmm)'
            TabOrder = 2
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
            object RadioButton21: TRadioButton
              Left = 8
              Top = 58
              Width = 97
              Height = 17
              Caption = 'Constant value:'
              TabOrder = 1
              OnClick = RadioButton21Click
            end
            object RadioButton22: TRadioButton
              Left = 8
              Top = 28
              Width = 97
              Height = 17
              Caption = 'From logs:'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = RadioButton22Click
            end
            object Edit11: TEdit
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
          object GroupBox14: TGroupBox
            Left = 248
            Top = 0
            Width = 246
            Height = 120
            Caption = 'Rt (Ohmm)'
            TabOrder = 3
            object Label23: TLabel
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
            object Label24: TLabel
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
            object RadioButton23: TRadioButton
              Left = 8
              Top = 58
              Width = 97
              Height = 17
              Caption = 'Constant value:'
              TabOrder = 1
              OnClick = RadioButton23Click
            end
            object RadioButton24: TRadioButton
              Left = 8
              Top = 28
              Width = 97
              Height = 17
              Caption = 'From logs:'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = RadioButton24Click
            end
            object Edit12: TEdit
              Left = 112
              Top = 56
              Width = 121
              Height = 21
              Color = clBtnFace
              Enabled = False
              TabOrder = 2
            end
            object Button14: TButton
              Left = 112
              Top = 24
              Width = 121
              Height = 25
              Caption = 'Select'
              TabOrder = 3
              OnClick = Button14Click
            end
          end
          object GroupBox15: TGroupBox
            Left = 0
            Top = 120
            Width = 246
            Height = 120
            Caption = 'Sonic Porosity (V/V)'
            TabOrder = 4
            object Label25: TLabel
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
            object Label26: TLabel
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
            object RadioButton25: TRadioButton
              Left = 8
              Top = 58
              Width = 97
              Height = 17
              Caption = 'Constant value:'
              TabOrder = 1
              OnClick = RadioButton25Click
            end
            object RadioButton26: TRadioButton
              Left = 8
              Top = 28
              Width = 97
              Height = 17
              Caption = 'From logs:'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = RadioButton26Click
            end
            object Edit13: TEdit
              Left = 112
              Top = 56
              Width = 121
              Height = 21
              Color = clBtnFace
              Enabled = False
              TabOrder = 2
            end
            object Button15: TButton
              Left = 112
              Top = 24
              Width = 121
              Height = 25
              Caption = 'Select'
              TabOrder = 3
              OnClick = Button15Click
            end
          end
          object GroupBox20: TGroupBox
            Left = 248
            Top = 120
            Width = 246
            Height = 120
            Caption = 'Density Porosity (V/V)'
            TabOrder = 5
            object Label29: TLabel
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
            object Label30: TLabel
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
            object RadioButton29: TRadioButton
              Left = 8
              Top = 58
              Width = 97
              Height = 17
              Caption = 'Constant value:'
              TabOrder = 1
              OnClick = RadioButton29Click
            end
            object RadioButton30: TRadioButton
              Left = 8
              Top = 28
              Width = 97
              Height = 17
              Caption = 'From logs:'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = RadioButton30Click
            end
            object Edit16: TEdit
              Left = 112
              Top = 56
              Width = 121
              Height = 21
              Color = clBtnFace
              Enabled = False
              TabOrder = 2
            end
            object Button17: TButton
              Left = 112
              Top = 24
              Width = 121
              Height = 25
              Caption = 'Select'
              TabOrder = 3
              OnClick = Button17Click
            end
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Indonesia'
      ImageIndex = 3
      object GroupBox21: TGroupBox
        Left = 0
        Top = 0
        Width = 246
        Height = 120
        Caption = 'Rw (Ohmm)'
        TabOrder = 0
        object Label31: TLabel
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
        object Label32: TLabel
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
        object RadioButton31: TRadioButton
          Left = 8
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Constant value:'
          TabOrder = 1
          OnClick = RadioButton31Click
        end
        object RadioButton32: TRadioButton
          Left = 8
          Top = 28
          Width = 97
          Height = 17
          Caption = 'From logs:'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton32Click
        end
        object Edit17: TEdit
          Left = 112
          Top = 56
          Width = 121
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
        end
        object Button18: TButton
          Left = 112
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Select'
          TabOrder = 3
          OnClick = Button18Click
        end
      end
      object GroupBox22: TGroupBox
        Left = 248
        Top = 0
        Width = 253
        Height = 120
        Caption = 'Rt (Ohmm)'
        TabOrder = 1
        object Label33: TLabel
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
        object Label34: TLabel
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
        object RadioButton33: TRadioButton
          Left = 8
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Constant value:'
          TabOrder = 1
          OnClick = RadioButton33Click
        end
        object RadioButton34: TRadioButton
          Left = 8
          Top = 28
          Width = 97
          Height = 17
          Caption = 'From logs:'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton34Click
        end
        object Edit18: TEdit
          Left = 112
          Top = 56
          Width = 121
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
        end
        object Button19: TButton
          Left = 112
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Select'
          TabOrder = 3
          OnClick = Button19Click
        end
      end
      object GroupBox23: TGroupBox
        Left = 248
        Top = 120
        Width = 253
        Height = 120
        Caption = 'Shale Volume (%)'
        TabOrder = 2
        object Label35: TLabel
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
        object Label36: TLabel
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
        object RadioButton35: TRadioButton
          Left = 8
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Constant value:'
          TabOrder = 1
          OnClick = RadioButton35Click
        end
        object RadioButton36: TRadioButton
          Left = 8
          Top = 28
          Width = 97
          Height = 17
          Caption = 'From logs:'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton36Click
        end
        object Edit19: TEdit
          Left = 112
          Top = 56
          Width = 121
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
        end
        object Button20: TButton
          Left = 112
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Select'
          TabOrder = 3
          OnClick = Button20Click
        end
      end
      object GroupBox24: TGroupBox
        Left = 0
        Top = 120
        Width = 246
        Height = 120
        Caption = 'Porosity (V/V)'
        TabOrder = 3
        object Label37: TLabel
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
        object Label38: TLabel
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
        object RadioButton37: TRadioButton
          Left = 8
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Constant value:'
          TabOrder = 1
          OnClick = RadioButton37Click
        end
        object RadioButton38: TRadioButton
          Left = 8
          Top = 28
          Width = 97
          Height = 17
          Caption = 'From logs:'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton38Click
        end
        object Edit20: TEdit
          Left = 112
          Top = 56
          Width = 121
          Height = 21
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
        end
        object Button21: TButton
          Left = 112
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Select'
          TabOrder = 3
          OnClick = Button21Click
        end
      end
      object GroupBox25: TGroupBox
        Left = 0
        Top = 240
        Width = 503
        Height = 105
        Caption = 'Equations'
        TabOrder = 4
        object LabeledEdit4: TLabeledEdit
          Left = 360
          Top = 76
          Width = 121
          Height = 21
          EditLabel.Width = 145
          EditLabel.Height = 13
          EditLabel.Caption = 'Shaly Beds Resistivity (Ohmm)'
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 0
        end
        object LabeledEdit9: TLabeledEdit
          Left = 136
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
        object LabeledEdit13: TLabeledEdit
          Left = 136
          Top = 76
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
        object ComboBox4: TComboBox
          Left = 8
          Top = 20
          Width = 105
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 3
          Text = 'General Form'
          OnChange = ComboBox4Change
          Items.Strings = (
            'General Form'
            'Average Sands'
            'Shaly Sands'
            'Carbonates'
            'Humble'
            'Modified Humble')
        end
        object LabeledEdit14: TLabeledEdit
          Left = 360
          Top = 54
          Width = 33
          Height = 21
          EditLabel.Width = 116
          EditLabel.Height = 13
          EditLabel.Caption = 'Saturation Exponent (n)'
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 4
          Text = '2'
        end
      end
    end
  end
end
