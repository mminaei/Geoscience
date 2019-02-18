unit FFIForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFFI_Form = class(TForm)
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Button3: TButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit2: TEdit;
    Button4: TButton;
    Label2: TLabel;
    Label4: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFI_Form: TFFI_Form;

implementation

uses Main_Form, SelectLog;

{$R *.dfm}

procedure TFFI_Form.Button2Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TFFI_Form.Button1Click(Sender: TObject);
var
Temp_Value:Single;
Error_Code:integer;
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
              MessageDlg('Please enter a valid number for porosity!', mtError, [mbOk], 0);
              Exit;
            end;
          PHI_Track_Number:=-1;
        end;
      Val(Edit2.Text, Temp_Value, Error_Code);
      if Error_Code=0 then
        Swir_Value:=Temp_Value/100
      else
        begin
          MessageDlg('Please enter a valid number for Swir!', mtError, [mbOk], 0);
          Exit;
        end;
    end;
  Close;
end;

procedure TFFI_Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=True;
  with MainForm do
    begin
      if (not(Operation_Canceled))and(PHI_Track_Number=-1)and(not(Value_Is_Constant[1])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for porosity.', mtWarning,[mbOk],0);
          Exit;
        end;
    end;
end;

procedure TFFI_Form.Button3Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.PHI_Track_Number:=Select_Log.Selected_Track_Number;
      Label3.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure TFFI_Form.RadioButton2Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton1.Checked;
  Edit1.Color:=clBtnFace;
  Button3.Enabled:=RadioButton2.Checked;
  if MainForm.PHI_Track_Number<>-1 then
    begin
      Label3.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Title.Text.Text;
    end;
end;

procedure TFFI_Form.RadioButton1Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton1.Checked;
  Edit1.Color:=clWindow;
  Button3.Enabled:=RadioButton2.Checked;
  Label3.Caption:='NONE';
  Edit1.SetFocus;
end;

procedure TFFI_Form.Button4Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.Swir_Track_Number:=Select_Log.Selected_Track_Number;
      Label3.Caption:=MainForm.Charts[MainForm.Swir_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure TFFI_Form.RadioButton3Click(Sender: TObject);
begin
  Edit2.Enabled:=RadioButton4.Checked;
  Edit2.Color:=clBtnFace;
  Button4.Enabled:=RadioButton3.Checked;
  if MainForm.PHI_Track_Number<>-1 then
    begin
      Label2.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Title.Text.Text;
    end;
end;

procedure TFFI_Form.RadioButton4Click(Sender: TObject);
begin
  Edit2.Enabled:=RadioButton4.Checked;
  Edit2.Color:=clWindow;
  Button3.Enabled:=RadioButton3.Checked;
  Label2.Caption:='NONE';
  Edit2.SetFocus;
end;

end.
