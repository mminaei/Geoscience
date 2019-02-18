unit LapseChartPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ExtCtrls, TeeProcs, TeePreviewPanel, Chart,
  TeeStore;

type
  TLapsePrint = class(TForm)
    TeePreviewPanel1: TTeePreviewPanel;
    SaveDialog1: TSaveDialog;
    PrintDialog1: TPrintDialog;
    ComboBox1: TComboBox;
    CheckListBox1: TCheckListBox;
    Label1: TLabel;
    Label2: TLabel;
    sButton3: TButton;
    sButton1: TButton;
    sButton2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure CheckListBox1ClickCheck(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sButton2Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LapsePrint: TLapsePrint;
  Tempchart:array [1..3]of TChart;

implementation

uses TLapsePage;

{$R *.dfm}

procedure TLapsePrint.FormCreate(Sender: TObject);
begin
  ComboBox1.ItemIndex:=1;
  With TLapse do
    begin
      SaveChartToFile(TCustomChart(Chart1),'tempchart1',True);
      SaveChartToFile(TCustomChart(Chart2),'tempchart2',True);
      SaveChartToFile(TCustomChart(Chart3),'tempchart3',True);
      tempchart[1]:=TChart.Create(Self);
      LoadChartFromFile(TCustomChart(tempchart[1]),'tempchart1');
      tempchart[2]:=TChart.Create(Self);
      LoadChartFromFile(TCustomChart(tempchart[2]),'tempchart2');
      tempchart[3]:=TChart.Create(Self);
      LoadChartFromFile(TCustomChart(tempchart[3]),'tempchart3');
    end;
  CheckListBox1.Items.Add('First Log');
  CheckListBox1.Items.Add('Second Log');
  CheckListBox1.Items.Add('Difference Log');
  TeePreviewPanel1.Canvas.TextOut3D(10,10,10,'P.U.T RockImg');
end;

procedure TLapsePrint.CheckListBox1ClickCheck(Sender: TObject);
var
i:integer;
begin
TeePreviewPanel1.Panels.clear;
    for i:=2 downto 0 do
      begin
        if CheckListBox1.Checked[i] then
          begin
            TeePreviewPanel1.Panels.Add(tempchart[i+1]);
          end;
      end;
TeePreviewPanel1.Repaint;
end;

procedure TLapsePrint.FormClose(Sender: TObject; var Action: TCloseAction);
var
i:integer;
begin
for i:=3 downto 1 do
  begin
    if FileExists('tempchart'+IntToStr(i)+'.tee') then
      begin
        DeleteFile('tempchart'+IntToStr(i)+'.tee');
        tempchart[i].Free;
      end;
  end;
end;

procedure TLapsePrint.sButton2Click(Sender: TObject);
begin
Close;
end;

procedure TLapsePrint.sButton3Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    TeePreviewPanel1.SaveToMetafileEnh(SaveDialog1.FileName);
end;

procedure TLapsePrint.sButton1Click(Sender: TObject);
begin
if PrintDialog1.Execute then
  TeePreviewPanel1.Print;
end;

end.


