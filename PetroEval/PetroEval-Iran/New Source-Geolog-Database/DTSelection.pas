unit DTSelection;

interface

uses
  Graphics, Dialogs, Controls, StdCtrls, Classes, Forms, SysUtils, ExtCtrls;

type
  TDT_Selection = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    GroupBox5: TGroupBox;
    ComboBox3: TComboBox;
    Label6: TLabel;
    ComboBox4: TComboBox;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Button3: TButton;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label8: TLabel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit2: TEdit;
    Button4: TButton;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DT_Selection  : TDT_Selection;

implementation

uses Main_Form, SelectLog;

{$R *.dfm}

procedure TDT_Selection.Button1Click(Sender: TObject);
var
Temp_Value: Extended;
Error_Code:Integer;
begin
  with MainForm do
    begin
      Operation_Canceled:=False;
      Value_Is_Constant[1]:=RadioButton1.Checked;
      Value_Is_Constant[2]:=RadioButton3.Checked;
      if Value_Is_Constant[1] then
        begin
          Val(Edit1.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            Constant_Value[1]:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for DT of P-Wave!', mtError, [mbOk], 0);
              Exit;
            end;
          DTP_Track_Number:=-1;
        end;
      if Value_Is_Constant[2] then
        begin
          Val(Edit2.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            Constant_Value[2]:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for DT of S-Wave!', mtError, [mbOk], 0);
              Exit;
            end;
          DTS_Track_Number:=-1;
        end;
    end;
  Close;
end;

procedure TDT_Selection.FormCreate(Sender: TObject);
begin
  with MainForm do
    begin
      DTS_Selected:=CheckBox1.Checked;
      DTP_Unit:=UpperCase(ComboBox1.Text);
      DTS_Unit:=UpperCase(ComboBox2.Text);
      VP_Unit:=UpperCase(ComboBox3.Text);
      VS_Unit:=UpperCase(ComboBox4.Text);
    end;
end;

procedure TDT_Selection.Button2Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TDT_Selection.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=True;
  with MainForm do
    begin
      if Operation_Canceled then
        begin
          CanClose:=True;
          Exit;
        end;
      if (not(Operation_Canceled))and(DTP_Track_Number=-1)and(not(Value_Is_Constant[1])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for DT of P-wave!', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and((ComboBox1.Text<>'US/FT')and(ComboBox1.Text<>'US/M')) then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for DT of P-wave!', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and(DTS_Track_Number=-1)and(not(Value_Is_Constant[1]))and(not(DTS_Selected))and(not(CheckBox1.Checked)) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for DT of S-wave!', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and(not(DTS_Selected)) then
        begin
          if MessageDlg('Are you sure there is no DT of S-wave log?', mtWarning,[mbYes,mbNo],0)=mrYes then
            begin
              CanClose:=True;
            end
          else
            begin
              CanClose:=False;
              Exit;
            end;
        end;
      if (not(Operation_Canceled))and(DTS_Selected)and(ComboBox2.Text<>'US/FT')and(ComboBox2.Text<>'US/M') then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for DT of S-wave!', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and(CanClose)and(ComboBox3.Text<>'FT/S')and(ComboBox3.Text<>'KM/S') then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for Vp!', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and(CanClose)and(ComboBox4.Text<>'FT/S')and(ComboBox4.Text<>'KM/S') then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for Vs!', mtWarning,[mbOk],0);
          Exit;
        end;
    end;
end;

procedure TDT_Selection.ComboBox1Change(Sender: TObject);
begin
  with MainForm do
    begin
      DTP_Unit:=UpperCase(ComboBox1.Text);
    end;
end;

procedure TDT_Selection.ComboBox2Change(Sender: TObject);
begin
  with MainForm do
    begin
      DTS_Unit:=UpperCase(ComboBox2.Text);
    end;
end;

procedure TDT_Selection.ComboBox3Change(Sender: TObject);
begin
  with MainForm do
    begin
      VP_Unit:=UpperCase(ComboBox3.Text);
    end;
end;

procedure TDT_Selection.ComboBox4Change(Sender: TObject);
begin
  with MainForm do
    begin
      VS_Unit:=UpperCase(ComboBox4.Text);
    end;
end;

procedure TDT_Selection.Button3Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.DTP_Track_Number:=Select_Log.Selected_Track_Number;
      Label3.Caption:=MainForm.Charts[MainForm.DTP_Track_Number].Axes.Top.Title.Caption;
    end;
  Select_Log.Free;
end;

procedure TDT_Selection.Button4Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.DTS_Track_Number:=Select_Log.Selected_Track_Number;
      MainForm.DTS_Selected:=True;
      Label8.Caption:=MainForm.Charts[MainForm.DTS_Track_Number].Axes.Top.Title.Caption;
    end;
  Select_Log.Free;
end;

procedure TDT_Selection.RadioButton2Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton1.Checked;
  Edit1.Color:=clBtnFace;
  Button3.Enabled:=RadioButton2.Checked;
  if MainForm.DTP_Track_Number<>-1 then
    begin
      Label3.Caption:=MainForm.Charts[MainForm.DTP_Track_Number].Axes.Top.Title.Caption;
    end;
end;

procedure TDT_Selection.RadioButton1Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton1.Checked;
  Edit1.Color:=clWindow;
  Button3.Enabled:=RadioButton2.Checked;
  Label3.Caption:='NONE';
  Edit1.SetFocus;
end;

procedure TDT_Selection.RadioButton4Click(Sender: TObject);
begin
  Edit2.Enabled:=RadioButton3.Checked;
  Edit2.Color:=clBtnFace;
  Button4.Enabled:=RadioButton4.Checked;
  if MainForm.DTS_Track_Number<>-1 then
    begin
      Label8.Caption:=MainForm.Charts[MainForm.DTS_Track_Number].Axes.Top.Title.Caption;
    end;
end;

procedure TDT_Selection.RadioButton3Click(Sender: TObject);
begin
  Edit2.Enabled:=RadioButton3.Checked;
  Edit2.Color:=clWindow;
  Button4.Enabled:=RadioButton4.Checked;
  Label8.Caption:='NONE';
  Edit2.SetFocus;
end;

procedure TDT_Selection.CheckBox1Click(Sender: TObject);
begin
  RadioButton4.Enabled:=not CheckBox1.Checked;
  Button4.Enabled:=not CheckBox1.Checked;
  RadioButton3.Enabled:=not CheckBox1.Checked;
  Edit2.Enabled:=not CheckBox1.Checked;
  Label4.Enabled:=not CheckBox1.Checked;
  Label8.Enabled:=not CheckBox1.Checked;
  MainForm.DTS_Selected:=not CheckBox1.Checked;
end;

end.
