object Rw_SP_Form: TRw_SP_Form
  Left = 433
  Top = 411
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Rw from SP Log'
  ClientHeight = 308
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ScreenSnap = True
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 267
    Width = 494
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button2: TButton
      Left = 413
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 333
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      Default = True
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 246
    Height = 120
    Caption = 'Static SP'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 88
      Width = 68
      Height = 13
      Caption = 'Selected Log: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 112
      Top = 88
      Width = 28
      Height = 13
      Caption = 'NONE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RadioButton1: TRadioButton
      Left = 8
      Top = 58
      Width = 97
      Height = 17
      Caption = 'Constant value:'
      Enabled = False
      TabOrder = 1
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 28
      Width = 97
      Height = 17
      Caption = 'From logs:'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton2Click
    end
    object Edit3: TEdit
      Left = 112
      Top = 56
      Width = 121
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 2
    end
    object Button3: TButton
      Left = 112
      Top = 24
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 3
      OnClick = Button3Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 120
    Width = 246
    Height = 49
    Caption = 'Sand Base Line'
    TabOrder = 2
    object Edit1: TEdit
      Left = 8
      Top = 19
      Width = 225
      Height = 21
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 169
    Width = 246
    Height = 49
    Caption = 'Shale Base Line'
    TabOrder = 3
    object Edit2: TEdit
      Left = 8
      Top = 19
      Width = 225
      Height = 21
      TabOrder = 0
    end
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 218
    Width = 246
    Height = 49
    Caption = 'Mud Filtrate Resistivity @ 75 '#176'F (Ohmm)'
    TabOrder = 4
    object Edit4: TEdit
      Left = 8
      Top = 19
      Width = 225
      Height = 21
      TabOrder = 0
    end
  end
  object GroupBox6: TGroupBox
    Left = 248
    Top = 0
    Width = 246
    Height = 267
    Align = alRight
    Caption = 'Formation Temperature ('#176'F)'
    TabOrder = 5
    object Label3: TLabel
      Left = 8
      Top = 58
      Width = 68
      Height = 13
      Caption = 'Selected Log: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 112
      Top = 58
      Width = 28
      Height = 13
      Caption = 'NONE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 8
      Top = 96
      Width = 230
      Height = 169
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object Label5: TLabel
        Left = 8
        Top = 24
        Width = 145
        Height = 13
        Caption = 'Bottom Hole Temperature ('#176'F)'
      end
      object Label6: TLabel
        Left = 8
        Top = 72
        Width = 56
        Height = 13
        Caption = 'Total Depth'
      end
      object Label7: TLabel
        Left = 8
        Top = 121
        Width = 168
        Height = 13
        Caption = 'Surface Average Temperature ('#176'F)'
      end
      object Label8: TLabel
        Left = 120
        Top = 72
        Width = 80
        Height = 13
        Caption = 'Formation Depth'
      end
      object Edit5: TEdit
        Left = 8
        Top = 43
        Width = 209
        Height = 21
        Color = clBtnFace
        Enabled = False
        TabOrder = 0
      end
      object Edit6: TEdit
        Left = 8
        Top = 92
        Width = 97
        Height = 21
        Color = clBtnFace
        Enabled = False
        TabOrder = 1
      end
      object Edit7: TEdit
        Left = 8
        Top = 141
        Width = 209
        Height = 21
        Color = clBtnFace
        Enabled = False
        TabOrder = 2
        Text = '80'
      end
      object Edit8: TEdit
        Left = 120
        Top = 92
        Width = 97
        Height = 21
        Color = clBtnFace
        Enabled = False
        TabOrder = 3
      end
    end
    object RadioButton3: TRadioButton
      Left = 8
      Top = 88
      Width = 97
      Height = 17
      Caption = 'Constant value:'
      TabOrder = 1
      OnClick = RadioButton3Click
    end
    object RadioButton4: TRadioButton
      Left = 8
      Top = 28
      Width = 97
      Height = 17
      Caption = 'From logs:'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton4Click
    end
    object Button4: TButton
      Left = 112
      Top = 24
      Width = 121
      Height = 25
      Caption = 'Select'
      TabOrder = 2
      OnClick = Button4Click
    end
  end
end
