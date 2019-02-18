object Correlation_Coefficient: TCorrelation_Coefficient
  Left = 765
  Top = 42
  BorderStyle = bsDialog
  Caption = 'Correlation Coefficient'
  ClientHeight = 456
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 79
    Height = 13
    Caption = 'Reference Track'
    Transparent = True
  end
  object Label3: TLabel
    Left = 200
    Top = 56
    Width = 113
    Height = 13
    Caption = 'Correlation Coefficients'
    Transparent = True
  end
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 352
    Height = 16
    Caption = 'Select the reference track to calculate Correlation Coefficient.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
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
  object Button1: TButton
    Left = 314
    Top = 424
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 424
    Width = 75
    Height = 25
    Caption = 'Calculate'
    Default = True
    TabOrder = 3
    OnClick = Button2Click
  end
end
