object SetMinMaxComp: TSetMinMaxComp
  Left = 269
  Top = 342
  BorderStyle = bsDialog
  Caption = 'Set Min, Max'
  ClientHeight = 217
  ClientWidth = 403
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
  object VrLabel1: TVrLabel
    Left = 0
    Top = 0
    Width = 403
    Height = 23
    Alignment = taLeftJustify
    Transparent = True
    Align = alTop
    AutoSize = True
    Color = clBtnFace
    Caption = 'Enter minimum and maximum values for the logs:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object VrLabel2: TVrLabel
    Left = 121
    Top = 32
    Width = 63
    Height = 20
    Transparent = True
    AutoSize = True
    Color = clBtnFace
    Caption = 'Minimum'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object VrLabel3: TVrLabel
    Left = 271
    Top = 32
    Width = 67
    Height = 20
    Transparent = True
    AutoSize = True
    Color = clBtnFace
    Caption = 'Maximum'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object VrLabel4: TVrLabel
    Left = 9
    Top = 56
    Width = 28
    Height = 20
    Style = lsNone
    Transparent = True
    AutoSize = True
    Color = clBtnFace
    Caption = 'Log'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object VrLabel5: TVrLabel
    Left = 9
    Top = 112
    Width = 28
    Height = 20
    Style = lsNone
    Transparent = True
    AutoSize = True
    Color = clBtnFace
    Caption = 'Log'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object ESBFloatEdit1: TESBFloatEdit
    Left = 120
    Top = 80
    Width = 113
    Height = 21
    TabOrder = 0
    Scale = 1.000000000000000000
    DecimalPlaces = 2
  end
  object ESBFloatEdit2: TESBFloatEdit
    Left = 272
    Top = 80
    Width = 113
    Height = 21
    TabOrder = 1
    Scale = 1.000000000000000000
    DecimalPlaces = 2
  end
  object sButton2: TsButton
    Left = 264
    Top = 175
    Width = 129
    Height = 33
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsButton'
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Data = '8421504;16777215;99;0;0;16777215;16777215;0;0;0'
    sStyle.HotStyle.HotBackground.Gradient.Data = 
      '8421504;8421504;10;0;0;8421504;16777215;43;0;0;16777215;10658466' +
      ';28;0;0;10658466;13816530;18;0;0;13816530;13816530;0;0;0'
    sStyle.HotStyle.HotPainting.Transparency = 0
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sButton2Click
    ShowFocus = False
    TabOrder = 5
  end
  object sButton1: TsButton
    Left = 112
    Top = 175
    Width = 129
    Height = 33
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsButton'
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Data = '8421504;16777215;99;0;0;16777215;16777215;0;0;0'
    sStyle.HotStyle.HotBackground.Gradient.Data = 
      '8421504;8421504;10;0;0;8421504;16777215;43;0;0;16777215;10658466' +
      ';28;0;0;10658466;13816530;18;0;0;13816530;13816530;0;0;0'
    sStyle.HotStyle.HotPainting.Transparency = 0
    Caption = 'Ok'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sButton1Click
    ShowFocus = False
    TabOrder = 4
  end
  object ESBFloatEdit3: TESBFloatEdit
    Left = 120
    Top = 136
    Width = 113
    Height = 21
    TabOrder = 2
    Scale = 1.000000000000000000
    DecimalPlaces = 2
  end
  object ESBFloatEdit4: TESBFloatEdit
    Left = 272
    Top = 136
    Width = 113
    Height = 21
    TabOrder = 3
    Scale = 1.000000000000000000
    DecimalPlaces = 2
  end
end
