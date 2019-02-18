object Cross_Plot_Tracks: TCross_Plot_Tracks
  Left = 181
  Top = 72
  BorderStyle = bsDialog
  Caption = 'Cross Plot Tracks Selection'
  ClientHeight = 448
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 234
    Height = 16
    Caption = 'Select reference tracks for X and Y axes.'
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
    Top = 40
    Width = 30
    Height = 13
    Caption = 'X-Axis'
    Transparent = True
  end
  object Label3: TLabel
    Left = 200
    Top = 40
    Width = 30
    Height = 13
    Caption = 'Y-Axis'
    Transparent = True
  end
  object ScrollBox2: TScrollBox
    Left = 200
    Top = 56
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
  object ScrollBox1: TScrollBox
    Left = 8
    Top = 56
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
    Left = 226
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Ok'
    Default = True
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 309
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = Button2Click
  end
end
