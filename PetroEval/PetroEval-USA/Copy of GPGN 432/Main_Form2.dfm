object MainForm2: TMainForm2
  Left = 269
  Top = 115
  Width = 853
  Height = 635
  HorzScrollBar.Style = ssHotTrack
  HorzScrollBar.Tracking = True
  Caption = 'P.U.T PetroEval'
  Color = clWhite
  TransparentColorValue = clWhite
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  ScreenSnap = True
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 562
    Width = 845
    Height = 19
    Panels = <
      item
        Text = 'Ready'
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 845
    Height = 43
    ButtonHeight = 39
    ButtonWidth = 39
    Caption = 'ToolBar1'
    Color = clWhite
    Images = ImageList2
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object ToolButton10: TToolButton
      Left = 0
      Top = 2
      Caption = 'Change &Scale'
      ImageIndex = 1
      MenuItem = ChangeScale1
    end
    object ToolButton3: TToolButton
      Left = 39
      Top = 2
      Caption = 'Move Tracks'
      ImageIndex = 2
      OnClick = ToolButton3Click
    end
    object Separator3: TToolButton
      Left = 78
      Top = 2
      Width = 715
      Caption = 'Separator3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 793
      Top = 2
      AutoSize = True
      Caption = 'E&xit'
      ImageIndex = 0
      MenuItem = Exit1
      ParentShowHint = False
      ShowHint = True
    end
  end
  object Panel1: TPanel
    Left = 29
    Top = 43
    Width = 816
    Height = 519
    Align = alClient
    Color = clWhite
    TabOrder = 2
    object Splitter2: TSplitter
      Left = 1
      Top = 97
      Width = 814
      Height = 3
      Cursor = crVSplit
      Align = alTop
      Color = clHotLight
      MinSize = 3
      ParentColor = False
    end
    object ScrollBox1: TScrollBox
      Left = 1
      Top = 100
      Width = 814
      Height = 418
      HorzScrollBar.Smooth = True
      HorzScrollBar.Tracking = True
      VertScrollBar.Smooth = True
      VertScrollBar.Style = ssHotTrack
      VertScrollBar.Tracking = True
      Align = alClient
      TabOrder = 0
      object DBChart1: TDBChart
        Tag = 1
        Left = 0
        Top = 0
        Width = 220
        Height = 412
        AllowPanning = pmHorizontal
        MarginBottom = 10
        MarginTop = 2
        MarginUnits = muPixels
        Title.Text.Strings = (
          'TDBChart')
        Title.Visible = False
        OnScroll = DBChart1Scroll
        OnUndoZoom = DBChart1UndoZoom
        OnZoom = Zooming
        CustomAxes = <
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = clRed
            Axis.Visible = False
            ExactDateTime = False
            Grid.Color = clBlack
            Grid.Style = psSolid
            Grid.Width = 2
            Increment = 200.000000000000000000
            Horizontal = True
            OtherSide = True
            Labels = False
            LabelsFont.Color = clRed
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsSize = 1
            Maximum = 100.000000000000000000
            MinorGrid.Color = clSilver
            MinorGrid.Visible = True
            MinorTickCount = 4
            MinorTickLength = 6
            MinorTicks.Color = clRed
            MinorTicks.Width = 2
            MinorTicks.Visible = False
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = clRed
            Ticks.Width = 2
            Ticks.Visible = False
            TickOnLabelsOnly = False
            Title.Caption = 'GR'
            Title.Font.Color = clRed
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Title.Shadow.Visible = False
            OnDrawLabel = TopAxisDrawLabel
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = clMaroon
            ExactDateTime = False
            Grid.Visible = False
            Increment = 16.000000000000000000
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = clMaroon
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsSize = 1
            Maximum = 16.000000000000000000
            MinorTickCount = 4
            MinorTickLength = 6
            MinorTicks.Color = clMaroon
            MinorTicks.Width = 2
            PositionPercent = -40.000000000000000000
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = clMaroon
            Ticks.Width = 2
            Title.Caption = 'CALIPER'
            Title.Font.Color = clMaroon
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = False
            OnDrawLabel = TopAxisDrawLabel
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = 16384
            ExactDateTime = False
            Grid.Visible = False
            Increment = 16.000000000000000000
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = 16384
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsFont.Shadow.Visible = False
            LabelsSize = 1
            Maximum = 16.000000000000000000
            MinorTickCount = 4
            MinorTickLength = 6
            MinorTicks.Color = 16384
            MinorTicks.Width = 2
            PositionPercent = -80.000000000000000000
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = 16384
            Ticks.Width = 2
            Title.Caption = 'BIT SIZE'
            Title.Font.Color = 16384
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = False
            OnDrawLabel = TopAxisDrawLabel
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = clBlue
            Grid.Visible = False
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = clBlue
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsSize = 1
            Maximum = 25.000000000000000000
            Minimum = -25.000000000000000000
            MinorTickCount = 4
            MinorTickLength = 6
            MinorTicks.Color = clBlue
            MinorTicks.Width = 2
            PositionPercent = -120.000000000000000000
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = clBlue
            Ticks.Width = 2
            TicksInner.Color = clBlue
            Title.Caption = 'SP'
            Title.Font.Color = clBlue
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            OnDrawLabel = TopAxisDrawLabel
          end>
        LeftAxis.Axis.Visible = False
        LeftAxis.ExactDateTime = False
        LeftAxis.Grid.Color = clBlack
        LeftAxis.Grid.Style = psSolid
        LeftAxis.Grid.Width = 2
        LeftAxis.Increment = 1.000000000000000000
        LeftAxis.Inverted = True
        LeftAxis.Labels = False
        LeftAxis.LabelsFont.Charset = ANSI_CHARSET
        LeftAxis.LabelsFont.Height = -13
        LeftAxis.LabelsFont.Name = 'Tahoma'
        LeftAxis.LabelsOnAxis = False
        LeftAxis.LabelsSeparation = 100
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorGrid.Visible = True
        LeftAxis.MinorTickCount = 4
        LeftAxis.MinorTicks.Visible = False
        LeftAxis.PositionUnits = muPixels
        LeftAxis.Ticks.Visible = False
        LeftAxis.TickOnLabelsOnly = False
        Legend.Visible = False
        RightAxis.ExactDateTime = False
        RightAxis.Increment = 1.000000000000000000
        RightAxis.LabelsSeparation = 100
        TopAxis.Automatic = False
        TopAxis.AutomaticMaximum = False
        TopAxis.AutomaticMinimum = False
        TopAxis.Grid.Color = clBlack
        TopAxis.Grid.Style = psSolid
        TopAxis.Grid.Width = 2
        TopAxis.LabelsFont.Height = -13
        TopAxis.LabelsFont.Name = 'Tahoma'
        TopAxis.MinorGrid.Color = clSilver
        TopAxis.MinorGrid.Visible = True
        TopAxis.MinorTickCount = 4
        TopAxis.Visible = False
        View3D = False
        Zoom.Brush.Color = clYellow
        Zoom.Brush.Style = bsSolid
        Zoom.Direction = tzdVertical
        Zoom.Pen.Color = clRed
        Zoom.Pen.Style = psDashDotDot
        Zoom.Pen.Width = 2
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        OnDblClick = DBChart1DblClick
        OnDragDrop = ChartsDragDrop
        OnDragOver = ChartsDragOver
        OnMouseDown = ChartClick
        PrintMargins = (
          37
          15
          37
          15)
        object Series1: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          Title = 'GR'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 0
        end
        object Series2: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          SeriesColor = clMaroon
          Title = 'CALIPER'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 1
        end
        object Series3: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          SeriesColor = 16384
          Title = 'BIT SIZE'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 2
        end
        object Series18: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'SP'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 3
        end
        object ChartTool1: TMarksTipTool
          HideDelay = 3500
          MouseAction = mtmClick
          MouseDelay = 0
          Style = smsXY
        end
        object SandLine: TDrawLineTool
          ClickTolerance = 5
          Lines = <>
          Pen.Color = clMaroon
          Pen.Style = psDot
          Pen.Width = 4
          Series = Series1
          OnDraggedLine = DragLine_Sand
        end
        object ShaleLine: TDrawLineTool
          ClickTolerance = 5
          Lines = <>
          Pen.Color = clMaroon
          Pen.Style = psDot
          Pen.Width = 4
          Series = Series1
          OnDraggedLine = DragLine_Shale
        end
      end
      object DBChart2: TDBChart
        Tag = 2
        Left = 220
        Top = 0
        Width = 130
        Height = 412
        AllowPanning = pmNone
        MarginBottom = 10
        MarginTop = 2
        MarginUnits = muPixels
        Title.Text.Strings = (
          'TDBChart')
        Title.Visible = False
        CustomAxes = <
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Visible = False
            ExactDateTime = False
            Increment = 500.000000000000000000
            Horizontal = True
            OtherSide = True
            Labels = False
            Maximum = -500.000000000000000000
            Minimum = -1000.000000000000000000
            MinorTicks.Visible = False
            PositionUnits = muPixels
            Ticks.Visible = False
            Title.Caption = 'DEPTH'
            Title.Font.Color = 16744448
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = False
            ZPosition = 0.010000000000000000
          end>
        LeftAxis.AxisValuesFormat = '#0.###'
        LeftAxis.ExactDateTime = False
        LeftAxis.Grid.Color = clBlack
        LeftAxis.Grid.Style = psSolid
        LeftAxis.Grid.Width = 2
        LeftAxis.Increment = 1.000000000000000000
        LeftAxis.Inverted = True
        LeftAxis.LabelsFont.Charset = ANSI_CHARSET
        LeftAxis.LabelsFont.Height = -13
        LeftAxis.LabelsFont.Name = 'Tahoma'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsSeparation = 100
        LeftAxis.MaximumOffset = 2
        LeftAxis.MinimumOffset = 2
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorGrid.Visible = True
        LeftAxis.MinorTickCount = 4
        LeftAxis.MinorTicks.Visible = False
        LeftAxis.Ticks.Visible = False
        LeftAxis.TickOnLabelsOnly = False
        Legend.Visible = False
        RightAxis.AxisValuesFormat = '#0.###'
        RightAxis.ExactDateTime = False
        RightAxis.Grid.Visible = False
        RightAxis.Increment = 1.000000000000000000
        RightAxis.Inverted = True
        RightAxis.LabelsFont.Height = -13
        RightAxis.LabelsFont.Name = 'Tahoma'
        RightAxis.LabelsFont.Style = [fsBold]
        RightAxis.LabelsSeparation = 100
        RightAxis.MaximumOffset = 2
        RightAxis.MinimumOffset = 2
        RightAxis.MinorTicks.Visible = False
        RightAxis.Ticks.Visible = False
        TopAxis.Automatic = False
        TopAxis.AutomaticMaximum = False
        TopAxis.AutomaticMinimum = False
        TopAxis.ExactDateTime = False
        TopAxis.Grid.Color = clBlack
        TopAxis.Grid.Style = psSolid
        TopAxis.Grid.Width = 2
        TopAxis.Increment = 1.000000000000000000
        TopAxis.LabelsFont.Color = clWhite
        TopAxis.LabelsFont.Name = 'Tahoma'
        TopAxis.LabelsFont.Style = [fsBold]
        TopAxis.LabelsSize = 1
        TopAxis.Maximum = 1.000000000000000000
        TopAxis.MinorGrid.Color = clSilver
        TopAxis.MinorGrid.Visible = True
        TopAxis.MinorTickCount = 0
        TopAxis.MinorTickLength = 6
        TopAxis.MinorTicks.Color = clWhite
        TopAxis.MinorTicks.Width = 2
        TopAxis.PositionUnits = muPixels
        TopAxis.TickLength = 8
        TopAxis.Ticks.Color = clWhite
        TopAxis.Title.Caption = 'DEPTH'
        TopAxis.Title.Font.Color = 16744448
        TopAxis.Title.Font.Name = 'Tahoma'
        TopAxis.Title.Font.Style = [fsBold]
        TopAxis.Title.Visible = False
        View3D = False
        Zoom.Allow = False
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 1
        OnDragDrop = ChartsDragDrop
        OnDragOver = ChartsDragOver
        object Series4: THorizLineSeries
          ColorEachLine = False
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          SeriesColor = clWhite
          ShowInLegend = False
          VertAxis = aBothVertAxis
          ClickableLine = False
          Dark3D = False
          LinePen.Style = psDashDotDot
          LinePen.SmallDots = True
          LinePen.SmallSpace = 100
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 0
        end
      end
      object DBChart3: TDBChart
        Tag = 3
        Left = 350
        Top = 0
        Width = 220
        Height = 412
        AllowPanning = pmHorizontal
        MarginBottom = 10
        MarginTop = 2
        MarginUnits = muPixels
        Title.Text.Strings = (
          'TDBChart')
        Title.Visible = False
        OnScroll = DBChart3Scroll
        OnUndoZoom = DBChart3UndoZoom
        OnZoom = Zooming
        CustomAxes = <
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = clRed
            Axis.Visible = False
            ExactDateTime = False
            Grid.Color = clSilver
            Grid.Style = psSolid
            Increment = 1.000000000000000000
            Horizontal = True
            OtherSide = True
            Labels = False
            LabelsFont.Color = clRed
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsSize = 12
            Maximum = 1.000000000000000000
            MinorGrid.Color = clSilver
            MinorGrid.Visible = True
            MinorTickCount = 9
            MinorTickLength = 6
            MinorTicks.Color = clRed
            MinorTicks.Width = 2
            MinorTicks.Visible = False
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = clRed
            Ticks.Width = 2
            Ticks.Visible = False
            TickOnLabelsOnly = False
            Title.Caption = 'MSFL'
            Title.Font.Color = clRed
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            TitleSize = 1
            OnDrawLabel = TopAxisDrawLabel
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = clGreen
            ExactDateTime = False
            Grid.Visible = False
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = clGreen
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsSize = 12
            Logarithmic = True
            Maximum = 2000.000000000000000000
            Minimum = 0.100000000000000000
            MinorTickCount = 9
            MinorTickLength = 6
            MinorTicks.Color = clGreen
            MinorTicks.Width = 2
            PositionPercent = -40.000000000000000000
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = clGreen
            Ticks.Width = 2
            Title.Caption = 'LLS'
            Title.Font.Color = clGreen
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = False
            OnDrawLabel = TopAxisDrawLabel
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = 16744448
            ExactDateTime = False
            Grid.Visible = False
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = 16744448
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsFont.Shadow.Visible = False
            LabelsSize = 12
            Logarithmic = True
            Maximum = 2000.000000000000000000
            Minimum = 0.100000000000000000
            MinorTickCount = 9
            MinorTickLength = 6
            MinorTicks.Color = 16744448
            MinorTicks.Width = 2
            PositionPercent = -80.000000000000000000
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = 16744448
            Ticks.Width = 2
            Title.Caption = 'LLD'
            Title.Font.Color = 16744448
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = False
            OnDrawLabel = TopAxisDrawLabel
          end>
        LeftAxis.Axis.Visible = False
        LeftAxis.ExactDateTime = False
        LeftAxis.Grid.Color = clBlack
        LeftAxis.Grid.Style = psSolid
        LeftAxis.Grid.Width = 2
        LeftAxis.Increment = 1.000000000000000000
        LeftAxis.Inverted = True
        LeftAxis.Labels = False
        LeftAxis.LabelsFont.Charset = ANSI_CHARSET
        LeftAxis.LabelsFont.Height = -13
        LeftAxis.LabelsFont.Name = 'Tahoma'
        LeftAxis.LabelsOnAxis = False
        LeftAxis.LabelsSeparation = 100
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorGrid.Visible = True
        LeftAxis.MinorTickCount = 4
        LeftAxis.MinorTicks.Visible = False
        LeftAxis.Ticks.Visible = False
        LeftAxis.TickOnLabelsOnly = False
        Legend.Visible = False
        RightAxis.ExactDateTime = False
        RightAxis.Increment = 1.000000000000000000
        RightAxis.LabelsSeparation = 100
        TopAxis.Automatic = False
        TopAxis.AutomaticMaximum = False
        TopAxis.AutomaticMinimum = False
        TopAxis.Grid.Color = clBlack
        TopAxis.Grid.Style = psSolid
        TopAxis.Grid.Width = 2
        TopAxis.LabelsFont.Height = -13
        TopAxis.LabelsFont.Name = 'Tahoma'
        TopAxis.MinorGrid.Color = clSilver
        TopAxis.MinorGrid.Visible = True
        TopAxis.MinorTickCount = 4
        TopAxis.Visible = False
        View3D = False
        Zoom.Brush.Color = clYellow
        Zoom.Brush.Style = bsSolid
        Zoom.Direction = tzdVertical
        Zoom.Pen.Color = clRed
        Zoom.Pen.Style = psDashDotDot
        Zoom.Pen.Width = 2
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 2
        OnDblClick = DBChart3DblClick
        OnDragDrop = ChartsDragDrop
        OnDragOver = ChartsDragOver
        object Series5: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          SeriesColor = 16744448
          Title = 'MSFL'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 0
          Data = {0000000000}
        end
        object Series6: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          Title = 'LLS'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 1
          Data = {0000000000}
        end
        object Series7: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          SeriesColor = 16744448
          Title = 'LLD'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 2
          Data = {0000000000}
        end
        object ChartTool2: TMarksTipTool
          HideDelay = 3500
          MouseAction = mtmClick
          MouseDelay = 0
          Style = smsXY
        end
      end
      object DBChart4: TDBChart
        Tag = 4
        Left = 570
        Top = 0
        Width = 220
        Height = 412
        AllowPanning = pmHorizontal
        MarginBottom = 10
        MarginTop = 2
        MarginUnits = muPixels
        Title.Text.Strings = (
          'TDBChart')
        Title.Visible = False
        OnScroll = DBChart4Scroll
        OnUndoZoom = DBChart4UndoZoom
        OnZoom = Zooming
        CustomAxes = <
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = 8388863
            Axis.Visible = False
            ExactDateTime = False
            Grid.Color = clBlack
            Grid.Style = psSolid
            Grid.Width = 2
            Increment = 0.600000000000000000
            Inverted = True
            Horizontal = True
            OtherSide = True
            Labels = False
            LabelsFont.Color = 47360
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsSize = 1
            Maximum = 0.450000000000000000
            Minimum = -0.150000000000000000
            MinorGrid.Color = clSilver
            MinorGrid.Visible = True
            MinorTickCount = 4
            MinorTickLength = 6
            MinorTicks.Color = 8388863
            MinorTicks.Width = 2
            MinorTicks.Visible = False
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = 8388863
            Ticks.Width = 2
            Ticks.Visible = False
            TickOnLabelsOnly = False
            Title.Caption = 'RHO'
            Title.Font.Color = 47360
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Title.Shadow.Visible = False
            OnDrawLabel = TopAxisDrawLabel
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = 8421440
            ExactDateTime = False
            Grid.Visible = False
            Increment = 0.600000000000000000
            Inverted = True
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = 8421440
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsSize = 1
            Maximum = 0.450000000000000000
            Minimum = -0.150000001000000000
            MinorTickCount = 4
            MinorTickLength = 6
            MinorTicks.Color = 8421440
            MinorTicks.Width = 2
            PositionPercent = -40.000000000000000000
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = 8421440
            Ticks.Width = 2
            Title.Caption = 'NPHI'
            Title.Font.Color = 8421440
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            OnDrawLabel = TopAxisInverseDrawLabel
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = 16711808
            ExactDateTime = False
            Grid.Visible = False
            Increment = 0.600000000000000000
            Inverted = True
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = 16711808
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsFont.Shadow.Visible = False
            LabelsSize = 1
            Maximum = 0.450000000000000000
            Minimum = -0.150000000000000000
            MinorTickCount = 4
            MinorTickLength = 6
            MinorTicks.Color = 16711808
            MinorTicks.Width = 2
            PositionPercent = -80.000000000000000000
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = 16711808
            Ticks.Width = 2
            Title.Caption = 'PEF'
            Title.Font.Color = 16711808
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            OnDrawLabel = TopAxisDrawLabel
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = 33023
            ExactDateTime = False
            Grid.Visible = False
            Increment = 0.600000000000000000
            Inverted = True
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = 33023
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            Maximum = 0.450000000000000000
            Minimum = -0.150000000000000000
            MinorTickCount = 4
            MinorTickLength = 6
            MinorTicks.Color = 33023
            MinorTicks.Width = 2
            PositionPercent = -120.000000000000000000
            PositionUnits = muPixels
            TickLength = 8
            Ticks.Color = 33023
            Ticks.Width = 2
            Title.Caption = 'DT'
            Title.Font.Color = 33023
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            ExactDateTime = False
            Increment = 0.600000000000000000
            Horizontal = True
            OtherSide = True
            Maximum = 0.450000000000000000
            Minimum = -0.150000000000000000
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            ExactDateTime = False
            Increment = 0.600000000000000000
            Horizontal = True
            OtherSide = True
            Maximum = 0.450000000000000000
            Minimum = -0.150000000000000000
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            ExactDateTime = False
            Increment = 0.600000000000000000
            Horizontal = True
            OtherSide = True
            Maximum = 0.450000000000000000
            Minimum = -0.150000000000000000
          end>
        LeftAxis.Axis.Visible = False
        LeftAxis.ExactDateTime = False
        LeftAxis.Grid.Color = clBlack
        LeftAxis.Grid.Style = psSolid
        LeftAxis.Grid.Width = 2
        LeftAxis.Increment = 1.000000000000000000
        LeftAxis.Inverted = True
        LeftAxis.Labels = False
        LeftAxis.LabelsFont.Charset = ANSI_CHARSET
        LeftAxis.LabelsFont.Height = -13
        LeftAxis.LabelsFont.Name = 'Tahoma'
        LeftAxis.LabelsOnAxis = False
        LeftAxis.LabelsSeparation = 100
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorGrid.Visible = True
        LeftAxis.MinorTickCount = 4
        LeftAxis.MinorTicks.Visible = False
        LeftAxis.Ticks.Visible = False
        LeftAxis.TickOnLabelsOnly = False
        Legend.Visible = False
        RightAxis.ExactDateTime = False
        RightAxis.Increment = 1.000000000000000000
        RightAxis.LabelsSeparation = 100
        TopAxis.Automatic = False
        TopAxis.AutomaticMaximum = False
        TopAxis.AutomaticMinimum = False
        TopAxis.Grid.Color = clBlack
        TopAxis.Grid.Style = psSolid
        TopAxis.Grid.Width = 2
        TopAxis.LabelsFont.Height = -13
        TopAxis.LabelsFont.Name = 'Tahoma'
        TopAxis.MinorGrid.Color = clSilver
        TopAxis.MinorGrid.Visible = True
        TopAxis.MinorTickCount = 4
        TopAxis.Visible = False
        View3D = False
        Zoom.Brush.Color = clYellow
        Zoom.Brush.Style = bsSolid
        Zoom.Direction = tzdVertical
        Zoom.Pen.Color = clRed
        Zoom.Pen.Style = psDashDotDot
        Zoom.Pen.Width = 2
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 3
        OnDblClick = DBChart4DblClick
        OnDragDrop = ChartsDragDrop
        OnDragOver = ChartsDragOver
        object HorizLineSeries1: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          SeriesColor = 47360
          Title = 'RHO'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 0
        end
        object HorizLineSeries2: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          SeriesColor = 8421440
          Title = 'NPHI'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 1
        end
        object HorizLineSeries3: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          SeriesColor = 16711808
          Title = 'PEF'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 2
        end
        object Series31: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          SeriesColor = 33023
          ShowInLegend = False
          Title = 'DT'
          Dark3D = False
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 3
        end
        object Series20: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          SeriesColor = 8421440
          Title = 'PHID_SST'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 4
        end
        object Series21: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          SeriesColor = 8421440
          Title = 'PHID_LST'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 5
        end
        object Series22: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          SeriesColor = 8421440
          Title = 'PHID_DOL'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 6
        end
        object ChartTool3: TMarksTipTool
          HideDelay = 3500
          MouseAction = mtmClick
          MouseDelay = 0
          Style = smsXY
        end
      end
    end
    object ScrollBox2: TScrollBox
      Left = 1
      Top = 1
      Width = 814
      Height = 96
      HorzScrollBar.Smooth = True
      HorzScrollBar.Tracking = True
      VertScrollBar.Smooth = True
      VertScrollBar.Style = ssHotTrack
      VertScrollBar.Tracking = True
      Align = alTop
      TabOrder = 1
      object DBChart5: TDBChart
        Left = 0
        Top = 0
        Width = 220
        Height = 150
        AllowPanning = pmHorizontal
        MarginBottom = 5
        MarginTop = 149
        MarginUnits = muPixels
        Title.Text.Strings = (
          'TDBChart')
        Title.Visible = False
        OnZoom = Zooming
        CustomAxes = <
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = clRed
            ExactDateTime = False
            Grid.Color = clBlack
            Grid.Style = psSolid
            Grid.Width = 2
            Increment = 100.000000000000000000
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = clRed
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsSize = 1
            Maximum = 100.000000000000000000
            MinorGrid.Color = clSilver
            MinorGrid.Visible = True
            MinorTickCount = 4
            MinorTickLength = 6
            MinorTicks.Color = clRed
            MinorTicks.Width = 2
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = clRed
            Ticks.Width = 2
            Title.Caption = '[GR]'
            Title.Font.Color = clRed
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Title.Shadow.Visible = False
            OnDrawLabel = TopAxisDrawLabel
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = clMaroon
            ExactDateTime = False
            Grid.Color = 4210816
            Grid.Visible = False
            Increment = 10.000000000000000000
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = clMaroon
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsSize = 1
            Maximum = 16.000000000000000000
            Minimum = 6.000000000000000000
            MinorTickCount = 4
            MinorTickLength = 6
            MinorTicks.Color = clMaroon
            MinorTicks.Width = 2
            PositionPercent = -40.000000000000000000
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = clMaroon
            Ticks.Width = 2
            Title.Caption = '[CALIPER]'
            Title.Font.Color = clMaroon
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            OnDrawLabel = TopAxisDrawLabel
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = 16384
            ExactDateTime = False
            Grid.Visible = False
            Increment = 16.000000000000000000
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = 16384
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsFont.Shadow.Visible = False
            LabelsSize = 1
            Maximum = 16.000000000000000000
            MinorTickCount = 4
            MinorTickLength = 6
            MinorTicks.Color = 16384
            MinorTicks.Width = 2
            PositionPercent = -80.000000000000000000
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = 16384
            Ticks.Width = 2
            Title.Caption = '[BIT SIZE]'
            Title.Font.Color = 16384
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            OnDrawLabel = TopAxisDrawLabel
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = clBlue
            ExactDateTime = False
            Grid.Visible = False
            Increment = 50.000000000000000000
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = clBlue
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsSize = 1
            Maximum = 25.000000000000000000
            Minimum = -25.000000000000000000
            MinorTickCount = 4
            MinorTickLength = 6
            MinorTicks.Color = clBlue
            MinorTicks.Width = 2
            PositionPercent = -120.000000000000000000
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = clBlue
            Ticks.Width = 2
            TicksInner.Color = clBlue
            Title.Caption = '[SP]'
            Title.Font.Color = clBlue
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            OnDrawLabel = TopAxisDrawLabel
          end>
        LeftAxis.Axis.Visible = False
        LeftAxis.ExactDateTime = False
        LeftAxis.Grid.Color = clBlack
        LeftAxis.Grid.Style = psSolid
        LeftAxis.Grid.Width = 2
        LeftAxis.Increment = 1.000000000000000000
        LeftAxis.Inverted = True
        LeftAxis.Labels = False
        LeftAxis.LabelsFont.Charset = ANSI_CHARSET
        LeftAxis.LabelsFont.Height = -13
        LeftAxis.LabelsFont.Name = 'Tahoma'
        LeftAxis.LabelsOnAxis = False
        LeftAxis.LabelsSeparation = 100
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorGrid.Visible = True
        LeftAxis.MinorTickCount = 4
        LeftAxis.MinorTicks.Visible = False
        LeftAxis.PositionUnits = muPixels
        LeftAxis.Ticks.Visible = False
        LeftAxis.TickOnLabelsOnly = False
        Legend.Visible = False
        RightAxis.ExactDateTime = False
        RightAxis.Increment = 1.000000000000000000
        RightAxis.LabelsSeparation = 100
        TopAxis.Automatic = False
        TopAxis.AutomaticMaximum = False
        TopAxis.AutomaticMinimum = False
        TopAxis.Grid.Color = clBlack
        TopAxis.Grid.Style = psSolid
        TopAxis.Grid.Width = 2
        TopAxis.LabelsFont.Height = -13
        TopAxis.LabelsFont.Name = 'Tahoma'
        TopAxis.MinorGrid.Color = clSilver
        TopAxis.MinorGrid.Visible = True
        TopAxis.MinorTickCount = 4
        TopAxis.Visible = False
        View3D = False
        View3DWalls = False
        Zoom.Direction = tzdVertical
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        OnDblClick = DBChart5DblClick
        object Series8: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 0
        end
        object Series9: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 1
        end
        object Series10: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 2
        end
        object Series19: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 3
        end
      end
      object DBChart6: TDBChart
        Left = 220
        Top = 0
        Width = 130
        Height = 150
        AllowPanning = pmNone
        MarginBottom = 5
        MarginTop = 149
        MarginUnits = muPixels
        Title.Text.Strings = (
          'TDBChart')
        Title.Visible = False
        CustomAxes = <
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            ExactDateTime = False
            Increment = 500.000000000000000000
            Horizontal = True
            OtherSide = True
            Labels = False
            LabelsSize = 10
            Maximum = -500.000000000000000000
            Minimum = -1000.000000000000000000
            MinorTicks.Visible = False
            PositionUnits = muPixels
            Ticks.Visible = False
            Title.Caption = 'DEPTH'
            Title.Font.Color = 16744448
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            ZPosition = 0.010000000000000000
            OnDrawLabel = TopAxisDrawLabel
          end>
        LeftAxis.ExactDateTime = False
        LeftAxis.Grid.Color = clBlack
        LeftAxis.Grid.Style = psSolid
        LeftAxis.Grid.Width = 2
        LeftAxis.Increment = 1.000000000000000000
        LeftAxis.Inverted = True
        LeftAxis.Labels = False
        LeftAxis.LabelsFont.Charset = ANSI_CHARSET
        LeftAxis.LabelsFont.Height = -13
        LeftAxis.LabelsFont.Name = 'Tahoma'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsSeparation = 100
        LeftAxis.MaximumOffset = 2
        LeftAxis.MinimumOffset = 2
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorGrid.Visible = True
        LeftAxis.MinorTickCount = 4
        LeftAxis.MinorTicks.Visible = False
        LeftAxis.Ticks.Visible = False
        LeftAxis.TickOnLabelsOnly = False
        LeftAxis.Visible = False
        Legend.Visible = False
        RightAxis.ExactDateTime = False
        RightAxis.Grid.Visible = False
        RightAxis.Increment = 1.000000000000000000
        RightAxis.Inverted = True
        RightAxis.Labels = False
        RightAxis.LabelsFont.Height = -13
        RightAxis.LabelsFont.Name = 'Tahoma'
        RightAxis.LabelsFont.Style = [fsBold]
        RightAxis.LabelsSeparation = 100
        RightAxis.MaximumOffset = 2
        RightAxis.MinimumOffset = 2
        RightAxis.MinorTicks.Visible = False
        RightAxis.Ticks.Visible = False
        TopAxis.Automatic = False
        TopAxis.AutomaticMaximum = False
        TopAxis.AutomaticMinimum = False
        TopAxis.ExactDateTime = False
        TopAxis.Grid.Color = clBlack
        TopAxis.Grid.Style = psSolid
        TopAxis.Grid.Width = 2
        TopAxis.Increment = 1.000000000000000000
        TopAxis.LabelsFont.Color = clWhite
        TopAxis.LabelsFont.Name = 'Tahoma'
        TopAxis.LabelsFont.Style = [fsBold]
        TopAxis.LabelsSize = 1
        TopAxis.Maximum = 1.000000000000000000
        TopAxis.MinorGrid.Color = clSilver
        TopAxis.MinorGrid.Visible = True
        TopAxis.MinorTickCount = 0
        TopAxis.MinorTickLength = 6
        TopAxis.MinorTicks.Color = clWhite
        TopAxis.MinorTicks.Width = 2
        TopAxis.PositionUnits = muPixels
        TopAxis.TickLength = 8
        TopAxis.Ticks.Color = clWhite
        TopAxis.Title.Font.Color = 16744448
        TopAxis.Title.Font.Name = 'Tahoma'
        TopAxis.Title.Font.Style = [fsBold]
        View3D = False
        View3DWalls = False
        Zoom.Allow = False
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 1
        object Series11: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 0
        end
      end
      object DBChart7: TDBChart
        Left = 350
        Top = 0
        Width = 220
        Height = 150
        AllowPanning = pmHorizontal
        MarginBottom = 5
        MarginTop = 149
        MarginUnits = muPixels
        Title.Text.Strings = (
          'TDBChart')
        Title.Visible = False
        OnZoom = Zooming
        CustomAxes = <
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = 16744448
            ExactDateTime = False
            Grid.Color = clSilver
            Grid.Style = psSolid
            Increment = 1.000000000000000000
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = 16744448
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsSize = 1
            Maximum = 1.000000000000000000
            MinorGrid.Color = clSilver
            MinorGrid.Visible = True
            MinorTickCount = 9
            MinorTickLength = 6
            MinorTicks.Color = 16744448
            MinorTicks.Width = 2
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = 16744448
            Ticks.Width = 2
            Title.Caption = '[S_VOL]'
            Title.Font.Color = 16744448
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            TitleSize = 1
            OnDrawLabel = TopAxisDrawLabel
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = clGreen
            ExactDateTime = False
            Grid.Visible = False
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = clGreen
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsSize = 1
            Logarithmic = True
            Maximum = 2000.000000000000000000
            Minimum = 0.100000000000000000
            MinorTickCount = 9
            MinorTickLength = 6
            MinorTicks.Color = clGreen
            MinorTicks.Width = 2
            PositionPercent = -40.000000000000000000
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = clGreen
            Ticks.Width = 2
            Title.Caption = '[LLS]'
            Title.Font.Color = clGreen
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = False
            OnDrawLabel = TopAxisDrawLabel
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = 16744448
            ExactDateTime = False
            Grid.Visible = False
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = 16744448
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsFont.Shadow.Visible = False
            LabelsSize = 1
            Logarithmic = True
            Maximum = 2000.000000000000000000
            Minimum = 0.100000000000000000
            MinorTickCount = 9
            MinorTickLength = 6
            MinorTicks.Color = 16744448
            MinorTicks.Width = 2
            PositionPercent = -80.000000000000000000
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = 16744448
            Ticks.Width = 2
            Title.Caption = '[LLD]'
            Title.Font.Color = 16744448
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = False
            OnDrawLabel = TopAxisDrawLabel
          end>
        LeftAxis.Axis.Visible = False
        LeftAxis.ExactDateTime = False
        LeftAxis.Grid.Color = clBlack
        LeftAxis.Grid.Style = psSolid
        LeftAxis.Grid.Width = 2
        LeftAxis.Increment = 1.000000000000000000
        LeftAxis.Inverted = True
        LeftAxis.Labels = False
        LeftAxis.LabelsFont.Charset = ANSI_CHARSET
        LeftAxis.LabelsFont.Height = -13
        LeftAxis.LabelsFont.Name = 'Tahoma'
        LeftAxis.LabelsOnAxis = False
        LeftAxis.LabelsSeparation = 100
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorGrid.Visible = True
        LeftAxis.MinorTickCount = 4
        LeftAxis.MinorTicks.Visible = False
        LeftAxis.Ticks.Visible = False
        LeftAxis.TickOnLabelsOnly = False
        Legend.Visible = False
        RightAxis.ExactDateTime = False
        RightAxis.Increment = 1.000000000000000000
        RightAxis.LabelsSeparation = 100
        TopAxis.Automatic = False
        TopAxis.AutomaticMaximum = False
        TopAxis.AutomaticMinimum = False
        TopAxis.Grid.Color = clBlack
        TopAxis.Grid.Style = psSolid
        TopAxis.Grid.Width = 2
        TopAxis.LabelsFont.Height = -13
        TopAxis.LabelsFont.Name = 'Tahoma'
        TopAxis.MinorGrid.Color = clSilver
        TopAxis.MinorGrid.Visible = True
        TopAxis.MinorTickCount = 4
        TopAxis.Visible = False
        View3D = False
        View3DWalls = False
        Zoom.Brush.Color = clYellow
        Zoom.Brush.Style = bsSolid
        Zoom.Direction = tzdVertical
        Zoom.Pen.Color = clRed
        Zoom.Pen.Style = psDashDotDot
        Zoom.Pen.Width = 2
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 2
        OnDblClick = DBChart7DblClick
        object Series12: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 0
        end
        object Series13: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 1
        end
        object Series14: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 2
        end
      end
      object DBChart8: TDBChart
        Left = 570
        Top = 0
        Width = 220
        Height = 150
        AllowPanning = pmHorizontal
        MarginBottom = 5
        MarginTop = 149
        MarginUnits = muPixels
        Title.Text.Strings = (
          'TDBChart')
        Title.Visible = False
        OnZoom = Zooming
        CustomAxes = <
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = 47360
            ExactDateTime = False
            Grid.Color = clBlack
            Grid.Style = psSolid
            Grid.Width = 2
            Grid.Visible = False
            Increment = 0.600000000000000000
            Inverted = True
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = 47360
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsSize = 1
            Maximum = 0.450000000000000000
            Minimum = -0.150000000000000000
            MinorGrid.Color = clSilver
            MinorGrid.Visible = True
            MinorTickCount = 4
            MinorTickLength = 6
            MinorTicks.Color = 47360
            MinorTicks.Width = 2
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = 47360
            Ticks.Width = 2
            Title.Caption = '[DPHI_SST]'
            Title.Font.Color = 47360
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Title.Shadow.Visible = False
            OnDrawLabel = TopAxisInverseDrawLabel
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = 8421440
            ExactDateTime = False
            Grid.Visible = False
            Increment = 0.600000000000000000
            Inverted = True
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = clGreen
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsSize = 1
            Maximum = 0.450000000000000000
            Minimum = -0.150000001000000000
            MinorTickCount = 4
            MinorTickLength = 6
            MinorTicks.Color = 8421440
            MinorTicks.Width = 2
            PositionPercent = -40.000000000000000000
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = 8421440
            Ticks.Width = 2
            Title.Caption = '[DPHI_LST]'
            Title.Font.Color = 8421440
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            OnDrawLabel = TopAxisInverseDrawLabel
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = 16711808
            ExactDateTime = False
            Grid.Visible = False
            Increment = 0.600000000000000000
            Inverted = True
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = 16744448
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsFont.Shadow.Visible = False
            LabelsSize = 1
            Maximum = 0.450000000000000000
            Minimum = -0.150000000000000000
            MinorTickCount = 4
            MinorTickLength = 6
            MinorTicks.Color = 16711808
            MinorTicks.Width = 2
            PositionPercent = -80.000000000000000000
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = 16711808
            Ticks.Width = 2
            Title.Caption = '[DPHI_DOL]'
            Title.Font.Color = 16711808
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            OnDrawLabel = TopAxisInverseDrawLabel
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            Axis.Color = 33023
            ExactDateTime = False
            Grid.Visible = False
            Increment = 0.600000000000000000
            Inverted = True
            Horizontal = True
            OtherSide = True
            LabelsFont.Color = 33023
            LabelsFont.Name = 'Tahoma'
            LabelsFont.Style = [fsBold]
            LabelsSize = 1
            Maximum = 0.450000000000000000
            Minimum = -0.150000000000000000
            MinorTickCount = 4
            MinorTickLength = 6
            MinorTicks.Color = 33023
            MinorTicks.Width = 2
            PositionPercent = -120.000000000000000000
            PositionUnits = muPixels
            RoundFirstLabel = False
            TickLength = 8
            Ticks.Color = 33023
            Ticks.Width = 2
            Title.Caption = '[NPHI]'
            Title.Font.Color = 33023
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            OnDrawLabel = TopAxisInverseDrawLabel
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            ExactDateTime = False
            Increment = 0.600000000000000000
            Horizontal = True
            OtherSide = True
            Maximum = 0.450000000000000000
            Minimum = -0.150000000000000000
            PositionPercent = -160.000000000000000000
            PositionUnits = muPixels
            Visible = False
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            ExactDateTime = False
            Increment = 0.600000000000000000
            Horizontal = True
            OtherSide = True
            Maximum = 0.450000000000000000
            Minimum = -0.150000000000000000
            PositionPercent = -200.000000000000000000
            PositionUnits = muPixels
            Visible = False
          end
          item
            Automatic = False
            AutomaticMaximum = False
            AutomaticMinimum = False
            ExactDateTime = False
            Increment = 0.600000000000000000
            Horizontal = True
            OtherSide = True
            Maximum = 0.450000000000000000
            Minimum = -0.150000000000000000
            PositionPercent = -240.000000000000000000
            PositionUnits = muPixels
            Visible = False
          end>
        LeftAxis.Axis.Visible = False
        LeftAxis.ExactDateTime = False
        LeftAxis.Grid.Color = clBlack
        LeftAxis.Grid.Style = psSolid
        LeftAxis.Grid.Width = 2
        LeftAxis.Increment = 1.000000000000000000
        LeftAxis.Inverted = True
        LeftAxis.Labels = False
        LeftAxis.LabelsFont.Charset = ANSI_CHARSET
        LeftAxis.LabelsFont.Height = -13
        LeftAxis.LabelsFont.Name = 'Tahoma'
        LeftAxis.LabelsOnAxis = False
        LeftAxis.LabelsSeparation = 100
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorGrid.Visible = True
        LeftAxis.MinorTickCount = 4
        LeftAxis.MinorTicks.Visible = False
        LeftAxis.Ticks.Visible = False
        LeftAxis.TickOnLabelsOnly = False
        LeftAxis.Visible = False
        Legend.Visible = False
        RightAxis.ExactDateTime = False
        RightAxis.Increment = 1.000000000000000000
        RightAxis.LabelsSeparation = 100
        RightAxis.Visible = False
        TopAxis.Automatic = False
        TopAxis.AutomaticMaximum = False
        TopAxis.AutomaticMinimum = False
        TopAxis.Grid.Color = clBlack
        TopAxis.Grid.Style = psSolid
        TopAxis.Grid.Width = 2
        TopAxis.LabelsFont.Height = -13
        TopAxis.LabelsFont.Name = 'Tahoma'
        TopAxis.MinorGrid.Color = clSilver
        TopAxis.MinorGrid.Visible = True
        TopAxis.MinorTickCount = 4
        TopAxis.Visible = False
        View3D = False
        View3DWalls = False
        Zoom.Brush.Color = clYellow
        Zoom.Brush.Style = bsSolid
        Zoom.Direction = tzdVertical
        Zoom.Pen.Color = clRed
        Zoom.Pen.Style = psDashDotDot
        Zoom.Pen.Width = 2
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 3
        OnDblClick = DBChart8DblClick
        object Series15: THorizLineSeries
          Depth = 0
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          SeriesColor = 8388863
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 0
          Data = {0000000000}
        end
        object Series16: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          SeriesColor = 8421440
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 1
          Data = {0000000000}
        end
        object Series17: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          SeriesColor = 16711808
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 2
          Data = {0000000000}
        end
        object Series30: THorizLineSeries
          HorizAxis = aCustomHorizAxis
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = False
          SeriesColor = 33023
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
          CustomHorizAxis = 3
          Data = {0000000000}
        end
      end
    end
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 43
    Width = 29
    Height = 519
    Align = alLeft
    Caption = 'ToolBar2'
    Color = clWhite
    ParentColor = False
    TabOrder = 3
  end
  object MainMenu1: TMainMenu
    Images = ImageList1
    Left = 112
    Top = 128
    object File1: TMenuItem
      Caption = 'File'
      object Open1: TMenuItem
        Caption = 'Open'
        ImageIndex = 3
        Visible = False
        object LAS1: TMenuItem
          Caption = 'LAS File'
          ImageIndex = 13
          OnClick = LAS1Click
        end
        object ASCIIFile1: TMenuItem
          Caption = 'ASCII File'
          ImageIndex = 15
          OnClick = ASCIIFile1Click
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'E&xit'
        ImageIndex = 0
        ShortCut = 16472
        OnClick = Exit1Click
      end
    end
    object General1: TMenuItem
      Caption = 'View'
      object ChangeScale1: TMenuItem
        Caption = 'Change &Scale'
        ImageIndex = 1
        OnClick = ChangeScale1Click
      end
      object MoveTracks1: TMenuItem
        Caption = 'Move Tracks'
        ImageIndex = 2
        OnClick = MoveTracks1Click
      end
    end
    object ools1: TMenuItem
      Caption = 'Tools'
      object PickSandLine1: TMenuItem
        Caption = 'Pick Sand Line'
        OnClick = PickSandLine1Click
      end
      object PickShaleLine1: TMenuItem
        Caption = 'Pick Shale Line'
        OnClick = PickShaleLine1Click
      end
    end
    object Calculation1: TMenuItem
      Caption = 'Calculation'
      object ShaleSandVolumes1: TMenuItem
        Caption = 'Shale-Sand Volumes'
        OnClick = ShaleSandVolumes1Click
      end
      object Porosity1: TMenuItem
        Caption = 'Porosity'
        OnClick = Porosity1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'LAS'
    Filter = 'LAS files|*.LAS'
    Options = [ofOverwritePrompt, ofPathMustExist, ofFileMustExist, ofCreatePrompt, ofShareAware, ofEnableSizing]
    Title = 'Open LAS file'
    Left = 144
    Top = 272
  end
  object ChartEditor1: TChartEditor
    Chart = DBChart1
    HideTabs = [cetExportNative]
    RememberPosition = True
    Title = 'Edit Track Properties'
    Left = 144
    Top = 112
  end
  object ChartPreviewer1: TChartPreviewer
    Options = [cpoChangePrinter, cpoSetupPrinter, cpoResizeChart, cpoMoveChart, cpoChangeDetail, cpoChangePaperOrientation, cpoChangeMargins, cpoProportional, cpoPrintPanel]
    Title = 'Print Preview'
    Left = 144
    Top = 144
  end
  object ImageList2: TImageList
    Height = 32
    Width = 32
    Left = 144
    Top = 208
    Bitmap = {
      494C010103000400040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007AB900007AB9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000092DC006BC6FF00007AB9000092DC000092
      DC00007AB9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00EEEEEE00EEEEEE00888888000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000092DC006BC6FF006BC6FF006BC6FF00007AB9000092DC000092
      DC000092DC000092DC00007AB900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE008888880000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006BC6FF006BC6FF006BC6FF006BC6FF006BC6FF00007AB9000092DC000092
      DC000092DC000092DC000092DC000092DC00007AB90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00BBBBBB00BBBBBB00EEEEEE0088888800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006BC6FF006BC6FF006BC6FF006BC6FF006BC6FF00006296000092DC000092
      DC000092DC000092DC000092DC000092DC000092DC0000000000B97A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00888888000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006BC6FF006BC6FF006BC6FF006BC6FF006BC6FF00006296000092DC000092
      DC000092DC000092DC000092DC000092DC000092DC0000000000B97A0000B97A
      0000B97A00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00EEEEEE00EEEEEE00EEEEEE00EEEEEE00BBBBBB00BBBBBB00EEEEEE008888
      8800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006BC6FF006BC6FF006BC6FF0048B8FF0048B8FF00004A73000092DC000092
      DC000092DC000092DC000092DC000092DC000092DC0000000000B97A0000B97A
      0000B97A000000000000007AB900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00EEEEEE00BBBBBB00BBBBBB00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00888888000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007C20F5037A1DFF00781421000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000048B8FF0048B8FF0025AAFF0025AAFF0000AAFF00004A7300006296000092
      DC000092DC000092DC000092DC000092DC000092DC0000000000B97A0000B97A
      0000B97A0000000000000092DC000092DC00007AB90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00EEEEEE00EEEEEE00EEEEEE00EEEEEE00BBBBBB00BBBB
      BB00EEEEEE008888880000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000001822AF542A05EFF007A1EE4007818270000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000025AAFF0025AAFF000092DC000092DC000092DC0000000000000000000092
      DC000092DC000092DC000092DC000092DC000092DC0000000000B97A0000B97A
      0000B97A0000000000000092DC000092DC000092DC000092DC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE0088888800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002096
      50FE1A9048FE148E42FE0F8A3AFE399E5DFF7FC095FF45A261FF007C1EE70078
      182A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000092DC000092DC00007AB900007AB90000000000000000000055FF000000
      00000092DC000092DC000092DC000092DC000092DC0000000000B97A0000B97A
      0000B97A0000000000000092DC000092DC000092DC000092DC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00BBBBBB00BBBBBB00EEEEEE00888888000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000289A
      5AFF8FCAA8FF8CC8A4FF89C5A0FF87C49DFF69B584FF81C196FF47A465FF007C
      20EA00781A300000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007AB900007AB90000000000000000000055FF000055FF000055FF000000
      00000092DC000092DC000092DC000092DC000092DC000092DC00000000000000
      0000B97A0000000000000092DC000092DC000092DC000092DC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00EEEEEE00BBBBBB00BBBB
      BB00EEEEEE00EEEEEE00EEEEEE00EEEEEE008888880000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000309E
      62FF93CDACFF6EB98DFF6AB788FF65B584FF60B27FFF66B481FF82C197FF3B9F
      5BFF007E24FC0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000055FF000055FF000055FF000055FF004873FF004873
      FF00000000000092DC000092DC000092DC000092DC000092DC000092DC000092
      DC0000000000000000000092DC000092DC000092DC000092DC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00BBBBBB00BBBBBB00EEEEEE0088888800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000036A2
      6AFF95CEAFFF93CDACFF90CBA9FF8FCBA7FF73BB8FFF89C7A0FF45A467FF0786
      34FD01822C0F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000055FF000055FF000055FF000055FF004873FF004873FF00003DB900003D
      B900000000000092DC000092DC000092DC000092DC000092DC000092DC000092
      DC000092DC000092DC000092DC000092DC000092DC000092DC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00888888000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003CA4
      6EFF36A26CFD32A066FD2E9C60FD54AE7BFF90CBA9FF4EAA73FF168E44FD118A
      3C0C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000055FF000055
      FF000055FF004873FF004873FF004873FF00003DB900003DB9000049DC000049
      DC000049DC00000000000092DC000092DC000092DC000092DC000092DC000092
      DC000092DC000092DC000092DC000092DC000092DC000092DC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00EEEEEE00EEEEEE00EEEEEE00EEEEEE00BBBBBB00BBBBBB00EEEEEE008888
      8800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002C9C
      5E09309E64FF36A26AF500000000309E62F559B280FF309E64FF1E944E090000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004873
      FF004873FF00003DB900003DB900003DB9000049DC000049DC000049DC000049
      DC000049DC00000000000092DC000092DC000092DC000092DC000092DC000092
      DC000092DC000092DC000092DC000092DC000092DC000092DC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00EEEEEE00BBBBBB00BBBBBB00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00888888000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001E944E092797
      56FF59B280FF309E62F50000000036A26AF5309E64FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000003D
      B900003DB9000049DC000049DC000049DC000049DC000049DC000049DC000049
      DC000055FF004873FF00000000000092DC000092DC000092DC000092DC000092
      DC000092DC000092DC000092DC000092DC000092DC000062960000000000003D
      B900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00EEEEEE00EEEEEE00EEEEEE00EEEEEE00BBBBBB00BBBB
      BB00EEEEEE008888880000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000118A3C0C168E44FD4EAA
      73FF90CBA9FF54AE7BFF2E9C60FD32A066FD36A26CFD3CA46EFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000049DC000049DC000049DC000049DC000049DC000049DC000055FF004873
      FF00003DB900003DB900000000000092DC000092DC000092DC000092DC000092
      DC000092DC000092DC000092DC000092DC000062960000000000003DB9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE0088888800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000001822C0F078634FD45A467FF89C7
      A0FF73BB8FFF8FCBA7FF90CBA9FF93CDACFF95CEAFFF36A26AFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000049DC000049DC000049DC000055FF004873FF004873FF00003DB900003D
      B9000049DC000049DC000049DC00000000000092DC000092DC000092DC000092
      DC000092DC000092DC000092DC000062960000000000003DB900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00BBBBBB00BBBBBB00EEEEEE00888888000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007E24FC3B9F5BFF82C197FF66B4
      81FF60B27FFF65B584FF6AB788FF6EB98DFF93CDACFF309E62FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000055FF004873FF00003DB900003DB900003DB9000049DC000049
      DC000049DC000049DC000049DC00000000000092DC000092DC000092DC000092
      DC000092DC000092DC000062960000000000003DB90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00EEEEEE00BBBBBB00BBBB
      BB00EEEEEE00EEEEEE00EEEEEE00EEEEEE008888880000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000781A30007C20EA47A465FF81C1
      96FF69B584FF87C49DFF89C5A0FF8CC8A4FF8FCAA8FF289A5AFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000003DB900003DB9000049DC000049DC000049DC000049DC000049
      DC000049DC000049DC000055FF000055FF00000000000092DC000092DC000092
      DC000092DC000062960000000000003DB9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00BBBBBB00BBBBBB00EEEEEE0088888800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000078182A007C1EE745A2
      61FF7FC095FF399E5DFF0F8A3AFE148E42FE1A9048FE209650FE000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000049DC000049DC000049DC000049DC000049DC000049
      DC000055FF000055FF00003DB900003DB900000000000092DC000092DC000092
      DC000062960000000000003DB900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00888888000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000781827007A
      1EE442A05EFF01822AF500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000049DC000049DC000049DC000055FF000055FF000055
      FF00003DB900003DB9000049DC000049DC000049DC00000000000092DC000062
      960000000000003DB90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00EEEEEE00EEEEEE00EEEEEE00EEEEEE00BBBBBB00BBBBBB00EEEEEE008888
      8800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000078
      1421037A1DFF007C20F500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000055FF000055FF00003DB900003DB900003D
      B9000049DC000049DC000049DC000049DC000049DC0000000000006296000000
      0000003DB9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00EEEEEE00BBBBBB00BBBBBB00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00888888000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003DB900003DB9000049DC000049DC000049
      DC000049DC000049DC000049DC000049DC000055FF000055FF0000000000003D
      B900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00EEEEEE00EEEEEE00EEEEEE00EEEEEE00BBBBBB00BBBB
      BB00EEEEEE008888880000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000049DC000049DC000049DC000049
      DC000049DC000049DC000055FF000055FF00003DB900003DB9000049DC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE0088888800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000049DC000049DC000049DC000055
      FF000055FF000055FF00003DB900003DB9000049DC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00EEEEEE00EEEEEE00444444004444
      4400EEEEEE00EEEEEE00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000055FF000055FF00003D
      B900003DB900003DB9000049DC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000003DB900003DB9000049
      DC000049DC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00EEEEEE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF00000000
      FF9FFFFFF9FFFFFFFFFFFFFF00000000FE07FFFFE0FFFFFFFFFFFFFF00000000
      F801FFFF807FFFFFFFFFFFFF00000000E0007FFF003FFFFFFFFFFFFF00000000
      E0001FFF001FFFFFFFFFFFFF00000000E00007FF800FFFFFFFFFFFFF00000000
      E00001FFC007FFFFFFFFFFFF00000000E000007FE003FFFFFFFE3FFF00000000
      E000001FF001FFFFFFFE1FFF00000000E000001FF800FFFFFFE00FFF00000000
      E000001FFC007FFFFFE007FF00000000E000001FFE003FFFFFE007FF00000000
      E000001FFF001FFFFFE007FF00000000C000001FFF800FFFFFE00FFF00000000
      8000001FFFC007FFFFE21FFF00000000C000000FFFE003FFFFC27FFF00000000
      C0000007FFF001FFFF803FFF00000000E000000FFFF800FFFF003FFF00000000
      E000001FFFFC007FFF003FFF00000000F000003FFFFE003FFF003FFF00000000
      F000007FFFFF001FFF803FFF00000000F80000FFFFFF800FFFC3FFFF00000000
      F80001FFFFFFC007FFE3FFFF00000000FC0003FFFFFFE003FFFFFFFF00000000
      FC0007FFFFFFF001FFFFFFFF00000000FE000FFFFFFFF800FFFFFFFF00000000
      FE001FFFFFFFFC00FFFFFFFF00000000FF007FFFFFFFFE01FFFFFFFF00000000
      FF01FFFFFFFFFF07FFFFFFFF00000000FF87FFFFFFFFFF9FFFFFFFFF00000000
      FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object PrintDialog1: TPrintDialog
    Options = [poPageNums, poSelection, poHelp]
    Left = 144
    Top = 240
  end
  object DataSource2: TDataSource
    Left = 112
    Top = 264
  end
  object DataSource1: TDataSource
    Left = 112
    Top = 296
  end
  object Litholog: TTable
    StoreDefs = True
    Left = 113
    Top = 191
    object LithologDEPTH: TFloatField
      FieldName = 'DEPTH'
    end
    object LithologSST: TFloatField
      FieldName = 'SST'
    end
    object LithologSHL: TFloatField
      FieldName = 'SHL'
    end
    object LithologLST: TFloatField
      FieldName = 'LST'
    end
    object LithologDOL: TFloatField
      FieldName = 'DOL'
    end
    object LithologGPS: TFloatField
      FieldName = 'GPS'
    end
    object LithologANH: TFloatField
      FieldName = 'ANH'
    end
  end
  object DataSource3: TDataSource
    DataSet = Litholog
    Left = 113
    Top = 223
  end
  object ImageList1: TImageList
    Left = 144
    Top = 176
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000135C
      9400105991000D578F00135B91000C568E0052A759FF50A557FF4EA255FF4DA0
      53FF4B9E51FF000000000000000000000000000000000000000000000000418F
      45FF408D44FF3F8C42FF3E8A41FF3D8940FF0000000000000000000000000000
      0000000000000000000000000000007C20F5037A1DFF00781421000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009898980070707000535353005050
      50004E4E4E004B4B4B0049494900464646004444440024669C003173A7003C7B
      AE004683B4004D89B9003D7DAC000C568E0053AA5BFF82BE88FF7CBA82FF53A5
      5AFFE9EFE7FF0000000000000000000000000000000000000000000000000000
      0000418F45FF6CAC70FF6DAD72FF3E8B41FF0000000000000000000000000000
      000000000000000000000000000001822AF542A05EFF007A1EE4007818270000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000057575700A1A1
      A100A1A1A100A2A2A200A3A3A300A3A3A300A4A4A4002E6EA40077AAD20077AA
      D30072A6D100689FCD003F7EAD000F58900055AC5EFF82BF89FF72B679FF6BB3
      72FF4EA356FF4CA053FF00000000000000000000000000000000000000004594
      49FF599F5DFF5DA563FF6BAC6FFF3F8C43FF0000000000000000000000002096
      50FE1A9048FE148E42FE0F8A3AFE399E5DFF7FC095FF45A261FF007C1EE70078
      182A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005B5B5B00A0A0
      A0003B723F009FA0A000A2A2A200A2A2A200A3A3A3003573A9007CAED4005A99
      C9005394C7005795C800407FAD00135B930057AF60FF56AD5EFF6BB572FF83BF
      89FF6DB473FF4FA255FF0000000000000000000000000000000047974BFF5CA4
      60FF74B278FF5EA362FF46934BFF408E44FF000000000000000000000000289A
      5AFF8FCAA8FF8CC8A4FF89C5A0FF87C49DFF69B584FF81C196FF47A465FF007C
      20EA00781A300000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005F5F5F009F9F
      9F003C75400035703800A1A1A100A1A1A100A2A2A2003C78AF0081B2D700619E
      CC005999C9005D9ACA004280AE00185F970059B262FF0000000057AE5FFF6BB5
      72FF69B370FF50A557FF00000000000000000000000000000000489A4EFF5EA6
      63FF61A766FF449348FFAFB6AFFF429046FF000000000000000000000000309E
      62FF93CDACFF6EB98DFF6AB788FF65B584FF60B27FFF66B481FF82C197FF3B9F
      5BFF007E24FC0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000036813D00337D3A00307836002D74
      330048904F00458E4B0038723C00A0A0A000A1A1A100447DB30087B6D90066A2
      CF00609DCC00629ECC004482B0001E639B0000000000000000000000000055AD
      5EFF53AB5CFF000000000000000000000000000000000000000000000000499A
      4FFF46974DFF46954AFF000000000000000000000000000000000000000036A2
      6AFF95CEAFFF93CDACFF90CBA9FF8FCBA7FF73BB8FFF89C7A0FF45A467FF0786
      34FD01822C0F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003A86410088CB910083C88C007FC5
      87007AC2820076C07E00468E4C003A733E00A0A0A0004B83B9008CBADB006DA7
      D10065A5D1005EB3DF004684B0002468A0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003CA4
      6EFF36A26CFD32A066FD2E9C60FD54AE7BFF90CBA9FF4EAA73FF168E44FD118A
      3C0C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003D8A45008ECE98007CC5860077C2
      800072BF7B0073BF7B0078C18000488F4E00537E56005388BE0093BEDD0074AC
      D40062B7E1004AD4FF00418AB7002B6DA5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002C9C
      5E09309E64FF36A26AF500000000309E62F559B280FF309E64FF1E944E090000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000408F490093D29E0090D099008CCD
      950088CB910083C88C0050975700407B45009E9E9E00598DC30097C2E0007BB2
      D70073AED6005DC3ED004A87B2003372AA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001E944E092797
      56FF59B280FF309E62F50000000036A26AF5309E64FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000043934C0041904A003E8C47003C88
      44005CA36400599F600044824A009D9D9D009D9D9D005F91C9009DC7E20082B7
      DA007CB3D7007DB2D7004E88B3003A78B0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000118A3C0C168E44FD4EAA
      73FF90CBA9FF54AE7BFF2E9C60FD32A066FD36A26CFD3CA46EFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000767676009999
      99003C89440048894E009B9B9B009C9C9C009C9C9C006595CC00A1CBE30088BC
      DC0082B8DA0083B8DA00508AB400427DB50000000000000000005FBB6AFF5EBA
      69FF5DB867FF00000000000000000000000000000000000000000000000052A8
      59FF51A658FF00000000000000000000000001822C0F078634FD45A467FF89C7
      A0FF73BB8FFF8FCBA7FF90CBA9FF93CDACFF95CEAFFF36A26AFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000797979009898
      980051905800989998009A9A9A009B9B9B009B9B9B006B99D000A6CEE5008EC0
      DF0088BCDC008ABCDC00528CB5004A83BB0064C26FFFF0F9F1FF61BD6CFF7FC9
      88FF78C381FF5DB768FF0000000000000000000000000000000056AD5DFF6DB7
      74FF6BB472FF52A75AFF000000004DA154FF007E24FC3B9F5BFF82C197FF66B4
      81FF60B27FFF65B584FF6AB788FF6EB98DFF93CDACFF309E62FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007C7C7C009898
      98009898980099999900999999009A9A9A009A9A9A006E9CD300A9D1E700AAD1
      E70097C7E10090C1DE00558EB6005188C00065C371FF6AC474FF82CC8BFF9AD3
      A3FF7AC783FF5EBA6AFF0000000000000000000000000000000058AF5FFF74BC
      7CFF8BC792FF6CB572FF51A658FF4FA456FF00781A30007C20EA47A465FF81C1
      96FF69B584FF87C49DFF89C5A0FF8CC8A4FF8FCAA8FF289A5AFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007D7D
      7D007B7B7B0079797900767676007474740071717100709DD4006E9DD60086B1
      DC00AAD3E800A8D0E600578FB700588DC50066C572FF9CD6A4FF91D19AFF7DCA
      86FF63BF6EFF000000000000000000000000000000000000000059B262FF58B0
      60FF75BC7DFF7DBF85FF89C48FFF51A759FF000000000078182A007C1EE745A2
      61FF7FC095FF399E5DFF0F8A3AFE148E42FE1A9048FE209650FE000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006F9D
      D6006C9BD40084B0DA005990B8005F92CB0067C773FFA0D8A8FF9DD6A6FF64C2
      70FF00000000000000000000000000000000000000000000000000000000CF96
      66FF5EB366FF8CC893FF8DC994FF53A95BFF000000000000000000781827007A
      1EE442A05EFF01822AF500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006C9BD4006999D2006596CF0067C773FF67C773FF66C572FF65C4
      71FF64C270FF0000000000000000000000000000000000000000000000005BB5
      65FF5AB363FF58B161FF57AE5FFF55AC5DFF0000000000000000000000000078
      1421037A1DFF007C20F500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFE007E0FE3F0000000007F0FE1F0000
      C00003E0E00F0000C00003C0E0070000C00043C0E00700000000E7E3E0070000
      0000FFFFE00F00000000FFFFE21F00000000FFFFC27F00000000FFFF803F0000
      C000C7E7003F0000C00003C2003F0000C00003C0003F0000C00007C0803F0000
      FFE00FE0C3FF0000FFF807E0E3FF000000000000000000000000000000000000
      000000000000}
  end
  object OpenDialog2: TOpenDialog
    Left = 142
    Top = 305
  end
end
