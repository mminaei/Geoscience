object ElasticChangeColor: TElasticChangeColor
  Left = 455
  Top = 175
  BorderStyle = bsDialog
  Caption = 'Change Color'
  ClientHeight = 102
  ClientWidth = 182
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
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 39
    Height = 13
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 39
    Height = 13
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Image1: TImage
    Left = 144
    Top = 8
    Width = 25
    Height = 25
    Cursor = crHandPoint
    OnClick = Image1Click
  end
  object Image2: TImage
    Left = 144
    Top = 40
    Width = 25
    Height = 25
    Cursor = crHandPoint
    OnClick = Image2Click
  end
  object sButton1: TsButton
    Left = 9
    Top = 69
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
    Caption = 'Ok'
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
    Left = 97
    Top = 69
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
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sButton2Click
    ShowFocus = False
    TabOrder = 1
  end
  object ColorDialog1: TColorDialog
    Left = 8
  end
end
