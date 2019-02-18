object Averaging_Form: TAveraging_Form
  Left = 604
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Averaging'
  ClientHeight = 351
  ClientWidth = 206
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  ScreenSnap = True
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 0
    Width = 206
    Height = 73
    Align = alTop
    Caption = 'Averaging Method'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Arithmetic'
      'Geometric'
      'Harmonic')
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 73
    Width = 206
    Height = 73
    Align = alTop
    Caption = 'Depth Range'
    TabOrder = 1
    object LabeledEdit2: TLabeledEdit
      Left = 8
      Top = 36
      Width = 65
      Height = 21
      EditLabel.Width = 26
      EditLabel.Height = 13
      EditLabel.Caption = 'From:'
      EditLabel.Transparent = True
      TabOrder = 0
      Text = '0'
    end
    object LabeledEdit3: TLabeledEdit
      Left = 96
      Top = 36
      Width = 65
      Height = 21
      EditLabel.Width = 16
      EditLabel.Height = 13
      EditLabel.Caption = 'To:'
      EditLabel.Transparent = True
      TabOrder = 1
      Text = '999999'
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 249
    Width = 206
    Height = 60
    Align = alTop
    Caption = 'Result'
    TabOrder = 2
    object Edit1: TEdit
      Left = 8
      Top = 24
      Width = 185
      Height = 21
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 309
    Width = 206
    Height = 42
    Align = alClient
    TabOrder = 3
    object Button1: TButton
      Left = 14
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Calculate'
      Default = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 117
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 146
    Width = 206
    Height = 103
    Align = alTop
    Caption = 'Grain Matrix Density (g/cm3)'
    TabOrder = 4
    object Label3: TLabel
      Left = 8
      Top = 72
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
      Top = 72
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
      Left = 40
      Top = 32
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 0
      OnClick = Button4Click
    end
  end
end
