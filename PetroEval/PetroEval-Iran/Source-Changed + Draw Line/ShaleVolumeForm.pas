unit ShaleVolumeForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TShaleVolume_Form = class(TForm)
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit3: TEdit;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ShaleVolume_Form: TShaleVolume_Form;

implementation

uses Main_Form, SelectLog;

{$R *.dfm}

procedure TShaleVolume_Form.Button1Click(Sender: TObject);
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
              MessageDlg('Please enter a valid number for gamma-ray index!', mtError, [mbOk], 0);
              Exit;
            end;
          GRI_Track_Number:=-1;
        end;
      Shale_Volume_Method:=RadioGroup1.ItemIndex;
    end;
  Close;
end;

procedure TShaleVolume_Form.Button2Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TShaleVolume_Form.Button3Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.GRI_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.GRI_Track_Number:=Select_Log.Selected_Track_Number;
      Label2.Caption:=MainForm.Charts[MainForm.GRI_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure TShaleVolume_Form.RadioButton2Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton1.Checked;
  Edit3.Color:=clBtnFace;
  Button3.Enabled:=RadioButton2.Checked;
  if MainForm.GRI_Track_Number<>-1 then
    begin
      Label2.Caption:=MainForm.Charts[MainForm.GRI_Track_Number].Title.Text.Text;
    end;
end;

procedure TShaleVolume_Form.RadioButton1Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton1.Checked;
  Edit3.Color:=clWindow;
  Button3.Enabled:=RadioButton2.Checked;
  Label2.Caption:='NONE';
  Edit3.SetFocus;
end;

procedure TShaleVolume_Form.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=True;
  with MainForm do
    begin
      if (not(Operation_Canceled))and(GRI_Track_Number=-1)and(not(Value_Is_Constant[1])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for gamma-ray index!', mtWarning,[mbOk],0);
          Exit;
        end;
    end;
end;

end.
