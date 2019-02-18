unit TauForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TTau_Form = class(TForm)
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    ComboBox1: TComboBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit3: TEdit;
    Button3: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tau_Form: TTau_Form;

implementation

uses Main_Form, SelectLog;

{$R *.dfm}

procedure TTau_Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=True;
  with MainForm do
    begin
      if (not(Operation_Canceled))and(PHI_Track_Number=-1)and(not(Value_Is_Constant[1])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for porosity', mtWarning,[mbOk],0);
          Exit;
        end;
    end;
end;

procedure TTau_Form.Button1Click(Sender: TObject);
var
Error_Code:integer;
Temp_Value:Single;
begin
  with MainForm do
    begin
      Operation_Canceled:=False;
      Value_Is_Constant[1]:=RadioButton1.Checked;
      if Value_Is_Constant[1] then
        begin
          Val(Edit3.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            Constant_Value[1]:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for porosity!', mtError, [mbOk], 0);
              Exit;
            end;
          PHI_Track_Number:=-1;
        end;
      Val(LabeledEdit1.Text, Temp_Value, Error_Code);
      if Error_Code=0 then
        Cementation_Factor:=Temp_Value
      else
        begin
          MessageDlg('Please enter a valid number for cementation factor!', mtError, [mbOk], 0);
          Exit;
        end;
    end;
  Close;
end;

procedure TTau_Form.Button2Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TTau_Form.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0:begin
        LabeledEdit1.Text:='2';
      end;
    1:begin
        LabeledEdit1.Text:='1.54';
      end;
    2:begin
        LabeledEdit1.Text:='1.33';
      end;
    3:begin
        LabeledEdit1.Text:='2';
      end;
    4:begin
        LabeledEdit1.Text:='2.15';
      end;
    5:begin
        LabeledEdit1.Text:='2';
      end;
    end;
end;

procedure TTau_Form.Button3Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.PHI_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.PHI_Track_Number:=Select_Log.Selected_Track_Number;
      Label2.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure TTau_Form.RadioButton2Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton1.Checked;
  Edit3.Color:=clBtnFace;
  Button3.Enabled:=RadioButton2.Checked;
  if MainForm.PHI_Track_Number<>-1 then
    begin
      Label2.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Title.Text.Text;
    end;
end;

procedure TTau_Form.RadioButton1Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton1.Checked;
  Edit3.Color:=clWindow;
  Button3.Enabled:=RadioButton2.Checked;
  Label2.Caption:='NONE';
  Edit3.SetFocus;
end;

end.
