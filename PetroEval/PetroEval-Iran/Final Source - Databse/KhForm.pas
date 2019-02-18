unit KhForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TKh_Form = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    TabSheet4: TTabSheet;
    GroupBox2: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    GroupBox8: TGroupBox;
    Button1: TButton;
    CheckBox1: TCheckBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Edit1: TEdit;
    Button4: TButton;
    GroupBox13: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    Edit2: TEdit;
    Button5: TButton;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox14: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    Edit3: TEdit;
    Button6: TButton;
    GroupBox15: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    Edit4: TEdit;
    Button7: TButton;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    RadioButton12: TRadioButton;
    RadioButton13: TRadioButton;
    Edit5: TEdit;
    Button8: TButton;
    GroupBox5: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    RadioButton14: TRadioButton;
    RadioButton15: TRadioButton;
    Edit6: TEdit;
    Button9: TButton;
    GroupBox6: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    RadioButton16: TRadioButton;
    RadioButton17: TRadioButton;
    Edit7: TEdit;
    Button10: TButton;
    GroupBox7: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    RadioButton18: TRadioButton;
    RadioButton19: TRadioButton;
    Edit8: TEdit;
    Button11: TButton;
    GroupBox11: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    RadioButton20: TRadioButton;
    RadioButton21: TRadioButton;
    Edit9: TEdit;
    Button12: TButton;
    GroupBox12: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    RadioButton22: TRadioButton;
    RadioButton23: TRadioButton;
    Edit10: TEdit;
    Button13: TButton;
    LabeledEdit4: TEdit;
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure RadioButton11Click(Sender: TObject);
    procedure RadioButton10Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure RadioButton13Click(Sender: TObject);
    procedure RadioButton15Click(Sender: TObject);
    procedure RadioButton12Click(Sender: TObject);
    procedure RadioButton14Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure RadioButton17Click(Sender: TObject);
    procedure RadioButton16Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure RadioButton19Click(Sender: TObject);
    procedure RadioButton18Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure RadioButton21Click(Sender: TObject);
    procedure RadioButton20Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure RadioButton23Click(Sender: TObject);
    procedure RadioButton22Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Kh_Form: TKh_Form;

implementation

uses Main_Form, CrossPlot, SelectLog;

{$R *.dfm}

procedure TKh_Form.Button3Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TKh_Form.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    Height:=400
  else
    Height:=345;
  Button1.Visible:=CheckBox1.Checked;
  GroupBox11.Visible:=CheckBox1.Checked;
  GroupBox12.Visible:=CheckBox1.Checked;
end;

procedure TKh_Form.RadioButton1Click(Sender: TObject);
begin
  if RadioButton1.Checked then
    LabeledEdit1.EditLabel.Caption:='Grain Radius (cm)';
end;

procedure TKh_Form.RadioButton2Click(Sender: TObject);
begin
  if RadioButton2.Checked then
    LabeledEdit1.EditLabel.Caption:='Svp (1/cm)';
end;

procedure TKh_Form.RadioButton3Click(Sender: TObject);
begin
  if RadioButton3.Checked then
    LabeledEdit1.EditLabel.Caption:='Svgr (1/cm)';
end;

procedure TKh_Form.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Case PageControl1.TabIndex of
    0:begin
        CanClose:=True;
        with MainForm do
          begin
            if (not(Operation_Canceled))and(PHI_Track_Number=-1)and(not(Value_Is_Constant[1])) then
              begin
                CanClose:=False;
                MessageDlg('Please select a track for porosity!', mtWarning,[mbOk],0);
                Exit;
              end;
            if (not(Operation_Canceled))and(Tau_Track_Number=-1)and(not(Value_Is_Constant[2])) then
              begin
                CanClose:=False;
                MessageDlg('Please select a track for tortuosity!', mtWarning,[mbOk],0);
                Exit;
              end;
          end;
      end;
    1:begin
        CanClose:=True;
        with MainForm do
          begin
            if (not(Operation_Canceled))and(PHI_Track_Number=-1)and(not(Value_Is_Constant[1])) then
              begin
                CanClose:=False;
                MessageDlg('Please select a track for porosity!', mtWarning,[mbOk],0);
                Exit;
              end;
            if (not(Operation_Canceled))and(Svgr_Track_Number=-1)and(not(Value_Is_Constant[2])) then
              begin
                CanClose:=False;
                MessageDlg('Please select a track for Svgr!', mtWarning,[mbOk],0);
                Exit;
              end;
          end;
      end;
    2:begin
        CanClose:=True;
        with MainForm do
          begin
            if (not(Operation_Canceled))and(PHI_Track_Number=-1)and(not(Value_Is_Constant[1])) then
              begin
                CanClose:=False;
                MessageDlg('Please select a track for porosity!', mtWarning,[mbOk],0);
                Exit;
              end;
            if (not(Operation_Canceled))and(T2ML_Track_Number=-1)and(not(Value_Is_Constant[2])) then
              begin
                CanClose:=False;
                MessageDlg('Please select a track for log mean relaxation time!', mtWarning,[mbOk],0);
                Exit;
              end;
          end;
      end;
    3:begin
        CanClose:=True;
        with MainForm do
          begin
            if (not(Operation_Canceled))and(PHI_Track_Number=-1)and(not(Value_Is_Constant[1])) then
              begin
                CanClose:=False;
                MessageDlg('Please select a track for porosity!', mtWarning,[mbOk],0);
                Exit;
              end;
            if (not(Operation_Canceled))and(Swir_Track_Number=-1)and(not(Value_Is_Constant[2])) then
              begin
                CanClose:=False;
                MessageDlg('Please select a track for irreducible water saturation!', mtWarning,[mbOk],0);
                Exit;
              end;
          end;
      end;
  end;
  MainForm.K_Calculation_Method:=PageControl1.TabIndex;
end;

procedure TKh_Form.Button2Click(Sender: TObject);
var
Temp_Value : Real;
Error_Code: Integer;
begin
  Case PageControl1.TabIndex of
    0:begin
        with MainForm do
          begin
            Value_Is_Constant[1]:=RadioButton4.Checked;
            Value_Is_Constant[2]:=RadioButton6.Checked;
            if Value_Is_Constant[1] then
              begin
                Val(Edit1.Text, Temp_Value, Error_Code);
                if Error_Code=0 then
                  Constant_Value[1]:=Temp_Value
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
                    MessageDlg('Please enter a valid number for tortuosity!', mtError, [mbOk], 0);
                    Exit;
                  end;
                Tau_Track_Number:=-1;
              end;
            Val(LabeledEdit1.Text, Temp_Value, Error_Code);
            if (Error_Code<>0)or(Temp_Value<=0) then
              begin
                MessageDlg('Please enter a valid number for property value!', mtError, [mbOk], 0);
                Exit;
              end
            else
              begin
                if RadioButton1.Checked then
                  begin
                    Grain_Radius:=Temp_Value;
                    Koenzy_Method_No:=1;
                  end
                else if RadioButton2.Checked then
                  begin
                    Svp_Value:=Temp_Value;
                    Koenzy_Method_No:=2;
                  end
                else if RadioButton3.Checked then
                  begin
                    Svgr_Value:=Temp_Value;
                    Koenzy_Method_No:=3;
                  end;
              end;
            Val(LabeledEdit3.Text, Temp_Value, Error_Code);
            if Error_Code<>0 then
              begin
                MessageDlg('Please enter a valid number for pore shape factor!', mtError, [mbOk], 0);
                Exit;
              end
            else
              Pore_Shape_Factor:=Temp_Value;
            Operation_Canceled:=False;
          end;
        Close;
      end;
    1:begin
        with MainForm do
          begin
            Value_Is_Constant[1]:=RadioButton16.Checked;
            Value_Is_Constant[2]:=RadioButton18.Checked;
            if Value_Is_Constant[1] then
              begin
                Val(Edit7.Text, Temp_Value, Error_Code);
                if Error_Code=0 then
                  Constant_Value[1]:=Temp_Value
                else
                  begin
                    MessageDlg('Please enter a valid number for porosity!', mtError, [mbOk], 0);
                    Exit;
                  end;
                PHI_Track_Number:=-1;
              end;
            if Value_Is_Constant[2] then
              begin
                Val(Edit8.Text, Temp_Value, Error_Code);
                if Error_Code=0 then
                  Constant_Value[2]:=Temp_Value
                else
                  begin
                    MessageDlg('Please enter a valid number for Svgr!', mtError, [mbOk], 0);
                    Exit;
                  end;
                Svgr_Track_Number:=-1;
              end;
            Val(LabeledEdit4.Text, MainForm.J1_Value, Error_Code);
            if Error_Code <> 0 then
              begin
                MessageDlg('Please enter a valid number for J1 value.', mtError, [mbOk], 0);
                Exit;
              end;
            Operation_Canceled:=False;
          end;
        Close;
      end;
    2:begin
        with MainForm do
          begin
            Value_Is_Constant[1]:=RadioButton8.Checked;
            Value_Is_Constant[2]:=RadioButton10.Checked;
            if Value_Is_Constant[1] then
              begin
                Val(Edit3.Text, Temp_Value, Error_Code);
                if Error_Code=0 then
                  Constant_Value[1]:=Temp_Value
                else
                  begin
                    MessageDlg('Please enter a valid number for porosity!', mtError, [mbOk], 0);
                    Exit;
                  end;
                PHI_Track_Number:=-1;
              end;
            if Value_Is_Constant[2] then
              begin
                Val(Edit4.Text, Temp_Value, Error_Code);
                if Error_Code=0 then
                  Constant_Value[2]:=Temp_Value
                else
                  begin
                    MessageDlg('Please enter a valid number for log mean relaxation time!', mtError, [mbOk], 0);
                    Exit;
                  end;
                T2ML_Track_Number:=-1;
              end;
            Operation_Canceled:=False;
          end;
        Close;
      end;
    3:begin
        with MainForm do
          begin
            Value_Is_Constant[1]:=RadioButton12.Checked;
            Value_Is_Constant[2]:=RadioButton14.Checked;
            if Value_Is_Constant[1] then
              begin
                Val(Edit5.Text, Temp_Value, Error_Code);
                if Error_Code=0 then
                  Constant_Value[1]:=Temp_Value
                else
                  begin
                    MessageDlg('Please enter a valid number for porosity!', mtError, [mbOk], 0);
                    Exit;
                  end;
                PHI_Track_Number:=-1;
              end;
            if Value_Is_Constant[2] then
              begin
                Val(Edit6.Text, Temp_Value, Error_Code);
                if (Error_Code=0)and(Temp_Value<1)and(Temp_Value>=0) then
                  Constant_Value[2]:=Temp_Value
                else
                  begin
                    MessageDlg('Please enter a valid number for irreducible water saturation!', mtError, [mbOk], 0);
                    Exit;
                  end;
                Swir_Track_Number:=-1;
              end;
          end;
        Close;
      end;
  end;
end;

procedure TKh_Form.Button1Click(Sender: TObject);
begin
  with MainForm do
    begin
      if Sw_Track_Number<>-1 then
        XAxis_Track_Number:=Sw_Track_Number
      else
        begin
          MessageDlg('Please select a track for water saturation!', mtError, [mbOk], 0);
          Exit;
        end;
      if JF_Track_Number<>-1 then
        YAxis_Track_Number:=JF_Track_Number
      else
        begin
          MessageDlg('Please select a track for J-function!', mtError, [mbOk], 0);
          Exit;
        end;
      Is_CrossPlot_3D:=False;
    end;
  Cross_Plot:=TCross_Plot.Create(Self);
  Cross_Plot.Panel1.Visible:=False;
  Cross_Plot.Depth_Start:=MainForm.Charts[MainForm.XAxis_Track_Number].Series[0].MinYValue;
  Cross_Plot.Depth_Stop:=MainForm.Charts[MainForm.XAxis_Track_Number].Series[0].MaxYValue;
  Cross_Plot.Chart1.Axes.Left.Logarithmic:=True;
  Cross_Plot.Chart1.Axes.Bottom.Logarithmic:=True;
  Cross_Plot.Show;
  Cross_Plot.Button6Click(Self);
  LabeledEdit4.Text:= FloatToStr(Cross_Plot.b + Cross_Plot.m);
end;

procedure TKh_Form.PageControl1Change(Sender: TObject);
begin
  MainForm.PHI_Track_Number:=-1;
end;

procedure TKh_Form.Button4Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.PHI_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.PHI_Track_Number:=Select_Log.Selected_Track_Number;
      Label2.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Axes.Top.Title.Caption;
    end;
  Select_Log.Free;
end;

procedure TKh_Form.RadioButton5Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton4.Checked;
  Edit1.Color:=clBtnFace;
  Button4.Enabled:=RadioButton5.Checked;
  if MainForm.PHI_Track_Number<>-1 then
    begin
      Label2.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Axes.Top.Title.Caption;
    end;
end;

procedure TKh_Form.RadioButton4Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton4.Checked;
  Edit1.Color:=clWindow;
  Button4.Enabled:=RadioButton5.Checked;
  Label2.Caption:='NONE';
  Edit1.SetFocus;
end;

procedure TKh_Form.Button5Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.Tau_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.Tau_Track_Number:=Select_Log.Selected_Track_Number;
      Label4.Caption:=MainForm.Charts[MainForm.Tau_Track_Number].Axes.Top.Title.Caption;
    end;
  Select_Log.Free;
end;

procedure TKh_Form.RadioButton7Click(Sender: TObject);
begin
  Edit2.Enabled:=RadioButton6.Checked;
  Edit2.Color:=clBtnFace;
  Button5.Enabled:=RadioButton7.Checked;
  if MainForm.Tau_Track_Number<>-1 then
    begin
      Label4.Caption:=MainForm.Charts[MainForm.Tau_Track_Number].Axes.Top.Title.Caption;
    end;
end;

procedure TKh_Form.RadioButton6Click(Sender: TObject);
begin
  Edit2.Enabled:=RadioButton6.Checked;
  Edit2.Color:=clWindow;
  Button5.Enabled:=RadioButton7.Checked;
  Label4.Caption:='NONE';
  Edit2.SetFocus;
end;

procedure TKh_Form.Button6Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.PHI_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.PHI_Track_Number:=Select_Log.Selected_Track_Number;
      Label8.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Axes.Top.Title.Caption;
    end;
  Select_Log.Free;
end;

procedure TKh_Form.RadioButton9Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton8.Checked;
  Edit3.Color:=clBtnFace;
  Button6.Enabled:=RadioButton9.Checked;
  if MainForm.PHI_Track_Number<>-1 then
    begin
      Label8.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Axes.Top.Title.Caption;
    end;
end;

procedure TKh_Form.RadioButton8Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton8.Checked;
  Edit3.Color:=clWindow;
  Button6.Enabled:=RadioButton9.Checked;
  Label8.Caption:='NONE';
  Edit3.SetFocus;
end;

procedure TKh_Form.Button7Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.t2ML_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.T2ML_Track_Number:=Select_Log.Selected_Track_Number;
      Label10.Caption:=MainForm.Charts[MainForm.T2ML_Track_Number].Axes.Top.Title.Caption;
    end;
  Select_Log.Free;
end;

procedure TKh_Form.RadioButton11Click(Sender: TObject);
begin
  Edit4.Enabled:=RadioButton10.Checked;
  Edit4.Color:=clBtnFace;
  Button7.Enabled:=RadioButton11.Checked;
  if MainForm.T2ML_Track_Number<>-1 then
    begin
      Label10.Caption:=MainForm.Charts[MainForm.t2ML_Track_Number].Axes.Top.Title.Caption;
    end;
end;

procedure TKh_Form.RadioButton10Click(Sender: TObject);
begin
  Edit4.Enabled:=RadioButton10.Checked;
  Edit4.Color:=clWindow;
  Button7.Enabled:=RadioButton11.Checked;
  Label10.Caption:='NONE';
  Edit4.SetFocus;
end;

procedure TKh_Form.Button8Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.PHI_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.PHI_Track_Number:=Select_Log.Selected_Track_Number;
      Label12.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Axes.Top.Title.Caption;
    end;
  Select_Log.Free;
end;

procedure TKh_Form.Button9Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.Swir_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.Swir_Track_Number:=Select_Log.Selected_Track_Number;
      Label14.Caption:=MainForm.Charts[MainForm.Swir_Track_Number].Axes.Top.Title.Caption;
    end;
  Select_Log.Free;
end;

procedure TKh_Form.RadioButton13Click(Sender: TObject);
begin
  Edit5.Enabled:=RadioButton12.Checked;
  Edit5.Color:=clBtnFace;
  Button8.Enabled:=RadioButton13.Checked;
  if MainForm.PHI_Track_Number<>-1 then
    begin
      Label12.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Axes.Top.Title.Caption;
    end;

end;

procedure TKh_Form.RadioButton15Click(Sender: TObject);
begin
  Edit6.Enabled:=RadioButton14.Checked;
  Edit6.Color:=clBtnFace;
  Button9.Enabled:=RadioButton15.Checked;
  if MainForm.Swir_Track_Number<>-1 then
    begin
      Label14.Caption:=MainForm.Charts[MainForm.Swir_Track_Number].Axes.Top.Title.Caption;
    end;
end;

procedure TKh_Form.RadioButton12Click(Sender: TObject);
begin
  Edit5.Enabled:=RadioButton12.Checked;
  Edit5.Color:=clWindow;
  Button8.Enabled:=RadioButton13.Checked;
  Label12.Caption:='NONE';
  Edit5.SetFocus;
end;

procedure TKh_Form.RadioButton14Click(Sender: TObject);
begin
  Edit6.Enabled:=RadioButton14.Checked;
  Edit6.Color:=clWindow;
  Button9.Enabled:=RadioButton15.Checked;
  Label14.Caption:='NONE';
  Edit6.SetFocus;
end;

procedure TKh_Form.Button10Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.PHI_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.PHI_Track_Number:=Select_Log.Selected_Track_Number;
      Label16.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Axes.Top.Title.Caption;
    end;
  Select_Log.Free;
end;

procedure TKh_Form.RadioButton17Click(Sender: TObject);
begin
  Edit7.Enabled:=RadioButton16.Checked;
  Edit7.Color:=clBtnFace;
  Button10.Enabled:=RadioButton17.Checked;
  if MainForm.PHI_Track_Number<>-1 then
    begin
      Label16.Caption:=MainForm.Charts[MainForm.PHI_Track_Number].Axes.Top.Title.Caption;
    end;
end;

procedure TKh_Form.RadioButton16Click(Sender: TObject);
begin
  Edit7.Enabled:=RadioButton16.Checked;
  Edit7.Color:=clWindow;
  Button10.Enabled:=RadioButton17.Checked;
  Label16.Caption:='NONE';
  Edit7.SetFocus;
end;

procedure TKh_Form.Button11Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.Svgr_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.Svgr_Track_Number:=Select_Log.Selected_Track_Number;
      Label18.Caption:=MainForm.Charts[MainForm.Svgr_Track_Number].Axes.Top.Title.Caption;
    end;
  Select_Log.Free;
end;

procedure TKh_Form.RadioButton19Click(Sender: TObject);
begin
  Edit8.Enabled:=RadioButton18.Checked;
  Edit8.Color:=clBtnFace;
  Button11.Enabled:=RadioButton19.Checked;
  if MainForm.Svgr_Track_Number<>-1 then
    begin
      Label18.Caption:=MainForm.Charts[MainForm.Svgr_Track_Number].Axes.Top.Title.Caption;
    end;
end;

procedure TKh_Form.RadioButton18Click(Sender: TObject);
begin
  Edit8.Enabled:=RadioButton18.Checked;
  Edit8.Color:=clWindow;
  Button11.Enabled:=RadioButton19.Checked;
  Label18.Caption:='NONE';
  Edit8.SetFocus;
end;

procedure TKh_Form.Button12Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.JF_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.Svgr_Track_Number:=Select_Log.Selected_Track_Number;
      Label20.Caption:=MainForm.Charts[MainForm.JF_Track_Number].Axes.Top.Title.Caption;
    end;
  Select_Log.Free;
end;

procedure TKh_Form.RadioButton21Click(Sender: TObject);
begin
  Edit9.Enabled:=RadioButton20.Checked;
  Edit9.Color:=clBtnFace;
  Button12.Enabled:=RadioButton21.Checked;
  if MainForm.JF_Track_Number<>-1 then
    begin
      Label20.Caption:=MainForm.Charts[MainForm.JF_Track_Number].Axes.Top.Title.Caption;
    end;
end;

procedure TKh_Form.RadioButton20Click(Sender: TObject);
begin
  Edit9.Enabled:=RadioButton20.Checked;
  Edit9.Color:=clWindow;
  Button12.Enabled:=RadioButton21.Checked;
  Label20.Caption:='NONE';
  Edit9.SetFocus;
end;

procedure TKh_Form.Button13Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.Sw_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.Sw_Track_Number:=Select_Log.Selected_Track_Number;
      Label22.Caption:=MainForm.Charts[MainForm.Sw_Track_Number].Axes.Top.Title.Caption;
    end;
  Select_Log.Free;
end;

procedure TKh_Form.RadioButton23Click(Sender: TObject);
begin
  Edit10.Enabled:=RadioButton22.Checked;
  Edit10.Color:=clBtnFace;
  Button13.Enabled:=RadioButton23.Checked;
  if MainForm.Sw_Track_Number<>-1 then
    begin
      Label22.Caption:=MainForm.Charts[MainForm.Sw_Track_Number].Axes.Top.Title.Caption;
    end;
end;

procedure TKh_Form.RadioButton22Click(Sender: TObject);
begin
  Edit10.Enabled:=RadioButton22.Checked;
  Edit10.Color:=clWindow;
  Button13.Enabled:=RadioButton23.Checked;
  Label22.Caption:='NONE';
  Edit10.SetFocus;
end;

end.
