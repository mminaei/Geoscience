object frm_MainWindow: Tfrm_MainWindow
  Left = 357
  Top = 275
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Serial Number Generator'
  ClientHeight = 224
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 326
    Height = 20
    Caption = 'P.U.T RockLog Serial Number Generator'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_Cancel: TButton
    Left = 144
    Top = 192
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Quit'
    TabOrder = 0
    OnClick = btn_CancelClick
  end
  object grp_Reg: TGroupBox
    Left = 8
    Top = 40
    Width = 337
    Height = 145
    TabOrder = 1
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
      Width = 67
      Height = 13
      Caption = 'Serial number:'
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
      Text = 'Enter user name here'
    end
    object Edit_Serial: TEdit
      Left = 8
      Top = 112
      Width = 233
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object btn_GetSer: TButton
      Left = 248
      Top = 112
      Width = 80
      Height = 25
      Caption = '&Get Serial'
      Default = True
      TabOrder = 2
      OnClick = btn_GetSerClick
    end
    object Edit_HWID: TEdit
      Left = 8
      Top = 72
      Width = 321
      Height = 21
      MaxLength = 19
      TabOrder = 3
      Text = 'Edit_HWID'
    end
  end
  object Button1: TButton
    Left = 16
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Reset'
    TabOrder = 2
    OnClick = Button1Click
  end
  object mxProtector: TmxProtector
    CodeKey = 'Ignore'
    ProtectionTypes = [stDayTrial, stRegister]
    Options = [poAutoInit, poCheckSytemTime, poPasswordOnce, poUseHardwareKey]
    RegistryRootKey = rkLocalMachine
    Expiration = 38711.548243090280000000
    MaxStartNumber = 0
    MaxDayNumber = 30
    UserName = 'Mohsen Minaei'
    Version = '1.31'
    OnGetHardwareID = mxProtectorGetHardwareID
    Left = 232
    UniqueCodeID = 
      '7A41333D3445373D3A273A484F38222454222239572F525C342F225A5F5C2914' +
      '621B6014635B'
    UniqueID = 
      '210857746E7065660376711B0E236C1F0214686E1D026F7649076E0913107468' +
      '726D795B7620'
  end
  object XPManifest1: TXPManifest
    Left = 240
    Top = 192
  end
end
