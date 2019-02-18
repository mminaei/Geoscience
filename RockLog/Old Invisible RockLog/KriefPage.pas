unit KriefPage;

interface

uses
  Graphics, Dialogs, VrLabel, Controls, StdCtrls, Classes, Forms, SysUtils;

type
  TKrief_Page = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ScrollBox2: TScrollBox;
    ScrollBox3: TScrollBox;
    Button1: TButton;
    Button2: TButton;
    ScrollBox1: TScrollBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label8: TLabel;
    ScrollBox4: TScrollBox;
    Label9: TLabel;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    Label10: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComboBox5Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Krief_Page: TKrief_Page;
  FileNames       :array of TVrLabel;
  RadioButtons1   :array of TRadioButton;
  RadioButtons2   :array of TRadioButton;
  RadioButtons3   :array of TRadioButton;
  RadioButtons4   :array of TRadioButton;
  ForFree         :TLabel;


implementation

uses Main_Form;

{$R *.dfm}

procedure TKrief_Page.FormCreate(Sender: TObject);
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
      FileNames[i].AutoSize:=True;
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
      FileNames[i].AutoSize:=True;
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
      FileNames[i].AutoSize:=True;
      FileNames[i].Style:=lsNone;
      FileNames[i].Parent:=ScrollBox3;
      for j:=0 to (MainForm.Number_of_Tracks[i]-1) do
        begin
          SetLength(RadioButtons3, Length(RadioButtons3)+1);
          RadioButtons3[k-i]:=TRadioButton.Create(ForFree);
          RadioButtons3[k-i].Top:=15*(k+1);
          RadioButtons3[k-i].Left:=15;
          RadioButtons3[k-i].Font.Color:=$00FF8000;
          RadioButtons3[k-i].Font.Name:='Tahoma';
          RadioButtons3[k-i].Font.Size:=8;
          RadioButtons3[k-i].Width:=150;
          RadioButtons3[k-i].Caption:=MainForm.CheckBox[k-i].Caption;
          RadioButtons3[k-i].Checked:=False;
          RadioButtons3[k-i].Tag:=k-i;
          RadioButtons3[k-i].Parent:=ScrollBox3;
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
      FileNames[i].AutoSize:=True;
      FileNames[i].Style:=lsNone;
      FileNames[i].Parent:=ScrollBox4;
      for j:=0 to (MainForm.Number_of_Tracks[i]-1) do
        begin
          SetLength(RadioButtons4, Length(RadioButtons4)+1);
          RadioButtons4[k-i]:=TRadioButton.Create(ForFree);
          RadioButtons4[k-i].Top:=15*(k+1);
          RadioButtons4[k-i].Left:=15;
          RadioButtons4[k-i].Font.Color:=$00FF8000;
          RadioButtons4[k-i].Font.Name:='Tahoma';
          RadioButtons4[k-i].Font.Size:=8;
          RadioButtons4[k-i].Width:=150;
          RadioButtons4[k-i].Caption:=MainForm.CheckBox[k-i].Caption;
          RadioButtons4[k-i].Checked:=False;
          RadioButtons4[k-i].Tag:=k-i;
          RadioButtons4[k-i].Parent:=ScrollBox4;
          k:=k+1;
        end;
      k:=k+1;
    end;
  with MainForm do
    begin
      DTP_Mineral_Unit:=UpperCase(ComboBox1.Text);
      DTP_Saturated_Unit:=UpperCase(ComboBox2.Text);
      DTP_Fluid_Unit:=UpperCase(ComboBox3.Text);
      DTS_Mineral_Unit:=UpperCase(ComboBox4.Text);
    end;
end;

procedure TKrief_Page.Button1Click(Sender: TObject);
var
i: Smallint;
begin
  with MainForm do
    begin
      for i:=0 to Length(RadioButtons1)-1 do
        begin
          if RadioButtons1[i].Checked then
            begin
              DTP_Mineral_Track_Number:=RadioButtons1[i].Tag;
            end;
        end;
      for i:=0 to Length(RadioButtons2)-1 do
        begin
          if RadioButtons2[i].Checked then
            begin
              DTP_Saturated_Track_Number:=RadioButtons2[i].Tag;
            end;
        end;
      for i:=0 to Length(RadioButtons3)-1 do
        begin
          if RadioButtons3[i].Checked then
            begin
              DTP_Fluid_Track_Number:=RadioButtons3[i].Tag;
            end;
        end;
      for i:=0 to Length(RadioButtons4)-1 do
        begin
          if RadioButtons3[i].Checked then
            begin
              DTS_Mineral_Track_Number:=RadioButtons4[i].Tag;
            end;
        end;
      Operation_Canceled:=False;
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
      if (not(Operation_Canceled))and(DTP_Mineral_Track_Number=-1) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for P-wave DT of the rock mineral.', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and((ComboBox1.Text<>'US/FT')and(ComboBox1.Text<>'US/M')) then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for P-wave DT of the rock mineral.', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and(DTP_Saturated_Track_Number=-1) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for P-wave DT of the saturated rock.', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and((ComboBox2.Text<>'US/FT')and(ComboBox2.Text<>'US/M')) then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for P-wave DT of the saturated rock.', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and(DTP_Fluid_Track_Number=-1) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for P-wave DT of the pore fluid.', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and((ComboBox3.Text<>'US/FT')and(ComboBox3.Text<>'US/M')) then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for P-wave DT of the pore fluid.', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and(DTS_Mineral_Track_Number=-1) then
        begin
          CanClose:=False;
          MessageDlg('Please select a track for S-wave DT of the rock mineral.', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and((ComboBox4.Text<>'US/FT')and(ComboBox4.Text<>'US/M')) then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for S-wave DT of the rock mineral.', mtWarning,[mbOk],0);
          Exit;
        end;
      if (not(Operation_Canceled))and((ComboBox5.Text<>'KM/S')and(ComboBox5.Text<>'FT/S')) then
        begin
          CanClose:=False;
          MessageDlg('Please select a valid measurment unit for S-wave velocity.', mtWarning,[mbOk],0);
          Exit;
        end;
    end;
  if CanClose then
    begin
      Finalize(FileNames);
      Finalize(RadioButtons1);
      Finalize(RadioButtons2);
      Finalize(RadioButtons3);
      ForFree.Free;
    end;
end;

procedure TKrief_Page.ComboBox5Change(Sender: TObject);
begin
  with MainForm do
    begin
      VS_Unit:=UpperCase(ComboBox5.Text);
    end;
end;

end.
