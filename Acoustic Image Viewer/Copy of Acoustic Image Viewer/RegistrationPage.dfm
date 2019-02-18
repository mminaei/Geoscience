object RegistrationForm: TRegistrationForm
  Left = 278
  Top = 189
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Registration'
  ClientHeight = 279
  ClientWidth = 351
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
    Width = 137
    Height = 16
    Caption = 'Time limited edition'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_Message: TLabel
    Left = 8
    Top = 24
    Width = 116
    Height = 13
    Caption = 'This license will expire ...'
  end
  object lbl_Remaining: TLabel
    Left = 8
    Top = 200
    Width = 329
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'lbl_Remaining'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_Go: TButton
    Left = 16
    Top = 248
    Width = 81
    Height = 25
    Caption = '&Continue Trial'
    TabOrder = 0
    OnClick = btn_GoClick
  end
  object btn_Cancel: TButton
    Left = 264
    Top = 248
    Width = 83
    Height = 25
    Caption = '&Quit'
    TabOrder = 1
    OnClick = btn_CancelClick
  end
  object ProgressBar: TProgressBar
    Left = 8
    Top = 216
    Width = 329
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 2
  end
  object btn_Register: TButton
    Left = 104
    Top = 248
    Width = 81
    Height = 25
    Caption = '&Register'
    TabOrder = 3
    OnClick = btn_RegisterClick
  end
  object grp_Reg: TGroupBox
    Left = 8
    Top = 42
    Width = 337
    Height = 145
    TabOrder = 4
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 51
      Height = 13
      Caption = 'Username:'
    end
    object lbl_Serial: TLabel
      Left = 8
      Top = 96
      Width = 69
      Height = 13
      Caption = 'Serial Number:'
    end
    object Label3: TLabel
      Left = 8
      Top = 56
      Width = 63
      Height = 13
      Caption = 'Hardware ID:'
    end
    object Edit_UserName: TEdit
      Left = 8
      Top = 32
      Width = 321
      Height = 21
      TabOrder = 0
    end
    object Edit_Serial: TEdit
      Left = 8
      Top = 112
      Width = 233
      Height = 21
      TabOrder = 1
    end
    object Edit_HWID: TEdit
      Left = 8
      Top = 72
      Width = 321
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
      Text = 'Edit_HWID'
    end
  end
  object mxProtector: TmxProtector
    CodeKey = 'Ignore'
    ProtectionTypes = [stDayTrial, stRegister]
    Options = [poAutoInit, poCheckSytemTime, poPasswordOnce, poUseHardwareKey]
    RegistryRootKey = rkLocalMachine
    Expiration = 38761.7303996644
    MaxStartNumber = 0
    MaxDayNumber = 30
    Version = '1.31'
    OnExpiration = mxProtectorExpiration
    OnDayTrial = mxProtectorDayTrial
    OnInvalidSystemTime = mxProtectorInvalidSystemTime
    OnInvalidSerialNumber = mxProtectorInvalidSerialNumber
    OnGetSerialNumber = mxProtectorGetSerialNumber
    OnUnknownHardware = mxProtectorUnknownHardware
    Left = 296
    Top = 8
    UniqueCodeID = 
      '7A35474643473F314B273935353E2224555424395753202E3459285F2B2B5918' +
      '64631B60155B'
    UniqueID = 
      '217D250469731716717174620A526C6A7014646E1D7D1B7D4E706F7362147F6D' +
      '031978267226'
  end
end
