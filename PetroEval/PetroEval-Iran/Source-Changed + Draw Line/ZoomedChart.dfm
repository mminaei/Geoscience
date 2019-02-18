object ZoomChart: TZoomChart
  Left = 232
  Top = 146
  Width = 256
  Height = 477
  Caption = 'Zoom'
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PrintDialog1: TPrintDialog
    Left = 216
    Top = 112
  end
  object ChartEditor1: TChartEditor
    Title = 'Edit Zoom Properties'
    Left = 216
    Top = 144
  end
  object ChartPreviewer1: TChartPreviewer
    Options = [cpoChangePrinter, cpoSetupPrinter, cpoResizeChart, cpoMoveChart, cpoChangeDetail, cpoChangePaperOrientation, cpoChangeMargins, cpoProportional, cpoPrintPanel]
    Title = 'Print Preview'
    Left = 216
    Top = 176
  end
end
