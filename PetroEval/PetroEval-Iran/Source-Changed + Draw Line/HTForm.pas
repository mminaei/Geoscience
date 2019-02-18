unit HTForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  THT_Form = class(TForm)
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
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HT_Form: THT_Form;

implementation

uses Main_Form, SelectLog;

{$R *.dfm}

procedure THT_Form.Button2Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure THT_Form.Button1Click(Sender: TObject);
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
              MessageDlg('Please enter a valid number for flow zone indicator!', mtError, [mbOk], 0);
              Exit;
            end;
          FZI_Track_Number:=-1;
        end;
    end;
  Close;
end;

procedure THT_Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=True;
  with MainForm do
    begin
      if (not(Operation_Canceled))and(FZI_Track_Number=-1)and(not(Value_Is_Constant[1])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for flow zone indicator!', mtWarning,[mbOk],0);
          Exit;
        end;
    end;
end;

procedure THT_Form.Button3Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.FZI_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.FZI_Track_Number:=Select_Log.Selected_Track_Number;
      Label2.Caption:=MainForm.Charts[MainForm.FZI_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure THT_Form.RadioButton2Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton1.Checked;
  Edit3.Color:=clBtnFace;
  Button3.Enabled:=RadioButton2.Checked;
  if MainForm.FZI_Track_Number<>-1 then
    begin
      Label2.Caption:=MainForm.Charts[MainForm.FZI_Track_Number].Title.Text.Text;
    end;
end;

procedure THT_Form.RadioButton1Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton1.Checked;
  Edit3.Color:=clWindow;
  Button3.Enabled:=RadioButton2.Checked;
  Label2.Caption:='NONE';
  Edit3.SetFocus;
end;

end.
