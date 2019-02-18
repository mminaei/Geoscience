unit TablePrintPage;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  GmTypes, GmClasses, GmCanvas, GmDbGridPrint, GmPageList,
  GmPreview, StdCtrls, GmPropertyComboBox, GmPageNavigator, GmThumbnails,
  ComCtrls,  ExtCtrls, VrLabel, VrControls, GmGridPrint,
  ESBPCSEdit, ESBPCSNumEdit, VrProgressBar, sButtonControl, sCustomButton;

type
  TTablePrint = class(TForm)
    GmPropertyComboBox1: TGmPropertyComboBox;
    GmDbGridPrint1: TGmDbGridPrint;
    GmPreview1: TGmPreview;
    Bevel1: TBevel;
    GmThumbnails1: TGmThumbnails;
    VrLabel1: TVrLabel;
    VrLabel2: TVrLabel;
    GmPropertyComboBox2: TGmPropertyComboBox;
    VrLabel3: TVrLabel;
    ComboBox1: TComboBox;
    VrLabel4: TVrLabel;
    VrLabel5: TVrLabel;
    VrLabel6: TVrLabel;
    Range2: TESBPosEdit;
    Range1: TESBPosEdit;
    Button3: TsButton;
    ProgressBar1: TVrProgressBar;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TsButton;
    Button2: TsButton;
    Button4: TsButton;
    GmPageNavigator2: TGmPageNavigator;
    sButton2: TsButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure GmPreview1NewPage(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TablePrint: TTablePrint;
  Table:String;
  PreviewKind:String;

implementation
uses CalculationPage;

{$R *.DFM}

procedure TTablePrint.Button1Click(Sender: TObject);
begin
GmPreview1.PrintRange(1,GmPreview1.NumPages);
end;

procedure TTablePrint.FormCreate(Sender: TObject);
begin
 CalculationForm.Table.AfterScroll:=nil;
 Button1.Enabled:=False;
 Button2.Enabled:=False;
 Button4.Enabled:=False;
 ComboBox1.ItemIndex:=0;
 GmPropertyComboBox1.ItemIndex:=0;
 GmPropertyComboBox1.ItemIndex:=1;
 RadioButton1.Checked:=True;
end;

procedure TTablePrint.Button2Click(Sender: TObject);
begin
GmPreview1.PrintCurrentPage;
end;

procedure TTablePrint.Button3Click(Sender: TObject);
var
RNumber:Integer;
PageNumber:Integer;
begin
 if Combobox1.Text<>'' then
  begin
   Button1.Enabled:=True;
   Button2.Enabled:=True;
   Button4.Enabled:=True;
   CalculationForm.Table.DisableControls;
   CalculationForm.ElasticTable.DisableControls;
   CalculationForm.Litholog.DisableControls;
   if ComboBox1.ItemIndex=0 then
     begin
       CalculationForm.Table.Open;
       GmDbGridPrint1.Grid:=CalculationForm.DBGrid1;
       GmDbGridPrint1.Preview:=GmPreview1;
       RNumber:=CalculationForm.Table.RecordCount;
       CalculationForm.Table.Last;
       CalculationForm.Table.First;
     end;
   if ComboBox1.ItemIndex=1 then
     begin
       CalculationForm.ElasticTable.Open;
       GmDbGridPrint1.Grid:=CalculationForm.DBGrid2;
       GmDbGridPrint1.Preview:=GmPreview1;
       RNumber:=CalculationForm.ElasticTable.RecordCount;
       CalculationForm.ElasticTable.Last;
       CalculationForm.ElasticTable.First;
     end;
   if ComboBox1.ItemIndex=2 then
     begin
       CalculationForm.LithoLog.Open;
       GmDbGridPrint1.Grid:=CalculationForm.DBGrid3;
       GmDbGridPrint1.Preview:=GmPreview1;
       RNumber:=CalculationForm.Litholog.RecordCount;
       CalculationForm.LithoLog.Last;
       CalculationForm.LithoLog.First;
     end;
   if RadioButton1.Checked then
     PageNumber:=Trunc(RNumber/22)
   else
     PageNumber:=Trunc(RNumber/35);
   ProgressBar1.MaxValue:=PageNumber+8;
   ProgressBar1.Visible:=True;
   ProgressBar1.Position:=0;
   ProgressBar1.Position:=ProgressBar1.Position+2;
   GmPreview1.BeginUpdate;
   GmPreview1.Clear;
   ProgressBar1.Position:=ProgressBar1.Position+1;
   GMPreview1.Header.CaptionLeft.Caption:=DateToStr(Date);
   ProgressBar1.Position:=ProgressBar1.Position+1;
   GMPreview1.Header.CaptionRight.Caption:=TimeToStr(Time);
   ProgressBar1.Position:=ProgressBar1.Position+1;
   if RadioButton2.Checked then
     GmPreview1.Orientation:=gmPortrait
   else
     GmPreview1.Orientation:=gmLandScape;
   ProgressBar1.Position:=ProgressBar1.Position+1;
   if RadioButton2.Checked then
     GmDbGridPrint1.GridToPage(10,20,0,gmMillimeters)
   else
     GmDbGridPrint1.GridToPage(10,20,0,gmMillimeters);
   ProgressBar1.Position:=ProgressBar1.Position+1;
   GmPreview1.EndUpdate;
   ProgressBar1.Position:=ProgressBar1.Position+1;
   if RadioButton2.Checked then
     GmThumbnails1.GridWidth:=5
   else
     GmThumbnails1.GridWidth:=4;
   CalculationForm.Table.EnableControls;
   CalculationForm.ElasticTable.EnableControls;
   CalculationForm.LithoLog.EnableControls;
   ProgressBar1.Visible:=False;
  end;

end;

procedure TTablePrint.GmPreview1NewPage(Sender: TObject);
begin
ProgressBar1.Position:=ProgressBar1.Position+1;
end;

procedure TTablePrint.Button4Click(Sender: TObject);
begin
 GmPreview1.PrintRange(Range1.AsInteger,Range2.AsInteger);
end;

procedure TTablePrint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 CalculationForm.Table.AfterScroll:=TableScroll;
end;

procedure TTablePrint.sButton2Click(Sender: TObject);
begin
Close;
end;

end.
