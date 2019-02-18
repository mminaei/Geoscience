unit CompositeLog;

interface

uses
  Classes, Graphics, Controls, Forms, VrLabel, StdCtrls, SysUtils, ExtCtrls;

type
  TComposite_Log = class(TForm)
    GroupBox1: TGroupBox;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Tracks_Number: array of Byte;
    { Public declarations }
  end;

var
  Composite_Log: TComposite_Log;
  FileNames     :array of TVrLabel;
  CheckBox1     :array of TCheckBox;
  ForFree       :TLabel;

implementation

uses Main_Form;

{$R *.dfm}

procedure TComposite_Log.FormCreate(Sender: TObject);
var
i,j,k,m: Smallint;
begin
  ForFree:=TLabel.Create(Self);
  k:=0;
  m:=0;
  for i:=0 to MainForm.Tree1.Roots.Count-1 do
    begin
      if UpperCase(MainForm.Tree1.Roots[i].SimpleText)='LITHOLOGY LOG' then Continue;
      if UpperCase(MainForm.Tree1.Roots[i].SimpleText)='COMPOSITE LOG' then Continue;
      SetLength(FileNames, Length(FileNames)+1);
      FileNames[m]:=TVrLabel.Create(ForFree);
      FileNames[m].Caption:=MainForm.Tree1.Roots[i].SimpleText;
      FileNames[m].AutoSize:=True;
      FileNames[m].Top:=15*k;
      FileNames[m].Left:=0;
      FileNames[m].Font.Style:=[fsBold];
      FileNames[m].Font.Size:=9;
      FileNames[m].Font.Name:='Tahoma';
      FileNames[m].Font.Color:=clGreen;
      FileNames[m].Transparent:=True;
      FileNames[m].Style:=lsNone;
      FileNames[m].Parent:=ScrollBox1;
      for j:=0 to (MainForm.Tree1.Roots[i].Childs.Count-1) do
        begin
          SetLength(CheckBox1, Length(CheckBox1)+1);
          CheckBox1[k-m]:=TCheckBox.Create(ForFree);
          CheckBox1[k-m].Top:=15*(k+1);
          CheckBox1[k-m].Left:=15;
          CheckBox1[k-m].Font.Color:=$00FF8000;
          CheckBox1[k-m].Font.Name:='Tahoma';
          CheckBox1[k-m].Font.Size:=8;
          CheckBox1[k-m].Width:=150;
          CheckBox1[k-m].Caption:=MainForm.Tree1.Roots[i].Childs[j].SimpleText;
          CheckBox1[k-m].Checked:=False;
          CheckBox1[k-m].Tag:=k-m;
          CheckBox1[k-m].Parent:=ScrollBox1;
          k:=k+1;
        end;
      k:=k+1;
      m:=m+1;
    end;
end;

procedure TComposite_Log.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Visible:=False;
  Finalize(FileNames);
  Finalize(CheckBox1);
  ForFree.Free;
end;

procedure TComposite_Log.Button2Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TComposite_Log.Button1Click(Sender: TObject);
var
i,j,n: Smallint;
begin
  n:=0;
  j:=0;
  for i:=0 to  Length(CheckBox1)-1 do
    begin
      if CheckBox1[i].Checked then
        begin
{          for k:=0 to MainForm.Tree1.Roots.Count-1 do
            begin
              for m:=0 to MainForm.Tree1.Roots[k].Childs.Count-1 do
                begin
                  TempStr:=MainForm.Tree1.Roots[k].Childs[m].SimpleText;
                  if CheckBox1[i].Caption=TempStr then
                    begin
                      n:=k;
                      Break;
                    end;
                end;
            end;
 }         SetLength(Tracks_Number, Length(Tracks_Number)+1);
          Tracks_Number[j]:=i+n;
          j:=j+1;
        end;
    end;
  if j=0 then
    MainForm.Operation_Canceled:=True
  else
    MainForm.Operation_Canceled:=False;
  Close;
end;

end.
