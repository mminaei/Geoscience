unit ElasticCorrelationP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, DBChart, Series,
  VrControls, VrLabel,TeeStore, Menus, TeExport, TeeEdit, sButtonControl,
  sCustomButton, Math, TeeTools, StdCtrls, ESBPCSEdit, ESBPCSNumEdit;

type
  TElasticCorrelationPage = class(TForm)
    DBChart1: TDBChart;
    Series1: THorizLineSeries;
    Series2: THorizLineSeries;
    DBChart2: TDBChart;
    HorizLineSeries1: THorizLineSeries;
    HorizLineSeries2: THorizLineSeries;
    DBChart3: TDBChart;
    HorizLineSeries3: THorizLineSeries;
    HorizLineSeries4: THorizLineSeries;
    DBChart5: TDBChart;
    Series3: THorizLineSeries;
    Series4: THorizLineSeries;
    PopupMenu1: TPopupMenu;
    Print1: TMenuItem;
    Export1: TMenuItem;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    PopupMenu5: TPopupMenu;
    Print2: TMenuItem;
    Export2: TMenuItem;
    Print3: TMenuItem;
    Export3: TMenuItem;
    Print5: TMenuItem;
    Export5: TMenuItem;
    sButton1: TsButton;
    ChartTool1: TMarksTipTool;
    ChartTool2: TMarksTipTool;
    ChartTool3: TMarksTipTool;
    ChartTool4: TMarksTipTool;
    SetMinMax1: TMenuItem;
    SetMinMax2: TMenuItem;
    SetMinMax3: TMenuItem;
    SetMinMax5: TMenuItem;
    ChangeColor1: TMenuItem;
    ChangeColor2: TMenuItem;
    ChangeColor3: TMenuItem;
    ChangeColor5: TMenuItem;
    DBChart4: TDBChart;
    HorizLineSeries5: THorizLineSeries;
    HorizLineSeries6: THorizLineSeries;
    MarksTipTool1: TMarksTipTool;
    PopupMenu4: TPopupMenu;
    Print4: TMenuItem;
    Export4: TMenuItem;
    SetMinMax4: TMenuItem;
    ChangeColor4: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    ESBPosEdit1: TESBPosEdit;
    Button6: TButton;
    procedure FormShow(Sender: TObject);
    procedure DBChart1Zoom(Sender: TObject);
    procedure DBChart2Zoom(Sender: TObject);
    procedure DBChart3Zoom(Sender: TObject);
    procedure DBChart5Zoom(Sender: TObject);
    procedure Zooming(Sender: TDBChart);
    procedure Print1Click(Sender: TObject);
    procedure Export1Click(Sender: TObject);
    procedure Print2Click(Sender: TObject);
    procedure Export2Click(Sender: TObject);
    procedure Print3Click(Sender: TObject);
    procedure Print5Click(Sender: TObject);
    procedure Export5Click(Sender: TObject);
    procedure Export3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure TopAxisDrawLabel(Sender:TChartAxis; var X,Y,Z:Integer;
                                  var Text:String; var DrawLabel:Boolean);
    procedure SetMinMax1Click(Sender: TObject);
    procedure SetMinMax2Click(Sender: TObject);
    procedure SetMinMax3Click(Sender: TObject);
    procedure SetMinMax5Click(Sender: TObject);
    procedure ChangeColor1Click(Sender: TObject);
    procedure ChangeColor2Click(Sender: TObject);
    procedure ChangeColor3Click(Sender: TObject);
    procedure ChangeColor5Click(Sender: TObject);
    procedure DBChart4Zoom(Sender: TObject);
    procedure Print4Click(Sender: TObject);
    procedure Export4Click(Sender: TObject);
    procedure ChangeColor4Click(Sender: TObject);
    procedure SetMinMax4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    GRField,RhoField:String;
    ChartMin1,ChartMax1,ChartMin2,ChartMax2: Real;
    Canceled:Boolean;
    { Public declarations }
  end;

var
  ElasticCorrelationPage: TElasticCorrelationPage;
  XMIN,XMAX:Real;
  Round_Points:integer;
  Max_Min_Difference:Real;

implementation
uses CalculationPage, DB, ZoomedChart, DBTables, SetMinMaxCom,
  ElasticChangeColorRange, PagingPage, Types;

{$R *.dfm}

procedure TElasticCorrelationPage.FormShow(Sender: TObject);
begin
CalculationForm.ElasticTable.DisableControls;
CalculationForm.Table.DisableControls;
CalculationForm.Table.AfterScroll:=nil;
try
DBChart5.Series[0].XValues.ValueSource:=GRField;
DBChart5.Series[1].XValues.ValueSource:=RhoField;
DBChart5.Series[0].YValues.ValueSource:=CalculationForm.Table.Fields[1].FieldName;
DBChart5.Series[1].YValues.ValueSource:=CalculationForm.Table.Fields[1].FieldName;
DBChart5.Series[0].DataSource:=CalculationForm.Table;
DBChart5.Series[1].DataSource:=CalculationForm.Table;
DBChart5.Series[0].CheckDataSource;
DBChart5.Series[1].CheckDataSource;

DBChart5.TopAxis.Title.Caption:=CalculationForm.Table.FieldByName(GRField).DisplayLabel;
DBChart5.BottomAxis.Title.Caption:=CalculationForm.Table.FieldByName(RhoField).DisplayLabel;

DBChart4.BottomAxis.Title.Caption:=CalculationForm.ElasticTable.Fields[15].DisplayLabel;

if DBChart1.Series[0].MinXValue<>0 then
  begin
    SetRoundMode(rmDown);
    Round_Points:=Round(Log10(ABS(DBChart1.Series[0].MinXValue)));
    SetRoundMode(rmNearest);
    XMIN:=RoundTo(DBChart1.Series[0].MinXValue-Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMIN:=0;
if DBChart1.Series[0].MaxXValue<>0 then
  begin
    SetRoundMode(rmUp);
    Round_Points:=Round(Log10(ABS(DBChart1.Series[0].MaxXValue)));
    SetRoundMode(rmNearest);
    XMAX:=RoundTo(DBChart1.Series[0].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMAX:=0;
DBChart1.TopAxis.SetMinMax(XMIN,XMAX);
DBChart1.TopAxis.MaximumOffset:=5;
DBChart1.TopAxis.MinimumOffset:=5;
DBChart1.Axes.Top.Items.Add(XMIN);
DBChart1.Axes.Top.Items.Add(XMAX);
DBChart1.Axes.Top.Items[0].Value:=XMIN;
DBChart1.Axes.Top.Items[DBChart1.Axes.Top.Items.Count-1].Value:=XMAX;
if DBChart1.Series[1].MinXValue<>0 then
  begin
    SetRoundMode(rmDown);
    Round_Points:=Round(Log10(ABS(DBChart1.Series[1].MinXValue)));
    SetRoundMode(rmNearest);
    XMIN:=RoundTo(DBChart1.Series[1].MinXValue-Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMIN:=0;
if DBChart1.Series[1].MaxXValue<>0 then
  begin
    SetRoundMode(rmUp);
    Round_Points:=Round(Log10(ABS(DBChart1.Series[1].MaxXValue)));
    SetRoundMode(rmNearest);
    XMAX:=RoundTo(DBChart1.Series[1].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMAX:=0;
DBChart1.BottomAxis.SetMinMax(XMIN,XMAX);
DBChart1.BottomAxis.MaximumOffset:=5;
DBChart1.BottomAxis.MinimumOffset:=5;
DBChart1.Axes.Bottom.Items.Add(XMIN);
DBChart1.Axes.Bottom.Items.Add(XMAX);
DBChart1.Axes.Bottom.Items[0].Value:=XMIN;
DBChart1.Axes.Bottom.Items[DBChart1.Axes.Bottom.Items.Count-1].Value:=XMAX;

if DBChart2.Series[0].MinXValue<>0 then
  begin
    SetRoundMode(rmDown);
    Round_Points:=Round(Log10(ABS(DBChart2.Series[0].MinXValue)));
    SetRoundMode(rmNearest);
    XMIN:=RoundTo(DBChart2.Series[0].MinXValue-Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMIN:=0;
if DBChart2.Series[0].MaxXValue<>0 then
  begin
    SetRoundMode(rmUp);
    Round_Points:=Round(Log10(ABS(DBChart2.Series[0].MaxXValue)));
    SetRoundMode(rmNearest);
    XMAX:=RoundTo(DBChart2.Series[0].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMAX:=0;
DBChart2.TopAxis.SetMinMax(XMIN,XMAX);
DBChart2.TopAxis.MaximumOffset:=5;
DBChart2.TopAxis.MinimumOffset:=5;
DBChart2.Axes.Top.Items.Add(XMIN);
DBChart2.Axes.Top.Items.Add(XMAX);
DBChart2.Axes.Top.Items[0].Value:=XMIN;
DBChart2.Axes.Top.Items[DBChart2.Axes.Top.Items.Count-1].Value:=XMAX;
if DBChart2.Series[1].MinXValue<>0 then
  begin
    SetRoundMode(rmDown);
    Round_Points:=Round(Log10(ABS(DBChart2.Series[1].MinXValue)));
    SetRoundMode(rmNearest);
    XMIN:=RoundTo(DBChart2.Series[1].MinXValue-Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMIN:=0;
if DBChart2.Series[1].MaxXValue<>0 then
  begin
    SetRoundMode(rmUp);
    Round_Points:=Round(Log10(ABS(DBChart2.Series[1].MaxXValue)));
    SetRoundMode(rmNearest);
    XMAX:=RoundTo(DBChart2.Series[1].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMAX:=0;
DBChart2.BottomAxis.SetMinMax(XMIN,XMAX);
DBChart2.BottomAxis.MaximumOffset:=5;
DBChart2.BottomAxis.MinimumOffset:=5;
DBChart2.Axes.Bottom.Items.Add(XMIN);
DBChart2.Axes.Bottom.Items.Add(XMAX);
DBChart2.Axes.Bottom.Items[0].Value:=XMIN;
DBChart2.Axes.Bottom.Items[DBChart2.Axes.Bottom.Items.Count-1].Value:=XMAX;

if DBChart3.Series[0].MinXValue<>0 then
  begin
    SetRoundMode(rmDown);
    Round_Points:=Round(Log10(ABS(DBChart3.Series[0].MinXValue)));
    SetRoundMode(rmNearest);
    XMIN:=RoundTo(DBChart3.Series[0].MinXValue-Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMIN:=0;
if DBChart3.Series[0].MaxXValue<>0 then
  begin
    SetRoundMode(rmUp);
    Round_Points:=Round(Log10(ABS(DBChart3.Series[0].MaxXValue)));
    SetRoundMode(rmNearest);
    XMAX:=RoundTo(DBChart3.Series[0].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMAX:=0;
DBChart3.TopAxis.SetMinMax(XMIN,XMAX);
DBChart3.TopAxis.MaximumOffset:=5;
DBChart3.TopAxis.MinimumOffset:=5;
DBChart3.Axes.Top.Items.Add(XMIN);
DBChart3.Axes.Top.Items.Add(XMAX);
DBChart3.Axes.Top.Items[0].Value:=XMIN;
DBChart3.Axes.Top.Items[DBChart3.Axes.Top.Items.Count-1].Value:=XMAX;
if DBChart3.Series[1].MinXValue<>0 then
  begin
    SetRoundMode(rmDown);
    Round_Points:=Round(Log10(ABS(DBChart3.Series[1].MinXValue)));
    SetRoundMode(rmNearest);
    XMIN:=RoundTo(DBChart3.Series[1].MinXValue-Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMIN:=0;
if DBChart3.Series[1].MaxXValue<>0 then
  begin
    SetRoundMode(rmUp);
    Round_Points:=Round(Log10(ABS(DBChart3.Series[1].MaxXValue)));
    SetRoundMode(rmNearest);
    XMAX:=RoundTo(DBChart3.Series[1].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMAX:=0;
DBChart3.BottomAxis.SetMinMax(XMIN,XMAX);
DBChart3.BottomAxis.MaximumOffset:=5;
DBChart3.BottomAxis.MinimumOffset:=5;
DBChart3.Axes.Bottom.Items.Add(XMIN);
DBChart3.Axes.Bottom.Items.Add(XMAX);
DBChart3.Axes.Bottom.Items[0].Value:=XMIN;
DBChart3.Axes.Bottom.Items[DBChart3.Axes.Bottom.Items.Count-1].Value:=XMAX;

if DBChart4.Series[0].MinXValue<>0 then
  begin
    SetRoundMode(rmDown);
    Round_Points:=Round(Log10(ABS(DBChart4.Series[0].MinXValue)));
    SetRoundMode(rmNearest);
    XMIN:=RoundTo(DBChart4.Series[0].MinXValue-Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMIN:=0;
if DBChart4.Series[0].MaxXValue<>0 then
  begin
    SetRoundMode(rmUp);
    Round_Points:=Round(Log10(ABS(DBChart4.Series[0].MaxXValue)));
    SetRoundMode(rmNearest);
    XMAX:=RoundTo(DBChart4.Series[0].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMAX:=0;
DBChart4.TopAxis.SetMinMax(XMIN,XMAX);
DBChart4.TopAxis.MaximumOffset:=5;
DBChart4.TopAxis.MinimumOffset:=5;
DBChart4.Axes.Top.Items.Add(XMIN);
DBChart4.Axes.Top.Items.Add(XMAX);
DBChart4.Axes.Top.Items[0].Value:=XMIN;
DBChart4.Axes.Top.Items[DBChart4.Axes.Top.Items.Count-1].Value:=XMAX;
if DBChart4.Series[1].MinXValue<>0 then
  begin
    SetRoundMode(rmDown);
    Round_Points:=Round(Log10(ABS(DBChart4.Series[1].MinXValue)));
    SetRoundMode(rmNearest);
    XMIN:=RoundTo(DBChart4.Series[1].MinXValue-Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMIN:=0;
if DBChart4.Series[1].MaxXValue<>0 then
  begin
    SetRoundMode(rmUp);
    Round_Points:=Round(Log10(ABS(DBChart4.Series[1].MaxXValue)));
    SetRoundMode(rmNearest);
    XMAX:=RoundTo(DBChart4.Series[1].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMAX:=0;
DBChart4.BottomAxis.SetMinMax(XMIN,XMAX);
DBChart4.BottomAxis.MaximumOffset:=5;
DBChart4.BottomAxis.MinimumOffset:=5;
DBChart4.Axes.Bottom.Items.Add(XMIN);
DBChart4.Axes.Bottom.Items.Add(XMAX);
DBChart4.Axes.Bottom.Items[0].Value:=XMIN;
DBChart4.Axes.Bottom.Items[DBChart4.Axes.Bottom.Items.Count-1].Value:=XMAX;

if DBChart5.Series[0].MinXValue<>0 then
  begin
    SetRoundMode(rmDown);
    Round_Points:=Round(Log10(ABS(DBChart5.Series[0].MinXValue)));
    SetRoundMode(rmNearest);
    XMIN:=RoundTo(DBChart5.Series[0].MinXValue-Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMIN:=0;
if DBChart5.Series[0].MaxXValue<>0 then
  begin
    SetRoundMode(rmUp);
    Round_Points:=Round(Log10(ABS(DBChart5.Series[0].MaxXValue)));
    SetRoundMode(rmNearest);
    XMAX:=RoundTo(DBChart5.Series[0].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMAX:=0;
DBChart5.TopAxis.SetMinMax(XMIN,XMAX);
DBChart5.TopAxis.MaximumOffset:=5;
DBChart5.TopAxis.MinimumOffset:=5;
DBChart5.Axes.Top.Items.Add(XMIN);
DBChart5.Axes.Top.Items.Add(XMAX);
DBChart5.Axes.Top.Items[0].Value:=XMIN;
DBChart5.Axes.Top.Items[DBChart5.Axes.Top.Items.Count-1].Value:=XMAX;
if DBChart5.Series[1].MinXValue<>0 then
  begin
    SetRoundMode(rmDown);
    Round_Points:=Round(Log10(ABS(DBChart5.Series[1].MinXValue)));
    SetRoundMode(rmNearest);
    XMIN:=RoundTo(DBChart5.Series[1].MinXValue-Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMIN:=0;
if DBChart5.Series[1].MaxXValue<>0 then
  begin
    SetRoundMode(rmUp);
    Round_Points:=Round(Log10(ABS(DBChart5.Series[1].MaxXValue)));
    SetRoundMode(rmNearest);
    XMAX:=RoundTo(DBChart5.Series[1].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
  end
else
  XMAX:=0;
DBChart5.BottomAxis.SetMinMax(XMIN,XMAX);
DBChart5.BottomAxis.MaximumOffset:=5;
DBChart5.BottomAxis.MinimumOffset:=5;
DBChart5.Axes.Bottom.Items.Add(XMIN);
DBChart5.Axes.Bottom.Items.Add(XMAX);
DBChart5.Axes.Bottom.Items[0].Value:=XMIN;
DBChart5.Axes.Bottom.Items[DBChart5.Axes.Bottom.Items.Count-1].Value:=XMAX;

DBChart1.Axes.Top.OnDrawLabel:= TopAxisDrawLabel;
DBChart1.Axes.Bottom.OnDrawLabel:= TopAxisDrawLabel;
DBChart2.Axes.Top.OnDrawLabel:= TopAxisDrawLabel;
DBChart2.Axes.Bottom.OnDrawLabel:= TopAxisDrawLabel;
DBChart3.Axes.Top.OnDrawLabel:= TopAxisDrawLabel;
DBChart3.Axes.Bottom.OnDrawLabel:= TopAxisDrawLabel;
DBChart4.Axes.Top.OnDrawLabel:= TopAxisDrawLabel;
DBChart4.Axes.Bottom.OnDrawLabel:= TopAxisDrawLabel;
DBChart5.Axes.Top.OnDrawLabel:= TopAxisDrawLabel;
DBChart5.Axes.Bottom.OnDrawLabel:= TopAxisDrawLabel;

DBChart5.Axes.Left.Title.Caption:=CalculationForm.DBChart8.LeftAxis.Title.Caption;
finally
CalculationForm.Table.AfterScroll:=CalculationForm.TableScroll;
CalculationForm.ElasticTable.EnableControls;
CalculationForm.Table.EnableControls;
Screen.Cursor:=crDefault;
end;
end;

procedure TElasticCorrelationPage.TopAxisDrawLabel(Sender:TChartAxis; var X,Y,Z:Integer;
                                               var Text:String;
                                               var DrawLabel:Boolean);
begin
    with Sender do
    if X=CalcPosValue(Minimum) then  // first label
    begin
      with ParentChart.Canvas do
      begin
        TextAlign:=TextAlign - TA_CENTER + TA_LEFT;  // align to left
        Font.Style:=[fsBold];
      end;
    end
    else
    if X=CalcPosValue(Maximum) then  // last label
    begin
      with ParentChart.Canvas do
      begin
        TextAlign:=TextAlign - TA_CENTER + TA_RIGHT; // align to right
        Font.Style:=[fsBold];
      end;
    end;
end;


procedure TElasticCorrelationPage.DBChart1Zoom(Sender: TObject);
begin
Zooming(DBChart1);
DbChart1.UndoZoom;
end;

procedure TElasticCorrelationPage.DBChart2Zoom(Sender: TObject);
begin
Zooming(DBChart2);
DbChart2.UndoZoom;
end;

procedure TElasticCorrelationPage.DBChart3Zoom(Sender: TObject);
begin
Zooming(DBChart3);
DbChart3.UndoZoom;
end;

procedure TElasticCorrelationPage.DBChart5Zoom(Sender: TObject);
begin
Zooming(DBChart5);
DbChart5.UndoZoom;
end;

procedure TElasticCorrelationPage.Zooming( Sender: TDBChart);
begin
      SaveChartToFile(Sender,'tempchart',True);
      ZoomChart:=TZoomChart.Create(ElasticCorrelationPage);
      ZoomChart.DBChart1.LeftAxis.Visible:=True;
      ZoomChart.DBChart1.Legend.Visible:=True;
      ZoomChart.DBChart1.Legend.CheckBoxes:=True;
      ZoomChart.DBChart1.LeftAxis.Title.Caption:=CalculationForm.DBChart8.LeftAxis.Title.Caption;
      ZoomChart.X0:=Sender.Zoom.X0;
      ZoomChart.Y0:=Sender.Zoom.Y0;
      ZoomChart.X1:=Sender.Zoom.X1;
      ZoomChart.Y1:=Sender.Zoom.Y1;
      ZoomChart.Show;
end;

procedure TElasticCorrelationPage.Print1Click(Sender: TObject);
var
ChartP:TChartPreviewer;
TempChart:TDBChart;
begin
  with Sender as TMenuItem do
    begin
      ChartP:=TChartPreviewer.Create(Self);
      ChartP.Title:='Print Preview';
      SaveChartToFile(TCustomChart(DBChart1),'tempchart.tee',True);
      TempChart:=TDBChart.Create(ChartP);
      LoadChartFromFile(TCustomChart(TempChart),'tempchart.tee');
      TempChart.LeftAxis.Title.Font.Color:=clBlue;
      TempChart.LeftAxis.Title.Font.Style:=[fsBold];
      TempChart.LeftAxis.Title.Angle:=90;
      TempChart.LeftAxis.Title.Caption:=CalculationForm.DBChart8.LeftAxis.Title.Caption;
      TempChart.LeftAxis.Title.Font.InterCharSize:=15;
      TempChart.LeftAxis.Visible:=True;
      TempChart.Width:=200;
      ChartP.Chart:=TempChart;
      TempChart.MarginRight:=15;
      TempChart.TopAxis.OnDrawLabel:=TopAxisDrawLabel;
      TempChart.BottomAxis.OnDrawLabel:=TopAxisDrawLabel;
      TempChart.TopAxis.Items.Clear;
      if TempChart.Series[0].MinXValue<>0 then
        begin
          SetRoundMode(rmDown);
          Round_Points:=Round(Log10(ABS(TempChart.Series[0].MinXValue)));
          SetRoundMode(rmNearest);
          XMIN1:=RoundTo(TempChart.Series[0].MinXValue-Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMIN1:=0;
      if TempChart.Series[0].MaxXValue<>0 then
        begin
          SetRoundMode(rmUp);
          Round_Points:=Round(Log10(ABS(TempChart.Series[0].MaxXValue)));
          SetRoundMode(rmNearest);
          XMAX1:=RoundTo(TempChart.Series[0].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMAX1:=0;
      TempChart.TopAxis.SetMinMax(XMIN1,XMAX1);
      TempChart.Axes.Top.Items.Add(XMIN1);
      TempChart.Axes.Top.Items.Add(XMAX1);
      TempChart.Axes.Top.Items[0].Value:=XMIN1;
      TempChart.Axes.Top.Items[TempChart.Axes.Top.Items.Count-1].Value:=XMAX1;
      TempChart.BottomAxis.Items.Clear;
      if TempChart.Series[1].MinXValue<>0 then
        begin
          SetRoundMode(rmDown);
          Round_Points:=Round(Log10(ABS(TempChart.Series[1].MinXValue)));
          SetRoundMode(rmNearest);
          XMIN2:=RoundTo(TempChart.Series[1].MinXValue-Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMIN2:=0;
      if TempChart.Series[1].MaxXValue<>0 then
        begin
          SetRoundMode(rmUp);
          Round_Points:=Round(Log10(ABS(TempChart.Series[1].MaxXValue)));
          SetRoundMode(rmNearest);
          XMAX2:=RoundTo(TempChart.Series[1].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMAX2:=0;
      TempChart.BottomAxis.SetMinMax(XMIN2,XMAX2);
      TempChart.Axes.Bottom.Items.Add(XMIN2);
      TempChart.Axes.Bottom.Items.Add(XMAX2);
      TempChart.Axes.Bottom.Items[0].Value:=XMIN2;
      TempChart.Axes.Bottom.Items[TempChart.Axes.Top.Items.Count-1].Value:=XMAX2;
      ChartP.Execute;
      ChartP.Free;
      Pat:=Application.ExeName;
      P:=Pos('RockLog.exe',Pat);
      if P=0 then
        P:=Pos('ROCKLOG.EXE',Pat);
      Path := Copy(Pat, 1, P - 1);
      ChDir(Path);
    end;
end;

procedure TElasticCorrelationPage.Export1Click(Sender: TObject);
begin
  with Sender as TMenuItem do
    begin
      TeeExport(Self,DBChart1);
      Pat:=Application.ExeName;
      P:=Pos('RockLog.exe',Pat);
      if P=0 then
        P:=Pos('ROCKLOG.EXE',Pat);
      Path := Copy(Pat, 1, P - 1);
      ChDir(Path);
    end;
end;

procedure TElasticCorrelationPage.Print2Click(Sender: TObject);
var
ChartP:TChartPreviewer;
TempChart:TDBChart;
begin
  with Sender as TMenuItem do
    begin
      ChartP:=TChartPreviewer.Create(Self);
      SaveChartToFile(TCustomChart(DBChart2),'tempchart.tee',True);
      ChartP.Title:='Print Preview';
      TempChart:=TDBChart.Create(ChartP);
      LoadChartFromFile(TCustomChart(TempChart),'tempchart.tee');
      TempChart.LeftAxis.Title.Font.Color:=clBlue;
      TempChart.LeftAxis.Title.Font.Style:=[fsBold];
      TempChart.LeftAxis.Title.Angle:=90;
      TempChart.LeftAxis.Title.Font.InterCharSize:=15;
      TempChart.LeftAxis.Title.Caption:=DBChart1.LeftAxis.Title.Caption;
      TempChart.LeftAxis.Labels:=True;
      TempChart.LeftAxis.Title.Visible:=True;
      TempChart.Width:=200;
      ChartP.Chart:=TempChart;
      TempChart.MarginRight:=15;
      TempChart.TopAxis.OnDrawLabel:=TopAxisDrawLabel;
      TempChart.BottomAxis.OnDrawLabel:=TopAxisDrawLabel;
      TempChart.TopAxis.Items.Clear;
      if TempChart.Series[0].MinXValue<>0 then
        begin
          SetRoundMode(rmDown);
          Round_Points:=Round(Log10(ABS(TempChart.Series[0].MinXValue)));
          SetRoundMode(rmNearest);
          XMIN1:=RoundTo(TempChart.Series[0].MinXValue-Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMIN1:=0;
      if TempChart.Series[0].MaxXValue<>0 then
        begin
          SetRoundMode(rmUp);
          Round_Points:=Round(Log10(ABS(TempChart.Series[0].MaxXValue)));
          SetRoundMode(rmNearest);
          XMAX1:=RoundTo(TempChart.Series[0].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMAX1:=0;
      TempChart.TopAxis.SetMinMax(XMIN1,XMAX1);
      TempChart.Axes.Top.Items.Add(XMIN1);
      TempChart.Axes.Top.Items.Add(XMAX1);
      TempChart.Axes.Top.Items[0].Value:=XMIN1;
      TempChart.Axes.Top.Items[TempChart.Axes.Top.Items.Count-1].Value:=XMAX1;
      TempChart.BottomAxis.Items.Clear;
      if TempChart.Series[1].MinXValue<>0 then
        begin
          SetRoundMode(rmDown);
          Round_Points:=Round(Log10(ABS(TempChart.Series[1].MinXValue)));
          SetRoundMode(rmNearest);
          XMIN2:=RoundTo(TempChart.Series[1].MinXValue-Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMIN2:=0;
      if TempChart.Series[1].MaxXValue<>0 then
        begin
          SetRoundMode(rmUp);
          Round_Points:=Round(Log10(ABS(TempChart.Series[1].MaxXValue)));
          SetRoundMode(rmNearest);
          XMAX2:=RoundTo(TempChart.Series[1].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMAX2:=0;
      TempChart.BottomAxis.SetMinMax(XMIN2,XMAX2);
      TempChart.Axes.Bottom.Items.Add(XMIN2);
      TempChart.Axes.Bottom.Items.Add(XMAX2);
      TempChart.Axes.Bottom.Items[0].Value:=XMIN2;
      TempChart.Axes.Bottom.Items[TempChart.Axes.Top.Items.Count-1].Value:=XMAX2;
      ChartP.Execute;
      ChartP.Free;
      Pat:=Application.ExeName;
      P:=Pos('RockLog.exe',Pat);
      if P=0 then
        P:=Pos('ROCKLOG.EXE',Pat);
      Path := Copy(Pat, 1, P - 1);
      ChDir(Path);
    end;
end;

procedure TElasticCorrelationPage.Export2Click(Sender: TObject);
begin
  with Sender as TMenuItem do
    begin
      TeeExport(Self,DBChart2);
      Pat:=Application.ExeName;
      P:=Pos('RockLog.exe',Pat);
      if P=0 then
        P:=Pos('ROCKLOG.EXE',Pat);
      Path := Copy(Pat, 1, P - 1);
      ChDir(Path);
    end;
end;

procedure TElasticCorrelationPage.Print3Click(Sender: TObject);
var
ChartP:TChartPreviewer;
TempChart:TDBChart;
begin
  with Sender as TMenuItem do
    begin
      ChartP:=TChartPreviewer.Create(Self);
      SaveChartToFile(TCustomChart(DBChart3),'tempchart.tee',True);
      ChartP.Title:='Print Preview';
      TempChart:=TDBChart.Create(ChartP);
      LoadChartFromFile(TCustomChart(TempChart),'tempchart.tee');
      TempChart.LeftAxis.Title.Font.Color:=clBlue;
      TempChart.LeftAxis.Title.Font.Style:=[fsBold];
      TempChart.LeftAxis.Title.Angle:=90;
      TempChart.LeftAxis.Title.Caption:=DBChart1.LeftAxis.Title.Caption;
      TempChart.LeftAxis.Labels:=True;
      TempChart.LeftAxis.Title.Visible:=True;
      TempChart.LeftAxis.Title.Font.InterCharSize:=15;
      TempChart.LeftAxis.Visible:=True;
      TempChart.Width:=200;
      ChartP.Chart:=TempChart;
      TempChart.MarginRight:=15;
      TempChart.TopAxis.OnDrawLabel:=TopAxisDrawLabel;
      TempChart.BottomAxis.OnDrawLabel:=TopAxisDrawLabel;
      TempChart.TopAxis.Items.Clear;
      if TempChart.Series[0].MinXValue<>0 then
        begin
          SetRoundMode(rmDown);
          Round_Points:=Round(Log10(ABS(TempChart.Series[0].MinXValue)));
          SetRoundMode(rmNearest);
          XMIN1:=RoundTo(TempChart.Series[0].MinXValue-Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMIN1:=0;
      if TempChart.Series[0].MaxXValue<>0 then
        begin
          SetRoundMode(rmUp);
          Round_Points:=Round(Log10(ABS(TempChart.Series[0].MaxXValue)));
          SetRoundMode(rmNearest);
          XMAX1:=RoundTo(TempChart.Series[0].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMAX1:=0;
      TempChart.TopAxis.SetMinMax(XMIN1,XMAX1);
      TempChart.Axes.Top.Items.Add(XMIN1);
      TempChart.Axes.Top.Items.Add(XMAX1);
      TempChart.Axes.Top.Items[0].Value:=XMIN1;
      TempChart.Axes.Top.Items[TempChart.Axes.Top.Items.Count-1].Value:=XMAX1;
      TempChart.BottomAxis.Items.Clear;
      if TempChart.Series[1].MinXValue<>0 then
        begin
          SetRoundMode(rmDown);
          Round_Points:=Round(Log10(ABS(TempChart.Series[1].MinXValue)));
          SetRoundMode(rmNearest);
          XMIN2:=RoundTo(TempChart.Series[1].MinXValue-Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMIN2:=0;
      if TempChart.Series[1].MaxXValue<>0 then
        begin
          SetRoundMode(rmUp);
          Round_Points:=Round(Log10(ABS(TempChart.Series[1].MaxXValue)));
          SetRoundMode(rmNearest);
          XMAX2:=RoundTo(TempChart.Series[1].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMAX2:=0;
      TempChart.BottomAxis.SetMinMax(XMIN2,XMAX2);
      TempChart.Axes.Bottom.Items.Add(XMIN2);
      TempChart.Axes.Bottom.Items.Add(XMAX2);
      TempChart.Axes.Bottom.Items[0].Value:=XMIN2;
      TempChart.Axes.Bottom.Items[TempChart.Axes.Top.Items.Count-1].Value:=XMAX2;
      ChartP.Execute;
      ChartP.Free;
      Pat:=Application.ExeName;
      P:=Pos('RockLog.exe',Pat);
      if P=0 then
        P:=Pos('ROCKLOG.EXE',Pat);
      Path := Copy(Pat, 1, P - 1);
      ChDir(Path);
    end;
end;

procedure TElasticCorrelationPage.Print5Click(Sender: TObject);
var
ChartP:TChartPreviewer;
TempChart:TDBChart;
begin
  with Sender as TMenuItem do
    begin
      ChartP:=TChartPreviewer.Create(Self);
      SaveChartToFile(TCustomChart(DBChart5),'tempchart.tee',True);
      ChartP.Title:='Print Preview';
      TempChart:=TDBChart.Create(ChartP);
      LoadChartFromFile(TCustomChart(TempChart),'tempchart.tee');
      TempChart.LeftAxis.Title.Font.Color:=clBlue;
      TempChart.LeftAxis.Title.Font.Style:=[fsBold];
      TempChart.LeftAxis.Title.Angle:=90;
      TempChart.LeftAxis.Title.Caption:=DBChart1.LeftAxis.Title.Caption;
      TempChart.LeftAxis.Labels:=True;
      TempChart.LeftAxis.Title.Visible:=True;
      TempChart.LeftAxis.Title.Font.InterCharSize:=15;
      TempChart.LeftAxis.Visible:=True;
      TempChart.Width:=200;
      ChartP.Chart:=TempChart;
      TempChart.MarginRight:=15;
      TempChart.TopAxis.OnDrawLabel:=TopAxisDrawLabel;
      TempChart.BottomAxis.OnDrawLabel:=TopAxisDrawLabel;
      TempChart.TopAxis.Items.Clear;
      if TempChart.Series[0].MinXValue<>0 then
        begin
          SetRoundMode(rmDown);
          Round_Points:=Round(Log10(ABS(TempChart.Series[0].MinXValue)));
          SetRoundMode(rmNearest);
          XMIN1:=RoundTo(TempChart.Series[0].MinXValue-Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMIN1:=0;
      if TempChart.Series[0].MaxXValue<>0 then
        begin
          SetRoundMode(rmUp);
          Round_Points:=Round(Log10(ABS(TempChart.Series[0].MaxXValue)));
          SetRoundMode(rmNearest);
          XMAX1:=RoundTo(TempChart.Series[0].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMAX1:=0;
      TempChart.TopAxis.SetMinMax(XMIN1,XMAX1);
      TempChart.Axes.Top.Items.Add(XMIN1);
      TempChart.Axes.Top.Items.Add(XMAX1);
      TempChart.Axes.Top.Items[0].Value:=XMIN1;
      TempChart.Axes.Top.Items[TempChart.Axes.Top.Items.Count-1].Value:=XMAX1;
      TempChart.BottomAxis.Items.Clear;
      if TempChart.Series[1].MinXValue<>0 then
        begin
          SetRoundMode(rmDown);
          Round_Points:=Round(Log10(ABS(TempChart.Series[1].MinXValue)));
          SetRoundMode(rmNearest);
          XMIN2:=RoundTo(TempChart.Series[1].MinXValue-Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMIN2:=0;
      if TempChart.Series[1].MaxXValue<>0 then
        begin
          SetRoundMode(rmUp);
          Round_Points:=Round(Log10(ABS(TempChart.Series[1].MaxXValue)));
          SetRoundMode(rmNearest);
          XMAX2:=RoundTo(TempChart.Series[1].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMAX2:=0;
      TempChart.BottomAxis.SetMinMax(XMIN2,XMAX2);
      TempChart.Axes.Bottom.Items.Add(XMIN2);
      TempChart.Axes.Bottom.Items.Add(XMAX2);
      TempChart.Axes.Bottom.Items[0].Value:=XMIN2;
      TempChart.Axes.Bottom.Items[TempChart.Axes.Top.Items.Count-1].Value:=XMAX2;
      ChartP.Execute;
      ChartP.Free;
      Pat:=Application.ExeName;
      P:=Pos('RockLog.exe',Pat);
      if P=0 then
        P:=Pos('ROCKLOG.EXE',Pat);
      Path := Copy(Pat, 1, P - 1);
      ChDir(Path);
    end;
end;

procedure TElasticCorrelationPage.Export5Click(Sender: TObject);
begin
  with Sender as TMenuItem do
    begin
      TeeExport(Self,DBChart5);
      Pat:=Application.ExeName;
      P:=Pos('RockLog.exe',Pat);
      if P=0 then
        P:=Pos('ROCKLOG.EXE',Pat);
      Path := Copy(Pat, 1, P - 1);
      ChDir(Path);
    end;
end;

procedure TElasticCorrelationPage.Export3Click(Sender: TObject);
begin
  with Sender as TMenuItem do
    begin
      TeeExport(Self,DBChart3);
      Pat:=Application.ExeName;
      P:=Pos('RockLog.exe',Pat);
      if P=0 then
        P:=Pos('ROCKLOG.EXE',Pat);
      Path := Copy(Pat, 1, P - 1);
      ChDir(Path);
    end;
end;

procedure TElasticCorrelationPage.FormActivate(Sender: TObject);
begin
CalculationForm.Repaint;
end;

procedure TElasticCorrelationPage.sButton1Click(Sender: TObject);
begin
Close;
end;

procedure TElasticCorrelationPage.SetMinMax1Click(Sender: TObject);
begin
Canceled:=False;
SetMinMaxComp:=TSetMinMaxComp.Create(Self);
SetMinMaxComp.VrLabel4.Caption:=DBChart1.Axes.Bottom.Title.Caption;
SetMinMaxComp.VrLabel5.Caption:=DBChart1.Axes.Top.Title.Caption;
SetMinMaxComp.ESBFloatEdit1.Text:=FloatToStr(DBChart1.Axes.Bottom.Minimum);
SetMinMaxComp.ESBFloatEdit2.Text:=FloatToStr(DBChart1.Axes.Bottom.Maximum);
SetMinMaxComp.ESBFloatEdit3.Text:=FloatToStr(DBChart1.Axes.Top.Minimum);
SetMinMaxComp.ESBFloatEdit4.Text:=FloatToStr(DBChart1.Axes.Top.Maximum);
SetMinMaxComp.ShowModal;
SetMinMaxComp.Free;
if Canceled then Exit;
if (ChartMin1<ChartMax1) then
  begin
    DBChart1.BottomAxis.Items.Clear;
    DBChart1.BottomAxis.SetMinMax(ChartMin1,ChartMax1);
    DBChart1.Axes.Bottom.Items.Add(ChartMin1);
    DBChart1.Axes.Bottom.Items.Add(ChartMax1);
    DBChart1.Axes.Bottom.Items[0].Value:=ChartMin1;
    DBChart1.Axes.Bottom.Items[DBChart1.Axes.Bottom.Items.Count-1].Value:=ChartMax1;
  end;
if (ChartMin2<ChartMax2) then
  begin
    DBChart1.TopAxis.Items.Clear;
    DBChart1.TopAxis.SetMinMax(ChartMin2,ChartMax2);
    DBChart1.Axes.Top.Items.Add(ChartMin2);
    DBChart1.Axes.Top.Items.Add(ChartMax2);
    DBChart1.Axes.Top.Items[0].Value:=ChartMin2;
    DBChart1.Axes.Top.Items[DBChart1.Axes.Top.Items.Count-1].Value:=ChartMax2;
  end;
end;

procedure TElasticCorrelationPage.SetMinMax2Click(Sender: TObject);
begin
Canceled:=False;
SetMinMaxComp:=TSetMinMaxComp.Create(Self);
SetMinMaxComp.VrLabel4.Caption:='MU.RHO';
SetMinMaxComp.VrLabel5.Caption:='LAMBDA.RHO';
SetMinMaxComp.ESBFloatEdit1.Text:=FloatToStr(DBChart2.Axes.Bottom.Minimum);
SetMinMaxComp.ESBFloatEdit2.Text:=FloatToStr(DBChart2.Axes.Bottom.Maximum);
SetMinMaxComp.ESBFloatEdit3.Text:=FloatToStr(DBChart2.Axes.Top.Minimum);
SetMinMaxComp.ESBFloatEdit4.Text:=FloatToStr(DBChart2.Axes.Top.Maximum);
SetMinMaxComp.ShowModal;
SetMinMaxComp.Free;
if Canceled then Exit;
if (ChartMin1<ChartMax1) then
  begin
    DBChart2.BottomAxis.Items.Clear;
    DBChart2.BottomAxis.SetMinMax(ChartMin1,ChartMax1);
    DBChart2.Axes.Bottom.Items.Add(ChartMin1);
    DBChart2.Axes.Bottom.Items.Add(ChartMax1);
    DBChart2.Axes.Bottom.Items[0].Value:=ChartMin1;
    DBChart2.Axes.Bottom.Items[DBChart2.Axes.Bottom.Items.Count-1].Value:=ChartMax1;
  end;
if (ChartMin2<ChartMax2) then
  begin
    DBChart2.TopAxis.Items.Clear;
    DBChart2.TopAxis.SetMinMax(ChartMin2,ChartMax2);
    DBChart2.Axes.Top.Items.Add(ChartMin2);
    DBChart2.Axes.Top.Items.Add(ChartMax2);
    DBChart2.Axes.Top.Items[0].Value:=ChartMin2;
    DBChart2.Axes.Top.Items[DBChart2.Axes.Top.Items.Count-1].Value:=ChartMax2;
  end;
end;

procedure TElasticCorrelationPage.SetMinMax3Click(Sender: TObject);
begin
Canceled:=False;
SetMinMaxComp:=TSetMinMaxComp.Create(Self);
SetMinMaxComp.VrLabel4.Caption:='YOUNG MOD.';
SetMinMaxComp.VrLabel5.Caption:='POISSON RATIO';
SetMinMaxComp.ESBFloatEdit1.Text:=FloatToStr(DBChart3.Axes.Bottom.Minimum);
SetMinMaxComp.ESBFloatEdit2.Text:=FloatToStr(DBChart3.Axes.Bottom.Maximum);
SetMinMaxComp.ESBFloatEdit3.Text:=FloatToStr(DBChart3.Axes.Top.Minimum);
SetMinMaxComp.ESBFloatEdit4.Text:=FloatToStr(DBChart3.Axes.Top.Maximum);
SetMinMaxComp.ShowModal;
SetMinMaxComp.Free;
if Canceled then Exit;
if (ChartMin1<ChartMax1) then
  begin
    DBChart3.BottomAxis.Items.Clear;
    DBChart3.BottomAxis.SetMinMax(ChartMin1,ChartMax1);
    DBChart3.Axes.Bottom.Items.Add(ChartMin1);
    DBChart3.Axes.Bottom.Items.Add(ChartMax1);
    DBChart3.Axes.Bottom.Items[0].Value:=ChartMin1;
    DBChart3.Axes.Bottom.Items[DBChart3.Axes.Bottom.Items.Count-1].Value:=ChartMax1;
  end;
if (ChartMin2<ChartMax2) then
  begin
    DBChart3.TopAxis.Items.Clear;
    DBChart3.TopAxis.SetMinMax(ChartMin2,ChartMax2);
    DBChart3.Axes.Top.Items.Add(ChartMin2);
    DBChart3.Axes.Top.Items.Add(ChartMax2);
    DBChart3.Axes.Top.Items[0].Value:=ChartMin2;
    DBChart3.Axes.Top.Items[DBChart3.Axes.Top.Items.Count-1].Value:=ChartMax2;
  end;
end;

procedure TElasticCorrelationPage.SetMinMax5Click(Sender: TObject);
begin
Canceled:=False;
SetMinMaxComp:=TSetMinMaxComp.Create(Self);
SetMinMaxComp.VrLabel4.Caption:=DBChart5.Axes.Bottom.Title.Caption;
SetMinMaxComp.VrLabel5.Caption:=DBChart5.Axes.Top.Title.Caption;
SetMinMaxComp.ESBFloatEdit1.Text:=FloatToStr(DBChart5.Axes.Bottom.Minimum);
SetMinMaxComp.ESBFloatEdit2.Text:=FloatToStr(DBChart5.Axes.Bottom.Maximum);
SetMinMaxComp.ESBFloatEdit3.Text:=FloatToStr(DBChart5.Axes.Top.Minimum);
SetMinMaxComp.ESBFloatEdit4.Text:=FloatToStr(DBChart5.Axes.Top.Maximum);
SetMinMaxComp.ShowModal;
SetMinMaxComp.Free;
if Canceled then Exit;
if (ChartMin1<ChartMax1) then
  begin
    DBChart5.BottomAxis.Items.Clear;
    DBChart5.BottomAxis.SetMinMax(ChartMin1,ChartMax1);
    DBChart5.Axes.Bottom.Items.Add(ChartMin1);
    DBChart5.Axes.Bottom.Items.Add(ChartMax1);
    DBChart5.Axes.Bottom.Items[0].Value:=ChartMin1;
    DBChart5.Axes.Bottom.Items[DBChart5.Axes.Bottom.Items.Count-1].Value:=ChartMax1;
  end;
if (ChartMin2<ChartMax2) then
  begin
    DBChart5.TopAxis.Items.Clear;
    DBChart5.TopAxis.SetMinMax(ChartMin2,ChartMax2);
    DBChart5.Axes.Top.Items.Add(ChartMin2);
    DBChart5.Axes.Top.Items.Add(ChartMax2);
    DBChart5.Axes.Top.Items[0].Value:=ChartMin2;
    DBChart5.Axes.Top.Items[DBChart5.Axes.Top.Items.Count-1].Value:=ChartMax2;
  end;
end;

procedure TElasticCorrelationPage.ChangeColor1Click(Sender: TObject);
begin
ElasticChangeColor:=TElasticChangeColor.Create(Self);
ElasticChangeColor.Tag:=1;
ElasticChangeColor.Label1.Caption:='P-IMP(GPa.Kg/m3)';
ElasticChangeColor.Label2.Caption:='S-IMP(GPa.Kg/m3)';
ElasticChangeColor.Image1.Canvas.Brush.Color:=DBChart1.Series[0].SeriesColor;
ElasticChangeColor.Image1.Canvas.FillRect(Rect(0,0,25,25));
ElasticChangeColor.Image2.Canvas.Brush.Color:=DBChart1.Series[1].SeriesColor;
ElasticChangeColor.Image2.Canvas.FillRect(Rect(0,0,25,25));
ElasticChangeColor.FirstColor:=DBChart1.Series[0].SeriesColor;
ElasticChangeColor.SecondColor:=DBChart1.Series[1].SeriesColor;
ElasticChangeColor.ShowModal;
ElasticChangeColor.Free;
end;

procedure TElasticCorrelationPage.ChangeColor2Click(Sender: TObject);
begin
ElasticChangeColor:=TElasticChangeColor.Create(Self);
ElasticChangeColor.Tag:=2;
ElasticChangeColor.Label1.Caption:='LAMBDA.RHO';
ElasticChangeColor.Label2.Caption:='MU.RHO';
ElasticChangeColor.Image1.Canvas.Brush.Color:=DBChart2.Series[0].SeriesColor;
ElasticChangeColor.Image1.Canvas.FillRect(Rect(0,0,25,25));
ElasticChangeColor.Image2.Canvas.Brush.Color:=DBChart2.Series[1].SeriesColor;
ElasticChangeColor.Image2.Canvas.FillRect(Rect(0,0,25,25));
ElasticChangeColor.FirstColor:=DBChart2.Series[0].SeriesColor;
ElasticChangeColor.SecondColor:=DBChart2.Series[1].SeriesColor;
ElasticChangeColor.ShowModal;
ElasticChangeColor.Free;
end;

procedure TElasticCorrelationPage.ChangeColor3Click(Sender: TObject);
begin
ElasticChangeColor:=TElasticChangeColor.Create(Self);
ElasticChangeColor.Tag:=3;
ElasticChangeColor.Label1.Caption:='POISSON RATIO';
ElasticChangeColor.Label2.Caption:='YOUNG MOD.(GPa)';
ElasticChangeColor.Image1.Canvas.Brush.Color:=DBChart3.Series[0].SeriesColor;
ElasticChangeColor.Image1.Canvas.FillRect(Rect(0,0,25,25));
ElasticChangeColor.Image2.Canvas.Brush.Color:=DBChart3.Series[1].SeriesColor;
ElasticChangeColor.Image2.Canvas.FillRect(Rect(0,0,25,25));
ElasticChangeColor.FirstColor:=DBChart3.Series[0].SeriesColor;
ElasticChangeColor.SecondColor:=DBChart3.Series[1].SeriesColor;
ElasticChangeColor.ShowModal;
ElasticChangeColor.Free;
end;

procedure TElasticCorrelationPage.ChangeColor5Click(Sender: TObject);
begin
ElasticChangeColor:=TElasticChangeColor.Create(Self);
ElasticChangeColor.Tag:=5;
ElasticChangeColor.Label1.Caption:=DBChart5.TopAxis.Title.Caption;
ElasticChangeColor.Label2.Caption:=DBChart5.BottomAxis.Title.Caption;
ElasticChangeColor.Image1.Canvas.Brush.Color:=DBChart5.Series[0].SeriesColor;
ElasticChangeColor.Image1.Canvas.FillRect(Rect(0,0,25,25));
ElasticChangeColor.Image2.Canvas.Brush.Color:=DBChart5.Series[1].SeriesColor;
ElasticChangeColor.Image2.Canvas.FillRect(Rect(0,0,25,25));
ElasticChangeColor.FirstColor:=DBChart5.Series[0].SeriesColor;
ElasticChangeColor.SecondColor:=DBChart5.Series[1].SeriesColor;
ElasticChangeColor.ShowModal;
ElasticChangeColor.Free;
end;

procedure TElasticCorrelationPage.DBChart4Zoom(Sender: TObject);
begin
Zooming(DBChart4);
DbChart4.UndoZoom;
end;

procedure TElasticCorrelationPage.Print4Click(Sender: TObject);
var
ChartP:TChartPreviewer;
TempChart:TDBChart;
begin
  with Sender as TMenuItem do
    begin
      ChartP:=TChartPreviewer.Create(Self);
      SaveChartToFile(TCustomChart(DBChart4),'tempchart.tee',True);
      ChartP.Title:='Print Preview';
      TempChart:=TDBChart.Create(ChartP);
      LoadChartFromFile(TCustomChart(TempChart),'tempchart.tee');
      TempChart.LeftAxis.Title.Font.Color:=clBlue;
      TempChart.LeftAxis.Title.Font.Style:=[fsBold];
      TempChart.LeftAxis.Title.Angle:=90;
      TempChart.LeftAxis.Title.Caption:=DBChart1.LeftAxis.Title.Caption;
      TempChart.LeftAxis.Labels:=True;
      TempChart.LeftAxis.Title.Visible:=True;
      TempChart.LeftAxis.Title.Font.InterCharSize:=15;
      TempChart.LeftAxis.Visible:=True;
      TempChart.Width:=200;
      ChartP.Chart:=TempChart;
      TempChart.MarginRight:=15;
      TempChart.TopAxis.OnDrawLabel:=TopAxisDrawLabel;
      TempChart.BottomAxis.OnDrawLabel:=TopAxisDrawLabel;
      TempChart.TopAxis.Items.Clear;
      if TempChart.Series[0].MinXValue<>0 then
        begin
          SetRoundMode(rmDown);
          Round_Points:=Round(Log10(ABS(TempChart.Series[0].MinXValue)));
          SetRoundMode(rmNearest);
          XMIN1:=RoundTo(TempChart.Series[0].MinXValue-Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMIN1:=0;
      if TempChart.Series[0].MaxXValue<>0 then
        begin
          SetRoundMode(rmUp);
          Round_Points:=Round(Log10(ABS(TempChart.Series[0].MaxXValue)));
          SetRoundMode(rmNearest);
          XMAX1:=RoundTo(TempChart.Series[0].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMAX1:=0;
      TempChart.TopAxis.SetMinMax(XMIN1,XMAX1);
      TempChart.Axes.Top.Items.Add(XMIN1);
      TempChart.Axes.Top.Items.Add(XMAX1);
      TempChart.Axes.Top.Items[0].Value:=XMIN1;
      TempChart.Axes.Top.Items[TempChart.Axes.Top.Items.Count-1].Value:=XMAX1;
      TempChart.BottomAxis.Items.Clear;
      if TempChart.Series[1].MinXValue<>0 then
        begin
          SetRoundMode(rmDown);
          Round_Points:=Round(Log10(ABS(TempChart.Series[1].MinXValue)));
          SetRoundMode(rmNearest);
          XMIN2:=RoundTo(TempChart.Series[1].MinXValue-Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMIN2:=0;
      if TempChart.Series[1].MaxXValue<>0 then
        begin
          SetRoundMode(rmUp);
          Round_Points:=Round(Log10(ABS(TempChart.Series[1].MaxXValue)));
          SetRoundMode(rmNearest);
          XMAX2:=RoundTo(TempChart.Series[1].MaxXValue+Power(10,Round_Points-1),Round_Points-1);
        end
      else
        XMAX2:=0;
      TempChart.BottomAxis.SetMinMax(XMIN2,XMAX2);
      TempChart.Axes.Bottom.Items.Add(XMIN2);
      TempChart.Axes.Bottom.Items.Add(XMAX2);
      TempChart.Axes.Bottom.Items[0].Value:=XMIN2;
      TempChart.Axes.Bottom.Items[TempChart.Axes.Top.Items.Count-1].Value:=XMAX2;
      ChartP.Execute;
      ChartP.Free;
      Pat:=Application.ExeName;
      P:=Pos('RockLog.exe',Pat);
      if P=0 then
        P:=Pos('ROCKLOG.EXE',Pat);
      Path := Copy(Pat, 1, P - 1);
      ChDir(Path);
    end;
end;

procedure TElasticCorrelationPage.Export4Click(Sender: TObject);
begin
  with Sender as TMenuItem do
    begin
      TeeExport(Self,DBChart4);
      Pat:=Application.ExeName;
      P:=Pos('RockLog.exe',Pat);
      if P=0 then
        P:=Pos('ROCKLOG.EXE',Pat);
      Path := Copy(Pat, 1, P - 1);
      ChDir(Path);
    end;
end;

procedure TElasticCorrelationPage.ChangeColor4Click(Sender: TObject);
begin
ElasticChangeColor:=TElasticChangeColor.Create(Self);
ElasticChangeColor.Tag:=4;
ElasticChangeColor.Label1.Caption:='Vp/Vs';
ElasticChangeColor.Label2.Caption:='DENSITY(Kg/m3)';
ElasticChangeColor.Image1.Canvas.Brush.Color:=DBChart4.Series[0].SeriesColor;
ElasticChangeColor.Image1.Canvas.FillRect(Rect(0,0,25,25));
ElasticChangeColor.Image2.Canvas.Brush.Color:=DBChart4.Series[1].SeriesColor;
ElasticChangeColor.Image2.Canvas.FillRect(Rect(0,0,25,25));
ElasticChangeColor.FirstColor:=DBChart4.Series[0].SeriesColor;
ElasticChangeColor.SecondColor:=DBChart4.Series[1].SeriesColor;
ElasticChangeColor.ShowModal;
ElasticChangeColor.Free;
end;

procedure TElasticCorrelationPage.SetMinMax4Click(Sender: TObject);
begin
Canceled:=False;
SetMinMaxComp:=TSetMinMaxComp.Create(Self);
SetMinMaxComp.VrLabel4.Caption:=DBChart4.Axes.Bottom.Title.Caption;
SetMinMaxComp.VrLabel5.Caption:=DBChart4.Axes.Top.Title.Caption;
SetMinMaxComp.ESBFloatEdit1.Text:=FloatToStr(DBChart4.Axes.Bottom.Minimum);
SetMinMaxComp.ESBFloatEdit2.Text:=FloatToStr(DBChart4.Axes.Bottom.Maximum);
SetMinMaxComp.ESBFloatEdit3.Text:=FloatToStr(DBChart4.Axes.Top.Minimum);
SetMinMaxComp.ESBFloatEdit4.Text:=FloatToStr(DBChart4.Axes.Top.Maximum);
SetMinMaxComp.ShowModal;
SetMinMaxComp.Free;
if Canceled then Exit;
if (ChartMin1<ChartMax1) then
  begin
    DBChart4.BottomAxis.Items.Clear;
    DBChart4.BottomAxis.SetMinMax(ChartMin1,ChartMax1);
    DBChart4.Axes.Bottom.Items.Add(ChartMin1);
    DBChart4.Axes.Bottom.Items.Add(ChartMax1);
    DBChart4.Axes.Bottom.Items[0].Value:=ChartMin1;
    DBChart4.Axes.Bottom.Items[DBChart4.Axes.Bottom.Items.Count-1].Value:=ChartMax1;
  end;
if (ChartMin2<ChartMax2) then
  begin
    DBChart4.TopAxis.Items.Clear;
    DBChart4.TopAxis.SetMinMax(ChartMin2,ChartMax2);
    DBChart4.Axes.Top.Items.Add(ChartMin2);
    DBChart4.Axes.Top.Items.Add(ChartMax2);
    DBChart4.Axes.Top.Items[0].Value:=ChartMin2;
    DBChart4.Axes.Top.Items[DBChart4.Axes.Top.Items.Count-1].Value:=ChartMax2;
  end;
end;

procedure TElasticCorrelationPage.Button1Click(Sender: TObject);
begin
  DBChart1.Page:=0;
  DBChart2.Page:=0;
  DBChart3.Page:=0;
  DBChart4.Page:=0;
  DBChart5.Page:=0;
end;

procedure TElasticCorrelationPage.Button2Click(Sender: TObject);
begin
  DBChart1.PreviousPage;
  DBChart2.PreviousPage;
  DBChart3.PreviousPage;
  DBChart4.PreviousPage;
  DBChart5.PreviousPage;
end;

procedure TElasticCorrelationPage.Button3Click(Sender: TObject);
begin
  DBChart1.NextPage;
  DBChart2.NextPage;
  DBChart3.NextPage;
  DBChart4.NextPage;
  DBChart5.NextPage;
end;

procedure TElasticCorrelationPage.Button4Click(Sender: TObject);
begin
  DBChart1.Page:=DBChart1.NumPages;
  DBChart2.Page:=DBChart2.NumPages;
  DBChart3.Page:=DBChart3.NumPages;
  DBChart4.Page:=DBChart4.NumPages;
  DBChart5.Page:=DBChart5.NumPages;
end;

procedure TElasticCorrelationPage.Button5Click(Sender: TObject);
var
i,j,mppp:integer;
Scale_Value:String;
Clicked_Ok:Boolean;
Conversion_Unit:Real;
begin
  Scale_Value:=ESBPosEdit1.AsString;
  Log_Scale:=StrToFloat(Scale_Value);
  if DepthSystem='ft' then
    begin
      Conversion_Unit:=1152;
    end;
  if DepthSystem='m' then
    begin
      Conversion_Unit:=3779.527559055;
    end;
  mppp:=Round(Log_Scale/StrToFloat(CalculationForm.Edit5.Text)*(DBChart5.ChartRect.Bottom-DBChart5.ChartRect.Top)/Conversion_Unit);
  DBChart1.MaxPointsPerPage:=mppp;
  DBChart1.ScaleLastPage:=False;
  DBChart1.AllowPanning:=pmVertical;
  DBChart2.MaxPointsPerPage:=mppp;
  DBChart2.ScaleLastPage:=False;
  DBChart2.AllowPanning:=pmVertical;
  DBChart3.MaxPointsPerPage:=mppp;
  DBChart3.ScaleLastPage:=False;
  DBChart3.AllowPanning:=pmVertical;
  DBChart4.MaxPointsPerPage:=mppp;
  DBChart4.ScaleLastPage:=False;
  DBChart4.AllowPanning:=pmVertical;
  DBChart5.MaxPointsPerPage:=mppp;
  DBChart5.ScaleLastPage:=False;
  DBChart5.AllowPanning:=pmVertical;
end;

procedure TElasticCorrelationPage.Button6Click(Sender: TObject);
begin
  DBChart1.MaxPointsPerPage:=0;
  DBChart1.AllowPanning:=pmNone;
  DBChart2.MaxPointsPerPage:=0;
  DBChart2.AllowPanning:=pmNone;
  DBChart3.MaxPointsPerPage:=0;
  DBChart3.AllowPanning:=pmNone;
  DBChart4.MaxPointsPerPage:=0;
  DBChart4.AllowPanning:=pmNone;
  DBChart5.MaxPointsPerPage:=0;
  DBChart5.AllowPanning:=pmNone;
  ESBPosEdit1.AsInteger:=0;
end;

end.
