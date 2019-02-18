unit SwForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

type
  TSw_Form = class(TForm)
    Panel1: TPanel;
    Button5: TButton;
    Button6: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
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
    Button1: TButton;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    Edit4: TEdit;
    Button2: TButton;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    GroupBox9: TGroupBox;
    ComboBox1: TComboBox;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    GroupBox10: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    Edit7: TEdit;
    Button9: TButton;
    GroupBox11: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    Edit9: TEdit;
    Button11: TButton;
    GroupBox12: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    RadioButton19: TRadioButton;
    RadioButton20: TRadioButton;
    Edit10: TEdit;
    Button12: TButton;
    TabSheet6: TTabSheet;
    GroupBox16: TGroupBox;
    ScrollBox7: TScrollBox;
    GroupBox17: TGroupBox;
    ComboBox2: TComboBox;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    GroupBox13: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    RadioButton21: TRadioButton;
    RadioButton22: TRadioButton;
    Edit11: TEdit;
    Button13: TButton;
    GroupBox14: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    RadioButton23: TRadioButton;
    RadioButton24: TRadioButton;
    Edit12: TEdit;
    Button14: TButton;
    GroupBox15: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    RadioButton25: TRadioButton;
    RadioButton26: TRadioButton;
    Edit13: TEdit;
    Button15: TButton;
    GroupBox18: TGroupBox;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    ComboBox3: TComboBox;
    GroupBox8: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    RadioButton15: TRadioButton;
    RadioButton16: TRadioButton;
    Edit8: TEdit;
    Button10: TButton;
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
    GroupBox7: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    RadioButton27: TRadioButton;
    RadioButton28: TRadioButton;
    Edit14: TEdit;
    Button16: TButton;
    GroupBox19: TGroupBox;
    Edit15: TEdit;
    GroupBox20: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    RadioButton29: TRadioButton;
    RadioButton30: TRadioButton;
    Edit16: TEdit;
    Button17: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure SelectLog(var Track_Name: smallint; var Change_Label: TLabel);
    procedure FromLog( From_Log: Boolean; var Track_Name: smallint; var Change_Label: TLabel;
                           var Change_Edit: TEdit; var Change_Button: TButton;
                           var Change_Radio1: TRadioButton; var Change_Radio2: TRadioButton);
    procedure CheckLog (i: Byte; var Change_Radio: TRadioButton; var Change_Edit: TEdit;
                    Log_Name: String; var Track_Name: Smallint );
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure RadioButton10Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure RadioButton12Click(Sender: TObject);
    procedure RadioButton11Click(Sender: TObject);
    procedure RadioButton16Click(Sender: TObject);
    procedure RadioButton15Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure RadioButton14Click(Sender: TObject);
    procedure RadioButton13Click(Sender: TObject);
    procedure RadioButton18Click(Sender: TObject);
    procedure RadioButton17Click(Sender: TObject);
    procedure RadioButton20Click(Sender: TObject);
    procedure RadioButton19Click(Sender: TObject);
    procedure RadioButton28Click(Sender: TObject);
    procedure RadioButton27Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure RadioButton22Click(Sender: TObject);
    procedure RadioButton21Click(Sender: TObject);
    procedure RadioButton24Click(Sender: TObject);
    procedure RadioButton23Click(Sender: TObject);
    procedure RadioButton26Click(Sender: TObject);
    procedure RadioButton25Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button17Click(Sender: TObject);
    procedure RadioButton30Click(Sender: TObject);
    procedure RadioButton29Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Sw_Form: TSw_Form;

implementation

uses Main_Form, SelectLog;

{$R *.dfm}

procedure TSw_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.Sw_Calculation_Method := PageControl1.TabIndex;
  MainForm.Shale_Calculation_Method := PageControl2.TabIndex;
end;

procedure TSw_Form.Button5Click(Sender: TObject);
var
Temp_Value: Single;
Error_Code: Integer;
begin
with MainForm do
  begin
    Case PageControl1.TabIndex of
    0:begin
        CheckLog(1, RadioButton1, Edit1, 'Rw', Rw_Track_Number);
        CheckLog(2, RadioButton3, Edit2, 'Rt', Rt_Track_Number);
        CheckLog(3, RadioButton5, Edit3, 'porosity', PHI_Track_Number);
        CheckLog(4, RadioButton7, Edit4, 'shale volume', Shale_Volume_Track_Number);
        Val(LabeledEdit12.Text, Temp_Value, Error_Code);
        if (Error_Code <> 0)or(Temp_Value < 0)  then
          begin
            MessageDlg('Please enter a valid number for a!', mtWarning,[mbOk],0);
            Exit;
          end
        else
          a_Value:=Temp_Value;

        Val(LabeledEdit11.Text, Temp_Value, Error_Code);
        if (Error_Code <> 0)or(Temp_Value < 0)  then
          begin
            MessageDlg('Please enter a valid number for m!', mtWarning,[mbOk],0);
            Exit;
          end
        else
          Cementation_Factor:=Temp_Value;

        Val(LabeledEdit10.Text, Temp_Value, Error_Code);
        if (Error_Code <> 0)or(Temp_Value < 0)  then
          begin
            MessageDlg('Please enter a valid number for shaly beds resistivity!', mtWarning,[mbOk],0);
            Exit;
          end
        else
          Shaly_Beds_Resistivity:=Temp_Value;

        Operation_Canceled:=False;
      end;
    1:begin
        CheckLog(1, RadioButton9, Edit5, 'Rw', Rw_Track_Number);
        CheckLog(2, RadioButton11, Edit6, 'Rt', Rt_Track_Number);
        CheckLog(3, RadioButton15, Edit8, 'formation resistivity factor', FR_Track_Number);
        Val(Edit15.Text, Temp_Value, Error_Code);
        if (Error_Code <> 0)or(Temp_Value < 0)  then
          begin
            MessageDlg('Please enter a valid number for saturation exponent (n)!', mtWarning,[mbOk],0);
            Exit;
          end
        else
          Saturation_Exponent:=Temp_Value;
        Operation_Canceled:=False;
      end;
    2:begin
        Case PageControl2.TabIndex of
          0:begin
              CheckLog(1, RadioButton13, Edit7, 'Rw', Rw_Track_Number);
              CheckLog(2, RadioButton17, Edit9, 'Rt', Rt_Track_Number);
              CheckLog(3, RadioButton19, Edit10, 'bulk porosity', PHI_Track_Number);
              CheckLog(4, RadioButton27, Edit14, 'shale volume', Shale_Volume_Track_Number);
              Val(LabeledEdit2.Text, Temp_Value, Error_Code);
              if (Error_Code <> 0)or(Temp_Value < 0)  then
                begin
                  MessageDlg('Please enter a valid number for a!', mtWarning,[mbOk],0);
                  Exit;
                end
              else
                a_Value:=Temp_Value;

              Val(LabeledEdit1.Text, Temp_Value, Error_Code);
              if (Error_Code <> 0)or(Temp_Value < 0)  then
                begin
                  MessageDlg('Please enter a valid number for m!', mtWarning,[mbOk],0);
                  Exit;
                end
              else
                Cementation_Factor:=Temp_Value;

              Val(LabeledEdit3.Text, Temp_Value, Error_Code);
              if (Error_Code <> 0)or(Temp_Value < 0)  then
                begin
                  MessageDlg('Please enter a valid number for n!', mtWarning,[mbOk],0);
                  Exit;
                end
              else
                Saturation_Exponent:=Temp_Value;

              Val(LabeledEdit5.Text, Temp_Value, Error_Code);
              if (Error_Code <> 0)or(Temp_Value < 0)  then
                begin
                  MessageDlg('Please enter a valid number for shaly beds resistivity!', mtWarning,[mbOk],0);
                  Exit;
                end
              else
                Shaly_Beds_Resistivity:=Temp_Value;

              Operation_Canceled:=False;
            end;
          1:begin
              CheckLog(1, RadioButton21, Edit11, 'Rw', Rw_Track_Number);
              CheckLog(2, RadioButton23, Edit12, 'Rt', Rt_Track_Number);
              CheckLog(3, RadioButton25, Edit13, 'sonic porosity', PHI_T_Track_Number);
              CheckLog(4, RadioButton29, Edit16, 'density porosity', PHI_D_Track_Number);
              Val(LabeledEdit6.Text, Temp_Value, Error_Code);
              if (Error_Code <> 0)or(Temp_Value < 0)  then
                begin
                  MessageDlg('Please enter a valid number for a!', mtWarning,[mbOk],0);
                  Exit;
                end
              else
                a_Value:=Temp_Value;

              Val(LabeledEdit7.Text, Temp_Value, Error_Code);
              if (Error_Code <> 0)or(Temp_Value < 0)  then
                begin
                  MessageDlg('Please enter a valid number for m!', mtWarning,[mbOk],0);
                  Exit;
                end
              else
                Cementation_Factor:=Temp_Value;

              Val(LabeledEdit8.Text, Temp_Value, Error_Code);
              if (Error_Code <> 0)or(Temp_Value < 0)  then
                begin
                  MessageDlg('Please enter a valid number for n!', mtWarning,[mbOk],0);
                  Exit;
                end
              else
                Saturation_Exponent:=Temp_Value;

              Operation_Canceled:=False;
            end;
        end;
      end;
    end;
  end;
Close
end;

procedure TSw_Form.Button6Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TSw_Form.SelectLog(var Track_Name: smallint; var Change_Label: TLabel);
begin
with MainForm do
  begin
    Select_Log:=TSelect_Log.Create(Self);
    Select_Log.ShowModal;
    Track_Name:=Select_Log.Selected_Track_Number;
    if Select_Log.Selected_Track_Number<>-1 then
      begin
        Track_Name:=Select_Log.Selected_Track_Number;
        Change_Label.Caption:=Charts[Track_Name].Title.Text.Text;
      end;
    Select_Log.Free;
  end;
end;

procedure TSw_Form.FromLog(From_Log: Boolean; var Track_Name: smallint;
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
            Change_Label.Caption:=Charts[Track_Name].Title.Text.Text;
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

procedure TSw_Form.Button3Click(Sender: TObject);
begin
  SelectLog(MainForm.Rw_Track_Number, Label2);
end;

procedure TSw_Form.Button4Click(Sender: TObject);
begin
  SelectLog(MainForm.Rt_Track_Number, Label4);
end;

procedure TSw_Form.Button1Click(Sender: TObject);
begin
  SelectLog(MainForm.PHI_Track_Number, Label6);
end;

procedure TSw_Form.Button2Click(Sender: TObject);
begin
  SelectLog(MainForm.Shale_Volume_Track_Number, Label8);
end;

procedure TSw_Form.RadioButton2Click(Sender: TObject);
begin
  FromLog(True, MainForm.Rw_Track_Number, Label2, Edit1, Button3, RadioButton1, RadioButton2);
end;

procedure TSw_Form.RadioButton1Click(Sender: TObject);
begin
  FromLog(False, MainForm.Rw_Track_Number, Label2, Edit1, Button3, RadioButton1, RadioButton2);
end;

procedure TSw_Form.RadioButton4Click(Sender: TObject);
begin
  FromLog(True, MainForm.Rt_Track_Number, Label4, Edit2, Button4, RadioButton3, RadioButton4);

end;

procedure TSw_Form.RadioButton6Click(Sender: TObject);
begin
  FromLog(True, MainForm.PHI_Track_Number, Label6, Edit3, Button1, RadioButton5, RadioButton6);
end;

procedure TSw_Form.RadioButton8Click(Sender: TObject);
begin
  FromLog(True, MainForm.Shale_Volume_Track_Number, Label8, Edit4, Button2, RadioButton7, RadioButton8);
end;

procedure TSw_Form.RadioButton3Click(Sender: TObject);
begin
  FromLog(False, MainForm.Rt_Track_Number, Label4, Edit2, Button4, RadioButton3, RadioButton4);
end;

procedure TSw_Form.RadioButton5Click(Sender: TObject);
begin
  FromLog(False, MainForm.PHI_Track_Number, Label6, Edit3, Button1, RadioButton5, RadioButton6);
end;

procedure TSw_Form.RadioButton7Click(Sender: TObject);
begin
  FromLog(False, MainForm.Shale_Volume_Track_Number, Label8, Edit4, Button2, RadioButton7, RadioButton8);
end;

procedure TSw_Form.Button7Click(Sender: TObject);
begin
  SelectLog(MainForm.Rw_Track_Number, Label10);
end;

procedure TSw_Form.Button8Click(Sender: TObject);
begin
  SelectLog(MainForm.Rt_Track_Number, Label12);
end;

procedure TSw_Form.Button10Click(Sender: TObject);
begin
  SelectLog(MainForm.FR_Track_Number, Label16);
end;

procedure TSw_Form.RadioButton10Click(Sender: TObject);
begin
  FromLog(True, MainForm.Rw_Track_Number, Label2, Edit5, Button7, RadioButton9, RadioButton10);
end;

procedure TSw_Form.RadioButton9Click(Sender: TObject);
begin
  FromLog(False, MainForm.Rw_Track_Number, Label2, Edit5, Button7, RadioButton9, RadioButton10);
end;

procedure TSw_Form.RadioButton12Click(Sender: TObject);
begin
  FromLog(True, MainForm.Rt_Track_Number, Label12, Edit6, Button8, RadioButton11, RadioButton12);
end;

procedure TSw_Form.RadioButton11Click(Sender: TObject);
begin
  FromLog(False, MainForm.Rt_Track_Number, Label12, Edit6, Button8, RadioButton11, RadioButton12);
end;

procedure TSw_Form.RadioButton16Click(Sender: TObject);
begin
  FromLog(True, MainForm.FR_Track_Number, Label16, Edit8, Button10, RadioButton15, RadioButton16);
end;

procedure TSw_Form.RadioButton15Click(Sender: TObject);
begin
  FromLog(False, MainForm.FR_Track_Number, Label16, Edit8, Button10, RadioButton15, RadioButton16);
end;

procedure TSw_Form.Button9Click(Sender: TObject);
begin
  SelectLog(MainForm.Rw_Track_Number, Label14);
end;

procedure TSw_Form.Button11Click(Sender: TObject);
begin
  SelectLog(MainForm.Rt_Track_Number, Label18);
end;

procedure TSw_Form.Button12Click(Sender: TObject);
begin
  SelectLog(MainForm.PHI_Track_Number, Label20);
end;

procedure TSw_Form.Button16Click(Sender: TObject);
begin
  SelectLog(MainForm.Shale_Volume_Track_Number, Label28);
end;

procedure TSw_Form.RadioButton14Click(Sender: TObject);
begin
  FromLog(True, MainForm.Rw_Track_Number, Label14, Edit7, Button9, RadioButton14, RadioButton13);
end;

procedure TSw_Form.RadioButton13Click(Sender: TObject);
begin
  FromLog(False, MainForm.Rw_Track_Number, Label14, Edit7, Button9, RadioButton14, RadioButton13);
end;

procedure TSw_Form.RadioButton18Click(Sender: TObject);
begin
  FromLog(True, MainForm.Rt_Track_Number, Label18, Edit9, Button11, RadioButton17, RadioButton18);
end;

procedure TSw_Form.RadioButton17Click(Sender: TObject);
begin
  FromLog(False, MainForm.Rt_Track_Number, Label18, Edit9, Button11, RadioButton17, RadioButton18);
end;

procedure TSw_Form.RadioButton20Click(Sender: TObject);
begin
  FromLog(True, MainForm.PHI_Track_Number, Label20, Edit10, Button12, RadioButton19, RadioButton20);
end;

procedure TSw_Form.RadioButton19Click(Sender: TObject);
begin
  FromLog(False, MainForm.PHI_Track_Number, Label20, Edit10, Button12, RadioButton19, RadioButton20);
end;

procedure TSw_Form.RadioButton28Click(Sender: TObject);
begin
  FromLog(True, MainForm.Shale_Volume_Track_Number, Label27, Edit14, Button16, RadioButton27, RadioButton28);
end;

procedure TSw_Form.RadioButton27Click(Sender: TObject);
begin
  FromLog(False, MainForm.Shale_Volume_Track_Number, Label27, Edit14, Button16, RadioButton27, RadioButton28);
end;

procedure TSw_Form.Button13Click(Sender: TObject);
begin
  SelectLog(MainForm.Rw_Track_Number, Label22);
end;

procedure TSw_Form.Button14Click(Sender: TObject);
begin
  SelectLog(MainForm.Rt_Track_Number, Label24);
end;

procedure TSw_Form.Button15Click(Sender: TObject);
begin
  SelectLog(MainForm.PHI_Track_Number, Label26);
end;

procedure TSw_Form.RadioButton22Click(Sender: TObject);
begin
  FromLog(True, MainForm.Rw_Track_Number, Label22, Edit11, Button13, RadioButton21, RadioButton22);
end;

procedure TSw_Form.RadioButton21Click(Sender: TObject);
begin
  FromLog(False, MainForm.Rw_Track_Number, Label22, Edit11, Button13, RadioButton21, RadioButton22);
end;

procedure TSw_Form.RadioButton24Click(Sender: TObject);
begin
  FromLog(True, MainForm.Rt_Track_Number, Label24, Edit12, Button14, RadioButton23, RadioButton24);
end;

procedure TSw_Form.RadioButton23Click(Sender: TObject);
begin
  FromLog(False, MainForm.Rt_Track_Number, Label24, Edit12, Button14, RadioButton23, RadioButton24);
end;

procedure TSw_Form.RadioButton26Click(Sender: TObject);
begin
  FromLog(True, MainForm.PHI_T_Track_Number, Label26, Edit13, Button15, RadioButton25, RadioButton26);
end;

procedure TSw_Form.RadioButton25Click(Sender: TObject);
begin
  FromLog(False, MainForm.PHI_T_Track_Number, Label26, Edit13, Button15, RadioButton25, RadioButton26);
end;

procedure TSw_Form.CheckLog (i: Byte; var Change_Radio: TRadioButton; var Change_Edit: TEdit;
                    Log_Name: String; var Track_Name: Smallint );
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
          Constant_Value[i]:=Temp_Value
        else
          begin
            MessageDlg('Please enter a valid number for ' + Log_Name + '!', mtError, [mbOk], 0);
            Exit;
          end;
        Track_Name:=-1;
      end;
  end;
end;

procedure TSw_Form.ComboBox3Change(Sender: TObject);
begin
  Case ComboBox3.ItemIndex of
    0:begin
        LabeledEdit12.Text:='1';
        LabeledEdit11.Text:='2';
      end;
    1:begin
        LabeledEdit12.Text:='1.45';
        LabeledEdit11.Text:='1.54';
      end;
    2:begin
        LabeledEdit12.Text:='1.65';
        LabeledEdit11.Text:='1.33';
      end;
    3:begin
        LabeledEdit12.Text:='1';
        LabeledEdit11.Text:='2';
      end;
    4:begin
        LabeledEdit12.Text:='0.62';
        LabeledEdit11.Text:='2.15';
      end;
    5:begin
        LabeledEdit12.Text:='0.81';
        LabeledEdit11.Text:='2';
      end;
    end;
end;

procedure TSw_Form.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0:begin
        LabeledEdit2.Text:='1';
        LabeledEdit1.Text:='2';
      end;
    1:begin
        LabeledEdit2.Text:='1.45';
        LabeledEdit1.Text:='1.54';
      end;
    2:begin
        LabeledEdit2.Text:='1.65';
        LabeledEdit1.Text:='1.33';
      end;
    3:begin
        LabeledEdit2.Text:='1';
        LabeledEdit1.Text:='2';
      end;
    4:begin
        LabeledEdit2.Text:='0.62';
        LabeledEdit1.Text:='2.15';
      end;
    5:begin
        LabeledEdit2.Text:='0.81';
        LabeledEdit1.Text:='2';
      end;
    end;
end;

procedure TSw_Form.ComboBox2Change(Sender: TObject);
begin
  Case ComboBox2.ItemIndex of
    0:begin
        LabeledEdit6.Text:='1';
        LabeledEdit7.Text:='2';
      end;
    1:begin
        LabeledEdit6.Text:='1.45';
        LabeledEdit7.Text:='1.54';
      end;
    2:begin
        LabeledEdit6.Text:='1.65';
        LabeledEdit7.Text:='1.33';
      end;
    3:begin
        LabeledEdit6.Text:='1';
        LabeledEdit7.Text:='2';
      end;
    4:begin
        LabeledEdit6.Text:='0.62';
        LabeledEdit7.Text:='2.15';
      end;
    5:begin
        LabeledEdit6.Text:='0.81';
        LabeledEdit7.Text:='2';
      end;
    end;
end;

procedure TSw_Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose:=True;
with MainForm do
  begin
    Case PageControl1.TabIndex of
      0:begin
          if (not(Operation_Canceled))and(Rw_Track_Number=-1)and(not(Value_Is_Constant[1])) then
            begin
              CanClose:=False;
              MessageDlg('Please select a track for Rw!', mtWarning,[mbOk],0);
              Exit;
            end;
          if (not(Operation_Canceled))and(Rt_Track_Number=-1)and(not(Value_Is_Constant[2])) then
            begin
              CanClose:=False;
              MessageDlg('Please select a track for Rt!', mtWarning,[mbOk],0);
              Exit;
            end;
          if (not(Operation_Canceled))and(PHI_Track_Number=-1)and(not(Value_Is_Constant[3])) then
            begin
              CanClose:=False;
              MessageDlg('Please select a track for bulk porosity!', mtWarning,[mbOk],0);
              Exit;
            end;
          if (not(Operation_Canceled))and(Shale_Volume_Track_Number=-1)and(not(Value_Is_Constant[4])) then
            begin
              CanClose:=False;
              MessageDlg('Please select a track for shale volume!', mtWarning,[mbOk],0);
              Exit;
            end;
        end;
      1:begin
          if (not(Operation_Canceled))and(Rw_Track_Number=-1)and(not(Value_Is_Constant[1])) then
            begin
              CanClose:=False;
              MessageDlg('Please select a track for Rw!', mtWarning,[mbOk],0);
              Exit;
            end;
          if (not(Operation_Canceled))and(Rt_Track_Number=-1)and(not(Value_Is_Constant[2])) then
            begin
              CanClose:=False;
              MessageDlg('Please select a track for Rt!', mtWarning,[mbOk],0);
              Exit;
            end;
          if (not(Operation_Canceled))and(FR_Track_Number=-1)and(not(Value_Is_Constant[3])) then
            begin
              CanClose:=False;
              MessageDlg('Please select a track for formation resistivity factor!', mtWarning,[mbOk],0);
              Exit;
            end;
        end;
      2:begin
          Case PageControl2.TabIndex of
            0:begin
                if (not(Operation_Canceled))and(Rw_Track_Number=-1)and(not(Value_Is_Constant[1])) then
                  begin
                    CanClose:=False;
                    MessageDlg('Please select a track for Rw!', mtWarning,[mbOk],0);
                    Exit;
                  end;
                if (not(Operation_Canceled))and(Rt_Track_Number=-1)and(not(Value_Is_Constant[2])) then
                  begin
                    CanClose:=False;
                    MessageDlg('Please select a track for Rt!', mtWarning,[mbOk],0);
                    Exit;
                  end;
                if (not(Operation_Canceled))and(PHI_Track_Number=-1)and(not(Value_Is_Constant[3])) then
                  begin
                    CanClose:=False;
                    MessageDlg('Please select a track for bulk porosity!', mtWarning,[mbOk],0);
                    Exit;
                  end;
                if (not(Operation_Canceled))and(Shale_Volume_Track_Number=-1)and(not(Value_Is_Constant[4])) then
                  begin
                    CanClose:=False;
                    MessageDlg('Please select a track for shale volume!', mtWarning,[mbOk],0);
                    Exit;
                  end;
              end;
            1:begin
                if (not(Operation_Canceled))and(Rw_Track_Number=-1)and(not(Value_Is_Constant[1])) then
                  begin
                    CanClose:=False;
                    MessageDlg('Please select a track for Rw!', mtWarning,[mbOk],0);
                    Exit;
                  end;
                if (not(Operation_Canceled))and(Rt_Track_Number=-1)and(not(Value_Is_Constant[2])) then
                  begin
                    CanClose:=False;
                    MessageDlg('Please select a track for Rt!', mtWarning,[mbOk],0);
                    Exit;
                  end;
                if (not(Operation_Canceled))and(PHI_T_Track_Number=-1)and(not(Value_Is_Constant[3])) then
                  begin
                    CanClose:=False;
                    MessageDlg('Please select a track for sonic porosity!', mtWarning,[mbOk],0);
                    Exit;
                  end;
                if (not(Operation_Canceled))and(PHI_D_Track_Number=-1)and(not(Value_Is_Constant[4])) then
                  begin
                    CanClose:=False;
                    MessageDlg('Please select a track for density porosity!', mtWarning,[mbOk],0);
                    Exit;
                  end;
              end;
          end;
        end;
    end;
  end;
end;

procedure TSw_Form.Button17Click(Sender: TObject);
begin
  SelectLog(MainForm.PHI_D_Track_Number, Label30);
end;

procedure TSw_Form.RadioButton30Click(Sender: TObject);
begin
  FromLog(True, MainForm.PHI_D_Track_Number, Label30, Edit16, Button17, RadioButton29, RadioButton30);
end;

procedure TSw_Form.RadioButton29Click(Sender: TObject);
begin
  FromLog(False, MainForm.PHI_D_Track_Number, Label30, Edit16, Button17, RadioButton29, RadioButton30);
end;

end.
