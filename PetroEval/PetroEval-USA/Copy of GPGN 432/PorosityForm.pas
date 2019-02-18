unit PorosityForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DB;

type
  TPorosity_Form = class(TForm)
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit3: TEdit;
    GroupBox3: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit1: TEdit;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    GroupBox4: TGroupBox;
    Edit2: TEdit;
    Label1: TLabel;
    Edit4: TEdit;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure Fill( var Combo: TComboBox);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  RHO_Values: array[0..38{46}] of Real = (2.70,2.96,2.94,2.46,2.90,2.85,2.71,1.57,
                                          2.71,2.65,2.77,{8.10,}1.60,1.40,8.50,3.00,
                                          2.87,3.31,2.57,2.69,2.98,{7.50,}2.75,2.32,
                                          2.16,5.25,{2.80,}7.87,{2.16,}2.64,2.83,{11.34,}
                                          0.90,2.71,5.17,2.95,{2.25,}2.95,2.78,{2.04,}
                                          5.06,2.65,2.65,2.40,{3.88,}2.07,2.13);

  Delta_T_Values:array[0..38{46}]of Real=(49,50,53,77,53,60,47.5,78,47.5,55.5,62,{,}
                                          105,120,60,44.5,43.5,38,68,50,42.4,{,}51,53,
                                          67,43,{,}57,{,}143,52,140,{,}47.5,39,64,
                                          {,}55,58,{,}43,55.5,55.5,110,{,}122,65);


  Lithology_Names:array[0..38{46}]of String=('Aluminum','Anhydrite','Aragonite',
                                             'Barite','Basalt','Biotite','Calcite',
                                             'Carnallite','Chalk','Chert','Chlorite',
                                             {'Cinnabar',}'Coal (anth.)','Coal (bit.)',
                                             'Copper','Diabase','Dolomite','Dunite',
                                             'Feldspar (ortho)','Feldspar (plag)',
                                             'Gabbro',{'Galena',}'Granite','Gypsum',
                                             'Halite','Hematite',{'Illite',}'Iron',
                                             {'Kainite',}'Kaolinite','Langbeinite',
                                             'Lead',{'Lignite',}'Limestone','Magnetite',
                                             'Mica',{'Montomorillionite',}'Muscovite',
                                             'Polyhalite',{'Potash',}'Pyrite','Quartz',
                                             'Sandstone','Shale',{'Siderite',}'Sulfur',
                                             'Trona');


var
  Porosity_Form: TPorosity_Form;

implementation

uses Main_Form2{, SelectLog};

{$R *.dfm}

procedure TPorosity_Form.RadioGroup1Click(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0:begin
        ComboBox1.Enabled:=True;
        LabeledEdit1.Enabled:=True;
        LabeledEdit2.Enabled:=True;
        GroupBox2.Caption:='DT of P-wave (US/FT)';
        LabeledEdit1.EditLabel.Caption:='Matrix DT (US/FT)';
        LabeledEdit1.Text:=FloatToStr(Delta_T_Values[ComboBox1.ItemIndex]);
        LabeledEdit2.EditLabel.Caption:='Fluid DT (US/FT)  ';
        LabeledEdit2.Text:='189';
        GroupBox3.Enabled:=False;
        RadioButton3.Enabled:=False;
        RadioButton4.Enabled:=False;
//        Button4.Enabled:=False;
        Edit1.Enabled:=False;
      end;
    1:begin
        ComboBox1.Enabled:=True;
        LabeledEdit1.Enabled:=True;
        LabeledEdit2.Enabled:=True;
        GroupBox2.Caption:='Density (G/CM3)';
        LabeledEdit1.EditLabel.Caption:='Matrix Density (G/CM3)';
        LabeledEdit1.Text:=FloatToStr(RHO_Values[ComboBox1.ItemIndex]);
        LabeledEdit2.EditLabel.Caption:='Fluid Density (G/CM3)   ';
        LabeledEdit2.Text:='1';
        GroupBox3.Enabled:=False;
        RadioButton3.Enabled:=False;
        RadioButton4.Enabled:=False;
//        Button4.Enabled:=False;
        Edit1.Enabled:=False;
      end;
    2:begin
        ComboBox1.Enabled:=False;
        LabeledEdit1.Enabled:=False;
        LabeledEdit2.Enabled:=False;
        GroupBox2.Caption:='Corrected Density Porosity (G/CM3)';
        GroupBox3.Caption:='Corrected Neutron Porosity (G/CM3)';
        GroupBox3.Enabled:=True;
        RadioButton3.Enabled:=True;
        RadioButton4.Enabled:=True;
//        Button4.Enabled:=True;
        Edit1.Enabled:=True;
      end;
    end;
end;

procedure TPorosity_Form.FormCreate(Sender: TObject);
var
i:integer;
begin
  ComboBox1.Items.Clear;
  for i:=0 to Length(Lithology_Names)-1 do
    ComboBox1.Items.Add(Lithology_Names[i]);
  ComboBox1.ItemIndex:=0;
  ComboBox2.Items.Clear;
  ComboBox3.Items.Clear;
  Fill(ComboBox2);
  Fill(ComboBox3);
end;

procedure TPorosity_Form.Fill( var Combo: TComboBox);
var
j:integer;
begin
 with MainForm2 do
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

procedure TPorosity_Form.Button2Click(Sender: TObject);
begin
  MainForm2.Operation_Canceled:=True;
  Close;
end;

procedure TPorosity_Form.Button1Click(Sender: TObject);
var
Error_Code:integer;
Temp_Value:Single;
s2,s3:string;
begin
  with MainForm2 do
    begin
{      with OpenedFile do
        begin
          s2:=Edit2.Text;
          s3:=Edit4.Text;
          Values.Open;
          Properties.Open;
          Values.Edit;
          Properties.Edit;
          Values.FieldDefs.Add(Trim(s2)+'.'+Trim(s3), ftFloat, 0, False);
          Properties.Fields[0].Value:=Trim(s3);
          Properties.Fields[1].Value:=Trim(s3);
          Properties.Fields[2].Value:=-99999999;
          Properties.Fields[3].Value:=99999999;
          NoTracks:=NoTracks+1;
        end;}

      s2:=Uppercase(ComboBox1.Text);
      if s2='SANDSTONE' then Lith_Type:=0;
      if s2='LIMESTONE' then Lith_Type:=1;
      if s2='DOLOMITE' then Lith_Type:=2;

      Value_Is_Constant[1]:=RadioButton1.Checked;
      if Value_Is_Constant[1] then
        begin
          Val(Edit3.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            Constant_Value[1]:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for porosity calculation!', mtError, [mbOk], 0);
              Exit;
            end;
          For_PHI_Track_Number:=-1;
        end;
      if RadioGroup1.ItemIndex=2 then
        begin
          Value_Is_Constant[2]:=RadioButton3.Checked;
          if Value_Is_Constant[2] then
            begin
              Val(Edit1.Text, Temp_Value, Error_Code);
              if Error_Code=0 then
                Constant_Value[2]:=Temp_Value
              else
                begin
                  MessageDlg('Please enter a valid number for corrected neutron porosity!', mtError, [mbOk], 0);
                  Exit;
                end;
              Neutron_Track_Number:=-1;
            end;
        end;
      Val(LabeledEdit1.Text, Temp_Value, Error_Code);
      if (Error_Code<>0)or(Temp_Value<=0) then
        begin
          MessageDlg('Please enter a valid number for matrix!', mtError, [mbOk], 0);
          Exit;
        end
      else
        Matrix_Value:=Temp_Value;
      Val(LabeledEdit2.Text, Temp_Value, Error_Code);
      if (Error_Code<>0)or(Temp_Value<=0) then
        begin
          MessageDlg('Please enter a valid number for fluid!', mtError, [mbOk], 0);
          Exit;
        end
      else
        Fluid_Value:=Temp_Value;
      Operation_Canceled:=False;
      PHI_Calculation_Method:=RadioGroup1.ItemIndex;
    end;
  Close;
end;

procedure TPorosity_Form.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=True;
  with MainForm2 do
    begin
      if (not(Operation_Canceled))and(For_PHI_Track_Number=-1)and(not(Value_Is_Constant[1])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for porosity calculation!', mtWarning,[mbOk],0);
          Exit;
        end;
      if RadioGroup1.ItemIndex=2 then
        if (not(Operation_Canceled))and(Neutron_Track_Number=-1)and(not(Value_Is_Constant[2])) then
          begin
            CanClose:=False;
            MessageDlg('Please select a track for corrected neutron porosity!', mtWarning,[mbOk],0);
            Exit;
          end;
    end;
end;

procedure TPorosity_Form.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex<>-1 then
    Case RadioGroup1.ItemIndex of
      0:LabeledEdit1.Text:=FloatToStr(Delta_T_Values[ComboBox1.ItemIndex]);
      1:LabeledEdit1.Text:=FloatToStr(RHO_Values[ComboBox1.ItemIndex]);
    end;
end;

procedure TPorosity_Form.RadioButton2Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton1.Checked;
  Edit3.Color:=clBtnFace;
  ComboBox2.Enabled:=RadioButton2.Checked;
end;

procedure TPorosity_Form.RadioButton1Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton1.Checked;
  Edit3.Color:=clWindow;
  ComboBox2.Enabled:=RadioButton2.Checked;
  Edit3.SetFocus;
end;

procedure TPorosity_Form.RadioButton4Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton3.Checked;
  Edit1.Color:=clBtnFace;
  ComboBox3.Enabled:=RadioButton4.Checked;
end;

procedure TPorosity_Form.RadioButton3Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton3.Checked;
  Edit1.Color:=clWindow;
  ComboBox3.Enabled:=RadioButton4.Checked;
  Edit1.SetFocus;
end;

procedure TPorosity_Form.ComboBox3Change(Sender: TObject);
begin
  with MainForm2 do
    Neutron_Track_Number:=ComboBox3.ItemIndex;
end;

procedure TPorosity_Form.ComboBox2Change(Sender: TObject);
begin
  with MainForm2 do
    For_PHI_Track_Number:=ComboBox2.ItemIndex;
end;

end.
