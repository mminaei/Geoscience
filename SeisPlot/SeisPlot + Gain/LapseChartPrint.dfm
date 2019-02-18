object LapsePrint: TLapsePrint
  Left = 602
  Top = 304
  Width = 620
  Height = 393
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
  object TeePreviewPanel1: TTeePreviewPanel
    Left = 201
    Top = 0
    Width = 411
    Height = 359
    DragImage = True
    Orientation = ppoLandscape
    PaperShadow.HorizSize = 2
    PaperShadow.VertSize = 2
    Border.SmallDots = True
    Border.Visible = True
    Gradient.EndColor = clGray
    Gradient.MidColor = clGray
    Gradient.StartColor = clGray
    Gradient.Visible = True
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 359
    Align = alLeft
    TabOrder = 1
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
    object sButton2: TButton
      Left = 8
      Top = 192
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 0
      OnClick = sButton2Click
    end
    object sButton1: TButton
      Left = 8
      Top = 160
      Width = 75
      Height = 25
      Caption = 'Print'
      TabOrder = 1
      OnClick = sButton1Click
    end
    object sButton3: TButton
      Left = 96
      Top = 160
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 2
      OnClick = sButton3Click
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
      TabOrder = 3
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
      ItemIndex = 0
      ParentFont = False
      TabOrder = 4
      Text = 'Landscape'
      OnChange = ComboBox1Change
      Items.Strings = (
        'Landscape'
        'Portrait')
    end
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
