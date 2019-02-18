object ZoomChart: TZoomChart
  Left = 630
  Top = 78
  BorderStyle = bsDialog
  Caption = 'Zoom'
  ClientHeight = 606
  ClientWidth = 246
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBChart1: TDBChart
    Left = 0
    Top = 41
    Width = 246
    Height = 565
    MarginBottom = 0
    MarginLeft = 0
    MarginRight = 0
    MarginTop = 0
    MarginUnits = muPixels
    Title.Text.Strings = (
      '')
    OnUndoZoom = DBChart1UndoZoom
    OnZoom = DBChart1Zoom
    BottomAxis.MaximumOffset = 5
    BottomAxis.MinimumOffset = 5
    Legend.Visible = False
    TopAxis.MaximumOffset = 5
    TopAxis.MinimumOffset = 5
    View3D = False
    Align = alClient
    TabOrder = 0
    PrintMargins = (
      38
      15
      38
      15)
    object ChartTool1: TMarksTipTool
      MouseAction = mtmClick
      MouseDelay = 0
      Style = smsXY
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 246
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object sButton1: TsButton
      Left = 8
      Top = 8
      Width = 75
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
      TabOrder = 0
    end
    object sButton2: TsButton
      Left = 168
      Top = 8
      Width = 75
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
      Left = 88
      Top = 8
      Width = 75
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
      TabOrder = 1
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.bmp'
    Filter = 'Bitmap files (*.bmp)|*.bmp'
    Left = 104
    Top = 80
  end
  object ChartPreviewer1: TChartPreviewer
    Chart = DBChart1
    Title = 'Print Preview'
    OnAfterDraw = ChartPreviewer1AfterDraw
    Left = 64
    Top = 137
  end
end
