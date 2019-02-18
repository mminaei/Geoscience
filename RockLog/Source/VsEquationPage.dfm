object VsEquation: TVsEquation
  Left = 413
  Top = 148
  Width = 481
  Height = 394
  Caption = 'Vs Equation'
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 238
    Height = 16
    Caption = 'Vs log was not recognized in the file.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 8
    Top = 24
    Width = 381
    Height = 16
    Caption = 'Which equation do you wish to be used for Vs calculation ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object sButton1: TsButton
    Left = 8
    Top = 320
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
    TabOrder = 0
  end
  object sButton2: TsButton
    Left = 328
    Top = 320
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
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 8
    Top = 40
    Width = 457
    Height = 273
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label3: TLabel
      Left = 116
      Top = 66
      Width = 22
      Height = 13
      Caption = 'Vp - '
    end
    object RadioButton2: TRadioButton
      Tag = 1
      Left = 8
      Top = 64
      Width = 41
      Height = 17
      Caption = 'Vs = '
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object RadioButton1: TRadioButton
      Left = 8
      Top = 24
      Width = 113
      Height = 17
      Caption = 'Vs = Vp / 1.73205'
      TabOrder = 0
    end
    object ESBFloatEdit1: TESBFloatEdit
      Left = 56
      Top = 62
      Width = 57
      Height = 21
      TabOrder = 2
      Scale = 1.000000000000000000
      AsFloat = 0.861900000000000000
    end
    object ESBFloatEdit2: TESBFloatEdit
      Left = 142
      Top = 62
      Width = 81
      Height = 21
      TabOrder = 3
      Scale = 1.000000000000000000
      AsFloat = 1172.000000000000000000
    end
    object Button1: TButton
      Left = 249
      Top = 60
      Width = 75
      Height = 25
      Caption = 'Defaults'
      TabOrder = 4
      OnClick = Button1Click
    end
    object Panel4: TPanel
      Left = 8
      Top = 112
      Width = 441
      Height = 153
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 6
      object Label10: TLabel
        Left = 8
        Top = 12
        Width = 36
        Height = 13
        Caption = 'DT Log'
      end
      object Label11: TLabel
        Left = 88
        Top = 12
        Width = 36
        Height = 13
        Caption = 'Phi Log'
      end
      object Label12: TLabel
        Left = 168
        Top = 12
        Width = 51
        Height = 13
        Caption = 'G-Ray Log'
      end
      object Label8: TLabel
        Left = 8
        Top = 90
        Width = 29
        Height = 13
        Caption = 'From :'
      end
      object Label9: TLabel
        Left = 8
        Top = 124
        Width = 19
        Height = 13
        Caption = 'To :'
      end
      object Label4: TLabel
        Left = 8
        Top = 70
        Width = 90
        Height = 13
        Caption = 'Interval of analysis:'
      end
      object Label5: TLabel
        Left = 267
        Top = 56
        Width = 22
        Height = 13
        Caption = 'V0 ='
      end
      object Label6: TLabel
        Left = 267
        Top = 90
        Width = 22
        Height = 13
        Caption = 'A   ='
      end
      object Label7: TLabel
        Left = 267
        Top = 124
        Width = 22
        Height = 13
        Caption = 'B   ='
      end
      object ComboBox1: TComboBox
        Left = 8
        Top = 28
        Width = 73
        Height = 21
        ItemHeight = 13
        TabOrder = 0
      end
      object ComboBox2: TComboBox
        Left = 88
        Top = 28
        Width = 73
        Height = 21
        ItemHeight = 13
        TabOrder = 1
      end
      object ComboBox3: TComboBox
        Left = 168
        Top = 28
        Width = 73
        Height = 21
        ItemHeight = 13
        TabOrder = 2
      end
      object ESBPosFloatEdit1: TESBPosFloatEdit
        Left = 48
        Top = 86
        Width = 81
        Height = 21
        TabOrder = 3
        Scale = 1.000000000000000000
      end
      object ESBPosFloatEdit2: TESBPosFloatEdit
        Left = 48
        Top = 120
        Width = 81
        Height = 21
        TabOrder = 4
        Scale = 1.000000000000000000
      end
      object ESBFloatEdit3: TESBFloatEdit
        Left = 296
        Top = 52
        Width = 113
        Height = 21
        TabOrder = 5
        Scale = 1.000000000000000000
      end
      object ESBFloatEdit4: TESBFloatEdit
        Left = 296
        Top = 86
        Width = 113
        Height = 21
        TabOrder = 6
        Scale = 1.000000000000000000
      end
      object ESBFloatEdit5: TESBFloatEdit
        Left = 296
        Top = 120
        Width = 113
        Height = 21
        TabOrder = 7
        Scale = 1.000000000000000000
      end
      object Button2: TButton
        Left = 160
        Top = 102
        Width = 75
        Height = 25
        Caption = 'Calculate >>'
        TabOrder = 8
        OnClick = Button2Click
      end
    end
    object RadioButton3: TRadioButton
      Left = 8
      Top = 104
      Width = 201
      Height = 17
      Caption = 'Vs = 0.67 V0 - 0.75 A Phi - 0.92 B Vc'
      TabOrder = 5
    end
  end
end
