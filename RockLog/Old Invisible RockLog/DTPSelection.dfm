object Vp_Selection: TVp_Selection
  Left = 242
  Top = 144
  BorderStyle = bsDialog
  Caption = 'Vp Selection'
  ClientHeight = 554
  ClientWidth = 206
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 78
    Height = 13
    Caption = 'P-Wave Velocity'
    Transparent = True
  end
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 186
    Height = 32
    Caption = 'Select the reference track of Vp and its measurment unit.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 416
    Width = 81
    Height = 13
    Caption = 'Measurment Unit'
    Transparent = True
  end
  object Label3: TLabel
    Left = 8
    Top = 464
    Width = 134
    Height = 13
    Caption = 'Desired Vs Measurment Unit'
    Transparent = True
  end
  object ScrollBox1: TScrollBox
    Left = 8
    Top = 64
    Width = 190
    Height = 345
    HorzScrollBar.Visible = False
    VertScrollBar.Smooth = True
    VertScrollBar.Tracking = True
    BevelInner = bvLowered
    BevelOuter = bvRaised
    BevelKind = bkTile
    Color = 16513514
    ParentColor = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 42
    Top = 520
    Width = 75
    Height = 25
    Caption = 'Ok'
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 125
    Top = 520
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 432
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = 'KM/S'
    OnChange = ComboBox1Change
    Items.Strings = (
      'KM/S'
      'FT/S')
  end
  object ComboBox2: TComboBox
    Left = 8
    Top = 480
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = 'KM/S'
    OnChange = ComboBox2Change
    Items.Strings = (
      'KM/S'
      'FT/S')
  end
end
