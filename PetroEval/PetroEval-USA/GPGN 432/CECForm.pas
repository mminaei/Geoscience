unit CECForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TCEC_Form = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Button3: TButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit2: TEdit;
    Button4: TButton;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Edit3: TEdit;
    Button5: TButton;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    Edit4: TEdit;
    Button6: TButton;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    Edit5: TEdit;
    Button7: TButton;
    GroupBox6: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    Edit6: TEdit;
    Button8: TButton;
    Edit7: TEdit;
    Label13: TLabel;
    Edit8: TEdit;
    Label14: TLabel;
    Edit9: TEdit;
    Label15: TLabel;
    Edit10: TEdit;
    Label16: TLabel;
    Edit11: TEdit;
    Label17: TLabel;
    Edit12: TEdit;
    Label18: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SelectLog(var Track_Name: smallint; var Change_Label: TLabel);
    procedure FromLog( From_Log: Boolean; var Track_Name: smallint; var Change_Label: TLabel;
                           var Change_Edit: TEdit; var Change_Button: TButton;
                           var Change_Radio1: TRadioButton; var Change_Radio2: TRadioButton);
    function CheckLog (i: Byte; var Change_Radio: TRadioButton; var Change_Edit: TEdit;
                    Log_Name: String; var Track_Name: Smallint ):Boolean;
    function  CheckValue(var ChangeEdit: TEdit; Value_Name: String; var Change_Value: Single;
                         LowerBound, UpperBound: Integer):Boolean ;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure RadioButton10Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure RadioButton12Click(Sender: TObject);
    procedure RadioButton11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CEC_Form: TCEC_Form;
  Total_Percentage:Single;

implementation

uses Main_Form, SelectLog;

{$R *.dfm}

procedure TCEC_Form.Button2Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TCEC_Form.Button1Click(Sender: TObject);
begin
  with MainForm do
    begin
      Total_Percentage:=0;
      
      if not CheckLog(1, RadioButton1, Edit1, 'Kaolinites', Kaolinites_Track_Number) then Exit;
      if not CheckLog(2, RadioButton3, Edit2, 'Illites', Illites_Track_Number) then Exit;
      if not CheckLog(3, RadioButton5, Edit3, 'Smectites', Smectites_Track_Number) then Exit;
      if not CheckLog(4, RadioButton7, Edit4, 'Chlorites', Chlorites_Track_Number) then Exit;
      if not CheckLog(5, RadioButton9, Edit5, 'Vermiculites', Vermiculites_Track_Number) then Exit;
      if not CheckLog(6, RadioButton11, Edit6, 'Polygorskites', Polygorskites_Track_Number) then Exit;

      if not CheckValue(Edit7, 'Kaolinites', Kaolinites_CEC_Value,3,25) then Exit;
      if not CheckValue(Edit8, 'Illites', Illites_CEC_Value,10,40) then Exit;
      if not CheckValue(Edit9, 'Smectites', Smectites_CEC_Value,80,150) then Exit;
      if not CheckValue(Edit10, 'Chlorites', Chlorites_CEC_Value,10,40) then Exit;
      if not CheckValue(Edit11, 'Vermiculites', Vermiculites_CEC_Value,100,260) then Exit;
      if not CheckValue(Edit12, 'Polygorskites', Polygorskites_CEC_Value,20,36) then Exit;

      if (RadioButton1.Checked)and(RadioButton3.Checked)and(RadioButton5.Checked)and
         (RadioButton7.Checked)and(RadioButton9.Checked)and(RadioButton11.Checked)and
         (Round(Total_Percentage)<>100) then
        begin
          MessageDlg('Total percentage is not equal to 100!'+#13+'Please revise your values and then try again.', mtError, [mbOk], 0);
          Exit;
        end;
      Operation_Canceled:=False;
    end;
  Close;
end;

procedure TCEC_Form.SelectLog(var Track_Name: smallint; var Change_Label: TLabel);
begin
with MainForm do
  begin
    Select_Log:=TSelect_Log.Create(Self);
    Select_Log.ShowModal;
    Track_Name:=Select_Log.Selected_Track_Number;
    if Select_Log.Selected_Track_Number<>-1 then
      begin
        Track_Name:=Select_Log.Selected_Track_Number;
        Change_Label.Caption:=Charts[Track_Name].Axes.Top.Title.Caption;
      end;
    Select_Log.Free;
  end;
end;

procedure TCEC_Form.FromLog(From_Log: Boolean; var Track_Name: smallint;
                           var Change_Label: TLabel; var Change_Edit: TEdit;
                           var Change_Button: TButton; var Change_Radio1: TRadioButton;
                           var Change_Radio2: TRadioButton);
begin
with MainForm do
  begin
    if From_Log then
      begin
        Change_Edit.Enabled:=Change_Radio1.Checked;
        Change_Edit.Color:=clBtnFace;
        Change_Button.Enabled:=Change_Radio2.Checked;
        if Track_Name<>-1 then
          begin
            Change_Label.Caption:=Charts[Track_Name].Axes.Top.Title.Caption;
          end;
      end
    else
      begin
        Change_Edit.Enabled:=Change_Radio1.Checked;
        Change_Edit.Color:=clWindow;
        Change_Button.Enabled:=Change_Radio2.Checked;
        Change_Label.Caption:='NONE';
        Change_Edit.SetFocus;
      end;
  end;
end;

function TCEC_Form.CheckLog (i: Byte; var Change_Radio: TRadioButton; var Change_Edit: TEdit;
                    Log_Name: String; var Track_Name: Smallint ):Boolean;
var
Temp_Value: Single;
Error_Code: integer;
begin
with MainForm do
  begin
    Value_Is_Constant[i]:=Change_Radio.Checked;
    if Value_Is_Constant[i] then
      begin
        Val(Change_Edit.Text, Temp_Value, Error_Code);
        if Error_Code=0 then
          begin
            Constant_Value[i]:=Temp_Value;
            Total_Percentage:=Total_Percentage+Temp_Value;
            Result:=True;
          end
        else
          begin
            MessageDlg('Please enter a valid number for ' + Log_Name + '!', mtError, [mbOk], 0);
            Result:=False;
          end;
        Track_Name:=-1;
      end
    else
      Result:=True;
  end;
end;

function TCEC_Form.CheckValue(var ChangeEdit: TEdit; Value_Name: String; var Change_Value: Single; LowerBound, UpperBound: integer ):Boolean ;
var
Error_Code:integer;
Temp_Value: Single;
begin
  with MainForm do
    begin
      Val(ChangeEdit.Text, Temp_Value, Error_Code);
      if (Error_Code = 0)and(Temp_Value >=LowerBound)and(Temp_Value <= UpperBound)  then
        begin
          Change_Value:=Temp_Value;
          Result:=True;
        end
      else
        begin
          MessageDlg('Please enter a valid number for '+Value_Name+'!'+#13+
          'The value should be between '+InttoStr(LowerBound)+' and '+IntToStr(UpperBound)+' .', mtWarning,[mbOk],0);
          Result:=False;
        end
    end;
end;


procedure TCEC_Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose:=True;
with MainForm do
  begin
    if (not(Operation_Canceled))and(Kaolinites_Track_Number=-1)and(not(Value_Is_Constant[1])) then
      begin
        CanClose:=False;
        MessageDlg('Please select a track for Kaolinites!', mtWarning,[mbOk],0);
        Exit;
      end;

    if (not(Operation_Canceled))and(Illites_Track_Number=-1)and(not(Value_Is_Constant[2])) then
      begin
        CanClose:=False;
        MessageDlg('Please select a track for Illites!', mtWarning,[mbOk],0);
        Exit;
      end;

    if (not(Operation_Canceled))and(Smectites_Track_Number=-1)and(not(Value_Is_Constant[3])) then
      begin
        CanClose:=False;
        MessageDlg('Please select a track for Smectites!', mtWarning,[mbOk],0);
        Exit;
      end;

    if (not(Operation_Canceled))and(Chlorites_Track_Number=-1)and(not(Value_Is_Constant[4])) then
      begin
        CanClose:=False;
        MessageDlg('Please select a track for Chlorites!', mtWarning,[mbOk],0);
        Exit;
      end;

    if (not(Operation_Canceled))and(Vermiculites_Track_Number=-1)and(not(Value_Is_Constant[5])) then
      begin
        CanClose:=False;
        MessageDlg('Please select a track for Vermiculites!', mtWarning,[mbOk],0);
        Exit;
      end;

    if (not(Operation_Canceled))and(Polygorskites_Track_Number=-1)and(not(Value_Is_Constant[6])) then
      begin
        CanClose:=False;
        MessageDlg('Please select a track for Polygorskites!', mtWarning,[mbOk],0);
        Exit;
      end;
  end;

end;

procedure TCEC_Form.Button3Click(Sender: TObject);
begin
  SelectLog(MainForm.Kaolinites_Track_Number, Label2);
end;

procedure TCEC_Form.Button4Click(Sender: TObject);
begin
  SelectLog(MainForm.Illites_Track_Number, Label4);
end;

procedure TCEC_Form.Button5Click(Sender: TObject);
begin
  SelectLog(MainForm.Smectites_Track_Number, Label6);
end;

procedure TCEC_Form.Button6Click(Sender: TObject);
begin
  SelectLog(MainForm.Chlorites_Track_Number, Label8);
end;

procedure TCEC_Form.Button7Click(Sender: TObject);
begin
  SelectLog(MainForm.Vermiculites_Track_Number, Label10);
end;

procedure TCEC_Form.Button8Click(Sender: TObject);
begin
  SelectLog(MainForm.Polygorskites_Track_Number, Label12);
end;

procedure TCEC_Form.RadioButton2Click(Sender: TObject);
begin
  FromLog(True, MainForm.Kaolinites_Track_Number, Label2, Edit1, Button3, RadioButton1, RadioButton2);
end;

procedure TCEC_Form.RadioButton1Click(Sender: TObject);
begin
  FromLog(False, MainForm.Kaolinites_Track_Number, Label2, Edit1, Button3, RadioButton1, RadioButton2);
end;

procedure TCEC_Form.RadioButton4Click(Sender: TObject);
begin
  FromLog(True, MainForm.Illites_Track_Number, Label4, Edit2, Button4, RadioButton3, RadioButton4);
end;

procedure TCEC_Form.RadioButton3Click(Sender: TObject);
begin
  FromLog(False, MainForm.Illites_Track_Number, Label4, Edit2, Button4, RadioButton3, RadioButton4);
end;

procedure TCEC_Form.RadioButton6Click(Sender: TObject);
begin
  FromLog(True, MainForm.Smectites_Track_Number, Label6, Edit3, Button5, RadioButton5, RadioButton6);
end;

procedure TCEC_Form.RadioButton5Click(Sender: TObject);
begin
  FromLog(False, MainForm.Smectites_Track_Number, Label6, Edit3, Button5, RadioButton5, RadioButton6);
end;

procedure TCEC_Form.RadioButton8Click(Sender: TObject);
begin
  FromLog(True, MainForm.Chlorites_Track_Number, Label8, Edit4, Button6, RadioButton7, RadioButton8);
end;

procedure TCEC_Form.RadioButton7Click(Sender: TObject);
begin
  FromLog(False, MainForm.Chlorites_Track_Number, Label8, Edit4, Button6, RadioButton7, RadioButton8);
end;

procedure TCEC_Form.RadioButton10Click(Sender: TObject);
begin
  FromLog(True, MainForm.Vermiculites_Track_Number, Label10, Edit5, Button7, RadioButton9, RadioButton10);
end;

procedure TCEC_Form.RadioButton9Click(Sender: TObject);
begin
  FromLog(False, MainForm.Vermiculites_Track_Number, Label10, Edit5, Button7, RadioButton9, RadioButton10);
end;

procedure TCEC_Form.RadioButton12Click(Sender: TObject);
begin
  FromLog(True, MainForm.Polygorskites_Track_Number, Label12, Edit6, Button8, RadioButton11, RadioButton12);
end;

procedure TCEC_Form.RadioButton11Click(Sender: TObject);
begin
  FromLog(False, MainForm.Polygorskites_Track_Number, Label12, Edit6, Button8, RadioButton11, RadioButton12);
end;

end.
