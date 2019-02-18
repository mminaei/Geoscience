object paging: Tpaging
  Left = 364
  Top = 347
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Paging'
  ClientHeight = 32
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  ScreenSnap = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 319
    Height = 32
    Align = alClient
    TabOrder = 0
    object Button1: TButton
      Left = 0
      Top = 0
      Width = 80
      Height = 33
      Caption = 'First Page <<<<'
      TabOrder = 0
      WordWrap = True
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 80
      Top = 0
      Width = 80
      Height = 33
      Caption = 'Previous Page  <<'
      TabOrder = 1
      WordWrap = True
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 160
      Top = 0
      Width = 80
      Height = 33
      Caption = 'Next Pag     >>'
      Default = True
      TabOrder = 2
      WordWrap = True
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 240
      Top = 0
      Width = 80
      Height = 33
      Caption = 'Last Page >>>>'
      TabOrder = 3
      WordWrap = True
      OnClick = Button4Click
    end
  end
end
