unit KriefPage;

interface

uses
  Graphics, Dialogs, Controls, StdCtrls, Classes, Forms, SysUtils, ExtCtrls;

type
  TKrief_Page = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    ComboBox5: TComboBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Button3: TButton;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    Edit4: TEdit;
    Button6: TButton;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Edit3: TEdit;
    Button5: TButton;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit2: TEdit;
    Button4: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComboBox5Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Krief_Page: TKrief_Page;

implementation

uses Main_Form, SelectLog;

{$R *.dfm}

procedure TKrief_Page.Button1Click(Sender: TObject);
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
      if Value_Is_Constant[1] then
        begin
          Val(Edit1.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            Constant_Value[1]:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for P-wave DT of mineral!', mtError, [mbOk], 0);
              Exit;
            end;
          DTP_Mineral_Track_Number:=-1;
        end;
      if Value_Is_Constant[2] then
        begin
          Val(Edit2.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            Constant_Value[2]:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for P-wave DT of saturated rock!', mtError, [mbOk], 0);
              Exit;
            end;
          DTP_Saturated_Track_Number:=-1;
        end;
      if Value_Is_Constant[3] then
        begin
          Val(Edit3.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            Constant_Value[3]:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for P-wave DT of pore fluid!', mtError, [mbOk], 0);
              Exit;
            end;
          DTP_Fluid_Track_Number:=-1;
        end;
      if Value_Is_Constant[4] then
        begin
          Val(Edit4.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            Constant_Value[4]:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for S-wave DT of mineral!', mtError, [mbOk], 0);
              Exit;
            end;
          DTS_Mineral_Track_Number:=-1;
        end;
    end;
  Close;
end;

procedure TKrief_Page.Button2Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TKrief_Page.ComboBox1Change(Sender: TObject);
begin
  with MainForm do
    begin
      DTP_Mineral_Unit:=UpperCase(ComboBox1.Text);
    end;
end;

procedure TKrief_Page.ComboBox2Change(Sender: TObject);
begin
  with MainForm do
    begin
      DTP_Saturated_Unit:=UpperCase(ComboBox2.Text);
    end;
end;

procedure TKrief_Page.ComboBox3Change(Sender: TObject);
begin
  with MainForm do
    begin
      DTP_Fluid_Unit:=UpperCase(ComboBox3.Text);
    end;
end;

procedure TKrief_Page.ComboBox4Change(Sender: TObject);
begin
  with MainForm do
    begin
      DTS_Mineral_Unit:=UpperCase(ComboBox4.Text);
    end;
end;

procedure TKrief_Page.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=True;
  with MainForm do
    begin
      if (not(Operation_Canceled))and(DTP_Mineral_Track_Number=-1)and(not(Value_Is_Constant[1])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for P-wave DT of mineral!', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and((ComboBox1.Text<>'US/FT')and(ComboBox1.Text<>'US/M')) then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for P-wave DT of the rock mineral!', mtWarning,[mbOk],0);
          Exit;
        end;

      if (not(Operation_Canceled))and(DTP_Saturated_Track_Number=-1)and(not(Value_Is_Constant[2])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for P-wave DT of saturated rock!', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and((ComboBox2.Text<>'US/FT')and(ComboBox2.Text<>'US/M')) then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for P-wave DT of the saturated rock!', mtWarning,[mbOk],0);
          Exit;
        end;

      if (not(Operation_Canceled))and(DTP_Fluid_Track_Number=-1)and(not(Value_Is_Constant[3])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for P-wave DT of pore fluid!', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and((ComboBox3.Text<>'US/FT')and(ComboBox3.Text<>'US/M')) then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for P-wave DT of the pore fluid!', mtWarning,[mbOk],0);
          Exit;
        end;

      if (not(Operation_Canceled))and(DTS_Mineral_Track_Number=-1)and(not(Value_Is_Constant[4])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for S-wave DT of mineral!', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and((ComboBox4.Text<>'US/FT')and(ComboBox4.Text<>'US/M')) then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for S-wave DT of the rock mineral!', mtWarning,[mbOk],0);
          Exit;
        end;

      if (not(Operation_Canceled))and((ComboBox5.Text<>'KM/S')and(ComboBox5.Text<>'FT/S')) then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for S-wave velocity!', mtWarning,[mbOk],0);
          Exit;
        end;
    end;
end;

procedure TKrief_Page.ComboBox5Change(Sender: TObject);
begin
  with MainForm do
    begin
      VS_Unit:=UpperCase(ComboBox5.Text);
    end;
end;

procedure TKrief_Page.Button3Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.DTP_Mineral_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.DTP_Mineral_Track_Number:=Select_Log.Selected_Track_Number;
      Label2.Caption:=MainForm.Charts[MainForm.DTP_Mineral_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure TKrief_Page.Button4Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.DTP_Saturated_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.DTP_Saturated_Track_Number:=Select_Log.Selected_Track_Number;
      Label4.Caption:=MainForm.Charts[MainForm.DTP_Saturated_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure TKrief_Page.Button5Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.DTP_Fluid_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.DTP_Fluid_Track_Number:=Select_Log.Selected_Track_Number;
      Label6.Caption:=MainForm.Charts[MainForm.DTP_Fluid_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure TKrief_Page.Button6Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.DTS_Mineral_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.DTS_Mineral_Track_Number:=Select_Log.Selected_Track_Number;
      Label8.Caption:=MainForm.Charts[MainForm.DTS_Mineral_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure TKrief_Page.RadioButton2Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton1.Checked;
  Edit1.Color:=clBtnFace;
  Button3.Enabled:=RadioButton2.Checked;
  if MainForm.DTP_Mineral_Track_Number<>-1 then
    begin
      Label2.Caption:=MainForm.Charts[MainForm.DTP_Mineral_Track_Number].Title.Text.Text;
    end;
  Button3.SetFocus;
end;

procedure TKrief_Page.RadioButton4Click(Sender: TObject);
begin
  Edit2.Enabled:=RadioButton3.Checked;
  Edit2.Color:=clBtnFace;
  Button4.Enabled:=RadioButton4.Checked;
  if MainForm.DTP_Saturated_Track_Number<>-1 then
    begin
      Label4.Caption:=MainForm.Charts[MainForm.DTP_Saturated_Track_Number].Title.Text.Text;
    end;
  Button4.SetFocus;
end;

procedure TKrief_Page.RadioButton6Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton5.Checked;
  Edit3.Color:=clBtnFace;
  Button5.Enabled:=RadioButton6.Checked;
  if MainForm.DTP_Fluid_Track_Number<>-1 then
    begin
      Label6.Caption:=MainForm.Charts[MainForm.DTP_Fluid_Track_Number].Title.Text.Text;
    end;
  Button5.SetFocus;
end;

procedure TKrief_Page.RadioButton8Click(Sender: TObject);
begin
  Edit4.Enabled:=RadioButton7.Checked;
  Edit4.Color:=clBtnFace;
  Button6.Enabled:=RadioButton8.Checked;
  if MainForm.DTS_Mineral_Track_Number<>-1 then
    begin
      Label8.Caption:=MainForm.Charts[MainForm.DTS_Mineral_Track_Number].Title.Text.Text;
    end;
  Button6.SetFocus;
end;

procedure TKrief_Page.RadioButton1Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton1.Checked;
  Edit1.Color:=clWindow;
  Button3.Enabled:=RadioButton2.Checked;
  Label2.Caption:='NONE';
  Edit1.SetFocus;
end;

procedure TKrief_Page.RadioButton3Click(Sender: TObject);
begin
  Edit2.Enabled:=RadioButton3.Checked;
  Edit2.Color:=clWindow;
  Button4.Enabled:=RadioButton4.Checked;
  Label4.Caption:='NONE';
  Edit2.SetFocus;
end;

procedure TKrief_Page.RadioButton5Click(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton5.Checked;
  Edit3.Color:=clWindow;
  Button5.Enabled:=RadioButton6.Checked;
  Label6.Caption:='NONE';
  Edit3.SetFocus;
end;

procedure TKrief_Page.RadioButton7Click(Sender: TObject);
begin
  Edit4.Enabled:=RadioButton7.Checked;
  Edit4.Color:=clWindow;
  Button6.Enabled:=RadioButton8.Checked;
  Label8.Caption:='NONE';
  Edit4.SetFocus;
end;

procedure TKrief_Page.FormCreate(Sender: TObject);
begin
  with MainForm do
    begin
      DTP_Mineral_Unit:=UpperCase(ComboBox1.Text);
      DTP_Saturated_Unit:=UpperCase(ComboBox2.Text);
      DTP_Fluid_Unit:=UpperCase(ComboBox3.Text);
      DTS_Mineral_Unit:=UpperCase(ComboBox4.Text);
      VS_Unit:=UpperCase(ComboBox5.Text);
    end;
end;

end.
