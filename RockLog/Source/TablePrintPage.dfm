object TablePrint: TTablePrint
  Left = 188
  Top = 115
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Table Print'
  ClientHeight = 541
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clMaroon
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 9
    Top = 366
    Width = 143
    Height = 57
    Shape = bsFrame
  end
  object VrLabel1: TVrLabel
    Left = 9
    Top = 227
    Width = 53
    Height = 20
    ColorHighlight = 14614489
    ColorShadow = 14614489
    Transparent = True
    AutoSize = True
    Color = clBtnFace
    Caption = 'Printers'
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
  object VrLabel2: TVrLabel
    Left = 9
    Top = 347
    Width = 132
    Height = 20
    ColorHighlight = 14614489
    ColorShadow = 14614489
    Transparent = True
    AutoSize = True
    Color = clBtnFace
    Caption = 'Table Preview Style'
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
    Top = 284
    Width = 48
    Height = 20
    ColorHighlight = 14614489
    ColorShadow = 14614489
    Transparent = True
    AutoSize = True
    Color = clBtnFace
    Caption = 'Papers'
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
  object VrLabel4: TVrLabel
    Left = 9
    Top = 168
    Width = 46
    Height = 20
    ColorHighlight = 14614489
    ColorShadow = 14614489
    Transparent = True
    AutoSize = True
    Color = clBtnFace
    Caption = 'Tables'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object VrLabel5: TVrLabel
    Left = 152
    Top = 512
    Width = 24
    Height = 18
    ColorHighlight = 14614489
    ColorShadow = 14614489
    Transparent = True
    AutoSize = True
    Color = clBtnFace
    Caption = 'To :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object VrLabel6: TVrLabel
    Left = 152
    Top = 488
    Width = 39
    Height = 18
    ColorHighlight = 14614489
    ColorShadow = 14614489
    Transparent = True
    AutoSize = True
    Color = clBtnFace
    Caption = 'From :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object ProgressBar1: TVrProgressBar
    Left = 296
    Top = 440
    Width = 473
    Height = 17
    Bevel.InnerShadow = clBtnShadow
    Bevel.InnerHighlight = clBtnHighlight
    Bevel.InnerWidth = 1
    Bevel.InnerStyle = bsNone
    Bevel.InnerSpace = 0
    Bevel.InnerColor = clBtnFace
    Bevel.OuterShadow = clBtnShadow
    Bevel.OuterHighlight = clBtnHighlight
    Bevel.OuterStyle = bsLowered
    Bevel.OuterOutline = osNone
    StartColor = clBlue
    EndColor = clBlack
    Step = 1
    Color = clWhite
    Visible = False
  end
  object GmPageNavigator2: TGmPageNavigator
    Left = 348
    Top = 457
    Width = 369
    Height = 50
    About = 'TGmPageNavigator v2.96.6'
    BorderStyle = bsSingle
    TabOrder = 13
    BorderWidth = 6
    Preview = GmPreview1
    VisibleButtons = [gmFirstPage, gmPrevPage, gmNextPage, gmLastPage, gmZoomIn, gmZoomOut, gmActualSize, gmFitWidth, gmFitHeight, gmFitWholePage]
  end
  object GmPreview1: TGmPreview
    Left = 296
    Top = 8
    Width = 473
    Height = 433
    HorzScrollBar.Range = 346
    HorzScrollBar.Smooth = True
    HorzScrollBar.Style = ssFlat
    HorzScrollBar.Tracking = True
    VertScrollBar.Range = 464
    VertScrollBar.Smooth = True
    VertScrollBar.Style = ssFlat
    VertScrollBar.Tracking = True
    About = 'TGmPreview v2.96.6'
    AutoScroll = False
    Color = clGray
    TabOrder = 3
    Canvas.CompareGraphics = True
    Footer.CaptionLeft.Font.Charset = DEFAULT_CHARSET
    Footer.CaptionLeft.Font.Color = clWindowText
    Footer.CaptionLeft.Font.Height = -16
    Footer.CaptionLeft.Font.Name = 'Arial'
    Footer.CaptionLeft.Font.Style = []
    Footer.CaptionCenter.Font.Charset = DEFAULT_CHARSET
    Footer.CaptionCenter.Font.Color = clWindowText
    Footer.CaptionCenter.Font.Height = -16
    Footer.CaptionCenter.Font.Name = 'Arial'
    Footer.CaptionCenter.Font.Style = []
    Footer.CaptionRight.Font.Charset = DEFAULT_CHARSET
    Footer.CaptionRight.Font.Color = clWindowText
    Footer.CaptionRight.Font.Height = -16
    Footer.CaptionRight.Font.Name = 'Arial'
    Footer.CaptionRight.Font.Style = []
    Header.CaptionLeft.Font.Charset = DEFAULT_CHARSET
    Header.CaptionLeft.Font.Color = clWindowText
    Header.CaptionLeft.Font.Height = -16
    Header.CaptionLeft.Font.Name = 'Arial'
    Header.CaptionLeft.Font.Style = []
    Header.CaptionCenter.Caption = 'RockLog Software'
    Header.CaptionCenter.Font.Charset = DEFAULT_CHARSET
    Header.CaptionCenter.Font.Color = clBlue
    Header.CaptionCenter.Font.Height = -16
    Header.CaptionCenter.Font.Name = 'Arial'
    Header.CaptionCenter.Font.Style = [fsBold]
    Header.CaptionRight.Font.Charset = DEFAULT_CHARSET
    Header.CaptionRight.Font.Color = clWindowText
    Header.CaptionRight.Font.Height = -16
    Header.CaptionRight.Font.Name = 'Arial'
    Header.CaptionRight.Font.Style = []
    Header.Visible = True
    Margins.Pen.Color = clSilver
    Margins.Pen.Style = psDot
    Margins.PrinterMarginPen.Color = clSilver
    Margins.PrinterMarginPen.Style = psDash
    Margins.Values.Left = 8.995833396911621000
    Margins.Values.Top = 8.995833396911621000
    Margins.Values.Right = 8.995833396911621000
    Margins.Values.Bottom = 8.995833396911621000
    Margins.Values.ValueMeasurement = gmMillimeters
    Margins.Visible = True
    PageGrid.GridPen.Color = clSilver
    PagesPerSheet = gmOnePage
    Shadow.Width = 2
    Zoom = 36
    OnNewPage = GmPreview1NewPage
    MarginValues = '510,510,510,510,"12632256,1,2,4","12632256,1,1,4"'
  end
  object GmPropertyComboBox1: TGmPropertyComboBox
    Left = 9
    Top = 246
    Width = 146
    Height = 26
    About = 'TGmPropertyComboBox v2.96.6'
    BevelInner = bvLowered
    BevelOuter = bvRaised
    Color = 16776161
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 20
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Items.Strings = (
      'Microsoft Office Document Image Writer')
    Preview = GmPreview1
  end
  object GmThumbnails1: TGmThumbnails
    Left = 1
    Top = 8
    Width = 295
    Height = 159
    About = 'TGmThumbnails v2.96.6'
    Color = clGray
    TabOrder = 4
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'MS Sans Serif'
    CaptionFont.Style = []
    HighlightStyle = gmThinLine
    Layout = gmThumbGrid
    PageCaptions = '#'
    Preview = GmPreview1
    Shadow.Width = 2
    ThumbSize = 3
    ThumbSpacing = 5
  end
  object GmPropertyComboBox2: TGmPropertyComboBox
    Left = 9
    Top = 305
    Width = 146
    Height = 26
    About = 'TGmPropertyComboBox v2.96.6'
    Color = 16776161
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 20
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Items.Strings = (
      'A3'
      'A4'
      'A5'
      'A6'
      'B5'
      'C5'
      'Legal'
      'Letter'
      'Custom'
      'B4'
      'Envelope_09'
      'Envelope_10'
      'Envelope_11'
      'Envelope_12'
      'Envelope_14'
      'Tabloid'
      'Ledger'
      'Executive')
    Preview = GmPreview1
    PreviewProperty = gmPaperList
  end
  object ComboBox1: TComboBox
    Left = 9
    Top = 191
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
    TabOrder = 0
    Items.Strings = (
      #13'Source Table'
      'Elastic Parameters'
      'Litholog Table')
  end
  object Range2: TESBPosEdit
    Left = 208
    Top = 512
    Width = 33
    Height = 22
    ColorFocus = clWhite
    ColorRW = 16776161
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    ColorFontNeg = clGreen
    ColorFontPos = clGreen
    AsLongWord = 1
  end
  object Range1: TESBPosEdit
    Left = 208
    Top = 488
    Width = 33
    Height = 22
    ColorFocus = clWhite
    ColorRW = 16776161
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    ColorFontNeg = clGreen
    ColorFontPos = clGreen
    AsLongWord = 1
  end
  object Button3: TsButton
    Left = 200
    Top = 189
    Width = 81
    Height = 46
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsButton'
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Data = '8421504;16777215;99;0;0;16777215;16777215;0;0;0'
    sStyle.HotStyle.HotBackground.Gradient.Data = 
      '8421504;8421504;10;0;0;8421504;16777215;43;0;0;16777215;10658466' +
      ';28;0;0;10658466;13816530;18;0;0;13816530;13816530;0;0;0'
    sStyle.HotStyle.HotPainting.Transparency = 0
    Caption = 'Get Table Preview'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16384
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Button3Click
    TabOrder = 7
  end
  object RadioButton1: TRadioButton
    Left = 16
    Top = 376
    Width = 129
    Height = 17
    Caption = 'Landscape'
    TabOrder = 8
  end
  object RadioButton2: TRadioButton
    Left = 16
    Top = 400
    Width = 129
    Height = 17
    Caption = 'Portrait'
    TabOrder = 9
  end
  object Button1: TsButton
    Left = 8
    Top = 429
    Width = 81
    Height = 46
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsButton'
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Data = '8421504;16777215;99;0;0;16777215;16777215;0;0;0'
    sStyle.HotStyle.HotBackground.Gradient.Data = 
      '8421504;8421504;10;0;0;8421504;16777215;43;0;0;16777215;10658466' +
      ';28;0;0;10658466;13816530;18;0;0;13816530;13816530;0;0;0'
    sStyle.HotStyle.HotPainting.Transparency = 0
    Caption = 'Print  All Pages'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8404992
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Button1Click
    TabOrder = 10
  end
  object Button2: TsButton
    Left = 8
    Top = 485
    Width = 81
    Height = 46
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsButton'
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Data = '8421504;16777215;99;0;0;16777215;16777215;0;0;0'
    sStyle.HotStyle.HotBackground.Gradient.Data = 
      '8421504;8421504;10;0;0;8421504;16777215;43;0;0;16777215;10658466' +
      ';28;0;0;10658466;13816530;18;0;0;13816530;13816530;0;0;0'
    sStyle.HotStyle.HotPainting.Transparency = 0
    Caption = 'Print Current Page'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8404992
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Button2Click
    TabOrder = 11
  end
  object Button4: TsButton
    Left = 152
    Top = 429
    Width = 81
    Height = 46
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsButton'
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Data = '8421504;16777215;99;0;0;16777215;16777215;0;0;0'
    sStyle.HotStyle.HotBackground.Gradient.Data = 
      '8421504;8421504;10;0;0;8421504;16777215;43;0;0;16777215;10658466' +
      ';28;0;0;10658466;13816530;18;0;0;13816530;13816530;0;0;0'
    sStyle.HotStyle.HotPainting.Transparency = 0
    Caption = 'Print Range :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8404992
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Button4Click
    TabOrder = 12
  end
  object sButton2: TsButton
    Left = 680
    Top = 508
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
    TabOrder = 14
  end
  object GmDbGridPrint1: TGmDbGridPrint
    About = 'TGmDbGridPrint v2.96.6'
    DefaultCellAlignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    FixedCellFont.Charset = DEFAULT_CHARSET
    FixedCellFont.Color = clWindowText
    FixedCellFont.Height = -11
    FixedCellFont.Name = 'Arial'
    FixedCellFont.Style = []
    Preview = GmPreview1
    ScaleText = True
    WordWrap = True
    Left = 248
    Top = 296
  end
end
