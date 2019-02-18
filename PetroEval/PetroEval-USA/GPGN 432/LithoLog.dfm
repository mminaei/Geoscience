object Litho_Log: TLitho_Log
  Left = 504
  Top = 244
  BorderStyle = bsDialog
  Caption = 'LithoLog'
  ClientHeight = 135
  ClientWidth = 248
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  ScreenSnap = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 248
    Height = 50
    Align = alTop
    Caption = 'Depth Range'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 28
      Height = 13
      Caption = 'From:'
    end
    object Label2: TLabel
      Left = 132
      Top = 24
      Width = 16
      Height = 13
      Caption = 'To:'
    end
    object Edit1: TEdit
      Left = 40
      Top = 20
      Width = 81
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 152
      Top = 20
      Width = 81
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvRaised
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 100
    Width = 248
    Height = 35
    Align = alBottom
    TabOrder = 1
    object Button2: TButton
      Left = 160
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 0
      OnClick = Button2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 50
    Width = 248
    Height = 50
    Align = alClient
    Caption = 'Lithology'
    TabOrder = 2
    object ComboBox1: TComboBox
      Left = 8
      Top = 20
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'Alluvium'
      Items.Strings = (
        'Alluvium'
        'Anhydratic Dolomite'
        'Anhydrite'
        'Arenaceous Dolomite'
        'Arenaceous Limestone'
        'Arenaceous Shale'
        'Argillaceous Dolomite'
        'Argillaceous Limestone'
        'Argillaceous Sandstone'
        'Argillaceous'
        'Ash'
        'Asphalt'
        'Basalt'
        'Basement'
        'Bedrock'
        'Bentonite'
        'Breccia'
        'Bryozoan Limestone'
        'Calcareous Dolomite'
        'Calcareous Mudstone'
        'Calcareous Sandstone'
        'Calcareous Siltstone'
        'Calcite'
        'Carbonate'
        'Clayey Sand'
        'Claystone'
        'Coal'
        'Coarse Sandstone'
        'Conglomerate'
        'Dolomite'
        'Dolomitic Limestone'
        'Dolomitic Mudstone'
        'Fine Sand'
        'Gneiss'
        'Granite'
        'Gravel'
        'Gypsum'
        'Kaolinized'
        'Limestone'
        'Marble'
        'Mudstone'
        'Oolitic Limestone'
        'Pyrite'
        'Quartz'
        'Quartzite'
        'Rhyolite'
        'Salt'
        'Sandstone'
        'Sandy Limestone'
        'Schist'
        'Shale'
        'Shaly Limestone'
        'Siltaceous Shale'
        'Siltstone'
        'Silty Limestone'
        'Silty Sand'
        'Stromatolites'
        'Talc'
        'Tuff'
        'Unknown')
    end
    object Button1: TButton
      Left = 160
      Top = 18
      Width = 75
      Height = 25
      Caption = 'Add'
      Default = True
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
