unit LithoDualForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TLitho_Dual_Form = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    GroupBox3: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Fill(var Combo:TComboBox);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    CVAlues: array [1..6] of Single;
    MainFormNo:smallint;
    { Public declarations }
  end;

var
  Litho_Dual_Form: TLitho_Dual_Form;

implementation

uses Main_Form2, Main_Form, PropertiesForm;

{$R *.dfm}

procedure TLitho_Dual_Form.Button2Click(Sender: TObject);
begin
  if MainFormNo=2 then
    MainForm2.Operation_Canceled:=True;
  if MainFormNo=1 then
    MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TLitho_Dual_Form.Button1Click(Sender: TObject);
var
TempValue:Single;
ErrorCode:integer;
begin
if MainFormNo=2 then
  begin
    with MainForm2 do
      begin
        Operation_Canceled:=False;
        DT_Track_Number:=ComboBox1.ItemIndex;
        RHO_Track_Number:=ComboBox2.ItemIndex;
        GR_Track_Number:=ComboBox3.ItemIndex;
        PEF_Track_Number:=ComboBox4.ItemIndex;
        SST_Checked:= CheckBox1.Checked;
        SHL_Checked:= CheckBox2.Checked;
        LST_Checked:= CheckBox3.Checked;
        DOL_Checked:= CheckBox4.Checked;
        GPS_Checked:= CheckBox5.Checked;
        ANH_Checked:= CheckBox6.Checked;
      end;
  end;
if MainFormNo=1 then
  begin
    with MainForm do
      begin
        Operation_Canceled:=False;
        DT_Track_Number:=ComboBox1.ItemIndex;
        RHO_Track_Number:=ComboBox2.ItemIndex;
        GR_Track_Number:=ComboBox3.ItemIndex;
        PEF_Track_Number:=ComboBox4.ItemIndex;
        SST_Checked:= CheckBox1.Checked;
        SHL_Checked:= CheckBox2.Checked;
        LST_Checked:= CheckBox3.Checked;
        DOL_Checked:= CheckBox4.Checked;
        GPS_Checked:= CheckBox5.Checked;
        ANH_Checked:= CheckBox6.Checked;
      end;
  end;

    Val(LabeledEdit1.Text, TempValue, ErrorCode);
    if (ErrorCode=0)and(TempValue<=1)and(TempValue>=0) then
      CValues[1]:=TempValue
    else
      begin
        MessageDlg('Please enter a valid number for maximum concentration of Sandstone!', mtError, [mbOk], 0);
        Exit;
      end;

    Val(LabeledEdit2.Text, TempValue, ErrorCode);
    if (ErrorCode=0)and(TempValue<=1)and(TempValue>=0) then
      CValues[2]:=TempValue
    else
      begin
        MessageDlg('Please enter a valid number for maximum concentration of Shale!', mtError, [mbOk], 0);
        Exit;
      end;

    Val(LabeledEdit3.Text, TempValue, ErrorCode);
    if (ErrorCode=0)and(TempValue<=1)and(TempValue>=0) then
      CValues[3]:=TempValue
    else
      begin
        MessageDlg('Please enter a valid number for maximum concentration of Limestone!', mtError, [mbOk], 0);
        Exit;
      end;

    Val(LabeledEdit4.Text, TempValue, ErrorCode);
    if (ErrorCode=0)and(TempValue<=1)and(TempValue>=0) then
      CValues[4]:=TempValue
    else
      begin
        MessageDlg('Please enter a valid number for maximum concentration of Dolomite!', mtError, [mbOk], 0);
        Exit;
      end;

    Val(LabeledEdit5.Text, TempValue, ErrorCode);
    if (ErrorCode=0)and(TempValue<=1)and(TempValue>=0) then
      CValues[5]:=TempValue
    else
      begin
        MessageDlg('Please enter a valid number for maximum concentration of Gypsum!', mtError, [mbOk], 0);
        Exit;
      end;

    Val(LabeledEdit6.Text, TempValue, ErrorCode);
    if (ErrorCode=0)and(TempValue<=1)and(TempValue>=0) then
      CValues[6]:=TempValue
    else
      begin
        MessageDlg('Please enter a valid number for maximum concentration of Anhydrite!', mtError, [mbOk], 0);
        Exit;
      end;

Close;
end;

procedure TLitho_Dual_Form.Fill( var Combo: TComboBox);
var
i,j:integer;
begin
if MainFormNo=2 then
  begin
    with MainForm2 do
      begin
        Combo.Items.Clear;
        for i:=0 to Openedfile.Values.FieldCount-1 do
          begin
            Combo.Items.Add(OpenedFile.Values.FieldDefs[i].Name);
          end;
      end;
  end;
if MainFormNo=1 then
  begin
    with MainForm do
      begin
        Combo.Items.Clear;
        for i:=0 to Tree1.Roots.Count-1 do
          begin
            if UpperCase(Tree1.Roots[i].SimpleText)='LITHOLOGY LOG' then Continue;
            if UpperCase(Tree1.Roots[i].SimpleText)='COMPOSITE LOG' then Continue;
            for j:=0 to (Tree1.Roots[i].Childs.Count-1) do
              begin
                Combo.Items.Add(Tree1.Roots[i].Childs[j].SimpleText);
              end;
          end;
      end;
  end;
end;

procedure TLitho_Dual_Form.Button3Click(Sender: TObject);
begin
  Properties_Form:=TProperties_Form.Create(Self);
  Properties_Form.LithoType:=1;
  Properties_Form.ShowModal;
  Properties_Form.Free;
end;

procedure TLitho_Dual_Form.Button4Click(Sender: TObject);
begin
  Properties_Form:=TProperties_Form.Create(Self);
  Properties_Form.LithoType:=2;
  Properties_Form.ShowModal;
  Properties_Form.Free;
end;

procedure TLitho_Dual_Form.Button5Click(Sender: TObject);
begin
  Properties_Form:=TProperties_Form.Create(Self);
  Properties_Form.LithoType:=3;
  Properties_Form.ShowModal;
  Properties_Form.Free;
end;

procedure TLitho_Dual_Form.Button6Click(Sender: TObject);
begin
  Properties_Form:=TProperties_Form.Create(Self);
  Properties_Form.LithoType:=4;
  Properties_Form.ShowModal;
  Properties_Form.Free;
end;

procedure TLitho_Dual_Form.Button7Click(Sender: TObject);
begin
  Properties_Form:=TProperties_Form.Create(Self);
  Properties_Form.LithoType:=5;
  Properties_Form.ShowModal;
  Properties_Form.Free;
end;

procedure TLitho_Dual_Form.Button8Click(Sender: TObject);
begin
  Properties_Form:=TProperties_Form.Create(Self);
  Properties_Form.LithoType:=6;
  Properties_Form.ShowModal;
  Properties_Form.Free;
end;

procedure TLitho_Dual_Form.FormShow(Sender: TObject);
begin
  Fill(ComboBox1);
  Fill(ComboBox2);
  Fill(ComboBox3);
  Fill(ComboBox4);
  if MainFormNo=2 then
    begin
      with MainForm2 do
        begin
          ComboBox1.ItemIndex:= DT_Track_Number;
          ComboBox2.ItemIndex:= RHO_Track_Number;
          ComboBox3.ItemIndex:= GR_Track_Number;
          ComboBox4.ItemIndex:= PEF_Track_Number;
//          ComboBox5.ItemIndex:= LLD_Track_Number;
//          ComboBox6.ItemIndex:= NPHI_Track_Number;
        end;
    end;
  if MainFormNo=1 then
    begin
      with MainForm do
        begin
          ComboBox1.ItemIndex:= DT_Track_Number;
          ComboBox2.ItemIndex:= RHO_Track_Number;
          ComboBox3.ItemIndex:= GR_Track_Number;
          ComboBox4.ItemIndex:= PEF_Track_Number;
//          ComboBox5.ItemIndex:= LLD_Track_Number;
//          ComboBox6.ItemIndex:= NPHI_Track_Number;
        end;
    end;
end;

end.
