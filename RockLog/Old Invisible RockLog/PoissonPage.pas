unit PoissonPage;

interface

uses
  Graphics, Dialogs, VrLabel, Controls, StdCtrls, Classes, Forms, SysUtils;

type
  TPoisson_Page = class(TForm)
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ScrollBox2: TScrollBox;
    Label3: TLabel;
    ComboBox2: TComboBox;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Poisson_Page  : TPoisson_Page;
  FileNames     :array of TVrLabel;
  RadioButtons1 :array of TRadioButton;
  RadioButtons2 :array of TRadioButton;
  ForFree       :TLabel;

implementation

uses Main_Form;

{$R *.dfm}

procedure TPoisson_Page.Button1Click(Sender: TObject);
var
i: Smallint;
begin
  with MainForm do
    begin
      for i:=0 to Length(RadioButtons1)-1 do
        begin
          if RadioButtons1[i].Checked then
            begin
              Vp_Track_Number:=RadioButtons1[i].Tag;
            end;
        end;
      for i:=0 to Length(RadioButtons2)-1 do
        begin
          if RadioButtons2[i].Checked then
            begin
              Poisson_Track_Number:=RadioButtons2[i].Tag;
            end;
        end;
      Operation_Canceled:=False;
    end;
  Close;
end;

procedure TPoisson_Page.FormCreate(Sender: TObject);
var
i,j,k: Smallint;
begin
  ForFree:=TLabel.Create(Self);
  k:=0;
  for i:=0 to MainForm.Number_of_Headers-1 do
    begin
      SetLength(FileNames, Length(FileNames)+1);
      FileNames[i]:=TVrLabel.Create(ForFree);
      FileNames[i].Caption:=MainForm.Headers[i].Caption;
      FileNames[i].AutoSize:=True;
      FileNames[i].Top:=15*k;
      FileNames[i].Left:=0;
      FileNames[i].Font.Style:=[fsBold];
      FileNames[i].Font.Size:=9;
      FileNames[i].Font.Name:='Tahoma';
      FileNames[i].Font.Color:=clGreen;
      FileNames[i].Transparent:=True;
      FileNames[i].Style:=lsNone;
      FileNames[i].Parent:=ScrollBox1;
      for j:=0 to (MainForm.Number_of_Tracks[i]-1) do
        begin
          SetLength(RadioButtons1, Length(RadioButtons1)+1);
          RadioButtons1[k-i]:=TRadioButton.Create(ForFree);
          RadioButtons1[k-i].Top:=15*(k+1);
          RadioButtons1[k-i].Left:=15;
          RadioButtons1[k-i].Font.Color:=$00FF8000;
          RadioButtons1[k-i].Font.Name:='Tahoma';
          RadioButtons1[k-i].Font.Size:=8;
          RadioButtons1[k-i].Width:=150;
          RadioButtons1[k-i].Caption:=MainForm.CheckBox[k-i].Caption;
          RadioButtons1[k-i].Checked:=False;
          RadioButtons1[k-i].Tag:=k-i;
          RadioButtons1[k-i].Parent:=ScrollBox1;
          k:=k+1;
        end;
      k:=k+1;
    end;
  k:=0;
  for i:=0 to MainForm.Number_of_Headers-1 do
    begin
      SetLength(FileNames, Length(FileNames)+1);
      FileNames[i]:=TVrLabel.Create(ForFree);
      FileNames[i].Caption:=MainForm.Headers[i].Caption;
      FileNames[i].AutoSize:=True;
      FileNames[i].Top:=15*k;
      FileNames[i].Left:=0;
      FileNames[i].Font.Style:=[fsBold];
      FileNames[i].Font.Size:=9;
      FileNames[i].Font.Name:='Tahoma';
      FileNames[i].Font.Color:=clGreen;
      FileNames[i].Transparent:=True;
      FileNames[i].Style:=lsNone;
      FileNames[i].Parent:=ScrollBox2;
      for j:=0 to (MainForm.Number_of_Tracks[i]-1) do
        begin
          SetLength(RadioButtons2, Length(RadioButtons2)+1);
          RadioButtons2[k-i]:=TRadioButton.Create(ForFree);
          RadioButtons2[k-i].Top:=15*(k+1);
          RadioButtons2[k-i].Left:=15;
          RadioButtons2[k-i].Font.Color:=$00FF8000;
          RadioButtons2[k-i].Font.Name:='Tahoma';
          RadioButtons2[k-i].Font.Size:=8;
          RadioButtons2[k-i].Width:=150;
          RadioButtons2[k-i].Caption:=MainForm.CheckBox[k-i].Caption;
          RadioButtons2[k-i].Checked:=False;
          RadioButtons2[k-i].Tag:=k-i;
          RadioButtons2[k-i].Parent:=ScrollBox2;
          k:=k+1;
        end;
      k:=k+1;
    end;
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
      if (not(Operation_Canceled))and(Vp_Track_Number=-1) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for P-Wave velocity.', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and((ComboBox1.Text<>'KM/S')and(ComboBox1.Text<>'FT/S')) then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for DT of P-Wave.', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and(Poisson_Track_Number=-1) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for Poisson.', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and((ComboBox2.Text<>'KM/S')and(ComboBox2.Text<>'FT/S')) then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for S-Wave velocity.', mtWarning,[mbOk],0);
          Exit;
        end;
    end;
  if CanClose then
    begin
      Finalize(FileNames);
      Finalize(RadioButtons1);
      Finalize(RadioButtons2);
      ForFree.Free;
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

end.
