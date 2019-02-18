unit GreenbergCastagnaForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Math;

type
  TGreenberg_Castagna_Form = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Button3: TButton;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    ComboBox1: TComboBox;
    GroupBox3: TGroupBox;
    ComboBox2: TComboBox;
    procedure Button3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Greenberg_Castagna_Form: TGreenberg_Castagna_Form;

implementation

uses SelectLog, Main_Form;

{$R *.dfm}

procedure TGreenberg_Castagna_Form.Button3Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.Vp_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.Vp_Track_Number:=Select_Log.Selected_Track_Number;
      Label2.Caption:=MainForm.Charts[MainForm.Vp_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure TGreenberg_Castagna_Form.RadioButton2Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton1.Checked;
  Edit1.Color:=clBtnFace;
  Button3.Enabled:=RadioButton2.Checked;
  if MainForm.Vp_Track_Number<>-1 then
    begin
      Label2.Caption:=MainForm.Charts[MainForm.Vp_Track_Number].Title.Text.Text;
    end;
end;

procedure TGreenberg_Castagna_Form.RadioButton1Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton1.Checked;
  Edit1.Color:=clWindow;
  Button3.Enabled:=RadioButton2.Checked;
  Label2.Caption:='NONE';
  Edit1.SetFocus;
end;

procedure TGreenberg_Castagna_Form.Button2Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TGreenberg_Castagna_Form.Button1Click(Sender: TObject);
var
Temp_Value: Extended;
Error_Code:Integer;
Total_Percentage:Single;
begin
  with MainForm do
    begin
      Operation_Canceled:=False;
      Value_Is_Constant[1]:=RadioButton1.Checked;
      if Value_Is_Constant[1] then
        begin
          Val(Edit1.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            Constant_Value[1]:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for P-wave velocity!', mtError, [mbOk], 0);
              Exit;
            end;
          Vp_Track_Number:=-1;
        end;

      if (not(Operation_Canceled))and((ComboBox1.Text<>'KM/S')and(ComboBox1.Text<>'FT/S')) then
        begin
          MessageDlg('Please enter a valid measurment unit for P-wave velocity!', mtWarning,[mbOk],0);
          Exit;
        end;

      if (not(Operation_Canceled))and((ComboBox2.Text<>'KM/S')and(ComboBox2.Text<>'FT/S')) then
        begin
          MessageDlg('Please enter a valid measurment unit for S-wave velocity!', mtWarning,[mbOk],0);
          Exit;
        end;

      Val(LabeledEdit1.Text, Temp_Value, Error_Code);
      if (Error_Code=0)and(Temp_Value>=0)and(Temp_Value<=100) then
        Sst_Percentage:=Temp_Value/100
      else
        begin
          MessageDlg('Please enter a valid number for sandstone percentage!', mtError, [mbOk], 0);
          Exit;
        end;

      Val(LabeledEdit2.Text, Temp_Value, Error_Code);
      if (Error_Code=0)and(Temp_Value>=0)and(Temp_Value<=100) then
        Lst_Percentage:=Temp_Value/100
      else
        begin
          MessageDlg('Please enter a valid number for limestone percentage!', mtError, [mbOk], 0);
          Exit;
        end;

      Val(LabeledEdit3.Text, Temp_Value, Error_Code);
      if (Error_Code=0)and(Temp_Value>=0)and(Temp_Value<=100) then
        Dolomite_Percentage:=Temp_Value/100
      else
        begin
          MessageDlg('Please enter a valid number for dolomite percentage!', mtError, [mbOk], 0);
          Exit;
        end;

      Val(LabeledEdit4.Text, Temp_Value, Error_Code);
      if (Error_Code=0)and(Temp_Value>=0)and(Temp_Value<=100) then
        Shale_Percentage:=Temp_Value/100
      else
        begin
          MessageDlg('Please enter a valid number for shale percentage!', mtError, [mbOk], 0);
          Exit;
        end;

      Total_Percentage:=RoundTo(Sst_percentage+Lst_Percentage+Dolomite_Percentage+Shale_Percentage, -2);
      if Total_Percentage<>1 then
        begin
          MessageDlg('Total percentage values is not equal to 100!'+#13+'Please revise your values and then try again.', mtError, [mbOk], 0);
          Exit;
        end;
    end;
  Close;
end;

procedure TGreenberg_Castagna_Form.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=True;
  with MainForm do
    begin
      if (not(Operation_Canceled))and(Vp_Track_Number=-1)and(not(Value_Is_Constant[1])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for P-wave velocity!', mtWarning,[mbOk],0);
          Exit;
        end;
    end;
end;

procedure TGreenberg_Castagna_Form.FormCreate(Sender: TObject);
begin
  with MainForm do
    begin
      VP_Unit:=UpperCase(ComboBox1.Text);
      VS_Unit:=UpperCase(ComboBox2.Text);
    end;
end;

procedure TGreenberg_Castagna_Form.ComboBox2Change(Sender: TObject);
begin
  with MainForm do
    begin
      VS_Unit:=UpperCase(ComboBox2.Text);
    end;
end;

procedure TGreenberg_Castagna_Form.ComboBox1Change(Sender: TObject);
begin
  with MainForm do
    begin
      VP_Unit:=UpperCase(ComboBox1.Text);
    end;
end;

end.
