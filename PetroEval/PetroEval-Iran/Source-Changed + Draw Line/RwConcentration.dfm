object Rw_Concentration: TRw_Concentration
  Left = 825
  Top = 16
  BorderStyle = bsDialog
  Caption = 'Water Resistivity'
  ClientHeight = 326
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ScreenSnap = True
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 371
    Height = 121
    Align = alTop
    Caption = 'Concentration Values (ppm)'
    TabOrder = 0
    object LabeledEdit1: TLabeledEdit
      Left = 8
      Top = 40
      Width = 65
      Height = 21
      EditLabel.Width = 13
      EditLabel.Height = 13
      EditLabel.Caption = 'Na'
      EditLabel.Transparent = True
      TabOrder = 0
      Text = '0'
    end
    object LabeledEdit2: TLabeledEdit
      Left = 80
      Top = 40
      Width = 65
      Height = 21
      EditLabel.Width = 9
      EditLabel.Height = 13
      EditLabel.Caption = 'Cl'
      EditLabel.Transparent = True
      TabOrder = 1
      Text = '0'
    end
    object LabeledEdit3: TLabeledEdit
      Left = 152
      Top = 40
      Width = 65
      Height = 21
      EditLabel.Width = 10
      EditLabel.Height = 13
      EditLabel.Caption = 'Br'
      EditLabel.Transparent = True
      TabOrder = 2
      Text = '0'
    end
    object LabeledEdit4: TLabeledEdit
      Left = 224
      Top = 40
      Width = 65
      Height = 21
      EditLabel.Width = 21
      EditLabel.Height = 13
      EditLabel.Caption = 'NO3'
      EditLabel.Transparent = True
      TabOrder = 3
      Text = '0'
    end
    object LabeledEdit5: TLabeledEdit
      Left = 296
      Top = 40
      Width = 65
      Height = 21
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'HCO3'
      EditLabel.Transparent = True
      TabOrder = 4
      Text = '0'
    end
    object LabeledEdit6: TLabeledEdit
      Left = 80
      Top = 88
      Width = 65
      Height = 21
      EditLabel.Width = 6
      EditLabel.Height = 13
      EditLabel.Caption = 'K'
      EditLabel.Transparent = True
      TabOrder = 5
      Text = '0'
    end
    object LabeledEdit7: TLabeledEdit
      Left = 8
      Top = 88
      Width = 65
      Height = 21
      EditLabel.Width = 20
      EditLabel.Height = 13
      EditLabel.Caption = 'SO4'
      EditLabel.Transparent = True
      TabOrder = 6
      Text = '0'
    end
    object LabeledEdit8: TLabeledEdit
      Left = 152
      Top = 88
      Width = 65
      Height = 21
      EditLabel.Width = 21
      EditLabel.Height = 13
      EditLabel.Caption = 'CO3'
      EditLabel.Transparent = True
      TabOrder = 7
      Text = '0'
    end
    object LabeledEdit9: TLabeledEdit
      Left = 224
      Top = 88
      Width = 65
      Height = 21
      EditLabel.Width = 13
      EditLabel.Height = 13
      EditLabel.Caption = 'Ca'
      EditLabel.Transparent = True
      TabOrder = 8
      Text = '0'
    end
    object LabeledEdit10: TLabeledEdit
      Left = 296
      Top = 88
      Width = 65
      Height = 21
      EditLabel.Width = 14
      EditLabel.Height = 13
      EditLabel.Caption = 'Mg'
      EditLabel.Transparent = True
      TabOrder = 9
      Text = '0'
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 172
    Width = 371
    Height = 113
    Align = alBottom
    Caption = 'Results'
    TabOrder = 1
    object LabeledEdit12: TLabeledEdit
      Left = 8
      Top = 36
      Width = 145
      Height = 21
      EditLabel.Width = 146
      EditLabel.Height = 13
      EditLabel.Caption = 'Equivalent NaCl Concentration'
      ReadOnly = True
      TabOrder = 0
    end
    object LabeledEdit13: TLabeledEdit
      Left = 216
      Top = 36
      Width = 145
      Height = 21
      EditLabel.Width = 121
      EditLabel.Height = 13
      EditLabel.Caption = 'Water Resistivity @ 75'#176'F'
      ReadOnly = True
      TabOrder = 1
    end
    object LabeledEdit14: TLabeledEdit
      Left = 216
      Top = 80
      Width = 145
      Height = 21
      EditLabel.Width = 103
      EditLabel.Height = 13
      EditLabel.Caption = 'Water Resistivity @ ?'
      ReadOnly = True
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 285
    Width = 371
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Button2: TButton
      Left = 286
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 0
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 371
    Height = 51
    Align = alClient
    TabOrder = 3
    object LabeledEdit11: TLabeledEdit
      Left = 8
      Top = 23
      Width = 137
      Height = 21
      EditLabel.Width = 133
      EditLabel.Height = 13
      EditLabel.Caption = 'Reservoir Temperature ('#176'F)'
      TabOrder = 0
      Text = '150'
    end
    object Button1: TButton
      Left = 232
      Top = 19
      Width = 129
      Height = 25
      Caption = 'Calculate'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
