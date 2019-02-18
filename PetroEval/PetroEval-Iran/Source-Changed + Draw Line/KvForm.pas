unit KvForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TKv_Form = class(TForm)
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RadioGroup1: TRadioGroup;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    GroupBox2: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox8: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit2: TEdit;
    Button4: TButton;
    GroupBox9: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Button1: TButton;
    LabeledEdit1: TEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Edit3: TEdit;
    Button5: TButton;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    Edit4: TEdit;
    Button6: TButton;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    Edit5: TEdit;
    Button7: TButton;
    LabeledEdit2: TEdit;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    Edit6: TEdit;
    Button8: TButton;
    procedure Button3Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PageControl1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure RadioButton10Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure RadioButton12Click(Sender: TObject);
    procedure RadioButton11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Kv_Form: TKv_Form;

implementation

uses Main_Form, SelectLog;

{$R *.dfm}

procedure TKv_Form.Button3Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TKv_Form.RadioGroup1Click(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0:begin
        LabeledEdit1.Visible:=False;
      end;
    1:begin
        LabeledEdit1.Visible:=True;
      end;
  end;
end;

procedure TKv_Form.RadioGroup3Click(Sender: TObject);
begin
  Case RadioGroup3.ItemIndex of
    0:begin
        RadioGroup4.Enabled:=False;
        GroupBox5.Enabled:=False;
        GroupBox6.Enabled:=False;
        LabeledEdit2.Color:=clBtnFace;
        RadioButton11.Enabled:=False;
        RadioButton12.Enabled:=False;
        Button8.Enabled:=False;
        Label12.Enabled:=False;
        Label13.Enabled:=False;
      end;
    1:begin
        RadioGroup4.Enabled:=True;
        GroupBox5.Enabled:=False;
        GroupBox6.Enabled:=True;
        LabeledEdit2.Color:=clWindow;
        RadioButton11.Enabled:=False;
        RadioButton12.Enabled:=False;
        Button8.Enabled:=False;
        Label12.Enabled:=False;
        Label13.Enabled:=False;
      end;
    2:begin
        RadioGroup4.Enabled:=True;
        GroupBox5.Enabled:=True;
        GroupBox6.Enabled:=False;
        LabeledEdit2.Color:=clBtnFace;
        RadioButton11.Enabled:=True;
        RadioButton12.Enabled:=True;
        Button8.Enabled:=True;
        Label12.Enabled:=True;
        Label13.Enabled:=True;
      end;
  end;
end;

procedure TKv_Form.Button2Click(Sender: TObject);
var
Temp_Value: Real;
Error_Code: integer;
begin
  with MainForm do
    begin
      Kv_Sst_Content:=PageControl1.TabIndex;
      Case PageControl1.TabIndex of   //Case 1
        0:begin
            Value_Is_Constant[1]:=RadioButton1.Checked;
            Value_Is_Constant[2]:=RadioButton3.Checked;
            if Value_Is_Constant[1] then
              begin
                Val(Edit1.Text, Temp_Value, Error_Code);
                if Error_Code=0 then
                  Constant_Value[1]:=Temp_Value
                else
                  begin
                    MessageDlg('Please enter a valid number for effective porosity!', mtError, [mbOk], 0);
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
                    MessageDlg('Please enter a valid number for horizontal permeability!', mtError, [mbOk], 0);
                    Exit;
                  end;
                Kh_Track_Number:=-1;
              end;
            Kv_Illite_Content:=RadioGroup1.ItemIndex;
            if RadioGroup1.ItemIndex=1 then //Case 2
              begin
                Val(LabeledEdit1.Text, Temp_Value, Error_Code);
                if (Error_Code<>0)or(Temp_Value<=0) then
                  begin
                    MessageDlg('Please enter a valid number for mean grain diameter!', mtError, [mbOk], 0);
                    Exit;
                  end
                else
                  Mean_Grain_Diameter:=Temp_Value;
              end;
            Operation_Canceled:=False;
            Close;
          end;  //End Case 2
        1:begin
            Kv_Shaly_Method_No:=PageControl2.TabIndex;
            Case PageControl2.TabIndex of   //Case 3
              0:begin
                  Kv_Illite_Content:=RadioGroup2.ItemIndex;
                  //Case 4
                  Value_Is_Constant[1]:=RadioButton5.Checked;
                  if Value_Is_Constant[1] then
                    begin
                      Val(Edit3.Text, Temp_Value, Error_Code);
                      if Error_Code=0 then
                        Constant_Value[1]:=Temp_Value
                    else
                        begin
                          MessageDlg('Please enter a valid number for horizontal permeability!', mtError, [mbOk], 0);
                          Exit;
                        end;
                      Kh_Track_Number:=-1;
                    end;
                  Close;
                  //End Case 4
                end;
              1:begin
                  Kv_Calcultion_Method_No:=RadioGroup3.ItemIndex;
                  Case RadioGroup3.ItemIndex of  //Case 5
                    0:begin
                        Value_Is_Constant[1]:=RadioButton9.Checked;
                        if Value_Is_Constant[1] then
                          begin
                            Val(Edit5.Text, Temp_Value, Error_Code);
                            if Error_Code=0 then
                              Constant_Value[1]:=Temp_Value
                            else
                              begin
                                MessageDlg('Please enter a valid number for effective porosity!', mtError, [mbOk], 0);
                                Exit;
                                end;
                            PHI_Track_Number:=-1;
                          end;
                        Value_Is_Constant[2]:=RadioButton7.Checked;
                        if Value_Is_Constant[2] then
                          begin
                            Val(Edit4.Text, Temp_Value, Error_Code);
                            if Error_Code=0 then
                              Constant_Value[1]:=Temp_Value
                            else
                              begin
                                MessageDlg('Please enter a valid number for horizontal permeability!', mtError, [mbOk], 0);
                                Exit;
                                end;
                            Kh_Track_Number:=-1;
                          end;
                        Close;
                      end;
                    1:begin
                        Value_Is_Constant[1]:=RadioButton9.Checked;
                        if Value_Is_Constant[1] then
                          begin
                            Val(Edit5.Text, Temp_Value, Error_Code);
                            if Error_Code=0 then
                              Constant_Value[1]:=Temp_Value
                            else
                              begin
                                MessageDlg('Please enter a valid number for effective porosity!', mtError, [mbOk], 0);
                                Exit;
                                end;
                            PHI_Track_Number:=-1;
                          end;
                        Value_Is_Constant[2]:=RadioButton7.Checked;
                        if Value_Is_Constant[2] then
                          begin
                            Val(Edit4.Text, Temp_Value, Error_Code);
                            if Error_Code=0 then
                              Constant_Value[1]:=Temp_Value
                            else
                              begin
                                MessageDlg('Please enter a valid number for horizontal permeability!', mtError, [mbOk], 0);
                                Exit;
                                end;
                            Kh_Track_Number:=-1;
                          end;
                        Val(LabeledEdit2.Text, Temp_Value, Error_Code);
                        if (Error_Code<>0)or(Temp_Value<=0) then
                          begin
                            MessageDlg('Please enter a valid number for mean grain diameter!', mtError, [mbOk], 0);
                            Exit;
                          end
                        else
                          Mean_Grain_Diameter:=Temp_Value;
                        Kv_Illite_Content:=RadioGroup4.ItemIndex;
                        Close;
                      end;
                    2:begin
                        Value_Is_Constant[1]:=RadioButton9.Checked;
                        if Value_Is_Constant[1] then
                          begin
                            Val(Edit5.Text, Temp_Value, Error_Code);
                            if Error_Code=0 then
                              Constant_Value[1]:=Temp_Value
                            else
                              begin
                                MessageDlg('Please enter a valid number for effective porosity!', mtError, [mbOk], 0);
                                Exit;
                                end;
                            PHI_Track_Number:=-1;
                          end;
                        Value_Is_Constant[2]:=RadioButton7.Checked;
                        if Value_Is_Constant[2] then
                          begin
                            Val(Edit4.Text, Temp_Value, Error_Code);
                            if Error_Code=0 then
                              Constant_Value[1]:=Temp_Value
                            else
                              begin
                                MessageDlg('Please enter a valid number for horizontal permeability!', mtError, [mbOk], 0);
                                Exit;
                                end;
                            Kh_Track_Number:=-1;
                          end;
                        Value_Is_Constant[3]:=RadioButton11.Checked;
                        if Value_Is_Constant[3] then
                          begin
                            Val(Edit6.Text, Temp_Value, Error_Code);
                            if Error_Code=0 then
                              Constant_Value[3]:=Temp_Value
                            else
                              begin
                                MessageDlg('Please enter a valid number for shale volume!', mtError, [mbOk], 0);
                                Exit;
                                end;
                            Shale_Volume_Track_Number:=-1;
                          end;
                        Kv_Illite_Content:=RadioGroup4.ItemIndex;
                        Close;
                      end;
                  end;  //End Case 5
                end;
            end;  //End Case 3
          end;
      end; //End Case 1
  end; //End with
end;

procedure TKv_Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Case PageControl1.TabIndex of
    0:begin
        CanClose:=True;
        with MainForm do
          begin
            if (not(Operation_Canceled))and(PHI_Track_Number=-1)and(not(Value_Is_Constant[1])) then
              begin
                CanClose:=False;
                MessageDlg('Please select a track for effective porosity.', mtWarning,[mbOk],0);
                Exit;
              end;
            if (not(Operation_Canceled))and(Kh_Track_Number=-1)and(not(Value_Is_Constant[2])) then
              begin
                CanClose:=False;
                MessageDlg('Please select a track for horizontal permeability!', mtWarning,[mbOk],0);
                Exit;
              end;
          end;
      end;
    1:begin
        CanClose:=True;
        Case PageControl2.TabIndex of
        0:begin
            with MainForm do
              begin
                if (not(Operation_Canceled))and(Kh_Track_Number=-1)and(not(Value_Is_Constant[1])) then
                  begin
                    CanClose:=False;
                    MessageDlg('Please select a track for horizontal permeability!', mtWarning,[mbOk],0);
                    Exit;
                  end;
              end;
          end;
        1:begin
            with MainForm do
              begin
                if (not(Operation_Canceled))and(PHI_Track_Number=-1)and(not(Value_Is_Constant[1])) then
                  begin
                    CanClose:=False;
                    MessageDlg('Please select a track for effective porosity!', mtWarning,[mbOk],0);
                    Exit;
                  end;
                if (not(Operation_Canceled))and(Kh_Track_Number=-1)and(not(Value_Is_Constant[2])) then
                  begin
                    CanClose:=False;
                    MessageDlg('Please select a track for horizontal permeability!', mtWarning,[mbOk],0);
                    Exit;
                  end;
                if RadioGroup3.ItemIndex=2 then
                  begin
                    if (not(Operation_Canceled))and(Shale_Volume_Track_Number=-1)and(not(Value_Is_Constant[3])) then
                      begin
                        CanClose:=False;
                        MessageDlg('Please select a track for shale volume!', mtWarning,[mbOk],0);
                        Exit;
                      end;
                  end;
              end;
          end;
        end;
      end;
  end;
end;

procedure TKv_Form.PageControl1Change(Sender: TObject);
begin
  MainForm.Kh_Track_Number:=-1;
  MainForm.PHI_Track_Number:=-1;
end;

procedure TKv_Form.Button1Click(Sender: TObject);
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

procedure TKv_Form.Button4Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.Kh_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.Kh_Track_Number:=Select_Log.Selected_Track_Number;
      Label4.Caption:=MainForm.Charts[MainForm.Kh_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure TKv_Form.RadioButton2Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton1.Checked;
  Edit1.Color:=clBtnFace;
  Button3.Enabled:=RadioButton2.Checked;
  if MainForm.PHI_Track_Number<>-1 then
    begin
      Label2.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Title.Text.Text;
    end;
end;

procedure TKv_Form.RadioButton1Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton1.Checked;
  Edit1.Color:=clWindow;
  Button3.Enabled:=RadioButton2.Checked;
  Label2.Caption:='NONE';
  Edit1.SetFocus;
end;

procedure TKv_Form.RadioButton4Click(Sender: TObject);
begin
  Edit2.Enabled:=RadioButton3.Checked;
  Edit2.Color:=clBtnFace;
  Button4.Enabled:=RadioButton4.Checked;
  if MainForm.Kh_Track_Number<>-1 then
    begin
      Label4.Caption:=MainForm.Charts[MainForm.Kh_Track_Number].Title.Text.Text;
    end;
end;

procedure TKv_Form.RadioButton3Click(Sender: TObject);
begin
  Edit2.Enabled:=RadioButton3.Checked;
  Edit2.Color:=clWindow;
  Button4.Enabled:=RadioButton4.Checked;
  Label4.Caption:='NONE';
  Edit2.SetFocus;
end;

procedure TKv_Form.Button5Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.Kh_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.Kh_Track_Number:=Select_Log.Selected_Track_Number;
      Label7.Caption:=MainForm.Charts[MainForm.Kh_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure TKv_Form.RadioButton6Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton5.Checked;
  Edit3.Color:=clBtnFace;
  Button5.Enabled:=RadioButton6.Checked;
  if MainForm.Kh_Track_Number<>-1 then
    begin
      Label7.Caption:=MainForm.Charts[MainForm.Kh_Track_Number].Title.Text.Text;
    end;
end;

procedure TKv_Form.RadioButton5Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton5.Checked;
  Edit3.Color:=clWindow;
  Button5.Enabled:=RadioButton6.Checked;
  Label7.Caption:='NONE';
  Edit3.SetFocus;
end;

procedure TKv_Form.Button7Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.PHI_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.PHI_Track_Number:=Select_Log.Selected_Track_Number;
      Label11.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure TKv_Form.RadioButton10Click(Sender: TObject);
begin
  Edit5.Enabled:=RadioButton9.Checked;
  Edit5.Color:=clBtnFace;
  Button7.Enabled:=RadioButton10.Checked;
  if MainForm.PHI_Track_Number<>-1 then
    begin
      Label11.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Title.Text.Text;
    end;
end;

procedure TKv_Form.RadioButton9Click(Sender: TObject);
begin
  Edit5.Enabled:=RadioButton9.Checked;
  Edit5.Color:=clWindow;
  Button7.Enabled:=RadioButton10.Checked;
  Label11.Caption:='NONE';
  Edit5.SetFocus;
end;

procedure TKv_Form.Button6Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.Kh_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.Kh_Track_Number:=Select_Log.Selected_Track_Number;
      Label9.Caption:=MainForm.Charts[MainForm.Kh_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;

end;

procedure TKv_Form.RadioButton8Click(Sender: TObject);
begin
  Edit4.Enabled:=RadioButton7.Checked;
  Edit4.Color:=clBtnFace;
  Button6.Enabled:=RadioButton8.Checked;
  if MainForm.Kh_Track_Number<>-1 then
    begin
      Label9.Caption:=MainForm.Charts[MainForm.Kh_Track_Number].Title.Text.Text;
    end;
end;

procedure TKv_Form.RadioButton7Click(Sender: TObject);
begin
  Edit4.Enabled:=RadioButton7.Checked;
  Edit4.Color:=clWindow;
  Button6.Enabled:=RadioButton8.Checked;
  Label9.Caption:='NONE';
  Edit4.SetFocus;
end;

procedure TKv_Form.Button8Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.Shale_Volume_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.Shale_Volume_Track_Number:=Select_Log.Selected_Track_Number;
      Label13.Caption:=MainForm.Charts[MainForm.Shale_Volume_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure TKv_Form.RadioButton12Click(Sender: TObject);
begin
  Edit6.Enabled:=RadioButton11.Checked;
  Edit6.Color:=clBtnFace;
  Button8.Enabled:=RadioButton12.Checked;
  if MainForm.Shale_Volume_Track_Number<>-1 then
    begin
      Label13.Caption:=MainForm.Charts[MainForm.Shale_Volume_Track_Number].Title.Text.Text;
    end;
end;

procedure TKv_Form.RadioButton11Click(Sender: TObject);
begin
  Edit6.Enabled:=RadioButton11.Checked;
  Edit6.Color:=clWindow;
  Button8.Enabled:=RadioButton12.Checked;
  Label13.Caption:='NONE';
  Edit6.SetFocus;
end;

end.
