object Load_Form: TLoad_Form
  Left = 673
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Project'
  ClientHeight = 626
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
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
  object Panel1: TPanel
    Left = 0
    Top = 585
    Width = 482
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button3: TButton
      Left = 400
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 1
      OnClick = Button4Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 482
    Height = 585
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'LAS - DLIS'
      object GroupBox2: TGroupBox
        Left = 0
        Top = 52
        Width = 474
        Height = 241
        Align = alBottom
        Caption = 'LAS File'
        TabOrder = 0
        object Label10: TLabel
          Left = 8
          Top = 48
          Width = 35
          Height = 13
          Caption = 'Header'
        end
        object Edit1: TEdit
          Left = 88
          Top = 18
          Width = 377
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object Button1: TButton
          Left = 8
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Select'
          TabOrder = 1
          OnClick = Button1Click
        end
        object Memo1: TMemo
          Left = 2
          Top = 64
          Width = 470
          Height = 175
          Align = alBottom
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 2
          WordWrap = False
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 293
        Width = 474
        Height = 264
        Align = alBottom
        Caption = 'Tracks'
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 48
          Width = 34
          Height = 13
          Caption = 'Bit Size'
        end
        object Label2: TLabel
          Left = 8
          Top = 72
          Width = 33
          Height = 13
          Caption = 'Caliper'
        end
        object Label3: TLabel
          Left = 8
          Top = 96
          Width = 57
          Height = 13
          Caption = 'Gamma Ray'
        end
        object Label4: TLabel
          Left = 8
          Top = 120
          Width = 88
          Height = 13
          Caption = 'Shallow Resistivity'
        end
        object Label5: TLabel
          Left = 8
          Top = 144
          Width = 88
          Height = 13
          Caption = 'Medium Resistivity'
        end
        object Label6: TLabel
          Left = 8
          Top = 168
          Width = 77
          Height = 13
          Caption = 'Deep Resistivity'
        end
        object Label7: TLabel
          Left = 8
          Top = 192
          Width = 36
          Height = 13
          Caption = 'Density'
        end
        object Label8: TLabel
          Left = 8
          Top = 216
          Width = 39
          Height = 13
          Caption = 'Neutron'
        end
        object Label9: TLabel
          Left = 8
          Top = 240
          Width = 62
          Height = 13
          Caption = 'Photoelectric'
        end
        object ComboBox1: TComboBox
          Tag = 1
          Left = 104
          Top = 44
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          OnChange = ComboBox1Change
        end
        object ComboBox2: TComboBox
          Tag = 2
          Left = 104
          Top = 68
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 2
          OnChange = ComboBox2Change
        end
        object ComboBox3: TComboBox
          Tag = 3
          Left = 104
          Top = 92
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 3
          OnChange = ComboBox3Change
        end
        object ComboBox4: TComboBox
          Tag = 4
          Left = 104
          Top = 116
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 4
          OnChange = ComboBox4Change
        end
        object ComboBox5: TComboBox
          Tag = 5
          Left = 104
          Top = 140
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 5
          OnChange = ComboBox5Change
        end
        object ComboBox6: TComboBox
          Tag = 6
          Left = 104
          Top = 164
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 6
          OnChange = ComboBox6Change
        end
        object ComboBox7: TComboBox
          Tag = 7
          Left = 104
          Top = 188
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 7
          OnChange = ComboBox7Change
        end
        object ComboBox8: TComboBox
          Tag = 8
          Left = 104
          Top = 212
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 8
          OnChange = ComboBox8Change
        end
        object ComboBox9: TComboBox
          Tag = 9
          Left = 104
          Top = 236
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 9
          OnChange = ComboBox9Change
        end
        object StringGrid1: TStringGrid
          Left = 256
          Top = 19
          Width = 205
          Height = 239
          TabStop = False
          ColCount = 2
          Ctl3D = False
          DefaultColWidth = 100
          DefaultRowHeight = 21
          FixedColor = 16777190
          FixedCols = 0
          RowCount = 10
          GridLineWidth = 3
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          ParentCtl3D = False
          ScrollBars = ssNone
          TabOrder = 0
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 474
        Height = 52
        Align = alClient
        Caption = 'Convert DLIS to LAS'
        TabOrder = 2
        object Button2: TButton
          Left = 8
          Top = 18
          Width = 75
          Height = 25
          Caption = 'Go!'
          TabOrder = 0
          OnClick = Button2Click
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TEXT'
      ImageIndex = 1
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 474
        Height = 289
        Align = alTop
        Caption = 'Text File'
        TabOrder = 0
        object Label16: TLabel
          Left = 8
          Top = 48
          Width = 38
          Height = 13
          Caption = 'Preview'
        end
        object Button5: TButton
          Left = 8
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Select'
          Default = True
          TabOrder = 0
          OnClick = Button5Click
        end
        object Edit6: TEdit
          Left = 88
          Top = 18
          Width = 377
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object Memo2: TMemo
          Left = 8
          Top = 64
          Width = 455
          Height = 121
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 2
          WordWrap = False
        end
        object GroupBox5: TGroupBox
          Left = 2
          Top = 192
          Width = 470
          Height = 95
          Align = alBottom
          Caption = 'How To Read?'
          TabOrder = 3
          object Label11: TLabel
            Left = 8
            Top = 18
            Width = 41
            Height = 13
            Caption = 'Delimiter'
            Transparent = True
          end
          object Label12: TLabel
            Left = 8
            Top = 40
            Width = 112
            Height = 13
            Caption = 'Number of Lines to Skip'
          end
          object Label14: TLabel
            Left = 6
            Top = 62
            Width = 51
            Height = 13
            Caption = 'Depth Unit'
          end
          object Label13: TLabel
            Left = 269
            Top = 18
            Width = 107
            Height = 13
            Caption = 'Depth Column Number'
          end
          object Label15: TLabel
            Left = 269
            Top = 40
            Width = 46
            Height = 13
            Caption = 'Null Value'
          end
          object ComboBox10: TComboBox
            Left = 128
            Top = 14
            Width = 73
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Text = 'Comma'
            Items.Strings = (
              'Comma'
              'Space'
              'Tab')
          end
          object Edit2: TEdit
            Left = 128
            Top = 36
            Width = 73
            Height = 21
            TabOrder = 1
          end
          object Edit4: TEdit
            Left = 128
            Top = 58
            Width = 73
            Height = 21
            TabOrder = 2
            Text = 'M'
          end
          object Edit3: TEdit
            Left = 384
            Top = 14
            Width = 73
            Height = 21
            TabOrder = 3
            Text = '1'
          end
          object Edit5: TEdit
            Left = 384
            Top = 36
            Width = 73
            Height = 21
            TabOrder = 4
            Text = '-999.25'
          end
          object Button6: TButton
            Left = 384
            Top = 64
            Width = 75
            Height = 25
            Caption = 'Read'
            TabOrder = 5
            OnClick = Button6Click
          end
        end
      end
      object GroupBox6: TGroupBox
        Left = 0
        Top = 293
        Width = 474
        Height = 264
        Align = alBottom
        Caption = 'Tracks'
        TabOrder = 1
        object Label17: TLabel
          Left = 8
          Top = 48
          Width = 34
          Height = 13
          Caption = 'Bit Size'
        end
        object Label18: TLabel
          Left = 8
          Top = 72
          Width = 33
          Height = 13
          Caption = 'Caliper'
        end
        object Label19: TLabel
          Left = 8
          Top = 96
          Width = 57
          Height = 13
          Caption = 'Gamma Ray'
        end
        object Label20: TLabel
          Left = 8
          Top = 120
          Width = 88
          Height = 13
          Caption = 'Shallow Resistivity'
        end
        object Label21: TLabel
          Left = 8
          Top = 144
          Width = 88
          Height = 13
          Caption = 'Medium Resistivity'
        end
        object Label22: TLabel
          Left = 8
          Top = 168
          Width = 77
          Height = 13
          Caption = 'Deep Resistivity'
        end
        object Label23: TLabel
          Left = 8
          Top = 192
          Width = 36
          Height = 13
          Caption = 'Density'
        end
        object Label24: TLabel
          Left = 8
          Top = 216
          Width = 39
          Height = 13
          Caption = 'Neutron'
        end
        object Label25: TLabel
          Left = 8
          Top = 240
          Width = 62
          Height = 13
          Caption = 'Photoelectric'
        end
        object ComboBox11: TComboBox
          Tag = 1
          Left = 104
          Top = 44
          Width = 145
          Height = 21
          ItemHeight = 0
          TabOrder = 1
          OnChange = ComboBox11Change
        end
        object ComboBox12: TComboBox
          Tag = 2
          Left = 104
          Top = 68
          Width = 145
          Height = 21
          ItemHeight = 0
          TabOrder = 2
          OnChange = ComboBox12Change
        end
        object ComboBox13: TComboBox
          Tag = 3
          Left = 104
          Top = 92
          Width = 145
          Height = 21
          ItemHeight = 0
          TabOrder = 3
          OnChange = ComboBox13Change
        end
        object ComboBox14: TComboBox
          Tag = 4
          Left = 104
          Top = 116
          Width = 145
          Height = 21
          ItemHeight = 0
          TabOrder = 4
          OnChange = ComboBox14Change
        end
        object ComboBox15: TComboBox
          Tag = 5
          Left = 104
          Top = 140
          Width = 145
          Height = 21
          ItemHeight = 0
          TabOrder = 5
          OnChange = ComboBox15Change
        end
        object ComboBox16: TComboBox
          Tag = 6
          Left = 104
          Top = 164
          Width = 145
          Height = 21
          ItemHeight = 0
          TabOrder = 6
          OnChange = ComboBox16Change
        end
        object ComboBox17: TComboBox
          Tag = 7
          Left = 104
          Top = 188
          Width = 145
          Height = 21
          ItemHeight = 0
          TabOrder = 7
          OnChange = ComboBox17Change
        end
        object ComboBox18: TComboBox
          Tag = 8
          Left = 104
          Top = 212
          Width = 145
          Height = 21
          ItemHeight = 0
          TabOrder = 8
          OnChange = ComboBox18Change
        end
        object ComboBox19: TComboBox
          Tag = 9
          Left = 104
          Top = 236
          Width = 145
          Height = 21
          ItemHeight = 0
          TabOrder = 9
          OnChange = ComboBox19Change
        end
        object StringGrid2: TStringGrid
          Left = 256
          Top = 19
          Width = 205
          Height = 239
          TabStop = False
          ColCount = 2
          Ctl3D = False
          DefaultColWidth = 100
          DefaultRowHeight = 21
          FixedColor = 16777190
          FixedCols = 0
          RowCount = 10
          GridLineWidth = 3
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          ParentCtl3D = False
          ScrollBars = ssNone
          TabOrder = 0
        end
      end
    end
  end
end
