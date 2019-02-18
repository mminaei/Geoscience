unit RwSPForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Math;

type
  TRw_SP_Form = class(TForm)
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit3: TEdit;
    Button3: TButton;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    Edit2: TEdit;
    GroupBox5: TGroupBox;
    Edit4: TEdit;
    GroupBox6: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Button4: TButton;
    Panel2: TPanel;
    Edit5: TEdit;
    Label5: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    Edit7: TEdit;
    Label7: TLabel;
    Edit8: TEdit;
    Label8: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rw_SP_Form: TRw_SP_Form;

implementation

uses SelectLog, Main_Form;

{$R *.dfm}

procedure TRw_SP_Form.Button3Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.SP_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.SP_Track_Number:=Select_Log.Selected_Track_Number;
      Label2.Caption:=MainForm.Charts[MainForm.SP_Track_Number].Axes.Top.Title.Caption;
      Edit1.Text:=FloatToStr(RoundTo(MainForm.Charts[MainForm.SP_Track_Number].Series[0].MinXValue, -4));
      Edit2.Text:=FloatToStr(RoundTo(MainForm.Charts[MainForm.SP_Track_Number].Series[0].MaxXValue, -4));
    end;
  Select_Log.Free;
end;

procedure TRw_SP_Form.RadioButton2Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton1.Checked;
  Edit3.Color:=clBtnFace;
  Button3.Enabled:=RadioButton2.Checked;
  if MainForm.SP_Track_Number<>-1 then
    begin
      Label2.Caption:=MainForm.Charts[MainForm.SP_Track_Number].Axes.Top.Title.Caption;
    end;
end;

procedure TRw_SP_Form.RadioButton1Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton1.Checked;
  Edit3.Color:=clWindow;
  Button3.Enabled:=RadioButton2.Checked;
  Label2.Caption:='NONE';
  Edit3.SetFocus;
end;

procedure TRw_SP_Form.Button2Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TRw_SP_Form.Button1Click(Sender: TObject);
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
              MessageDlg('Please enter a valid number for SP!', mtError, [mbOk], 0);
              Exit;
            end;
          SP_Track_Number:=-1;
        end;
      Value_Is_Constant[2]:=RadioButton3.Checked;
      if Value_Is_Constant[2] then
        begin
          Val(Edit5.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            BHT_Value:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for bottom hole temperature!', mtError, [mbOk], 0);
              Exit;
            end;
          Val(Edit6.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            TD_Value:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for total depth!', mtError, [mbOk], 0);
              Exit;
            end;
          Val(Edit8.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            FD_Value:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for formation depth!', mtError, [mbOk], 0);
              Exit;
            end;
          Val(Edit7.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            SAT_Value:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for surface average temperature!', mtError, [mbOk], 0);
              Exit;
            end;
          T_Track_Number:=-1;
        end;

      Val(Edit1.Text, Temp_Value, Error_Code);
      if Error_Code=0 then
        SP_Sand:=Temp_Value
      else
        begin
          MessageDlg('Please enter a valid number for sand base line!', mtError, [mbOk], 0);
          Exit;
        end;
      Val(Edit2.Text, Temp_Value, Error_Code);
      if Error_Code=0 then
        SP_Shale:=Temp_Value
      else
        begin
          MessageDlg('Please enter a valid number for shale base line!', mtError, [mbOk], 0);
          Exit;
        end;
      Val(Edit4.Text, Temp_Value, Error_Code);
      if Error_Code=0 then
        Rmf_Value:=Temp_Value
      else
        begin
          MessageDlg('Please enter a valid number for mud filtrate resistivity!', mtError, [mbOk], 0);
          Exit;
        end;
    end;
  Close;
end;

procedure TRw_SP_Form.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=True;
  with MainForm do
    begin
      if (not(Operation_Canceled))and(SP_Track_Number=-1)and(not(Value_Is_Constant[1])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for SP!', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and(T_Track_Number=-1)and(not(Value_Is_Constant[2])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for temperature!', mtWarning,[mbOk],0);
          Exit;
        end;
    end;
end;

procedure TRw_SP_Form.Button4Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.T_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.T_Track_Number:=Select_Log.Selected_Track_Number;
      Label4.Caption:=MainForm.Charts[MainForm.T_Track_Number].Axes.Top.Title.Caption;
    end;
  Select_Log.Free;
end;

procedure TRw_SP_Form.RadioButton4Click(Sender: TObject);
begin
  Edit5.Enabled:=RadioButton3.Checked;
  Edit5.Color:=clBtnFace;
  Edit6.Enabled:=RadioButton3.Checked;
  Edit6.Color:=clBtnFace;
  Edit7.Enabled:=RadioButton3.Checked;
  Edit7.Color:=clBtnFace;
  Edit8.Enabled:=RadioButton3.Checked;
  Edit8.Color:=clBtnFace;
  Button4.Enabled:=RadioButton4.Checked;
  if MainForm.T_Track_Number<>-1 then
    begin
      Label4.Caption:=MainForm.Charts[MainForm.T_Track_Number].Axes.Top.Title.Caption;
    end;
end;

procedure TRw_SP_Form.RadioButton3Click(Sender: TObject);
begin
  Edit5.Enabled:=RadioButton3.Checked;
  Edit5.Color:=clWindow;
  Edit5.SetFocus;
  Edit6.Enabled:=RadioButton3.Checked;
  Edit6.Color:=clWindow;
  Edit7.Enabled:=RadioButton3.Checked;
  Edit7.Color:=clWindow;
  Edit8.Enabled:=RadioButton3.Checked;
  Edit8.Color:=clWindow;
  Button4.Enabled:=RadioButton4.Checked;
  Label4.Caption:='NONE';
end;

end.
