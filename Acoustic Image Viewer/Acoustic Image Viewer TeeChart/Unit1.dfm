object Form1: TForm1
  Left = 14
  Top = 12
  Width = 986
  Height = 722
  HorzScrollBar.Smooth = True
  VertScrollBar.Smooth = True
  VertScrollBar.Tracking = True
  Caption = 'P.U.T Acoustic Image Viewer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 217
    Height = 688
    Align = alLeft
    Caption = 'Data'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Button2: TButton
      Left = 8
      Top = 80
      Width = 81
      Height = 25
      Caption = 'Save Images'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button7: TButton
      Left = 8
      Top = 16
      Width = 129
      Height = 25
      Caption = 'Open Amplitude Data File'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button7Click
    end
    object Button4: TButton
      Left = 8
      Top = 112
      Width = 81
      Height = 25
      Caption = 'Reset'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 8
      Top = 48
      Width = 129
      Height = 25
      Caption = 'Open Radius Data File'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button5Click
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 312
      Width = 201
      Height = 145
      Caption = 'Amplitude'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object Label3: TLabel
        Left = 4
        Top = 79
        Width = 74
        Height = 13
        Caption = 'Maximum Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 4
        Top = 108
        Width = 71
        Height = 13
        Caption = 'Minimum Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 4
        Top = 23
        Width = 51
        Height = 13
        Caption = 'Top Depth'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 4
        Top = 51
        Width = 65
        Height = 13
        Caption = 'Bottom Depth'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Edit4: TEdit
        Left = 88
        Top = 78
        Width = 105
        Height = 21
        TabOrder = 0
      end
      object Edit5: TEdit
        Left = 88
        Top = 108
        Width = 105
        Height = 21
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 88
        Top = 19
        Width = 105
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 88
        Top = 48
        Width = 105
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 504
      Width = 201
      Height = 145
      Caption = 'Radius'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object Label5: TLabel
        Left = 4
        Top = 85
        Width = 74
        Height = 13
        Caption = 'Maximum Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 4
        Top = 116
        Width = 71
        Height = 13
        Caption = 'Minimum Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 4
        Top = 23
        Width = 51
        Height = 13
        Caption = 'Top Depth'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 4
        Top = 54
        Width = 65
        Height = 13
        Caption = 'Bottom Depth'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Edit6: TEdit
        Left = 88
        Top = 83
        Width = 105
        Height = 21
        TabOrder = 0
      end
      object Edit7: TEdit
        Left = 88
        Top = 116
        Width = 105
        Height = 21
        TabOrder = 1
      end
      object Edit8: TEdit
        Left = 88
        Top = 19
        Width = 105
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object Edit9: TEdit
        Left = 88
        Top = 51
        Width = 105
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
    end
    object Button6: TButton
      Left = 8
      Top = 651
      Width = 201
      Height = 25
      Caption = 'Change maximum and minimum values'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = Button6Click
    end
    object Button9: TButton
      Left = 8
      Top = 459
      Width = 201
      Height = 25
      Caption = 'Change maximum and minimum values'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = Button9Click
    end
    object Button1: TButton
      Left = 16
      Top = 152
      Width = 75
      Height = 25
      Caption = 'Save Data'
      TabOrder = 8
      OnClick = Button1Click
    end
  end
  object DBChart2: TDBChart
    Left = 280
    Top = 8
    Width = 220
    Height = 673
    AllowPanning = pmVertical
    MarginBottom = 10
    MarginLeft = 10
    MarginRight = 10
    MarginTop = 0
    MarginUnits = muPixels
    Title.Font.Height = -13
    Title.Font.Style = [fsBold]
    Title.Font.InterCharSize = 5
    Title.Text.Strings = (
      'Amplitude')
    OnUndoZoom = DBChart2UndoZoom
    OnZoom = DBChart2Zoom
    BottomAxis.Visible = False
    LeftAxis.MinorTickLength = 4
    LeftAxis.TickLength = 6
    LeftAxis.Ticks.Width = 2
    Legend.Visible = False
    Pages.ScaleLastPage = False
    RightAxis.Visible = False
    TopAxis.MinorTickLength = 4
    TopAxis.TickLength = 6
    TopAxis.Ticks.Width = 2
    View3D = False
    Zoom.Direction = tzdVertical
    Zoom.MinimumPixels = 8
    Zoom.Pen.Color = clBlue
    BevelInner = bvLowered
    TabOrder = 1
  end
  object DBChart3: TDBChart
    Left = 504
    Top = 8
    Width = 220
    Height = 673
    AllowPanning = pmNone
    MarginBottom = 10
    MarginLeft = 10
    MarginRight = 10
    MarginTop = 0
    MarginUnits = muPixels
    Title.Font.Height = -13
    Title.Font.Style = [fsBold]
    Title.Font.InterCharSize = 5
    Title.Text.Strings = (
      'Radius')
    OnUndoZoom = DBChart3UndoZoom
    OnZoom = DBChart3Zoom
    BottomAxis.Visible = False
    LeftAxis.Visible = False
    Legend.Visible = False
    Pages.ScaleLastPage = False
    RightAxis.Visible = False
    View3D = False
    Zoom.Allow = False
    Zoom.Direction = tzdVertical
    Zoom.MinimumPixels = 8
    BevelInner = bvLowered
    TabOrder = 2
  end
  object Chart1: TChart
    Left = 224
    Top = 9
    Width = 57
    Height = 672
    AllowPanning = pmNone
    BottomWall.Visible = False
    Legend.Visible = False
    MarginBottom = 10
    MarginLeft = 0
    MarginRight = 0
    MarginTop = 0
    MarginUnits = muPixels
    Title.Font.Height = -13
    Title.Font.Style = [fsBold]
    Title.Font.InterCharSize = 5
    Title.Text.Strings = (
      '')
    BottomAxis.Axis.Width = 1
    BottomAxis.Visible = False
    LeftAxis.Axis.Width = 1
    LeftAxis.Inverted = True
    RightAxis.Visible = False
    TopAxis.LabelStyle = talNone
    TopAxis.MinimumOffset = 100
    Zoom.Allow = False
    BevelInner = bvLowered
    TabOrder = 3
    object Series4: TFastLineSeries
      HorizAxis = aTopAxis
      Marks.Callout.Brush.Color = clBlack
      Marks.Visible = False
      SeriesColor = clBlack
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {0000000000}
    end
  end
  object GroupBox4: TGroupBox
    Left = 736
    Top = 4
    Width = 232
    Height = 333
    TabOrder = 4
    object Label11: TLabel
      Left = 10
      Top = 120
      Width = 46
      Height = 11
      Caption = 'Median ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 10
      Top = 140
      Width = 87
      Height = 11
      Caption = 'Whisker Length ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 10
      Top = 160
      Width = 58
      Height = 11
      Caption = 'Quartile1 ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 10
      Top = 181
      Width = 58
      Height = 11
      Caption = 'Quartile3 ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 10
      Top = 201
      Width = 77
      Height = 11
      Caption = 'Inner Fence1 ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 10
      Top = 222
      Width = 77
      Height = 11
      Caption = 'Inner Fence3 ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 10
      Top = 242
      Width = 78
      Height = 11
      Caption = 'Outer Fence1 ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 10
      Top = 263
      Width = 78
      Height = 11
      Caption = 'Outer Fence3 ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 10
      Top = 283
      Width = 91
      Height = 11
      Caption = 'Adjacent Point1 ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 10
      Top = 304
      Width = 91
      Height = 11
      Caption = 'Adjacent Point3 ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit11: TEdit
      Left = 115
      Top = 116
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object Edit12: TEdit
      Left = 115
      Top = 136
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object Edit13: TEdit
      Left = 115
      Top = 156
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object Edit14: TEdit
      Left = 115
      Top = 177
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object Edit15: TEdit
      Left = 115
      Top = 197
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object Edit16: TEdit
      Left = 115
      Top = 218
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object Edit17: TEdit
      Left = 115
      Top = 238
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object Edit18: TEdit
      Left = 115
      Top = 259
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object Edit19: TEdit
      Left = 115
      Top = 279
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object Edit20: TEdit
      Left = 115
      Top = 300
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object DBChart1: TDBChart
      Left = 10
      Top = 16
      Width = 210
      Height = 97
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        'Amplitude Data Distribution')
      BottomAxis.Grid.Visible = False
      LeftAxis.Visible = False
      Legend.Alignment = laBottom
      Legend.CheckBoxes = True
      Legend.LegendStyle = lsLastValues
      Legend.Visible = False
      View3D = False
      BevelInner = bvLowered
      TabOrder = 10
      object Series1: THorizBoxSeries
        Marks.Callout.Brush.Color = clBlack
        Marks.Visible = False
        ClickableLine = False
        Pointer.Brush.Color = clWhite
        Pointer.Draw3D = False
        Pointer.HorizSize = 15
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.VertSize = 15
        Pointer.Visible = True
        XValues.Order = loNone
        YValues.Name = 'Samples'
        YValues.Order = loNone
        ExtrOut.InflateMargins = True
        ExtrOut.Style = psStar
        ExtrOut.Visible = False
        MedianPen.Style = psDot
        MildOut.InflateMargins = True
        MildOut.Style = psCircle
        MildOut.Visible = False
        SampleValues.Order = loNone
        WhiskerLength = 1.900000000000000000
        Data = {0000000000}
      end
    end
  end
  object GroupBox5: TGroupBox
    Left = 736
    Top = 348
    Width = 232
    Height = 333
    TabOrder = 5
    object Label9: TLabel
      Left = 10
      Top = 120
      Width = 46
      Height = 11
      Caption = 'Median ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 10
      Top = 140
      Width = 87
      Height = 11
      Caption = 'Whisker Length ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 10
      Top = 160
      Width = 58
      Height = 11
      Caption = 'Quartile1 ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 10
      Top = 181
      Width = 58
      Height = 11
      Caption = 'Quartile3 ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 10
      Top = 201
      Width = 77
      Height = 11
      Caption = 'Inner Fence1 ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 10
      Top = 222
      Width = 77
      Height = 11
      Caption = 'Inner Fence3 ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label25: TLabel
      Left = 10
      Top = 242
      Width = 78
      Height = 11
      Caption = 'Outer Fence1 ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 10
      Top = 263
      Width = 78
      Height = 11
      Caption = 'Outer Fence3 ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 10
      Top = 283
      Width = 91
      Height = 11
      Caption = 'Adjacent Point1 ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label28: TLabel
      Left = 10
      Top = 304
      Width = 91
      Height = 11
      Caption = 'Adjacent Point3 ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBChart5: TDBChart
      Left = 10
      Top = 16
      Width = 210
      Height = 97
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        'Radius Data Distribution')
      BottomAxis.Grid.Visible = False
      LeftAxis.Visible = False
      Legend.Alignment = laBottom
      Legend.CheckBoxes = True
      Legend.LegendStyle = lsLastValues
      Legend.Visible = False
      View3D = False
      BevelInner = bvLowered
      TabOrder = 0
      object Series5: THorizBoxSeries
        Marks.Callout.Brush.Color = clBlack
        Marks.Visible = False
        ShowInLegend = False
        ClickableLine = False
        Pointer.Brush.Color = clWhite
        Pointer.Draw3D = False
        Pointer.HorizSize = 15
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.VertSize = 15
        Pointer.Visible = True
        XValues.Order = loNone
        YValues.Name = 'Samples'
        YValues.Order = loNone
        ExtrOut.InflateMargins = True
        ExtrOut.Style = psStar
        ExtrOut.Visible = False
        MedianPen.Style = psDot
        MildOut.InflateMargins = True
        MildOut.Style = psCircle
        MildOut.Visible = False
        SampleValues.Order = loNone
        WhiskerLength = 1.900000000000000000
        Data = {0000000000}
      end
    end
    object Edit30: TEdit
      Left = 115
      Top = 300
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object Edit21: TEdit
      Left = 115
      Top = 116
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object Edit22: TEdit
      Left = 115
      Top = 136
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object Edit23: TEdit
      Left = 115
      Top = 156
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object Edit24: TEdit
      Left = 115
      Top = 177
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object Edit25: TEdit
      Left = 115
      Top = 197
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object Edit26: TEdit
      Left = 115
      Top = 218
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object Edit27: TEdit
      Left = 115
      Top = 238
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object Edit28: TEdit
      Left = 115
      Top = 259
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object Edit29: TEdit
      Left = 115
      Top = 279
      Width = 105
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'LAS files|*.las'
    Options = [ofEnableSizing]
    Left = 616
    Top = 40
  end
  object SavePictureDialog1: TSavePictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save Amplitude Image'
    Left = 616
    Top = 8
  end
  object XPManifest1: TXPManifest
    Left = 648
    Top = 8
  end
  object SavePictureDialog2: TSavePictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save Radius Image'
    Left = 680
    Top = 8
  end
  object mxProtector1: TmxProtector
    CodeKey = 'Ignore'
    ProtectionTypes = []
    Options = [poAutoInit, poCheckSytemTime, poPasswordOnce]
    RegistryRootKey = rkLocalMachine
    Expiration = 38668.391553090280000000
    MaxStartNumber = 0
    MaxDayNumber = 0
    Version = '1.31'
    OnExpiration = mxProtector1Expiration
    OnStartTrial = mxProtector1StartTrial
    Left = 568
    Top = 8
    UniqueCodeID = 
      '7A373B3C40373E494F273D393C4A2224292022392D50232E345F222A5F2C5A14' +
      '65146016115B'
    UniqueID = 
      '217A55721F0265660172726E0F206B620215616E657769054E741F076167076F' +
      '73157A560420'
  end
  object ChartEditor1: TChartEditor
    Chart = DBChart2
    Left = 312
    Top = 176
  end
end
