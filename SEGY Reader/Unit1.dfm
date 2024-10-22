object Form1: TForm1
  Left = 390
  Top = 110
  Width = 738
  Height = 703
  Caption = 'SEGY Reader'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 265
    Top = 0
    Width = 465
    Height = 652
    Legend.Visible = False
    Title.Text.Strings = (
      'TChart')
    BottomAxis.Grid.Visible = False
    LeftAxis.Grid.Visible = False
    LeftAxis.Inverted = True
    RightAxis.Grid.Visible = False
    View3D = False
    Zoom.Brush.Color = 8454016
    Zoom.Brush.Style = bsSolid
    Zoom.Pen.Color = clRed
    Zoom.Pen.Width = 2
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object ChartTool1: TLightTool
      Active = False
      Style = lsSpotLight
    end
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 652
    Width = 730
    Height = 17
    Align = alBottom
    Smooth = True
    TabOrder = 1
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 265
    Height = 652
    Align = alLeft
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 204
      Width = 33
      Height = 13
      Caption = 'Palette'
    end
    object Button1: TButton
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Open'
      TabOrder = 0
      OnClick = Button1Click
    end
    object LabeledEdit1: TLabeledEdit
      Left = 160
      Top = 80
      Width = 100
      Height = 21
      EditLabel.Width = 140
      EditLabel.Height = 13
      EditLabel.Caption = 'Sampling interval                    '
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 1
    end
    object LabeledEdit2: TLabeledEdit
      Left = 160
      Top = 104
      Width = 100
      Height = 21
      EditLabel.Width = 141
      EditLabel.Height = 13
      EditLabel.Caption = 'Number of Samples per Trace'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 2
    end
    object LabeledEdit3: TLabeledEdit
      Left = 160
      Top = 128
      Width = 100
      Height = 21
      EditLabel.Width = 142
      EditLabel.Height = 13
      EditLabel.Caption = 'Data Sample Format Code      '
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 3
    end
    object Button2: TButton
      Left = 174
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Edit'
      TabOrder = 4
      OnClick = Button2Click
    end
    object LabeledEdit4: TLabeledEdit
      Left = 160
      Top = 152
      Width = 100
      Height = 21
      EditLabel.Width = 142
      EditLabel.Height = 13
      EditLabel.Caption = 'Number of Traces                   '
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 5
    end
    object Button3: TButton
      Left = 96
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Clear'
      TabOrder = 6
      OnClick = Button3Click
    end
    object LabeledEdit5: TLabeledEdit
      Left = 160
      Top = 56
      Width = 100
      Height = 21
      EditLabel.Width = 140
      EditLabel.Height = 13
      EditLabel.Caption = 'File Size (Bytes)                      '
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 7
    end
    object LabeledEdit6: TLabeledEdit
      Left = 160
      Top = 176
      Width = 100
      Height = 21
      EditLabel.Width = 142
      EditLabel.Height = 13
      EditLabel.Caption = 'Time Spent (ms)                      '
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 8
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 224
      Width = 65
      Height = 17
      Caption = 'Wiggles'
      Enabled = False
      TabOrder = 9
      OnClick = CheckBox1Click
    end
    object ComboBox1: TComboBox
      Left = 160
      Top = 200
      Width = 100
      Height = 21
      Enabled = False
      ItemHeight = 13
      ItemIndex = 2
      TabOrder = 10
      Text = 'Gray'
      OnChange = ComboBox1Change
      Items.Strings = (
        'Pale'
        'Strong'
        'Gray'
        'Inverted Gray'
        'Rainbow')
    end
    object Memo1: TMemo
      Left = 16
      Top = 256
      Width = 217
      Height = 41
      ReadOnly = True
      TabOrder = 11
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'sgy'
    Filter = 'SGY files|*.sgy|SEGY files|*.segy'
    FilterIndex = 0
    Left = 336
    Top = 184
  end
  object ChartEditor1: TChartEditor
    Chart = Chart1
    Left = 336
    Top = 152
  end
  object XPManifest1: TXPManifest
    Left = 336
    Top = 120
  end
end
