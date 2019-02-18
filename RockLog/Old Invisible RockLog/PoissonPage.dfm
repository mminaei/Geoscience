object Poisson_Page: TPoisson_Page
  Left = 192
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Poisson '
  ClientHeight = 513
  ClientWidth = 397
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
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 380
    Height = 32
    Caption = 
      'Select reference tracks for P-wave velocity and Poisson Ratio lo' +
      'gs and their measurment units.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 76
    Height = 13
    Caption = 'P-wave Velocity'
    Transparent = True
  end
  object Label3: TLabel
    Left = 200
    Top = 56
    Width = 64
    Height = 13
    Caption = 'Poisson Ratio'
    Transparent = True
  end
  object Label2: TLabel
    Left = 8
    Top = 424
    Width = 85
    Height = 13
    Caption = 'Measurment Unit:'
  end
  object Label7: TLabel
    Left = 200
    Top = 424
    Width = 138
    Height = 13
    Caption = 'Desired Vs Measurment Unit:'
  end
  object ScrollBox1: TScrollBox
    Left = 8
    Top = 72
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
  object ScrollBox2: TScrollBox
    Left = 200
    Top = 72
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
    TabOrder = 1
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 440
    Width = 153
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = 'KM/S'
    OnChange = ComboBox1Change
    Items.Strings = (
      'KM/S'
      'FT/S')
  end
  object Button1: TButton
    Left = 226
    Top = 480
    Width = 75
    Height = 25
    Caption = 'Ok'
    Default = True
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 309
    Top = 480
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = Button2Click
  end
  object ComboBox2: TComboBox
    Left = 200
    Top = 440
    Width = 153
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'KM/S'
    OnChange = ComboBox2Change
    Items.Strings = (
      'KM/S'
      'FT/S')
  end
end
