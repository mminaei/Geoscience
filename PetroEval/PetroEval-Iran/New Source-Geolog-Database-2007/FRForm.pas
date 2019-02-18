unit FRForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TFR_Form = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Button3: TButton;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit2: TEdit;
    Button4: TButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Edit3: TEdit;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FR_Form: TFR_Form;

implementation

uses Main_Form, SelectLog;

{$R *.dfm}

procedure TFR_Form.Button1Click(Sender: TObject);
var
Error_Code:integer;
Temp_Value:Single;
begin
  with MainForm do
    begin
      Operation_Canceled:=False;
      Case PageControl1.TabIndex of
        0:begin
            Value_Is_Constant[1]:=RadioButton5.Checked;
            if Value_Is_Constant[1] then
              begin
                Val(Edit3.Text, Temp_Value, Error_Code);
                if Error_Code=0 then
                  Constant_Value[1]:=Temp_Value
                else
                  begin
                    MessageDlg('Please enter a valid number for Porosity!', mtError, [mbOk], 0);
                    Exit;
                  end;
                PHI_Track_Number:=-1;
              end;
            FR_Calculation_Method:=0;

            Val(LabeledEdit2.Text, Temp_Value, Error_Code);
            if Error_Code=0 then
              Cementation_Factor:=Temp_Value
            else
              begin
                MessageDlg('Please enter a valid number for cementation factor!', mtError, [mbOk], 0);
                Exit;
              end;
            Val(LabeledEdit1.Text, Temp_Value, Error_Code);
            if Error_Code=0 then
              a_Value:=Temp_Value
            else
              begin
                MessageDlg('Please enter a valid number for constant "a" value!', mtError, [mbOk], 0);
                Exit;
              end;
          end;
        1:begin
            Value_Is_Constant[1]:=RadioButton1.Checked;
            Value_Is_Constant[2]:=RadioButton3.Checked;
            if Value_Is_Constant[1] then
              begin
                Val(Edit1.Text, Temp_Value, Error_Code);
                if Error_Code=0 then
                  Constant_Value[1]:=Temp_Value
                else
                  begin
                    MessageDlg('Please enter a valid number for Ro!', mtError, [mbOk], 0);
                    Exit;
                  end;
                Ro_Track_Number:=-1;
              end;
            if Value_Is_Constant[2] then
              begin
                Val(Edit2.Text, Temp_Value, Error_Code);
                if Error_Code=0 then
                  Constant_Value[2]:=Temp_Value
                else
                  begin
                    MessageDlg('Please enter a valid number for Rw!', mtError, [mbOk], 0);
                    Exit;
                  end;
                Rw_Track_Number:=-1;
              end;
            FR_Calculation_Method:=1;
          end;
      end;
    end;
  Close;

end;

procedure TFR_Form.Button2Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TFR_Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=True;
  with MainForm do
    begin
      Case PageControl1.TabIndex of
        0:begin
            if (not(Operation_Canceled))and(PHI_Track_Number=-1)and(not(Value_Is_Constant[1])) then
              begin
                CanClose:=False;
                MessageDlg('Please select a track for Porosity!', mtWarning,[mbOk],0);
                Exit;
              end;
          end;
        1:begin
            if (not(Operation_Canceled))and(Ro_Track_Number=-1)and(not(Value_Is_Constant[1])) then
              begin
                CanClose:=False;
                MessageDlg('Please select a track for Ro!', mtWarning,[mbOk],0);
                Exit;
              end;
            if (not(Operation_Canceled))and(Rw_Track_Number=-1)and(not(Value_Is_Constant[2])) then
              begin
                CanClose:=False;
                MessageDlg('Please select a track for Rw!', mtWarning,[mbOk],0);
                Exit;
              end;
          end;
      end;
    end;

end;

procedure TFR_Form.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0:begin
        LabeledEdit1.Text:='1';
        LabeledEdit2.Text:='2';
      end;
    1:begin
        LabeledEdit1.Text:='1.45';
        LabeledEdit2.Text:='1.54';
      end;
    2:begin
        LabeledEdit1.Text:='1.65';
        LabeledEdit2.Text:='1.33';
      end;
    3:begin
        LabeledEdit1.Text:='1';
        LabeledEdit2.Text:='2';
      end;
    4:begin
        LabeledEdit1.Text:='0.62';
        LabeledEdit2.Text:='2.15';
      end;
    5:begin
        LabeledEdit1.Text:='0.81';
        LabeledEdit2.Text:='2';
      end;
    end;
end;

procedure TFR_Form.Button3Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.Ro_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.Ro_Track_Number:=Select_Log.Selected_Track_Number;
      Label2.Caption:=MainForm.Charts[MainForm.Ro_Track_Number].Axes.Top.Title.Caption;
    end;
  Select_Log.Free;
end;

procedure TFR_Form.RadioButton2Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton1.Checked;
  Edit1.Color:=clBtnFace;
  Button3.Enabled:=RadioButton2.Checked;
  if MainForm.Ro_Track_Number<>-1 then
    begin
      Label2.Caption:=MainForm.Charts[MainForm.Rw_Track_Number].Axes.Top.Title.Caption;
    end;
end;

procedure TFR_Form.RadioButton1Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton1.Checked;
  Edit1.Color:=clWindow;
  Button3.Enabled:=RadioButton2.Checked;
  Label2.Caption:='NONE';
  Edit1.SetFocus;
end;

procedure TFR_Form.Button4Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.Rw_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.Rw_Track_Number:=Select_Log.Selected_Track_Number;
      Label4.Caption:=MainForm.Charts[MainForm.Rw_Track_Number].Axes.Top.Title.Caption;
    end;
  Select_Log.Free;
end;

procedure TFR_Form.RadioButton4Click(Sender: TObject);
begin
  Edit2.Enabled:=RadioButton3.Checked;
  Edit2.Color:=clBtnFace;
  Button4.Enabled:=RadioButton4.Checked;
  if MainForm.Rw_Track_Number<>-1 then
    begin
      Label4.Caption:=MainForm.Charts[MainForm.Rw_Track_Number].Axes.Top.Title.Caption;
    end;
end;

procedure TFR_Form.RadioButton3Click(Sender: TObject);
begin
  Edit2.Enabled:=RadioButton3.Checked;
  Edit2.Color:=clWindow;
  Button4.Enabled:=RadioButton4.Checked;
  Label4.Caption:='NONE';
  Edit2.SetFocus;
end;

procedure TFR_Form.Button5Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.PHI_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.PHI_Track_Number:=Select_Log.Selected_Track_Number;
      Label6.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Axes.Top.Title.Caption;
    end;
  Select_Log.Free;
end;

procedure TFR_Form.RadioButton6Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton5.Checked;
  Edit3.Color:=clBtnFace;
  Button5.Enabled:=RadioButton6.Checked;
  if MainForm.PHI_Track_Number<>-1 then
    begin
      Label6.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Axes.Top.Title.Caption;
    end;
end;

procedure TFR_Form.RadioButton5Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton5.Checked;
  Edit3.Color:=clWindow;
  Button5.Enabled:=RadioButton6.Checked;
  Label6.Caption:='NONE';
  Edit3.SetFocus;
end;

end.
