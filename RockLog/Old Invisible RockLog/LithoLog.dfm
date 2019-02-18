object Litho_Log: TLitho_Log
  Left = 469
  Top = 184
  BorderStyle = bsDialog
  Caption = 'LithoLog'
  ClientHeight = 88
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 28
    Width = 28
    Height = 13
    Caption = 'From:'
  end
  object Label2: TLabel
    Left = 20
    Top = 60
    Width = 16
    Height = 13
    Caption = 'To:'
  end
  object Label3: TLabel
    Left = 144
    Top = 8
    Width = 43
    Height = 13
    Caption = 'Lithology'
  end
  object ESBFloatEdit1: TESBFloatEdit
    Left = 40
    Top = 24
    Width = 81
    Height = 21
    TabOrder = 0
    Scale = 1.000000000000000000
    DecimalPlaces = 2
  end
  object ESBFloatEdit2: TESBFloatEdit
    Left = 40
    Top = 56
    Width = 81
    Height = 21
    TabOrder = 1
    Scale = 1.000000000000000000
    DecimalPlaces = 2
  end
  object ComboBox1: TComboBox
    Left = 144
    Top = 24
    Width = 161
    Height = 21
    ItemHeight = 13
    TabOrder = 2
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
    Left = 144
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Add'
    Default = True
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 232
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 4
    OnClick = Button2Click
  end
end
