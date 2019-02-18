unit CECMethodForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Math;

type
  TCECMethod_Form = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit2: TEdit;
    Button2: TButton;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Edit3: TEdit;
    Button3: TButton;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    Edit4: TEdit;
    Button4: TButton;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    Edit5: TEdit;
    Button5: TButton;
    GroupBox6: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    Edit6: TEdit;
    Button6: TButton;
    GroupBox7: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    Edit7: TEdit;
    Button7: TButton;
    GroupBox8: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    RadioButton15: TRadioButton;
    RadioButton16: TRadioButton;
    Edit8: TEdit;
    Button8: TButton;
    Panel1: TPanel;
    Button9: TButton;
    Button10: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure RadioButton10Click(Sender: TObject);
    procedure RadioButton12Click(Sender: TObject);
    procedure RadioButton14Click(Sender: TObject);
    procedure RadioButton16Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure RadioButton11Click(Sender: TObject);
    procedure RadioButton13Click(Sender: TObject);
    procedure RadioButton15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CECMethod_Form: TCECMethod_Form;

implementation

uses SelectLog, Main_Form;

{$R *.dfm}

procedure TCECMethod_Form.Button1Click(Sender: TObject);
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

procedure TCECMethod_Form.Button2Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.FR_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.FR_Track_Number:=Select_Log.Selected_Track_Number;
      Label4.Caption:=MainForm.Charts[MainForm.FR_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;

end;

procedure TCECMethod_Form.Button4Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.T_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.T_Track_Number:=Select_Log.Selected_Track_Number;
      Label8.Caption:=MainForm.Charts[MainForm.T_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;

end;

procedure TCECMethod_Form.Button3Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.CEC_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.CEC_Track_Number:=Select_Log.Selected_Track_Number;
      Label6.Caption:=MainForm.Charts[MainForm.CEC_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;

end;

procedure TCECMethod_Form.Button5Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.Rw_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.Rw_Track_Number:=Select_Log.Selected_Track_Number;
      Label10.Caption:=MainForm.Charts[MainForm.Rw_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;

end;

procedure TCECMethod_Form.Button7Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.RHO_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.RHO_Track_Number:=Select_Log.Selected_Track_Number;
      Label14.Caption:=MainForm.Charts[MainForm.RHO_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;

end;

procedure TCECMethod_Form.Button6Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.Rt_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.Rt_Track_Number:=Select_Log.Selected_Track_Number;
      Label12.Caption:=MainForm.Charts[MainForm.Rt_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;

end;

procedure TCECMethod_Form.Button8Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.n_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.n_Track_Number:=Select_Log.Selected_Track_Number;
      Label16.Caption:=MainForm.Charts[MainForm.n_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;

end;

procedure TCECMethod_Form.Button10Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TCECMethod_Form.Button9Click(Sender: TObject);
var
Temp_Value: Extended;
Error_Code:Integer;
begin
  with MainForm do
    begin
      Operation_Canceled:=False;
      Value_Is_Constant[1]:=RadioButton1.Checked;
      Value_Is_Constant[2]:=RadioButton3.Checked;
      Value_Is_Constant[3]:=RadioButton5.Checked;
      Value_Is_Constant[4]:=RadioButton7.Checked;
      Value_Is_Constant[5]:=RadioButton9.Checked;
      Value_Is_Constant[6]:=RadioButton11.Checked;
      Value_Is_Constant[7]:=RadioButton13.Checked;
      Value_Is_Constant[8]:=RadioButton15.Checked;

      if Value_Is_Constant[1] then
        begin
          Val(Edit1.Text, Temp_Value, Error_Code);
          if (Error_Code=0)and(Temp_Value>=0)and(Temp_Value<=100) then
            Constant_Value[1]:=Temp_Value/100
          else
            begin
              MessageDlg('Please enter a valid number for porosity!', mtError, [mbOk], 0);
              Exit;
            end;
          PHI_Track_Number:=-1;
        end;

      if Value_Is_Constant[2] then
        begin
          Val(Edit2.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            Constant_Value[2]:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for shaly-sand formation resistivity factor, Fr*!', mtError, [mbOk], 0);
              Exit;
            end;
          FR_Track_Number:=-1;
        end;

      if Value_Is_Constant[3] then
        begin
          Val(Edit3.Text, Temp_Value, Error_Code);
          if (Error_Code=0) then
            Constant_Value[3]:=Temp_Value/100
          else
            begin
              MessageDlg('Please enter a valid number for cation exchange capacity, CEC!', mtError, [mbOk], 0);
              Exit;
            end;
          CEC_Track_Number:=-1;
        end;

      if Value_Is_Constant[4] then
        begin
          Val(Edit4.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            Constant_Value[4]:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for formation temperature!', mtError, [mbOk], 0);
              Exit;
            end;
          T_Track_Number:=-1;
        end;

      if Value_Is_Constant[5] then
        begin
          Val(Edit5.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            Constant_Value[5]:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for Rw!', mtError, [mbOk], 0);
              Exit;
            end;
          Rw_Track_Number:=-1;
        end;

      if Value_Is_Constant[6] then
        begin
          Val(Edit6.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            Constant_Value[6]:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for Rt!', mtError, [mbOk], 0);
              Exit;
            end;
          Rt_Track_Number:=-1;
        end;

      if Value_Is_Constant[7] then
        begin
          Val(Edit7.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            Constant_Value[7]:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for matrix density!', mtError, [mbOk], 0);
              Exit;
            end;
          RHO_Track_Number:=-1;
        end;

      if Value_Is_Constant[8] then
        begin
          Val(Edit8.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            Constant_Value[8]:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for shaly-sand saturation exponent, n*!', mtError, [mbOk], 0);
              Exit;
            end;
          n_Track_Number:=-1;
        end;
    end;
  Close;
end;

procedure TCECMethod_Form.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=True;
  with MainForm do
    begin
      if (not(Operation_Canceled))and(PHI_Track_Number=-1)and(not(Value_Is_Constant[1])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for porosity!', mtWarning,[mbOk],0);
          Exit;
        end;

      if (not(Operation_Canceled))and(FR_Track_Number=-1)and(not(Value_Is_Constant[2])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for shaly-sand formation resistivity factor, Fr*!', mtWarning,[mbOk],0);
          Exit;
        end;

      if (not(Operation_Canceled))and(CEC_Track_Number=-1)and(not(Value_Is_Constant[3])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for cation exchange capacity, CEC!', mtWarning,[mbOk],0);
          Exit;
        end;

      if (not(Operation_Canceled))and(T_Track_Number=-1)and(not(Value_Is_Constant[4])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for formation temperature!', mtWarning,[mbOk],0);
          Exit;
        end;

      if (not(Operation_Canceled))and(Rw_Track_Number=-1)and(not(Value_Is_Constant[5])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for Rw!', mtWarning,[mbOk],0);
          Exit;
        end;

      if (not(Operation_Canceled))and(Rt_Track_Number=-1)and(not(Value_Is_Constant[6])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for Rt!', mtWarning,[mbOk],0);
          Exit;
        end;

      if (not(Operation_Canceled))and(RHO_Track_Number=-1)and(not(Value_Is_Constant[7])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for matrix density!', mtWarning,[mbOk],0);
          Exit;
        end;

      if (not(Operation_Canceled))and(n_Track_Number=-1)and(not(Value_Is_Constant[8])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for shaly-sand saturation exponent, n*!', mtWarning,[mbOk],0);
          Exit;
        end;
    end;
end;

procedure TCECMethod_Form.RadioButton2Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton1.Checked;
  Edit1.Color:=clBtnFace;
  Button1.Enabled:=RadioButton2.Checked;
  if MainForm.PHI_Track_Number<>-1 then
    begin
      Label2.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Title.Text.Text;
    end;
  Button1.SetFocus;
end;

procedure TCECMethod_Form.RadioButton4Click(Sender: TObject);
begin
  Edit2.Enabled:=RadioButton3.Checked;
  Edit2.Color:=clBtnFace;
  Button2.Enabled:=RadioButton4.Checked;
  if MainForm.FR_Track_Number<>-1 then
    begin
      Label4.Caption:=MainForm.Charts[MainForm.FR_Track_Number].Title.Text.Text;
    end;
  Button2.SetFocus;
end;

procedure TCECMethod_Form.RadioButton6Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton5.Checked;
  Edit3.Color:=clBtnFace;
  Button3.Enabled:=RadioButton6.Checked;
  if MainForm.CEC_Track_Number<>-1 then
    begin
      Label6.Caption:=MainForm.Charts[MainForm.CEC_Track_Number].Title.Text.Text;
    end;
  Button3.SetFocus;
end;

procedure TCECMethod_Form.RadioButton8Click(Sender: TObject);
begin
  Edit4.Enabled:=RadioButton7.Checked;
  Edit4.Color:=clBtnFace;
  Button4.Enabled:=RadioButton8.Checked;
  if MainForm.T_Track_Number<>-1 then
    begin
      Label8.Caption:=MainForm.Charts[MainForm.T_Track_Number].Title.Text.Text;
    end;
  Button4.SetFocus;
end;

procedure TCECMethod_Form.RadioButton10Click(Sender: TObject);
begin
  Edit5.Enabled:=RadioButton9.Checked;
  Edit5.Color:=clBtnFace;
  Button5.Enabled:=RadioButton10.Checked;
  if MainForm.Rw_Track_Number<>-1 then
    begin
      Label10.Caption:=MainForm.Charts[MainForm.Rw_Track_Number].Title.Text.Text;
    end;
  Button5.SetFocus;
end;

procedure TCECMethod_Form.RadioButton12Click(Sender: TObject);
begin
  Edit6.Enabled:=RadioButton11.Checked;
  Edit6.Color:=clBtnFace;
  Button6.Enabled:=RadioButton12.Checked;
  if MainForm.Rt_Track_Number<>-1 then
    begin
      Label12.Caption:=MainForm.Charts[MainForm.Rt_Track_Number].Title.Text.Text;
    end;
  Button6.SetFocus;
end;

procedure TCECMethod_Form.RadioButton14Click(Sender: TObject);
begin
  Edit7.Enabled:=RadioButton13.Checked;
  Edit7.Color:=clBtnFace;
  Button7.Enabled:=RadioButton14.Checked;
  if MainForm.RHO_Track_Number<>-1 then
    begin
      Label14.Caption:=MainForm.Charts[MainForm.RHO_Track_Number].Title.Text.Text;
    end;
  Button7.SetFocus;
end;

procedure TCECMethod_Form.RadioButton16Click(Sender: TObject);
begin
  Edit8.Enabled:=RadioButton15.Checked;
  Edit8.Color:=clBtnFace;
  Button8.Enabled:=RadioButton16.Checked;
  if MainForm.n_Track_Number<>-1 then
    begin
      Label16.Caption:=MainForm.Charts[MainForm.n_Track_Number].Title.Text.Text;
    end;
  Button8.SetFocus;
end;

procedure TCECMethod_Form.RadioButton1Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton1.Checked;
  Edit1.Color:=clWindow;
  Button1.Enabled:=RadioButton2.Checked;
  Label2.Caption:='NONE';
  Edit1.SetFocus;
end;

procedure TCECMethod_Form.RadioButton3Click(Sender: TObject);
begin
  Edit2.Enabled:=RadioButton3.Checked;
  Edit2.Color:=clWindow;
  Button2.Enabled:=RadioButton4.Checked;
  Label4.Caption:='NONE';
  Edit2.SetFocus;
end;

procedure TCECMethod_Form.RadioButton5Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton5.Checked;
  Edit3.Color:=clWindow;
  Button3.Enabled:=RadioButton6.Checked;
  Label6.Caption:='NONE';
  Edit3.SetFocus;

end;

procedure TCECMethod_Form.RadioButton7Click(Sender: TObject);
begin
  Edit4.Enabled:=RadioButton7.Checked;
  Edit4.Color:=clWindow;
  Button4.Enabled:=RadioButton8.Checked;
  Label8.Caption:='NONE';
  Edit4.SetFocus;

end;

procedure TCECMethod_Form.RadioButton9Click(Sender: TObject);
begin
  Edit5.Enabled:=RadioButton9.Checked;
  Edit5.Color:=clWindow;
  Button5.Enabled:=RadioButton10.Checked;
  Label10.Caption:='NONE';
  Edit5.SetFocus;

end;

procedure TCECMethod_Form.RadioButton11Click(Sender: TObject);
begin
  Edit6.Enabled:=RadioButton11.Checked;
  Edit6.Color:=clWindow;
  Button6.Enabled:=RadioButton12.Checked;
  Label12.Caption:='NONE';
  Edit6.SetFocus;

end;

procedure TCECMethod_Form.RadioButton13Click(Sender: TObject);
begin
  Edit7.Enabled:=RadioButton13.Checked;
  Edit7.Color:=clWindow;
  Button7.Enabled:=RadioButton14.Checked;
  Label14.Caption:='NONE';
  Edit7.SetFocus;

end;

procedure TCECMethod_Form.RadioButton15Click(Sender: TObject);
begin
  Edit8.Enabled:=RadioButton15.Checked;
  Edit8.Color:=clWindow;
  Button8.Enabled:=RadioButton16.Checked;
  Label16.Caption:='NONE';
  Edit8.SetFocus;

end;

end.
