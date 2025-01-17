unit SelectLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TSelect_Log = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    ScrollBox1: TScrollBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Selected_Track_Number: Smallint;
    { Public declarations }
  end;

var
  Select_Log: TSelect_Log;
  FileNames     :array of TLabel;
  RadioButtons1 :array of TRadioButton;
  ForFree       :TLabel;

implementation

uses Main_Form;

{$R *.dfm}

procedure TSelect_Log.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=True;
  with MainForm do
    begin
      if (not(Operation_Canceled))and(Selected_Track_Number=-1) then
        begin
          CanClose:=False;
          MessageDlg('Please select a log to continue!', mtError,[mbOk],0);
          Exit;
        end;
    end;
  if CanClose then
    begin
      Visible:=False;
      Finalize(FileNames);
      Finalize(RadioButtons1);
      ForFree.Free;
    end;
end;

procedure TSelect_Log.Button1Click(Sender: TObject);
var
i: Smallint;
begin
  with MainForm do
    begin
      for i:=0 to Length(RadioButtons1)-1 do
        begin
          if RadioButtons1[i].Checked then
            begin
              Selected_Track_Number:=RadioButtons1[i].Tag;
            end;
        end;
      Operation_Canceled:=False;
    end;
  Close;
end;

procedure TSelect_Log.Button2Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TSelect_Log.FormCreate(Sender: TObject);
var
i,j,k,m: Smallint;
begin
  Selected_Track_Number:=-1;
  ForFree:=TLabel.Create(Self);
  k:=0;
  m:=0;
  for i:=0 to MainForm.Tree1.Roots.Count-1 do
    begin
      if UpperCase(MainForm.Tree1.Roots[i].SimpleText)='LITHOLOGY LOG' then Continue;
      if UpperCase(MainForm.Tree1.Roots[i].SimpleText)='COMPOSITE LOG' then Continue;
      SetLength(FileNames, Length(FileNames)+1);
      FileNames[m]:=TLabel.Create(ForFree);
      FileNames[m].Caption:=MainForm.Tree1.Roots[i].SimpleText;
      FileNames[m].AutoSize:=True;
      FileNames[m].Top:=15*k;
      FileNames[m].Left:=0;
      FileNames[m].Font.Style:=[fsBold];
      FileNames[m].Font.Size:=9;
      FileNames[m].Font.Name:='Tahoma';
      FileNames[m].Font.Color:=clGreen;
      FileNames[m].Transparent:=True;
      FileNames[m].Parent:=ScrollBox1;
      for j:=0 to (MainForm.Tree1.Roots[i].Childs.Count-1) do
        begin
          SetLength(RadioButtons1, Length(RadioButtons1)+1);
          RadioButtons1[k-m]:=TRadioButton.Create(ForFree);
          RadioButtons1[k-m].Top:=15*(k+1);
          RadioButtons1[k-m].Left:=15;
          RadioButtons1[k-m].Font.Color:=$00FF8000;
          RadioButtons1[k-m].Font.Name:='Tahoma';
          RadioButtons1[k-m].Font.Size:=8;
          RadioButtons1[k-m].Width:=150;
          RadioButtons1[k-m].Caption:=MainForm.Tree1.Roots[i].Childs[j].SimpleText;
          RadioButtons1[k-m].Checked:=False;
          RadioButtons1[k-m].Tag:=k-m;
          RadioButtons1[k-m].OnDblClick:=Button1Click;
          RadioButtons1[k-m].Parent:=ScrollBox1;
          k:=k+1;
        end;
      k:=k+1;
      m:=m+1;
    end;
end;

end.
