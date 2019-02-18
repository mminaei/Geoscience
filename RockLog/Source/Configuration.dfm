object ColumnConfiguration: TColumnConfiguration
  Left = 296
  Top = 201
  Width = 382
  Height = 264
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Column Configuration'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object VrLabel200: TVrLabel
    Left = 0
    Top = 0
    Width = 374
    Height = 20
    Style = lsNone
    ShadowDepth = 1
    Transparent = True
    Align = alTop
    AutoSize = True
    Color = clBtnFace
    Caption = 'Uncheck a column to make it invisible in the source table:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object CheckListBox1: TCheckListBox
    Left = 0
    Top = 20
    Width = 374
    Height = 210
    OnClickCheck = CheckListBox1ClickCheck
    Align = alClient
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = 16709865
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HeaderColor = clBlack
    ItemHeight = 17
    ParentFont = False
    Style = lbOwnerDrawFixed
    TabOrder = 0
  end
end
