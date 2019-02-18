unit CrossPlotTracks;

interface

uses
  Graphics, Forms, Dialogs, VrLabel, StdCtrls, Controls, Classes;

type
  TCross_Plot_Tracks = class(TForm)
    Label4: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    ScrollBox2: TScrollBox;
    ScrollBox1: TScrollBox;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cross_Plot_Tracks   :TCross_Plot_Tracks;
  FileNames     :array of TVrLabel;
  RadioButtons1 :array of TRadioButton;
  RadioButtons2 :array of TRadioButton;
  ForFree :TLabel;

implementation

uses Main_Form;

{$R *.dfm}

procedure TCross_Plot_Tracks.FormCreate(Sender: TObject);
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
end;

procedure TCross_Plot_Tracks.Button1Click(Sender: TObject);
var
i: Smallint;
begin
  with MainForm do
    begin
      for i:=0 to Length(RadioButtons1)-1 do
        begin
          if RadioButtons1[i].Checked then
            begin
              XAxis_Track_Number:=RadioButtons1[i].Tag;
            end;
        end;
      for i:=0 to Length(RadioButtons2)-1 do
        begin
          if RadioButtons2[i].Checked then
            begin
              YAxis_Track_Number:=RadioButtons2[i].Tag;
            end;
        end;
      Operation_Canceled:=False;
    end;
  Close;
end;

procedure TCross_Plot_Tracks.Button2Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TCross_Plot_Tracks.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Finalize(FileNames);
  Finalize(RadioButtons1);
  Finalize(RadioButtons2);
  ForFree.Free;
end;

end.
