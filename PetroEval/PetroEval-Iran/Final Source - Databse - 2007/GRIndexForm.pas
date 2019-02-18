unit GRIndexForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Math;

type
  TGRIndex_Form = class(TForm)
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit3: TEdit;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure GetMinMax(Sender: TObject);
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
  GRIndex_Form: TGRIndex_Form;

implementation

uses Main_Form, TeEngine, SelectLog;

{$R *.dfm}

procedure TGRIndex_Form.GetMinMax(Sender: TObject);
begin
  with MainForm do
    begin
      with Sender as TRadioButton do
        begin
          GR_Sand:=Charts[Tag].Series[0].MinXValue;
          GR_Shale:=Charts[Tag].Series[0].MaxXValue;
          Edit1.Text:=FloatToStr(GR_Sand);
          Edit2.Text:=FloatToStr(GR_Shale);
        end;
    end;
end;

procedure TGRIndex_Form.Button2Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TGRIndex_Form.Button1Click(Sender: TObject);
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
              MessageDlg('Please enter a valid number for Gamma-ray!', mtError, [mbOk], 0);
              Exit;
            end;
          GR_Track_Number:=-1;
        end;
      Val(Edit1.Text, Temp_Value, Error_Code);
      if Error_Code=0 then
        GR_Sand:=Temp_Value
      else
        begin
          MessageDlg('Please enter a valid number for clean-sand zone Gamma-ray!', mtError, [mbOk], 0);
          Exit;
        end;
      Val(Edit2.Text, Temp_Value, Error_Code);
      if Error_Code=0 then
        GR_Shale:=Temp_Value
      else
        begin
          MessageDlg('Please enter a valid number for shale zone Gamma-ray!', mtError, [mbOk], 0);
          Exit;
        end;
    end;
  Close;
end;

procedure TGRIndex_Form.Button3Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.GR_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.GR_Track_Number:=Select_Log.Selected_Track_Number;
      Label2.Caption:=MainForm.Charts[MainForm.GR_Track_Number].Axes.Top.Title.Caption;
      Edit1.Text:=FloatToStr(RoundTo(MainForm.Charts[MainForm.GR_Track_Number].Series[0].MinXValue,-4));
      Edit2.Text:=FloatToStr(RoundTo(MainForm.Charts[MainForm.GR_Track_Number].Series[0].MaxXValue,-4));
    end;
  Select_Log.Free;
end;

procedure TGRIndex_Form.RadioButton2Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton1.Checked;
  Edit3.Color:=clBtnFace;
  Button3.Enabled:=RadioButton2.Checked;
  if MainForm.GR_Track_Number<>-1 then
    begin
      Label2.Caption:=MainForm.Charts[MainForm.GR_Track_Number].Axes.Top.Title.Caption;
    end;
end;

procedure TGRIndex_Form.RadioButton1Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton1.Checked;
  Edit3.Color:=clWindow;
  Button3.Enabled:=RadioButton2.Checked;
  Label2.Caption:='NONE';
  Edit3.SetFocus;
end;

procedure TGRIndex_Form.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=True;
  with MainForm do
    begin
      if (not(Operation_Canceled))and(GR_Track_Number=-1)and(not(Value_Is_Constant[1])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for Gamma-ray!', mtWarning,[mbOk],0);
          Exit;
        end;
    end;
end;

end.
