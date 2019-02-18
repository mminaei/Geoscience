object Kv_Form: TKv_Form
  Left = 760
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Vertical Permeability Estimation'
  ClientHeight = 389
  ClientWidth = 512
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
    Top = 348
    Width = 512
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button2: TButton
      Left = 343
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      Default = True
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 423
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 512
    Height = 348
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Clean Sandstone'
      object RadioGroup1: TRadioGroup
        Left = 0
        Top = 0
        Width = 504
        Height = 75
        Align = alTop
        Caption = 'Calculation Method'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Mean Hydraulic Radius'
          'Mean Grain Diameter')
        TabOrder = 0
        OnClick = RadioGroup1Click
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 195
        Width = 504
        Height = 75
        Caption = 'Mean Grain Diameter (cm)'
        TabOrder = 1
        object LabeledEdit1: TEdit
          Left = 8
          Top = 28
          Width = 121
          Height = 21
          TabOrder = 0
        end
      end
      object GroupBox8: TGroupBox
        Left = 258
        Top = 75
        Width = 246
        Height = 120
        Caption = 'Horizontal Permeability (md)'
        TabOrder = 2
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
      object GroupBox9: TGroupBox
        Left = 0
        Top = 75
        Width = 246
        Height = 120
        Caption = 'Effective Porosity (V/V)'
        TabOrder = 3
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
    end
    object TabSheet2: TTabSheet
      Caption = 'Shaly Sandstone'
      ImageIndex = 1
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 504
        Height = 320
        ActivePage = TabSheet3
        Align = alClient
        TabOrder = 0
        object TabSheet3: TTabSheet
          Caption = 'TAGI'
          object RadioGroup2: TRadioGroup
            Left = 0
            Top = 0
            Width = 246
            Height = 120
            Caption = 'Clay Content'
            ItemIndex = 0
            Items.Strings = (
              'High Illite Content'
              'Equal Kaolinite-Illite Content')
            TabOrder = 0
            OnClick = RadioGroup1Click
          end
          object GroupBox1: TGroupBox
            Left = 248
            Top = 0
            Width = 246
            Height = 120
            Caption = 'Horizontal Permeability (md)'
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
            object Label7: TLabel
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
        object TabSheet4: TTabSheet
          Caption = 'Peffer et al.'
          ImageIndex = 1
          object RadioGroup3: TRadioGroup
            Left = 0
            Top = 0
            Width = 246
            Height = 65
            Caption = 'Calculation Method'
            ItemIndex = 0
            Items.Strings = (
              'Mean Hydraulic Radius'
              'Mean Grain Diameter'
              'Shale Volume')
            TabOrder = 0
            OnClick = RadioGroup3Click
          end
          object RadioGroup4: TRadioGroup
            Left = 0
            Top = 66
            Width = 246
            Height = 54
            Caption = 'Clay Content'
            Enabled = False
            ItemIndex = 0
            Items.Strings = (
              'High Illite Content'
              'Equal Kaolinite-Illite Content')
            TabOrder = 1
          end
          object GroupBox6: TGroupBox
            Left = 0
            Top = 242
            Width = 496
            Height = 50
            Align = alBottom
            Caption = 'Mean Grain Diameter (cm)'
            TabOrder = 2
            object LabeledEdit2: TEdit
              Left = 8
              Top = 20
              Width = 121
              Height = 21
              TabOrder = 0
            end
          end
          object GroupBox3: TGroupBox
            Left = 0
            Top = 120
            Width = 246
            Height = 120
            Caption = 'Horizontal Permeability (md)'
            TabOrder = 3
            object Label8: TLabel
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
            object Label9: TLabel
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
          object GroupBox4: TGroupBox
            Left = 248
            Top = 0
            Width = 246
            Height = 120
            Caption = 'Effective Porosity (V/V)'
            TabOrder = 4
            object Label10: TLabel
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
            object Label11: TLabel
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
          object GroupBox5: TGroupBox
            Left = 248
            Top = 120
            Width = 246
            Height = 120
            Caption = 'Shale Volume (%)'
            Enabled = False
            TabOrder = 5
            object Label12: TLabel
              Left = 8
              Top = 88
              Width = 68
              Height = 13
              Caption = 'Selected Log: '
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label13: TLabel
              Left = 112
              Top = 88
              Width = 28
              Height = 13
              Caption = 'NONE'
              Enabled = False
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
              Enabled = False
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
              Enabled = False
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
              Enabled = False
              TabOrder = 3
              OnClick = Button8Click
            end
          end
        end
      end
    end
  end
end
