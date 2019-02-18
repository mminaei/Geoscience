object Litho_Dual_Form: TLitho_Dual_Form
  Left = 165
  Top = 410
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Lithology Interpretation - Dual Compositional Method'
  ClientHeight = 308
  ClientWidth = 379
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
    Top = 267
    Width = 379
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 210
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      Default = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 293
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 379
    Height = 161
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 0
      Top = 0
      Width = 177
      Height = 161
      Align = alLeft
      Caption = 'Select Lithologies'
      TabOrder = 0
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
        Top = 44
        Width = 73
        Height = 17
        Caption = 'Shale'
        TabOrder = 1
      end
      object CheckBox3: TCheckBox
        Left = 8
        Top = 65
        Width = 73
        Height = 17
        Caption = 'Limestone'
        TabOrder = 2
      end
      object CheckBox4: TCheckBox
        Left = 8
        Top = 86
        Width = 73
        Height = 17
        Caption = 'Water'
        TabOrder = 3
      end
      object CheckBox5: TCheckBox
        Left = 8
        Top = 107
        Width = 73
        Height = 17
        Caption = 'Oil'
        TabOrder = 4
      end
      object CheckBox6: TCheckBox
        Left = 8
        Top = 128
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
        Top = 44
        Width = 75
        Height = 17
        Caption = 'Properties'
        TabOrder = 7
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 86
        Top = 65
        Width = 75
        Height = 17
        Caption = 'Properties'
        TabOrder = 8
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 86
        Top = 86
        Width = 75
        Height = 17
        Caption = 'Properties'
        TabOrder = 9
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 86
        Top = 107
        Width = 75
        Height = 17
        Caption = 'Properties'
        TabOrder = 10
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 86
        Top = 128
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
      Width = 202
      Height = 161
      Align = alClient
      Caption = 'Select Tracks'
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 47
        Height = 13
        Caption = 'DT (us/ft)'
      end
      object Label2: TLabel
        Left = 8
        Top = 58
        Width = 68
        Height = 13
        Caption = 'RHOB (g/cm3)'
      end
      object Label3: TLabel
        Left = 8
        Top = 93
        Width = 57
        Height = 13
        Caption = 'Gamma Ray'
      end
      object Label6: TLabel
        Left = 8
        Top = 128
        Width = 18
        Height = 13
        Caption = 'PEF'
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
        Top = 54
        Width = 110
        Height = 21
        ItemHeight = 13
        TabOrder = 1
      end
      object ComboBox3: TComboBox
        Left = 80
        Top = 89
        Width = 110
        Height = 21
        ItemHeight = 13
        TabOrder = 2
      end
      object ComboBox4: TComboBox
        Left = 80
        Top = 124
        Width = 110
        Height = 21
        ItemHeight = 13
        TabOrder = 3
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 161
    Width = 379
    Height = 106
    Align = alClient
    Caption = 'Maximum Concentration of Lithologies in Matrix'
    TabOrder = 2
    object LabeledEdit1: TLabeledEdit
      Left = 64
      Top = 24
      Width = 65
      Height = 21
      EditLabel.Width = 51
      EditLabel.Height = 13
      EditLabel.Caption = 'Sandstone'
      LabelPosition = lpLeft
      TabOrder = 0
      Text = '1'
    end
    object LabeledEdit2: TLabeledEdit
      Left = 64
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 26
      EditLabel.Height = 13
      EditLabel.Caption = 'Shale'
      LabelPosition = lpLeft
      TabOrder = 1
      Text = '1'
    end
    object LabeledEdit3: TLabeledEdit
      Left = 64
      Top = 72
      Width = 65
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = 'Limestone'
      LabelPosition = lpLeft
      TabOrder = 2
      Text = '1'
    end
    object LabeledEdit4: TLabeledEdit
      Left = 224
      Top = 24
      Width = 65
      Height = 21
      EditLabel.Width = 41
      EditLabel.Height = 13
      EditLabel.Caption = 'Dolomite'
      LabelPosition = lpLeft
      TabOrder = 3
      Text = '1'
    end
    object LabeledEdit5: TLabeledEdit
      Left = 224
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 38
      EditLabel.Height = 13
      EditLabel.Caption = 'Gypsum'
      LabelPosition = lpLeft
      TabOrder = 4
      Text = '1'
    end
    object LabeledEdit6: TLabeledEdit
      Left = 224
      Top = 72
      Width = 65
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = 'Anhydrite'
      LabelPosition = lpLeft
      TabOrder = 5
      Text = '1'
    end
  end
end
