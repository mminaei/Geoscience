object Cross_Plot_Tracks: TCross_Plot_Tracks
  Left = 295
  Top = 227
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cross Plot Tracks Selection'
  ClientHeight = 255
  ClientWidth = 183
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
  object GroupBox4: TGroupBox
    Left = 0
    Top = 160
    Width = 183
    Height = 80
    Caption = 'Z-Axis Log'
    TabOrder = 4
    Visible = False
    object Label5: TLabel
      Left = 8
      Top = 56
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
      Left = 80
      Top = 56
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
    object Button5: TButton
      Left = 32
      Top = 24
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 0
      OnClick = Button5Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 214
    Width = 183
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 18
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      Default = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 99
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 160
    Width = 183
    Height = 54
    Align = alTop
    Caption = 'Depth Range'
    TabOrder = 1
    object LabeledEdit1: TLabeledEdit
      Left = 40
      Top = 20
      Width = 49
      Height = 21
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'From:'
      EditLabel.Transparent = True
      LabelPosition = lpLeft
      TabOrder = 0
      Text = '0'
    end
    object LabeledEdit2: TLabeledEdit
      Left = 120
      Top = 20
      Width = 49
      Height = 21
      EditLabel.Width = 16
      EditLabel.Height = 13
      EditLabel.Caption = 'To:'
      EditLabel.Transparent = True
      LabelPosition = lpLeft
      TabOrder = 1
      Text = '999999'
    end
    object CheckBox1: TCheckBox
      Left = 88
      Top = 4
      Width = 89
      Height = 13
      Caption = '3D Cross Plot'
      TabOrder = 2
      Visible = False
      OnClick = CheckBox1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 183
    Height = 80
    Align = alTop
    Caption = 'X-Axis Log'
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 56
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
      Left = 80
      Top = 56
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
    object Button3: TButton
      Left = 32
      Top = 24
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 0
      OnClick = Button3Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 80
    Width = 183
    Height = 80
    Align = alTop
    Caption = 'Y-Axis Log'
    TabOrder = 3
    object Label3: TLabel
      Left = 8
      Top = 56
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
      Left = 80
      Top = 56
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
    object Button4: TButton
      Left = 32
      Top = 24
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 0
      OnClick = Button4Click
    end
  end
end
