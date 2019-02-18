object ChartPrintP: TChartPrintP
  Left = 176
  Top = 129
  Width = 775
  Height = 575
  Caption = 'Print Preview'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object VrLabel2: TVrLabel
    Left = 9
    Top = 3
    Width = 92
    Height = 20
    ColorHighlight = 14614489
    ColorShadow = 14614489
    Transparent = True
    AutoSize = True
    Color = clBtnFace
    Caption = 'Preview Style'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object VrLabel3: TVrLabel
    Left = 9
    Top = 59
    Width = 71
    Height = 20
    ColorHighlight = 14614489
    ColorShadow = 14614489
    Transparent = True
    AutoSize = True
    Color = clBtnFace
    Caption = 'Tracks List'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object TeePreviewPanel1: TTeePreviewPanel
    Left = 242
    Top = 0
    Width = 525
    Height = 541
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
    TabOrder = 3
  end
  object CheckListBox1: TCheckListBox
    Left = 8
    Top = 80
    Width = 185
    Height = 273
    OnClickCheck = CheckListBox1ClickCheck
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 4
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
    TabOrder = 5
    OnChange = ComboBox1Change
    Items.Strings = (
      'Landscape'
      'Portrait')
  end
  object sButton1: TsButton
    Left = 8
    Top = 400
    Width = 105
    Height = 25
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsButton'
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Data = '8421504;16777215;99;0;0;16777215;16777215;0;0;0'
    sStyle.HotStyle.HotBackground.Gradient.Data = 
      '8421504;8421504;10;0;0;8421504;16777215;43;0;0;16777215;10658466' +
      ';28;0;0;10658466;13816530;18;0;0;13816530;13816530;0;0;0'
    sStyle.HotStyle.HotPainting.Transparency = 0
    Caption = 'Print'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sButton1Click
    ShowFocus = False
    TabOrder = 1
  end
  object sButton2: TsButton
    Left = 8
    Top = 510
    Width = 105
    Height = 25
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsButton'
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Data = '8421504;16777215;99;0;0;16777215;16777215;0;0;0'
    sStyle.HotStyle.HotBackground.Gradient.Data = 
      '8421504;8421504;10;0;0;8421504;16777215;43;0;0;16777215;10658466' +
      ';28;0;0;10658466;13816530;18;0;0;13816530;13816530;0;0;0'
    sStyle.HotStyle.HotPainting.Transparency = 0
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sButton2Click
    ShowFocus = False
    TabOrder = 2
  end
  object sButton3: TsButton
    Left = 8
    Top = 370
    Width = 105
    Height = 25
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsButton'
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Data = '8421504;16777215;99;0;0;16777215;16777215;0;0;0'
    sStyle.HotStyle.HotBackground.Gradient.Data = 
      '8421504;8421504;10;0;0;8421504;16777215;43;0;0;16777215;10658466' +
      ';28;0;0;10658466;13816530;18;0;0;13816530;13816530;0;0;0'
    sStyle.HotStyle.HotPainting.Transparency = 0
    Caption = 'Save'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sButton3Click
    ShowFocus = False
    TabOrder = 0
  end
  object PrintDialog1: TPrintDialog
    Left = 176
    Top = 376
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.bmp'
    Filter = 'Bitmap files (*.bmp)|*.bmp'
    Title = 'Save as Bitmap'
    Left = 176
    Top = 408
  end
end
