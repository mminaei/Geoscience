object Save_Form: TSave_Form
  Left = 472
  Top = 82
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Save as LAS File'
  ClientHeight = 398
  ClientWidth = 452
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ScreenSnap = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 275
    Top = 0
    Width = 177
    Height = 357
    Align = alClient
    Caption = 'Available Tracks'
    TabOrder = 0
    object ScrollBox1: TScrollBox
      Left = 2
      Top = 15
      Width = 173
      Height = 340
      HorzScrollBar.Visible = False
      VertScrollBar.Smooth = True
      VertScrollBar.Tracking = True
      Align = alClient
      Color = 16513514
      ParentColor = False
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 275
    Height = 357
    Align = alLeft
    Caption = 'Well Information'
    TabOrder = 1
    object LabeledEdit1: TLabeledEdit
      Left = 8
      Top = 40
      Width = 121
      Height = 21
      EditLabel.Width = 51
      EditLabel.Height = 13
      EditLabel.Caption = 'Depth Unit'
      MaxLength = 14
      TabOrder = 0
    end
    object LabeledEdit2: TLabeledEdit
      Left = 8
      Top = 80
      Width = 121
      Height = 21
      EditLabel.Width = 56
      EditLabel.Height = 13
      EditLabel.Caption = 'Start Depth'
      MaxLength = 14
      TabOrder = 1
    end
    object LabeledEdit3: TLabeledEdit
      Left = 8
      Top = 120
      Width = 121
      Height = 21
      EditLabel.Width = 54
      EditLabel.Height = 13
      EditLabel.Caption = 'Stop Depth'
      MaxLength = 14
      TabOrder = 2
    end
    object LabeledEdit4: TLabeledEdit
      Left = 8
      Top = 160
      Width = 121
      Height = 21
      EditLabel.Width = 51
      EditLabel.Height = 13
      EditLabel.Caption = 'Step Value'
      MaxLength = 14
      TabOrder = 3
    end
    object LabeledEdit5: TLabeledEdit
      Left = 8
      Top = 200
      Width = 121
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Null Value'
      MaxLength = 14
      TabOrder = 4
    end
    object LabeledEdit6: TLabeledEdit
      Left = 8
      Top = 280
      Width = 121
      Height = 21
      EditLabel.Width = 20
      EditLabel.Height = 13
      EditLabel.Caption = 'Well'
      MaxLength = 14
      TabOrder = 6
    end
    object LabeledEdit7: TLabeledEdit
      Left = 8
      Top = 320
      Width = 121
      Height = 21
      EditLabel.Width = 22
      EditLabel.Height = 13
      EditLabel.Caption = 'Field'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      MaxLength = 14
      TabOrder = 7
    end
    object LabeledEdit8: TLabeledEdit
      Left = 144
      Top = 40
      Width = 121
      Height = 21
      EditLabel.Width = 40
      EditLabel.Height = 13
      EditLabel.Caption = 'Location'
      MaxLength = 14
      TabOrder = 8
    end
    object LabeledEdit9: TLabeledEdit
      Left = 144
      Top = 80
      Width = 121
      Height = 21
      EditLabel.Width = 35
      EditLabel.Height = 13
      EditLabel.Caption = 'County'
      MaxLength = 14
      TabOrder = 9
    end
    object LabeledEdit10: TLabeledEdit
      Left = 144
      Top = 120
      Width = 121
      Height = 21
      EditLabel.Width = 26
      EditLabel.Height = 13
      EditLabel.Caption = 'State'
      MaxLength = 14
      TabOrder = 10
    end
    object LabeledEdit11: TLabeledEdit
      Left = 144
      Top = 160
      Width = 121
      Height = 21
      EditLabel.Width = 39
      EditLabel.Height = 13
      EditLabel.Caption = 'Country'
      MaxLength = 14
      TabOrder = 11
    end
    object LabeledEdit12: TLabeledEdit
      Left = 144
      Top = 200
      Width = 121
      Height = 21
      EditLabel.Width = 83
      EditLabel.Height = 13
      EditLabel.Caption = 'Service Company'
      MaxLength = 14
      TabOrder = 12
    end
    object LabeledEdit13: TLabeledEdit
      Left = 144
      Top = 240
      Width = 121
      Height = 21
      EditLabel.Width = 57
      EditLabel.Height = 13
      EditLabel.Caption = 'API Number'
      MaxLength = 14
      TabOrder = 13
    end
    object LabeledEdit14: TLabeledEdit
      Left = 144
      Top = 280
      Width = 121
      Height = 21
      EditLabel.Width = 23
      EditLabel.Height = 13
      EditLabel.Caption = 'Date'
      MaxLength = 14
      TabOrder = 14
    end
    object LabeledEdit15: TLabeledEdit
      Left = 144
      Top = 320
      Width = 121
      Height = 21
      EditLabel.Width = 70
      EditLabel.Height = 13
      EditLabel.Caption = 'Unique Well ID'
      MaxLength = 14
      TabOrder = 15
    end
    object LabeledEdit16: TLabeledEdit
      Left = 8
      Top = 240
      Width = 121
      Height = 21
      EditLabel.Width = 45
      EditLabel.Height = 13
      EditLabel.Caption = 'Company'
      MaxLength = 14
      TabOrder = 5
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 357
    Width = 452
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BitBtn2: TBitBtn
      Left = 368
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = BitBtn2Click
      Kind = bkClose
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Save'
      Default = True
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000B969358FB868
        34B5B76834EEB66734FFB46734FFB36633FFB16533FFAF6432FFAD6332FFAB62
        31FFA96131FFA86031FFA75F30FFA65F30FEA55F30F1A76030C4B96934DEEBC5
        ACFFEAC4ACFFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFB
        F8FFFEFBF8FFFEFBF8FFFEFBF8FFC8997BFFC79778FFA65F30EDB96A36FEEDCA
        B2FFE0A179FFFEFAF7FF61BF87FF61BF87FF61BF87FF61BF87FF61BF87FF61BF
        87FF61BF87FF61BF87FFFDF9F6FFCA8C64FFC99A7BFFA65F30FEBA6B37FFEECC
        B5FFE1A179FFFEFAF7FFBEDCC1FFBEDCC1FFBEDCC1FFBEDCC1FFBEDCC1FFBEDC
        C1FFBEDCC1FFBEDCC1FFFDF9F6FFCD8F67FFCC9D80FFA76031FFBA6A37FFEFCE
        B7FFE1A178FFFEFAF7FF61BF87FF61BF87FF61BF87FF61BF87FF61BF87FF61BF
        87FF61BF87FF61BF87FFFDF9F6FFCF9269FFCEA283FFA96031FFB96935FFEFD0
        BAFFE2A179FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFB
        F8FFFEFBF8FFFEFBF8FFFEFBF8FFD3956CFFD2A689FFAA6131FFBA6935FFF0D2
        BDFFE2A279FFE2A279FFE1A279FFE2A27AFFE1A27AFFE0A077FFDE9E76FFDD9E
        75FFDC9C73FFD99A71FFD89870FFD6986FFFD5AA8DFFAC6232FFBA6935FFF2D5
        C1FFE3A279FFE3A279FFE2A27AFFE2A27AFFE2A37AFFE1A178FFE0A077FFDE9F
        76FFDE9D74FFDC9C73FFDA9A72FFD99A72FFDAAF94FFAE6332FFBA6935FFF2D8
        C4FFE3A37AFFE3A279FFE3A379FFE2A37AFFE2A27AFFE1A27AFFE1A178FFDF9F
        76FFDE9E75FFDD9D73FFDB9B71FFDC9C73FFDDB499FFB06433FFBA6A35FFF4D9
        C7FFE6A57CFFC88B63FFC98C64FFC98D66FFCB916BFFCB916CFFCA8F68FFC88B
        64FFC88B63FFC88B63FFC88B63FFDA9B73FFE1B99EFFB26533FFBA6A35FEF4DC
        C9FFE7A67CFFF9ECE1FFF9ECE1FFF9EDE3FFFCF4EEFFFDFAF7FFFDF7F3FFFAED
        E5FFF7E7DBFFF7E5D9FFF6E5D8FFDE9F76FFE4BDA3FFB36633FFBB6A35FAF5DD
        CCFFE7A77DFFFAF0E8FFFAF0E8FFC98C65FFFAF0E9FFFDF8F3FFFEFAF8FFFCF4
        EFFFF9E9DFFFF7E7DBFFF7E5D9FFE0A177FFE7C1A8FFB56734FFBB6A35F0F6DF
        D0FFE8A77DFFFCF6F1FFFCF6F1FFC88B63FFFAF1E9FFFBF4EEFFFDFAF7FFFDF9
        F6FFFAF0E8FFF8E8DDFFF7E6DBFFE1A279FFEFD5C2FFB66834FEBB6A35D8F6DF
        D1FFE9A97FFFFEFAF6FFFDFAF6FFC88B63FFFBF3EEFFFBF1EAFFFCF6F2FFFEFB
        F8FFFCF6F1FFF9ECE2FFF8E7DBFFEED0B9FFECD0BCFFBA6F3DF8BB6A359BF6E0
        D1FFF7E0D1FFFEFBF8FFFEFBF7FFFDF9F6FFFCF5F0FFFAF0EAFFFBF2EDFFFDF9
        F6FFFDFAF7FFFBF1EBFFF8E9DFFEECD0BCFBC9885DECB4683463BB6A3571BB6A
        3590BB6A35CCBB6A35EEBB6A35FABA6A35FEBA6A35FFBA6935FFBA6935FFBB6B
        38FFBC6D3AFFBA6C39FFBA6A37EFBA6F3DCBB568345400000000}
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'las'
    Filter = 'LAS Files|*.las'
    Options = [ofOverwritePrompt, ofEnableSizing]
    Left = 104
    Top = 368
  end
end
