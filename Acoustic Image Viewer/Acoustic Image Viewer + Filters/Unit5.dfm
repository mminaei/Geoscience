object Form5: TForm5
  Left = 288
  Top = 86
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Trim Filter Settings'
  ClientHeight = 335
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 312
    Top = 304
    Width = 75
    Height = 25
    TabOrder = 0
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 392
    Top = 304
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 457
    Height = 140
    Caption = 'Amplitude'
    TabOrder = 2
    object Label7: TLabel
      Left = 200
      Top = 66
      Width = 59
      Height = 13
      Caption = 'Change To :'
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 32
      Width = 185
      Height = 81
      Caption = 'Current Values'
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 50
        Height = 13
        Caption = 'Maximum :'
      end
      object Label2: TLabel
        Left = 96
        Top = 24
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label3: TLabel
        Left = 8
        Top = 48
        Width = 47
        Height = 13
        Caption = 'Minimum :'
      end
      object Label4: TLabel
        Left = 96
        Top = 48
        Width = 6
        Height = 13
        Caption = '0'
      end
    end
    object GroupBox3: TGroupBox
      Left = 264
      Top = 32
      Width = 185
      Height = 81
      Caption = 'New Values'
      TabOrder = 1
      object Label5: TLabel
        Left = 8
        Top = 24
        Width = 50
        Height = 13
        Caption = 'Maximum :'
      end
      object Label6: TLabel
        Left = 8
        Top = 48
        Width = 47
        Height = 13
        Caption = 'Minimum :'
      end
      object ESBPosFloatEdit1: TESBPosFloatEdit
        Left = 96
        Top = 20
        Width = 81
        Height = 21
        TabOrder = 0
        TrimTrailingZeroes = True
        Scale = 1
      end
      object ESBPosFloatEdit2: TESBPosFloatEdit
        Left = 96
        Top = 44
        Width = 81
        Height = 21
        TabOrder = 1
        TrimTrailingZeroes = True
        Scale = 1
      end
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 152
    Width = 457
    Height = 140
    Caption = 'Radius'
    TabOrder = 3
    object Label8: TLabel
      Left = 200
      Top = 66
      Width = 59
      Height = 13
      Caption = 'Change To :'
    end
    object GroupBox5: TGroupBox
      Left = 8
      Top = 32
      Width = 185
      Height = 81
      Caption = 'Current Values'
      TabOrder = 0
      object Label9: TLabel
        Left = 8
        Top = 24
        Width = 50
        Height = 13
        Caption = 'Maximum :'
      end
      object Label10: TLabel
        Left = 96
        Top = 24
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label11: TLabel
        Left = 8
        Top = 48
        Width = 47
        Height = 13
        Caption = 'Minimum :'
      end
      object Label12: TLabel
        Left = 96
        Top = 48
        Width = 6
        Height = 13
        Caption = '0'
      end
    end
    object GroupBox6: TGroupBox
      Left = 264
      Top = 32
      Width = 185
      Height = 81
      Caption = 'New Values'
      TabOrder = 1
      object Label13: TLabel
        Left = 8
        Top = 24
        Width = 50
        Height = 13
        Caption = 'Maximum :'
      end
      object Label14: TLabel
        Left = 8
        Top = 48
        Width = 47
        Height = 13
        Caption = 'Minimum :'
      end
      object ESBPosFloatEdit3: TESBPosFloatEdit
        Left = 96
        Top = 20
        Width = 81
        Height = 21
        TabOrder = 0
        TrimTrailingZeroes = True
        Scale = 1
      end
      object ESBPosFloatEdit4: TESBPosFloatEdit
        Left = 96
        Top = 44
        Width = 81
        Height = 21
        TabOrder = 1
        TrimTrailingZeroes = True
        Scale = 1
      end
    end
  end
end
