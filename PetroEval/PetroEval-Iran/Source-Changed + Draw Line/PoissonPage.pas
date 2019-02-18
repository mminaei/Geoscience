unit PoissonPage;

interface

uses
  Graphics, Dialogs, Controls, StdCtrls, Classes, Forms, SysUtils,
  ExtCtrls;

type
  TPoisson_Page = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    ComboBox2: TComboBox;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Button3: TButton;
    GroupBox6: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit2: TEdit;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Poisson_Page  : TPoisson_Page;

implementation

uses Main_Form, SelectLog;

{$R *.dfm}

procedure TPoisson_Page.Button1Click(Sender: TObject);
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
              MessageDlg('Please enter a valid number for p-wave velocity!', mtError, [mbOk], 0);
              Exit;
            end;
          VP_Track_Number:=-1;
        end;
      if Value_Is_Constant[2] then
        begin
          Val(Edit2.Text, Temp_Value, Error_Code);
          if Error_Code=0 then
            Constant_Value[2]:=Temp_Value
          else
            begin
              MessageDlg('Please enter a valid number for Poisson ratio!', mtError, [mbOk], 0);
              Exit;
            end;
          Poisson_Track_Number:=-1;
        end;
    end;
  Close;
end;

procedure TPoisson_Page.FormCreate(Sender: TObject);
begin
  with MainForm do
    begin
      Vp_Unit:=UpperCase(ComboBox1.Text);
      Vs_Unit:=UpperCase(ComboBox2.Text);
    end;
end;

procedure TPoisson_Page.Button2Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TPoisson_Page.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=True;
  with MainForm do
    begin
      if (not(Operation_Canceled))and(VP_Track_Number=-1)and(not(Value_Is_Constant[1])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for P-wave velocity.', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and((ComboBox1.Text<>'KM/S')and(ComboBox1.Text<>'FT/S')) then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for P-wave velocity!', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and(Poisson_Track_Number=-1)and(not(Value_Is_Constant[2])) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for Poisson!', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and((ComboBox2.Text<>'KM/S')and(ComboBox2.Text<>'FT/S')) then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for S-wave velocity.', mtWarning,[mbOk],0);
          Exit;
        end;
    end;
end;

procedure TPoisson_Page.ComboBox1Change(Sender: TObject);
begin
  with MainForm do
    begin
      Vp_Unit:=UpperCase(ComboBox1.Text);
    end;
end;

procedure TPoisson_Page.ComboBox2Change(Sender: TObject);
begin
  with MainForm do
    begin
      Vs_Unit:=UpperCase(ComboBox2.Text);
    end;
end;

procedure TPoisson_Page.Button3Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.VP_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.VP_Track_Number:=Select_Log.Selected_Track_Number;
      Label2.Caption:=MainForm.Charts[MainForm.VP_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure TPoisson_Page.RadioButton2Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton1.Checked;
  Edit1.Color:=clBtnFace;
  Button3.Enabled:=RadioButton2.Checked;
  if MainForm.VP_Track_Number<>-1 then
    begin
      Label2.Caption:=MainForm.Charts[MainForm.VP_Track_Number].Title.Text.Text;
    end;
end;

procedure TPoisson_Page.RadioButton1Click(Sender: TObject);
begin
  Edit1.Enabled:=RadioButton1.Checked;
  Edit1.Color:=clWindow;
  Button3.Enabled:=RadioButton2.Checked;
  Label2.Caption:='NONE';
  Edit1.SetFocus;
end;

procedure TPoisson_Page.Button4Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.Poisson_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.Poisson_Track_Number:=Select_Log.Selected_Track_Number;
      Label4.Caption:=MainForm.Charts[MainForm.Poisson_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure TPoisson_Page.RadioButton4Click(Sender: TObject);
begin
  Edit2.Enabled:=RadioButton3.Checked;
  Edit2.Color:=clBtnFace;
  Button4.Enabled:=RadioButton4.Checked;
  if MainForm.Poisson_Track_Number<>-1 then
    begin
      Label4.Caption:=MainForm.Charts[MainForm.Poisson_Track_Number].Title.Text.Text;
    end;
end;

procedure TPoisson_Page.RadioButton3Click(Sender: TObject);
begin
  Edit2.Enabled:=RadioButton3.Checked;
  Edit2.Color:=clWindow;
  Button4.Enabled:=RadioButton4.Checked;
  Label4.Caption:='NONE';
  Edit2.SetFocus;
end;

end.
