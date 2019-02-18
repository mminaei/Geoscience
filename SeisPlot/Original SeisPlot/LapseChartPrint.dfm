object LapsePrint: TLapsePrint
  Left = 262
  Top = 132
  Width = 729
  Height = 566
  Caption = 'Print'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 78
    Height = 13
    Caption = 'Preview Style'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 64
    Height = 13
    Caption = 'Tracks List'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TeePreviewPanel1: TTeePreviewPanel
    Left = 196
    Top = 0
    Width = 525
    Height = 539
    DragImage = True
    Orientation = ppoPortrait
    PaperShadow.HorizSize = 2
    PaperShadow.VertSize = 2
    Border.SmallDots = True
    Border.Visible = True
    Gradient.EndColor = clGray
    Gradient.MidColor = clGray
    Gradient.StartColor = clGray
    Gradient.Visible = True
    Align = alRight
    TabOrder = 0
  end
  object ComboBox1: TComboBox
    Left = 9
    Top = 23
    Width = 146
    Height = 21
    Color = 16776161
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 13
    ParentFont = False
    TabOrder = 1
    Items.Strings = (
      'Landscape'
      'Portrait')
  end
  object CheckListBox1: TCheckListBox
    Left = 8
    Top = 80
    Width = 185
    Height = 65
    OnClickCheck = CheckListBox1ClickCheck
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 2
  end
  object sButton3: TButton
    Left = 8
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 3
    OnClick = sButton3Click
  end
  object sButton1: TButton
    Left = 8
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Print'
    TabOrder = 4
    OnClick = sButton1Click
  end
  object sButton2: TButton
    Left = 8
    Top = 504
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 5
    OnClick = sButton2Click
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.bmp'
    Filter = 'Bitmap files (*.bmp)|*.bmp'
    Title = 'Save as Bitmap'
    Left = 176
    Top = 408
  end
  object PrintDialog1: TPrintDialog
    Left = 176
    Top = 376
  end
end
