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
    TabSheet2: TTabSheet;
    GroupBox8: TGroupBox;
    GroupBox5: TGroupBox;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    Edit5: TEdit;
    GroupBox6: TGroupBox;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    Edit6: TEdit;
    GroupBox19: TGroupBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    Edit2: TEdit;
    Edit1: TEdit;
    Edit15: TEdit;
    Edit3: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FromLog(From_Log: Boolean; var Track_Name: smallint;
                           var Change_Edit: TEdit;var Change_Combo: TComboBox;
                           var Change_Radio1: TRadioButton;var Change_Radio2: TRadioButton);
    procedure CheckLog (i: Byte; var Change_Radio: TRadioButton; var Change_Edit: TEdit;
                    Log_Name: String; var Track_Name: Smallint );
    procedure RadioButton10Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure RadioButton12Click(Sender: TObject);
    procedure RadioButton11Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Fill( var Combo: TComboBox);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Sw_Form: TSw_Form;

implementation

uses Main_Form2, TeEngine;

{$R *.dfm}

procedure TSw_Form.Button5Click(Sender: TObject);
var
Temp_Value: Single;
Error_Code: Integer;
begin
with MainForm2 do
  begin
        CheckLog(1, RadioButton9, Edit5, 'Rw', Rw_Track_Number);
        CheckLog(2, RadioButton11, Edit6, 'Rt', Rt_Track_Number);
        CheckLog(3, RadioButton1, Edit3, 'PHI', PHI_Track_Number);
        Val(Edit15.Text, Temp_Value, Error_Code);
        if (Error_Code <> 0)or(Temp_Value < 0)  then
          begin
            MessageDlg('Please enter a valid number for saturation exponent (n)!', mtWarning,[mbOk],0);
            Exit;
          end
        else
          Saturation_Exponent:=Temp_Value;

        Val(Edit2.Text, Temp_Value, Error_Code);
        if (Error_Code <> 0)or(Temp_Value < 0)  then
          begin
            MessageDlg('Please enter a valid number for compaction exponent (m)!', mtWarning,[mbOk],0);
            Exit;
          end
        else
          m_Value:=Temp_Value;

        Val(Edit1.Text, Temp_Value, Error_Code);
        if (Error_Code <> 0)or(Temp_Value < 0)  then
          begin
            MessageDlg('Please enter a valid number for constant (a)!', mtWarning,[mbOk],0);
            Exit;
          end
        else
          a_Value:=Temp_Value;
        Operation_Canceled:=False;

  end;
Close
end;

procedure TSw_Form.Button6Click(Sender: TObject);
begin
  MainForm2.Operation_Canceled:=True;
  Close;
end;

procedure TSw_Form.FromLog(From_Log: Boolean; var Track_Name: smallint;
                           var Change_Edit: TEdit;var Change_Combo: TComboBox;
                           var Change_Radio1: TRadioButton;var Change_Radio2: TRadioButton);
begin
    if From_Log then
      begin
        Change_Edit.Enabled:=Change_Radio1.Checked;
        Change_Edit.Color:=clBtnFace;
        Change_Combo.Enabled:=Change_Radio2.Checked;
      end
    else
      begin
        Change_Edit.Enabled:=Change_Radio1.Checked;
        Change_Edit.Color:=clWindow;
        Change_Combo.Enabled:=Change_Radio2.Checked;
        Change_Edit.SetFocus;
      end;
end;

procedure TSw_Form.RadioButton10Click(Sender: TObject);
begin
  FromLog(True, MainForm2.Rw_Track_Number, Edit5, ComboBox5, RadioButton9, RadioButton10);
end;

procedure TSw_Form.RadioButton9Click(Sender: TObject);
begin
  FromLog(False, MainForm2.Rw_Track_Number, Edit5, ComboBox5, RadioButton9, RadioButton10);
end;

procedure TSw_Form.RadioButton12Click(Sender: TObject);
begin
  FromLog(True, MainForm2.Rt_Track_Number, Edit6, ComboBox6, RadioButton11, RadioButton12);
end;

procedure TSw_Form.RadioButton11Click(Sender: TObject);
begin
  FromLog(False, MainForm2.Rt_Track_Number, Edit6, ComboBox6, RadioButton11, RadioButton12);
end;

procedure TSw_Form.CheckLog (i: Byte; var Change_Radio: TRadioButton; var Change_Edit: TEdit;
                    Log_Name: String; var Track_Name: Smallint );
var
Temp_Value: Single;
Error_Code: integer;
begin
with MainForm2 do
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

procedure TSw_Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose:=True;
with MainForm2 do
  begin
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
              MessageDlg('Please select a track for porosity!', mtWarning,[mbOk],0);
              Exit;
            end;

  end;
end;

procedure TSw_Form.FormCreate(Sender: TObject);
var
i:integer;
begin
  ComboBox1.Items.Clear;
  ComboBox5.Items.Clear;
  ComboBox6.Items.Clear;
  Fill(ComboBox1);
  Fill(ComboBox5);
  Fill(ComboBox6);
end;

procedure TSw_Form.Fill( var Combo: TComboBox);
var
j:integer;
begin
 with MainForm2 do
    begin
      Combo.Items.Clear;
      Combo.Clear;
          for j:=0 to OpenedFile.Values.FieldDefs.Count-1 do
            begin
              Combo.Items.Add(OpenedFile.Values.FieldDefs[j].Name);
            end;
      Combo.ItemIndex:=-1;
    end;
end;

procedure TSw_Form.RadioButton2Click(Sender: TObject);
begin
  FromLog(True, MainForm2.PHI_Track_Number, Edit3, ComboBox1, RadioButton1, RadioButton2);
end;

procedure TSw_Form.RadioButton1Click(Sender: TObject);
begin
  FromLog(False, MainForm2.PHI_Track_Number, Edit3, ComboBox1, RadioButton1, RadioButton2);
end;

procedure TSw_Form.ComboBox5Change(Sender: TObject);
begin
  with MainForm2 do
    Rw_Track_Number:=ComboBox5.ItemIndex;
end;

procedure TSw_Form.ComboBox6Change(Sender: TObject);
begin
  with MainForm2 do
    Rt_Track_Number:=ComboBox6.ItemIndex;
end;

procedure TSw_Form.ComboBox1Change(Sender: TObject);
begin
  with MainForm2 do
    PHI_Track_Number:=ComboBox1.ItemIndex;
end;

end.
