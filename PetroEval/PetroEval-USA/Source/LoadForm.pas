unit LoadForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, Math, ExtActns;

type
  TLoad_Form = class(TForm)
    Panel1: TPanel;
    Button3: TButton;
    Button4: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    StringGrid1: TStringGrid;
    GroupBox3: TGroupBox;
    Button2: TButton;
    GroupBox4: TGroupBox;
    Button5: TButton;
    Edit6: TEdit;
    Memo2: TMemo;
    GroupBox5: TGroupBox;
    ComboBox10: TComboBox;
    Label11: TLabel;
    Label12: TLabel;
    Edit2: TEdit;
    Edit4: TEdit;
    Label14: TLabel;
    Label13: TLabel;
    Edit3: TEdit;
    Edit5: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    GroupBox6: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    ComboBox11: TComboBox;
    ComboBox12: TComboBox;
    ComboBox13: TComboBox;
    ComboBox14: TComboBox;
    ComboBox15: TComboBox;
    ComboBox16: TComboBox;
    ComboBox17: TComboBox;
    ComboBox18: TComboBox;
    ComboBox19: TComboBox;
    StringGrid2: TStringGrid;
    Button6: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Fill( var Combo: TComboBox);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure ComboBox8Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ComboBox11Change(Sender: TObject);
    procedure ComboBox12Change(Sender: TObject);
    procedure ComboBox13Change(Sender: TObject);
    procedure ComboBox14Change(Sender: TObject);
    procedure ComboBox15Change(Sender: TObject);
    procedure ComboBox16Change(Sender: TObject);
    procedure ComboBox17Change(Sender: TObject);
    procedure ComboBox18Change(Sender: TObject);
    procedure ComboBox19Change(Sender: TObject);
    procedure DeleteFiles;
    procedure ReadLAS(FileName: String);
  private
    { Private declarations }
  public
    Database_Opened:Boolean;
{      BS_Track_Number,
      CALI_Track_Number,
      GR_Track_Number,
      MSFL_Track_Number,
      LLM_Track_Number,
      LLD_Track_Number,
      RHO_Track_Number,
      NPHI_Track_Number,
      PEF_Track_Number,
      DT_Track_Number    :Smallint;}
    { Public declarations }
  end;

var
  Load_Form: TLoad_Form;

implementation

uses FirstForm, Main_Form, Main_Form2;

{$R *.dfm}

procedure TLoad_Form.ReadLAS(FileName:String);
begin
//
end;

procedure TLoad_Form.Button3Click(Sender: TObject);
begin
  Close;
  First_Form.Visible:=True;
end;

procedure TLoad_Form.Button1Click(Sender: TObject);
var
i:integer;
Header: TStringList;
//s1,s2:string;
//p1,p2:integer;
//File_Name:string;
//Temp_Value:Integer;
//ConversionUnit:Single;
begin
  with MainForm2 do
    begin

      DeleteFiles;

      BS_Track_Number:=-1;
      CALI_Track_Number:=-1;
      GR_Track_Number:=-1;
      MSFL_Track_Number:=-1;
      LLM_Track_Number:=-1;
      LLD_Track_Number:=-1;
      RHO_Track_Number:=-1;
      NPHI_Track_Number:=-1;
      PEF_Track_Number:=-1;
      DT_Track_Number:=-1;

      LAS1.Click;

      if OpenDialog1.Files.Count=0 then Exit;

      with MainForm do
        begin
          BS_Track_Number:=-1;
          CALI_Track_Number:=-1;
          GR_Track_Number:=-1;
          MSFL_Track_Number:=-1;
          LLM_Track_Number:=-1;
          LLD_Track_Number:=-1;
          RHO_Track_Number:=-1;
          NPHI_Track_Number:=-1;
          PEF_Track_Number:=-1;
          DT_Track_Number:=-1;
          LAS1.Click;
          DT_Track_Number:=MainForm2.DT_Track_Number-1;
        end;

      Database_Opened:=True;

      Edit1.Text:=OpenDialog1.FileName;
      Memo1.Clear;
      Header:=TStringList.Create;
      Header.LoadFromFile(OpenDialog1.FileName);
      for i:=0 to OpenedFile.DataStartLineNo-1 do
        Memo1.Lines.Append(Header[i]);
      Header.Free;
      Fill(ComboBox1);
      Fill(ComboBox2);
      Fill(ComboBox3);
      Fill(ComboBox4);
      Fill(ComboBox5);
      Fill(ComboBox6);
      Fill(ComboBox7);
      Fill(ComboBox8);
      Fill(ComboBox9);
      ComboBox1.ItemIndex:=BS_Track_Number;
      ComboBox2.ItemIndex:=CALI_Track_Number;
      ComboBox3.ItemIndex:=GR_Track_Number;
      ComboBox4.ItemIndex:=MSFL_Track_Number;
      ComboBox5.ItemIndex:=LLM_Track_Number;
      ComboBox6.ItemIndex:=LLD_Track_Number;
      ComboBox7.ItemIndex:=RHO_Track_Number;
      ComboBox8.ItemIndex:=NPHI_Track_Number;
      ComboBox9.ItemIndex:=PEF_Track_Number;

      StringGrid1.Cells[0,1]:=FloatToStr(RoundTo(DBChart1.Series[2].MinXValue, -4));
      StringGrid1.Cells[0,2]:=FloatToStr(RoundTo(DBChart1.Series[1].MinXValue, -4));
      StringGrid1.Cells[0,3]:=FloatToStr(RoundTo(DBChart1.Series[0].MinXValue, -4));
      StringGrid1.Cells[0,4]:=FloatToStr(RoundTo(DBChart3.Series[0].MinXValue, -4));
      StringGrid1.Cells[0,5]:=FloatToStr(RoundTo(DBChart3.Series[1].MinXValue, -4));
      StringGrid1.Cells[0,6]:=FloatToStr(RoundTo(DBChart3.Series[2].MinXValue, -4));
      StringGrid1.Cells[0,7]:=FloatToStr(RoundTo(DBChart4.Series[0].MinXValue, -4));
      StringGrid1.Cells[0,8]:=FloatToStr(RoundTo(DBChart4.Series[1].MinXValue, -4));
      StringGrid1.Cells[0,9]:=FloatToStr(RoundTo(DBChart4.Series[2].MinXValue, -4));
      StringGrid1.Cells[1,1]:=FloatToStr(RoundTo(DBChart1.Series[2].MaxXValue, -4));
      StringGrid1.Cells[1,2]:=FloatToStr(RoundTo(DBChart1.Series[1].MaxXValue, -4));
      StringGrid1.Cells[1,3]:=FloatToStr(RoundTo(DBChart1.Series[0].MaxXValue, -4));
      StringGrid1.Cells[1,4]:=FloatToStr(RoundTo(DBChart3.Series[0].MaxXValue, -4));
      StringGrid1.Cells[1,5]:=FloatToStr(RoundTo(DBChart3.Series[1].MaxXValue, -4));
      StringGrid1.Cells[1,6]:=FloatToStr(RoundTo(DBChart3.Series[2].MaxXValue, -4));
      StringGrid1.Cells[1,7]:=FloatToStr(RoundTo(DBChart4.Series[0].MaxXValue, -4));
      StringGrid1.Cells[1,8]:=FloatToStr(RoundTo(DBChart4.Series[1].MaxXValue, -4));
      StringGrid1.Cells[1,9]:=FloatToStr(RoundTo(DBChart4.Series[2].MaxXValue, -4));
    end;
end;

procedure TLoad_Form.Fill( var Combo: TComboBox);
var
j:integer;
begin
  with MainForm do
    begin
      Combo.Items.Clear;
      Combo.Clear;
          for j:=0 to OpenedFile.Values.FieldDefs.Count-1 do
            begin
              Combo.Items.Add(OpenedFile.Values.FieldDefs[j].Name);
            end;
      Combo.ItemIndex:=-1;
    end;
end;

procedure TLoad_Form.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0,0]:='Minimum Value';
  StringGrid1.Cells[1,0]:='Maximum Value';
  Database_Opened:=False;
end;

procedure TLoad_Form.Button4Click(Sender: TObject);
var
i:integer;
begin
if PageControl1.TabIndex=1 then
  begin
    with MainForm do
      begin
        BS_Track_Number:=ComboBox11.ItemIndex-1;
        CALI_Track_Number:=ComboBox12.ItemIndex-1;
        GR_Track_Number:=ComboBox13.ItemIndex-1;
        MSFL_Track_Number:=ComboBox14.ItemIndex-1;
        LLM_Track_Number:=ComboBox15.ItemIndex-1;
        LLD_Track_Number:=ComboBox16.ItemIndex-1;
        RHO_Track_Number:=ComboBox17.ItemIndex-1;
        NPHI_Track_Number:=ComboBox18.ItemIndex-1;
        PEF_Track_Number:=ComboBox19.ItemIndex-1;
      end;
  with MainForm2 do
    begin
      BS_Track_Number:=ComboBox11.ItemIndex;
      CALI_Track_Number:=ComboBox12.ItemIndex;
      GR_Track_Number:=ComboBox13.ItemIndex;
      MSFL_Track_Number:=ComboBox14.ItemIndex;
      LLM_Track_Number:=ComboBox15.ItemIndex;
      LLD_Track_Number:=ComboBox16.ItemIndex;
      RHO_Track_Number:=ComboBox17.ItemIndex;
      NPHI_Track_Number:=ComboBox18.ItemIndex;
      PEF_Track_Number:=ComboBox19.ItemIndex;

      with OpenedFile do
        begin
          if GR_Track_Number<>-1 then
            begin
              DBChart1.Series[0].XValues.ValueSource:=Values.FieldDefs[GR_Track_Number].Name;
              DBChart1.Series[0].XValues.Name:=Values.FieldDefs[GR_Track_Number].Name;
              Properties.First;
              for i:=0 to GR_Track_Number-1 do
                Properties.Next;
              DBChart5.CustomAxes[0].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart1.Series[0].XValues.ValueSource:='';
              DBChart1.Series[0].XValues.Name:='';
              DBChart5.CustomAxes[0].Title.Caption :='[GR]';
            end;

          if CALI_Track_Number<>-1 then
            begin
              DBChart1.Series[1].XValues.ValueSource:=Values.FieldDefs[CALI_Track_Number].Name;
              DBChart1.Series[1].XValues.Name:=Values.FieldDefs[CALI_Track_Number].Name;
              Properties.First;
              for i:=0 to CALI_Track_Number-1 do
                Properties.Next;
              DBChart5.CustomAxes[1].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart1.Series[1].XValues.ValueSource:='';
              DBChart1.Series[1].XValues.Name:='';
              DBChart5.CustomAxes[1].Title.Caption :='[CALIPER]';
            end;

          if BS_Track_Number<>-1 then
            begin
              DBChart1.Series[2].XValues.ValueSource:=Values.FieldDefs[BS_Track_Number].Name;
              DBChart1.Series[2].XValues.Name:=Values.FieldDefs[BS_Track_Number].Name;
              Properties.First;
              for i:=0 to BS_Track_Number-1 do
                Properties.Next;
              DBChart5.CustomAxes[2].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart1.Series[2].XValues.ValueSource:='';
              DBChart1.Series[2].XValues.Name:='';
              DBChart5.CustomAxes[2].Title.Caption :='[BIT SIZE]';
            end;

          if MSFL_Track_Number<>-1 then
            begin
              DBChart3.Series[0].XValues.ValueSource:=Values.FieldDefs[MSFL_Track_Number].Name;
              DBChart3.Series[0].XValues.Name:=Values.FieldDefs[MSFL_Track_Number].Name;
              Properties.First;
              for i:=0 to MSFL_Track_Number-1 do
                Properties.Next;
              DBChart7.CustomAxes[0].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart3.Series[0].XValues.ValueSource:='';
              DBChart3.Series[0].XValues.Name:='';
              DBChart7.CustomAxes[0].Title.Caption :='[MSFL]';
            end;

          if LLM_Track_Number<>-1 then
            begin
              DBChart3.Series[1].XValues.ValueSource:=Values.FieldDefs[LLM_Track_Number].Name;
              DBChart3.Series[1].XValues.Name:=Values.FieldDefs[LLM_Track_Number].Name;
              Properties.First;
              for i:=0 to LLM_Track_Number-1 do
                Properties.Next;
              DBChart7.CustomAxes[1].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart3.Series[1].XValues.ValueSource:='';
              DBChart3.Series[1].XValues.Name:='';
              DBChart7.CustomAxes[1].Title.Caption :='[LLM]';
            end;

          if LLD_Track_Number<>-1 then
            begin
              DBChart7.Series[2].XValues.ValueSource:=Values.FieldDefs[LLD_Track_Number].Name;
              DBChart7.Series[2].XValues.Name:=Values.FieldDefs[LLD_Track_Number].Name;
              Properties.First;
              for i:=0 to LLD_Track_Number-1 do
                Properties.Next;
              DBChart7.CustomAxes[2].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart3.Series[2].XValues.ValueSource:='';
              DBChart3.Series[2].XValues.Name:='';
              DBChart7.CustomAxes[2].Title.Caption :='[LLD]';
            end;

          if RHO_Track_Number<>-1 then
            begin
              DBChart4.Series[0].XValues.ValueSource:=Values.FieldDefs[RHO_Track_Number].Name;
              DBChart4.Series[0].XValues.Name:=Values.FieldDefs[RHO_Track_Number].Name;
              Properties.First;
              for i:=0 to RHO_Track_Number-1 do
                Properties.Next;
              DBChart8.CustomAxes[0].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart4.Series[0].XValues.ValueSource:='';
              DBChart4.Series[0].XValues.Name:='';
              DBChart8.CustomAxes[0].Title.Caption :='[RHO]';
            end;

          if NPHI_Track_Number<>-1 then
            begin
              DBChart4.Series[1].XValues.ValueSource:=Values.FieldDefs[NPHI_Track_Number].Name;
              DBChart4.Series[1].XValues.Name:=Values.FieldDefs[NPHI_Track_Number].Name;
              Properties.First;
              for i:=0 to NPHI_Track_Number-1 do
                Properties.Next;
              DBChart8.CustomAxes[1].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart4.Series[1].XValues.ValueSource:='';
              DBChart4.Series[1].XValues.Name:='';
              DBChart8.CustomAxes[1].Title.Caption :='[NPHI]';
            end;

          if PEF_Track_Number<>-1 then
            begin
              DBChart4.Series[2].XValues.ValueSource:=Values.FieldDefs[PEF_Track_Number].Name;
              DBChart4.Series[2].XValues.Name:=Values.FieldDefs[PEF_Track_Number].Name;
              Properties.First;
              for i:=0 to PEF_Track_Number-1 do
                Properties.Next;
              DBChart8.CustomAxes[2].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart4.Series[2].XValues.ValueSource:='';
              DBChart4.Series[2].XValues.Name:='';
              DBChart8.CustomAxes[2].Title.Caption :='[PEF]';
            end;

          if DT_Track_Number<>-1 then
            begin
              DBChart4.Series[3].XValues.ValueSource:=Values.FieldDefs[DT_Track_Number].Name;
              DBChart4.Series[3].XValues.Name:=Values.FieldDefs[DT_Track_Number].Name;
              Properties.First;
              for i:=0 to DT_Track_Number-1 do
                Properties.Next;
              DBChart8.CustomAxes[3].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart4.Series[3].XValues.ValueSource:='';
              DBChart4.Series[3].XValues.Name:='';
              DBChart8.CustomAxes[3].Title.Caption :='[DT]';
            end;

        end;
    end;
  end
else
  begin
    with MainForm do
      begin
        BS_Track_Number:=ComboBox1.ItemIndex-1;
        CALI_Track_Number:=ComboBox2.ItemIndex-1;
        GR_Track_Number:=ComboBox3.ItemIndex-1;
        MSFL_Track_Number:=ComboBox4.ItemIndex-1;
        LLM_Track_Number:=ComboBox5.ItemIndex-1;
        LLD_Track_Number:=ComboBox6.ItemIndex-1;
        RHO_Track_Number:=ComboBox7.ItemIndex-1;
        NPHI_Track_Number:=ComboBox8.ItemIndex-1;
        PEF_Track_Number:=ComboBox9.ItemIndex-1;
      end;
  with MainForm2 do
    begin
      BS_Track_Number:=ComboBox1.ItemIndex;
      CALI_Track_Number:=ComboBox2.ItemIndex;
      GR_Track_Number:=ComboBox3.ItemIndex;
      MSFL_Track_Number:=ComboBox4.ItemIndex;
      LLM_Track_Number:=ComboBox5.ItemIndex;
      LLD_Track_Number:=ComboBox6.ItemIndex;
      RHO_Track_Number:=ComboBox7.ItemIndex;
      NPHI_Track_Number:=ComboBox8.ItemIndex;
      PEF_Track_Number:=ComboBox9.ItemIndex;

      with OpenedFile do
        begin
          if GR_Track_Number<>-1 then
            begin
              DBChart1.Series[0].XValues.ValueSource:=Values.FieldDefs[GR_Track_Number].Name;
              DBChart1.Series[0].XValues.Name:=Values.FieldDefs[GR_Track_Number].Name;
              Properties.First;
              for i:=0 to GR_Track_Number-1 do
                Properties.Next;
              DBChart5.CustomAxes[0].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart1.Series[0].XValues.ValueSource:='';
              DBChart1.Series[0].XValues.Name:='';
              DBChart5.CustomAxes[0].Title.Caption :='[GR]';
            end;

          if CALI_Track_Number<>-1 then
            begin
              DBChart1.Series[1].XValues.ValueSource:=Values.FieldDefs[CALI_Track_Number].Name;
              DBChart1.Series[1].XValues.Name:=Values.FieldDefs[CALI_Track_Number].Name;
              Properties.First;
              for i:=0 to CALI_Track_Number-1 do
                Properties.Next;
              DBChart5.CustomAxes[1].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart1.Series[1].XValues.ValueSource:='';
              DBChart1.Series[1].XValues.Name:='';
              DBChart5.CustomAxes[1].Title.Caption :='[CALIPER]';
            end;

          if BS_Track_Number<>-1 then
            begin
              DBChart1.Series[2].XValues.ValueSource:=Values.FieldDefs[BS_Track_Number].Name;
              DBChart1.Series[2].XValues.Name:=Values.FieldDefs[BS_Track_Number].Name;
              Properties.First;
              for i:=0 to BS_Track_Number-1 do
                Properties.Next;
              DBChart5.CustomAxes[2].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart1.Series[2].XValues.ValueSource:='';
              DBChart1.Series[2].XValues.Name:='';
              DBChart5.CustomAxes[2].Title.Caption :='[BIT SIZE]';
            end;

          if MSFL_Track_Number<>-1 then
            begin
              DBChart3.Series[0].XValues.ValueSource:=Values.FieldDefs[MSFL_Track_Number].Name;
              DBChart3.Series[0].XValues.Name:=Values.FieldDefs[MSFL_Track_Number].Name;
              Properties.First;
              for i:=0 to MSFL_Track_Number-1 do
                Properties.Next;
              DBChart7.CustomAxes[0].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart3.Series[0].XValues.ValueSource:='';
              DBChart3.Series[0].XValues.Name:='';
              DBChart7.CustomAxes[0].Title.Caption :='[MSFL]';
            end;

          if LLM_Track_Number<>-1 then
            begin
              DBChart3.Series[1].XValues.ValueSource:=Values.FieldDefs[LLM_Track_Number].Name;
              DBChart3.Series[1].XValues.Name:=Values.FieldDefs[LLM_Track_Number].Name;
              Properties.First;
              for i:=0 to LLM_Track_Number-1 do
                Properties.Next;
              DBChart7.CustomAxes[1].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart3.Series[1].XValues.ValueSource:='';
              DBChart3.Series[1].XValues.Name:='';
              DBChart7.CustomAxes[1].Title.Caption :='[LLM]';
            end;

          if LLD_Track_Number<>-1 then
            begin
              DBChart7.Series[2].XValues.ValueSource:=Values.FieldDefs[LLD_Track_Number].Name;
              DBChart7.Series[2].XValues.Name:=Values.FieldDefs[LLD_Track_Number].Name;
              Properties.First;
              for i:=0 to LLD_Track_Number-1 do
                Properties.Next;
              DBChart7.CustomAxes[2].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart3.Series[2].XValues.ValueSource:='';
              DBChart3.Series[2].XValues.Name:='';
              DBChart7.CustomAxes[2].Title.Caption :='[LLD]';
            end;

          if RHO_Track_Number<>-1 then
            begin
              DBChart4.Series[0].XValues.ValueSource:=Values.FieldDefs[RHO_Track_Number].Name;
              DBChart4.Series[0].XValues.Name:=Values.FieldDefs[RHO_Track_Number].Name;
              Properties.First;
              for i:=0 to RHO_Track_Number-1 do
                Properties.Next;
              DBChart8.CustomAxes[0].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart4.Series[0].XValues.ValueSource:='';
              DBChart4.Series[0].XValues.Name:='';
              DBChart8.CustomAxes[0].Title.Caption :='[RHO]';
            end;

          if NPHI_Track_Number<>-1 then
            begin
              DBChart4.Series[1].XValues.ValueSource:=Values.FieldDefs[NPHI_Track_Number].Name;
              DBChart4.Series[1].XValues.Name:=Values.FieldDefs[NPHI_Track_Number].Name;
              Properties.First;
              for i:=0 to NPHI_Track_Number-1 do
                Properties.Next;
              DBChart8.CustomAxes[1].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart4.Series[1].XValues.ValueSource:='';
              DBChart4.Series[1].XValues.Name:='';
              DBChart8.CustomAxes[1].Title.Caption :='[NPHI]';
            end;

          if PEF_Track_Number<>-1 then
            begin
              DBChart4.Series[2].XValues.ValueSource:=Values.FieldDefs[PEF_Track_Number].Name;
              DBChart4.Series[2].XValues.Name:=Values.FieldDefs[PEF_Track_Number].Name;
              Properties.First;
              for i:=0 to PEF_Track_Number-1 do
                Properties.Next;
              DBChart8.CustomAxes[2].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart4.Series[2].XValues.ValueSource:='';
              DBChart4.Series[2].XValues.Name:='';
              DBChart8.CustomAxes[2].Title.Caption :='[PEF]';
            end;

          if DT_Track_Number<>-1 then
            begin
              DBChart4.Series[3].XValues.ValueSource:=Values.FieldDefs[DT_Track_Number].Name;
              DBChart4.Series[3].XValues.Name:=Values.FieldDefs[DT_Track_Number].Name;
              Properties.First;
              for i:=0 to DT_Track_Number-1 do
                Properties.Next;
              DBChart8.CustomAxes[3].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
            end
          else
            begin
              DBChart4.Series[3].XValues.ValueSource:='';
              DBChart4.Series[3].XValues.Name:='';
              DBChart8.CustomAxes[3].Title.Caption :='[DT]';
            end;

        end;
    end;
  end;
  Close;
  First_Form.Visible:=True;
end;

procedure TLoad_Form.ComboBox1Change(Sender: TObject);
begin
      MainForm2.BS_Track_Number:=ComboBox1.ItemIndex;
      if MainForm2.BS_Track_Number<>-1 then
        begin
          MainForm2.DBChart1.Series[2].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm.BS_Track_Number].Name;
          MainForm2.DBChart1.Series[2].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm.BS_Track_Number].Name;
          StringGrid1.Cells[0,1]:=FloatToStr(RoundTo(MainForm2.DBChart1.Series[2].MinXValue, -4));
          StringGrid1.Cells[1,1]:=FloatToStr(RoundTo(MainForm2.DBChart1.Series[2].MaxXValue, -4));
        end
      else
        begin
          StringGrid1.Cells[0,1]:='0';
          StringGrid1.Cells[1,1]:='0';
        end;
end;

procedure TLoad_Form.ComboBox2Change(Sender: TObject);
begin
      MainForm2.CALI_Track_Number:=ComboBox2.ItemIndex;
      if MainForm2.CALI_Track_Number<>-1 then
        begin
          MainForm2.DBChart1.Series[1].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm2.CALI_Track_Number].Name;
          MainForm2.DBChart1.Series[1].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm2.CALI_Track_Number].Name;
          StringGrid1.Cells[0,2]:=FloatToStr(RoundTo(MainForm2.DBChart1.Series[1].MinXValue, -4));
          StringGrid1.Cells[1,2]:=FloatToStr(RoundTo(MainForm2.DBChart1.Series[1].MaxXValue, -4));
        end
      else
        begin
          StringGrid1.Cells[0,2]:='0';
          StringGrid1.Cells[1,2]:='0';
        end;
end;

procedure TLoad_Form.ComboBox3Change(Sender: TObject);
begin
      MainForm2.GR_Track_Number:=ComboBox3.ItemIndex;
      if MainForm2.GR_Track_Number<>-1 then
        begin
          MainForm2.DBChart1.Series[0].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm2.GR_Track_Number].Name;
          MainForm2.DBChart1.Series[0].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm2.GR_Track_Number].Name;
          StringGrid1.Cells[0,3]:=FloatToStr(RoundTo(MainForm2.DBChart1.Series[0].MinXValue, -4));
          StringGrid1.Cells[1,3]:=FloatToStr(RoundTo(MainForm2.DBChart1.Series[0].MaxXValue, -4));
        end
      else
        begin
          StringGrid1.Cells[0,3]:='0';
          StringGrid1.Cells[1,3]:='0';
        end;
end;

procedure TLoad_Form.ComboBox4Change(Sender: TObject);
begin
      MainForm2.MSFL_Track_Number:=ComboBox4.ItemIndex;
      if MainForm2.MSFL_Track_Number<>-1 then
        begin
          MainForm2.DBChart3.Series[0].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm2.MSFL_Track_Number].Name;
          MainForm2.DBChart3.Series[0].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm2.MSFL_Track_Number].Name;
          StringGrid1.Cells[0,4]:=FloatToStr(RoundTo(MainForm2.DBChart3.Series[0].MinXValue, -4));
          StringGrid1.Cells[1,4]:=FloatToStr(RoundTo(MainForm2.DBChart3.Series[0].MaxXValue, -4));
        end
      else
        begin
          StringGrid1.Cells[0,4]:='0';
          StringGrid1.Cells[1,4]:='0';
        end;
end;

procedure TLoad_Form.ComboBox5Change(Sender: TObject);
begin
      MainForm2.LLM_Track_Number:=ComboBox5.ItemIndex;
      if MainForm2.LLM_Track_Number<>-1 then
        begin
          MainForm2.DBChart3.Series[1].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm2.LLM_Track_Number].Name;
          MainForm2.DBChart3.Series[1].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm2.LLM_Track_Number].Name;
          StringGrid1.Cells[0,5]:=FloatToStr(RoundTo(MainForm2.DBChart3.Series[1].MinXValue, -4));
          StringGrid1.Cells[1,5]:=FloatToStr(RoundTo(MainForm2.DBChart3.Series[1].MaxXValue, -4));
        end
      else
        begin
          StringGrid1.Cells[0,5]:='0';
          StringGrid1.Cells[1,5]:='0';
        end;
end;

procedure TLoad_Form.ComboBox6Change(Sender: TObject);
begin
      MainForm2.LLD_Track_Number:=ComboBox6.ItemIndex;
      if MainForm2.LLD_Track_Number<>-1 then
        begin
          MainForm2.DBChart3.Series[2].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm2.LLD_Track_Number].Name;
          MainForm2.DBChart3.Series[2].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm2.LLD_Track_Number].Name;
          StringGrid1.Cells[0,6]:=FloatToStr(RoundTo(MainForm2.DBChart3.Series[2].MinXValue, -4));
          StringGrid1.Cells[1,6]:=FloatToStr(RoundTo(MainForm2.DBChart3.Series[2].MaxXValue, -4));
        end
      else
        begin
          StringGrid1.Cells[0,6]:='0';
          StringGrid1.Cells[1,6]:='0';
        end;
end;

procedure TLoad_Form.ComboBox7Change(Sender: TObject);
begin
      MainForm2.RHO_Track_Number:=ComboBox7.ItemIndex;
      if MainForm2.RHO_Track_Number<>-1 then
        begin
          MainForm2.DBChart4.Series[0].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm2.RHO_Track_Number].Name;
          MainForm2.DBChart4.Series[0].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm2.RHO_Track_Number].Name;
          StringGrid1.Cells[0,7]:=FloatToStr(RoundTo(MainForm2.DBChart4.Series[0].MinXValue, -4));
          StringGrid1.Cells[1,7]:=FloatToStr(RoundTo(MainForm2.DBChart4.Series[0].MaxXValue, -4));
        end
      else
        begin
          StringGrid1.Cells[0,7]:='0';
          StringGrid1.Cells[1,7]:='0';
        end;
end;

procedure TLoad_Form.ComboBox8Change(Sender: TObject);
begin
      MainForm2.NPHI_Track_Number:=ComboBox8.ItemIndex;
      if MainForm2.NPHI_Track_Number<>-1 then
        begin
          MainForm2.DBChart4.Series[1].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm2.NPHI_Track_Number].Name;
          MainForm2.DBChart4.Series[1].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm2.NPHI_Track_Number].Name;
          StringGrid1.Cells[0,8]:=FloatToStr(RoundTo(MainForm2.DBChart4.Series[1].MinXValue, -4));
          StringGrid1.Cells[1,8]:=FloatToStr(RoundTo(MainForm2.DBChart4.Series[1].MaxXValue, -4));
        end
      else
        begin
          StringGrid1.Cells[0,8]:='0';
          StringGrid1.Cells[1,8]:='0';
        end;
end;

procedure TLoad_Form.ComboBox9Change(Sender: TObject);
begin
      MainForm2.PEF_Track_Number:=ComboBox9.ItemIndex;
      if MainForm2.PEF_Track_Number<>-1 then
        begin
          MainForm2.DBChart4.Series[2].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm2.PEF_Track_Number].Name;
          MainForm2.DBChart4.Series[2].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm2.PEF_Track_Number].Name;
          StringGrid1.Cells[0,9]:=FloatToStr(RoundTo(MainForm2.DBChart4.Series[2].MinXValue, -4));
          StringGrid1.Cells[1,9]:=FloatToStr(RoundTo(MainForm2.DBChart4.Series[2].MaxXValue, -4));
        end
      else
        begin
          StringGrid1.Cells[0,9]:='0';
          StringGrid1.Cells[1,9]:='0';
        end;
end;

procedure TLoad_Form.Button2Click(Sender: TObject);
var
P : integer;
Pat, Path: string;
Execute_File:TFileRun;
begin
  Pat:=Application.ExeName;
  P:=Pos('PetroEval.exe',Pat);
  if P=0 then
    P:=Pos('PETROEVAL.EXE',Pat);
  Path := Copy(Pat, 1, P - 1);
  ChDir(Path);
  Execute_File:=TFileRun.Create(Self);
  Execute_File.FileName:='dlisconverter.exe';
  if not Execute_File.Execute then
    begin
      MessageDlg('Specified module not found. Please reinstall the program.', mtError, [mbOk],0);
    end;
  Execute_File.Free;
end;

procedure TLoad_Form.Button5Click(Sender: TObject);
begin
  with MainForm2 do
    begin
      with OpenDialog2 do
        begin
          DefaultExt:='TXT';
          Filter:='Text files|*.txt';
          Title:='Open Text files';
        end;
      if OpenDialog2.Execute then
        begin
          Edit6.Text:=OpenDialog2.FileName;
          Memo2.Lines.LoadFromFile(OpenDialog2.FileName);
        end;
    end;
end;

procedure TLoad_Form.Button6Click(Sender: TObject);
var
s:string;
begin
try
  with MainForm2 do
   begin
      if Database_Opened then DeleteFiles;
//     SetLength(LASFiles, Length(LASFiles)+1);
     OpenedFile:=TLASFile.Create;
//     ChangePath;
     with OpenedFile do
      begin
        s:=UpperCase(ComboBox10.Text);
        if s='COMMA' then DLMChar:=','
        else if s='SPACE' then DLMChar:=' '
        else if s='TAB' then DLMChar:=#9
        else DLMChar:=' ';
        No_Lines_Skip:=Edit2.Text;
        StepValueString:='0.15';
        Depth_Column:=Edit3.Text;
        DepthUnitString:=Edit4.Text;
        NullValueString:=Edit5.Text;
      end;

      BS_Track_Number:=-1;
      CALI_Track_Number:=-1;
      GR_Track_Number:=-1;
      MSFL_Track_Number:=-1;
      LLM_Track_Number:=-1;
      LLD_Track_Number:=-1;
      RHO_Track_Number:=-1;
      NPHI_Track_Number:=-1;
      PEF_Track_Number:=-1;
      DT_Track_Number:=-1;

      ASCIIFile1.Click;

      with MainForm do
        begin
          SetLength(LASFiles, Length(LASFiles)+1);
          LASFiles[Length(LASFiles)-1]:=TLAS2File.Create;
          with LASFiles[Length(LASFiles)-1] do
            begin
              s:=UpperCase(ComboBox10.Text);
              if s='COMMA' then DLMChar:=','
              else if s='SPACE' then DLMChar:=' '
              else if s='TAB' then DLMChar:=#9
              else DLMChar:=' ';
              No_Lines_Skip:=Edit2.Text;
              StepValueString:='0.15';
              Depth_Column:=Edit3.Text;
              DepthUnitString:=Edit4.Text;
              NullValueString:=Edit5.Text;
            end;
          BS_Track_Number:=-1;
          CALI_Track_Number:=-1;
          GR_Track_Number:=-1;
          MSFL_Track_Number:=-1;
          LLM_Track_Number:=-1;
          LLD_Track_Number:=-1;
          RHO_Track_Number:=-1;
          NPHI_Track_Number:=-1;
          PEF_Track_Number:=-1;
          DT_Track_Number:=-1;
          ASCIIFile1.Click;
        end;

      Fill(ComboBox11);
      Fill(ComboBox12);
      Fill(ComboBox13);
      Fill(ComboBox14);
      Fill(ComboBox15);
      Fill(ComboBox16);
      Fill(ComboBox17);
      Fill(ComboBox18);
      Fill(ComboBox19);
      ComboBox11.ItemIndex:=BS_Track_Number;
      ComboBox12.ItemIndex:=CALI_Track_Number;
      ComboBox13.ItemIndex:=GR_Track_Number;
      ComboBox14.ItemIndex:=MSFL_Track_Number;
      ComboBox15.ItemIndex:=LLM_Track_Number;
      ComboBox16.ItemIndex:=LLD_Track_Number;
      ComboBox17.ItemIndex:=RHO_Track_Number;
      ComboBox18.ItemIndex:=NPHI_Track_Number;
      ComboBox19.ItemIndex:=PEF_Track_Number;

      StringGrid2.Cells[0,1]:=FloatToStr(RoundTo(DBChart1.Series[2].MinXValue, -4));
      StringGrid2.Cells[0,2]:=FloatToStr(RoundTo(DBChart1.Series[1].MinXValue, -4));
      StringGrid2.Cells[0,3]:=FloatToStr(RoundTo(DBChart1.Series[0].MinXValue, -4));
      StringGrid2.Cells[0,4]:=FloatToStr(RoundTo(DBChart3.Series[0].MinXValue, -4));
      StringGrid2.Cells[0,5]:=FloatToStr(RoundTo(DBChart3.Series[1].MinXValue, -4));
      StringGrid2.Cells[0,6]:=FloatToStr(RoundTo(DBChart3.Series[2].MinXValue, -4));
      StringGrid2.Cells[0,7]:=FloatToStr(RoundTo(DBChart4.Series[0].MinXValue, -4));
      StringGrid2.Cells[0,8]:=FloatToStr(RoundTo(DBChart4.Series[1].MinXValue, -4));
      StringGrid2.Cells[0,9]:=FloatToStr(RoundTo(DBChart4.Series[2].MinXValue, -4));
      StringGrid2.Cells[1,1]:=FloatToStr(RoundTo(DBChart1.Series[2].MaxXValue, -4));
      StringGrid2.Cells[1,2]:=FloatToStr(RoundTo(DBChart1.Series[1].MaxXValue, -4));
      StringGrid2.Cells[1,3]:=FloatToStr(RoundTo(DBChart1.Series[0].MaxXValue, -4));
      StringGrid2.Cells[1,4]:=FloatToStr(RoundTo(DBChart3.Series[0].MaxXValue, -4));
      StringGrid2.Cells[1,5]:=FloatToStr(RoundTo(DBChart3.Series[1].MaxXValue, -4));
      StringGrid2.Cells[1,6]:=FloatToStr(RoundTo(DBChart3.Series[2].MaxXValue, -4));
      StringGrid2.Cells[1,7]:=FloatToStr(RoundTo(DBChart4.Series[0].MaxXValue, -4));
      StringGrid2.Cells[1,8]:=FloatToStr(RoundTo(DBChart4.Series[1].MaxXValue, -4));
      StringGrid2.Cells[1,9]:=FloatToStr(RoundTo(DBChart4.Series[2].MaxXValue, -4));
    end;
finally
  Database_Opened:=True;
end;
end;

procedure TLoad_Form.ComboBox11Change(Sender: TObject);
begin
      MainForm2.BS_Track_Number:=ComboBox11.ItemIndex;
      if MainForm2.BS_Track_Number<>-1 then
        begin
          MainForm2.DBChart1.Series[2].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm2.BS_Track_Number].Name;
          MainForm2.DBChart1.Series[2].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm2.BS_Track_Number].Name;
          StringGrid2.Cells[0,1]:=FloatToStr(RoundTo(MainForm2.DBChart1.Series[2].MinXValue, -4));
          StringGrid2.Cells[1,1]:=FloatToStr(RoundTo(MainForm2.DBChart1.Series[2].MaxXValue, -4));
        end
      else
        begin
          StringGrid2.Cells[0,1]:='0';
          StringGrid2.Cells[1,1]:='0';
        end;
end;

procedure TLoad_Form.ComboBox12Change(Sender: TObject);
begin
      MainForm2.CALI_Track_Number:=ComboBox12.ItemIndex;
      if MainForm2.CALI_Track_Number<>-1 then
        begin
          MainForm2.DBChart1.Series[1].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm2.CALI_Track_Number].Name;
          MainForm2.DBChart1.Series[1].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm2.CALI_Track_Number].Name;
          StringGrid2.Cells[0,2]:=FloatToStr(RoundTo(MainForm2.DBChart1.Series[1].MinXValue, -4));
          StringGrid2.Cells[1,2]:=FloatToStr(RoundTo(MainForm2.DBChart1.Series[1].MaxXValue, -4));
        end
      else
        begin
          StringGrid2.Cells[0,2]:='0';
          StringGrid2.Cells[1,2]:='0';
        end;
end;

procedure TLoad_Form.ComboBox13Change(Sender: TObject);
begin
      MainForm2.GR_Track_Number:=ComboBox13.ItemIndex;
      if MainForm2.GR_Track_Number<>-1 then
        begin
          MainForm2.DBChart1.Series[0].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm2.GR_Track_Number].Name;
          MainForm2.DBChart1.Series[0].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm2.GR_Track_Number].Name;
          StringGrid2.Cells[0,3]:=FloatToStr(RoundTo(MainForm2.DBChart1.Series[0].MinXValue, -4));
          StringGrid2.Cells[1,3]:=FloatToStr(RoundTo(MainForm2.DBChart1.Series[0].MaxXValue, -4));
        end
      else
        begin
          StringGrid2.Cells[0,3]:='0';
          StringGrid2.Cells[1,3]:='0';
        end;
end;

procedure TLoad_Form.ComboBox14Change(Sender: TObject);
begin
      MainForm2.MSFL_Track_Number:=ComboBox14.ItemIndex;
      if MainForm2.MSFL_Track_Number<>-1 then
        begin
          MainForm2.DBChart3.Series[0].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm2.MSFL_Track_Number].Name;
          MainForm2.DBChart3.Series[0].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm2.MSFL_Track_Number].Name;
          StringGrid2.Cells[0,4]:=FloatToStr(RoundTo(MainForm2.DBChart3.Series[0].MinXValue, -4));
          StringGrid2.Cells[1,4]:=FloatToStr(RoundTo(MainForm2.DBChart3.Series[0].MaxXValue, -4));
        end
      else
        begin
          StringGrid2.Cells[0,4]:='0';
          StringGrid2.Cells[1,4]:='0';
        end;
end;

procedure TLoad_Form.ComboBox15Change(Sender: TObject);
begin
      MainForm2.LLM_Track_Number:=ComboBox15.ItemIndex;
      if MainForm2.LLM_Track_Number<>-1 then
        begin
          MainForm2.DBChart3.Series[1].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm2.LLM_Track_Number].Name;
          MainForm2.DBChart3.Series[1].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm2.LLM_Track_Number].Name;
          StringGrid2.Cells[0,5]:=FloatToStr(RoundTo(MainForm2.DBChart3.Series[1].MinXValue, -4));
          StringGrid2.Cells[1,5]:=FloatToStr(RoundTo(MainForm2.DBChart3.Series[1].MaxXValue, -4));
        end
      else
        begin
          StringGrid2.Cells[0,5]:='0';
          StringGrid2.Cells[1,5]:='0';
        end;
end;

procedure TLoad_Form.ComboBox16Change(Sender: TObject);
begin
      MainForm2.LLD_Track_Number:=ComboBox16.ItemIndex;
      if MainForm2.LLD_Track_Number<>-1 then
        begin
          MainForm2.DBChart3.Series[2].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm2.LLD_Track_Number].Name;
          MainForm2.DBChart3.Series[2].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm2.LLD_Track_Number].Name;
          StringGrid2.Cells[0,6]:=FloatToStr(RoundTo(MainForm2.DBChart3.Series[2].MinXValue, -4));
          StringGrid2.Cells[1,6]:=FloatToStr(RoundTo(MainForm2.DBChart3.Series[2].MaxXValue, -4));
        end
      else
        begin
          StringGrid2.Cells[0,6]:='0';
          StringGrid2.Cells[1,6]:='0';
        end;
end;

procedure TLoad_Form.ComboBox17Change(Sender: TObject);
begin
      MainForm2.RHO_Track_Number:=ComboBox17.ItemIndex;
      if MainForm2.RHO_Track_Number<>-1 then
        begin
          MainForm2.DBChart4.Series[0].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm2.RHO_Track_Number].Name;
          MainForm2.DBChart4.Series[0].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm2.RHO_Track_Number].Name;
          StringGrid2.Cells[0,7]:=FloatToStr(RoundTo(MainForm2.DBChart4.Series[0].MinXValue, -4));
          StringGrid2.Cells[1,7]:=FloatToStr(RoundTo(MainForm2.DBChart4.Series[0].MaxXValue, -4));
        end
      else
        begin
          StringGrid2.Cells[0,7]:='0';
          StringGrid2.Cells[1,7]:='0';
        end;
end;

procedure TLoad_Form.ComboBox18Change(Sender: TObject);
begin
      MainForm2.NPHI_Track_Number:=ComboBox18.ItemIndex;
      if MainForm2.NPHI_Track_Number<>-1 then
        begin
          MainForm2.DBChart4.Series[1].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm2.NPHI_Track_Number].Name;
          MainForm2.DBChart4.Series[1].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm2.NPHI_Track_Number].Name;
          StringGrid2.Cells[0,8]:=FloatToStr(RoundTo(MainForm2.DBChart4.Series[1].MinXValue, -4));
          StringGrid2.Cells[1,8]:=FloatToStr(RoundTo(MainForm2.DBChart4.Series[1].MaxXValue, -4));
        end
      else
        begin
          StringGrid2.Cells[0,8]:='0';
          StringGrid2.Cells[1,8]:='0';
        end;
end;

procedure TLoad_Form.ComboBox19Change(Sender: TObject);
begin
      MainForm2.PEF_Track_Number:=ComboBox19.ItemIndex;
      if MainForm2.PEF_Track_Number<>-1 then
        begin
          MainForm2.DBChart4.Series[2].XValues.ValueSource:=OpenedFile.Values.FieldDefs[MainForm2.PEF_Track_Number].Name;
          MainForm2.DBChart4.Series[2].XValues.Name:=OpenedFile.Values.FieldDefs[MainForm2.PEF_Track_Number].Name;
          StringGrid2.Cells[0,9]:=FloatToStr(RoundTo(MainForm2.DBChart4.Series[2].MinXValue, -4));
          StringGrid2.Cells[1,9]:=FloatToStr(RoundTo(MainForm2.DBChart4.Series[2].MaxXValue, -4));
        end
      else
        begin
          StringGrid2.Cells[0,9]:='0';
          StringGrid2.Cells[1,9]:='0';
        end;
end;

procedure TLoad_Form.DeleteFiles;
begin
if First_Form.MainForm2_Created then
with MainForm2 do
  begin
    BS_Track_Number:=-1;
    CALI_Track_Number:=-1;
    GR_Track_Number:=-1;
    MSFL_Track_Number:=-1;
    LLM_Track_Number:=-1;
    LLD_Track_Number:=-1;
    RHO_Track_Number:=-1;
    NPHI_Track_Number:=-1;
    PEF_Track_Number:=-1;
    DT_Track_Number:=-1;

    DBChart1.Series[0].YValues.ValueSource:='';
    DBChart1.Series[0].XValues.ValueSource:='';
    DBChart1.Series[0].DataSource:=nil;

    DBChart1.Series[1].YValues.ValueSource:='';
    DBChart1.Series[1].XValues.ValueSource:='';
    DBChart1.Series[1].DataSource:=nil;

    DBChart1.Series[2].YValues.ValueSource:='';
    DBChart1.Series[2].XValues.ValueSource:='';
    DBChart1.Series[2].DataSource:=nil;

    DBChart3.Series[0].YValues.ValueSource:='';
    DBChart3.Series[0].XValues.ValueSource:='';
    DBChart3.Series[0].DataSource:=nil;

    DBChart3.Series[1].YValues.ValueSource:='';
    DBChart3.Series[1].XValues.ValueSource:='';
    DBChart3.Series[1].DataSource:=nil;

    DBChart3.Series[2].YValues.ValueSource:='';
    DBChart3.Series[2].XValues.ValueSource:='';
    DBChart3.Series[2].DataSource:=nil;

    DBChart4.Series[0].YValues.ValueSource:='';
    DBChart4.Series[0].XValues.ValueSource:='';
    DBChart4.Series[0].DataSource:=nil;

    DBChart4.Series[1].YValues.ValueSource:='';
    DBChart4.Series[1].XValues.ValueSource:='';
    DBChart4.Series[1].DataSource:=nil;

    DBChart4.Series[2].YValues.ValueSource:='';
    DBChart4.Series[2].XValues.ValueSource:='';
    DBChart4.Series[2].DataSource:=nil;

    DBChart4.Series[3].YValues.ValueSource:='';
    DBChart4.Series[3].XValues.ValueSource:='';
    DBChart4.Series[3].DataSource:=nil;

    DBChart9.Series[0].YValues.ValueSource:='';
    DBChart9.Series[0].XValues.ValueSource:='';
    DBChart9.Series[0].DataSource:=nil;

    DBChart9.Series[1].YValues.ValueSource:='';
    DBChart9.Series[1].XValues.ValueSource:='';
    DBChart9.Series[1].DataSource:=nil;

    DBChart9.Series[2].YValues.ValueSource:='';
    DBChart9.Series[2].XValues.ValueSource:='';
    DBChart9.Series[2].DataSource:=nil;

    DBChart9.Series[3].YValues.ValueSource:='';
    DBChart9.Series[3].XValues.ValueSource:='';
    DBChart9.Series[3].DataSource:=nil;

    DBChart9.Series[4].YValues.ValueSource:='';
    DBChart9.Series[4].XValues.ValueSource:='';
    DBChart9.Series[4].DataSource:=nil;

    DBChart9.Series[5].YValues.ValueSource:='';
    DBChart9.Series[5].XValues.ValueSource:='';
    DBChart9.Series[5].DataSource:=nil;

    DBChart2.Series[0].YValues.ValueSource:='';
    DBChart2.Series[0].XValues.ValueSource:='';
    DBChart2.Series[0].DataSource:=nil;

    if Database_Opened then
      with OpenedFile do
        begin
          if Properties.Exists then
            begin
              Properties.Close;
              Properties.FieldDefs.Clear;
              Properties.EmptyTable;
              Properties.DeleteTable;
              Properties.Free;
            end;
          if Values.Exists then
            begin
              Values.Close;
              Values.FieldDefs.Clear;
              Values.EmptyTable;
              Values.DeleteTable;
              Values.Free;
            end;
          if Litholog.Exists then
            begin
              Litholog.Close;
              Litholog.EmptyTable;
              Litholog.DeleteTable;
//              Litholog.Free;
            end;
          Free;
          MainForm.Close;
          MainForm.Free;
          MainForm:=TMainForm.Create(Self);
          Database_Opened:=False;
      end;
  end;
end;

end.
