unit CrossPlotsPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, DBChart, TeeTools, Chart,
  Menus, TeeEdit, TeExport, sButtonControl, sCustomButton;

type
  TCrossPlots = class(TForm)
    DBChart2: TDBChart;
    PointSeries2: TPointSeries;
    DBChart3: TDBChart;
    PointSeries3: TPointSeries;
    DBChart4: TDBChart;
    PointSeries4: TPointSeries;
    ChartTool2: TMarksTipTool;
    ChartTool3: TMarksTipTool;
    ChartTool4: TMarksTipTool;
    PopupMenu1: TPopupMenu;
    Print1: TMenuItem;
    Export1: TMenuItem;
    ChangeColor1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Print2: TMenuItem;
    Export2: TMenuItem;
    ChangeColor2: TMenuItem;
    PopupMenu3: TPopupMenu;
    Print3: TMenuItem;
    Export3: TMenuItem;
    ChangeColor3: TMenuItem;
    PopupMenu4: TPopupMenu;
    Print4: TMenuItem;
    Export4: TMenuItem;
    ChangeColor4: TMenuItem;
    ColorDialog1: TColorDialog;
    sButton1: TsButton;
    Edit1: TMenuItem;
    DBChart1: TDBChart;
    ChartTool1: TMarksTipTool;
    PointSeries1: TPointSeries;
    SetMinMax1: TMenuItem;
    SetMinMax2: TMenuItem;
    SetMinMax3: TMenuItem;
    procedure Print1Click(Sender: TObject);
    procedure Export1Click(Sender: TObject);
    procedure ChangeColor1Click(Sender: TObject);
    procedure Print2Click(Sender: TObject);
    procedure Export2Click(Sender: TObject);
    procedure ChangeColor2Click(Sender: TObject);
    procedure Print3Click(Sender: TObject);
    procedure Export3Click(Sender: TObject);
    procedure ChangeColor3Click(Sender: TObject);
    procedure Print4Click(Sender: TObject);
    procedure Export4Click(Sender: TObject);
    procedure ChangeColor4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure SetMinMax1Click(Sender: TObject);
    procedure SetMinMax2Click(Sender: TObject);
    procedure SetMinMax3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CrossPlots: TCrossPlots;
  Canceled:Boolean;
  ChartMin1,ChartMax1: Real;
  ChartMin2,ChartMax2: Real;

implementation

uses CalculationPage, SetMinMaxCom;

{$R *.dfm}

procedure TCrossPlots.Print1Click(Sender: TObject);
var
ChartP:TChartPreviewer;
P:integer;
Pat,Path:string;
begin
  with Sender as TMenuItem do
    begin
      ChartP:=TChartPreviewer.Create(Self);
      ChartP.Chart:=DBChart1;
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

procedure TCrossPlots.Export1Click(Sender: TObject);
var
P:integer;
Pat,Path:string;
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

procedure TCrossPlots.ChangeColor1Click(Sender: TObject);
begin
if ColorDialog1.Execute then
  begin
    DBChart1.Series[0].Color:=ColorDialog1.Color;
  end;
end;

procedure TCrossPlots.Print2Click(Sender: TObject);
var
ChartP:TChartPreviewer;
P:integer;
Pat,Path:string;
begin
  with Sender as TMenuItem do
    begin
      ChartP:=TChartPreviewer.Create(Self);
      ChartP.Chart:=DBChart2;
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

procedure TCrossPlots.Export2Click(Sender: TObject);
var
P:integer;
Pat,Path:string;
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

procedure TCrossPlots.ChangeColor2Click(Sender: TObject);
begin
if ColorDialog1.Execute then
  begin
    DBChart2.Series[0].SeriesColor:=ColorDialog1.Color;
  end;
end;

procedure TCrossPlots.Print3Click(Sender: TObject);
var
ChartP:TChartPreviewer;
P:integer;
Pat,Path:string;
begin
  with Sender as TMenuItem do
    begin
      ChartP:=TChartPreviewer.Create(Self);
      ChartP.Chart:=DBChart3;
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

procedure TCrossPlots.Export3Click(Sender: TObject);
var
P:integer;
Pat,Path:string;
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

procedure TCrossPlots.ChangeColor3Click(Sender: TObject);
begin
if ColorDialog1.Execute then
  begin
    DBChart3.Series[0].SeriesColor:=ColorDialog1.Color;
  end;
end;

procedure TCrossPlots.Print4Click(Sender: TObject);
var
ChartP:TChartPreviewer;
P:integer;
Pat,Path:string;
begin
  with Sender as TMenuItem do
    begin
      ChartP:=TChartPreviewer.Create(Self);
      ChartP.Chart:=DBChart4;
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

procedure TCrossPlots.Export4Click(Sender: TObject);
var
P:integer;
Pat,Path:string;
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

procedure TCrossPlots.ChangeColor4Click(Sender: TObject);
begin
if ColorDialog1.Execute then
  begin
    DBChart4.Series[0].SeriesColor:=ColorDialog1.Color;
  end;
end;

procedure TCrossPlots.FormShow(Sender: TObject);
begin
DBChart1.BottomAxis.Title.Caption:=CalculationForm.ElasticTable.FieldByname('Rho').DisplayLabel;
DBChart1.LeftAxis.Title.Caption:=CalculationForm.ElasticTable.FieldByname('Vp/Vs').DisplayLabel;
end;

procedure TCrossPlots.sButton1Click(Sender: TObject);
begin
Close;
end;

procedure TCrossPlots.Edit1Click(Sender: TObject);
begin
Canceled:=False;
SetMinMaxComp:=TSetMinMaxComp.Create(CrossPlots);
SetMinMaxComp.VrLabel4.Caption:=DBChart1.Axes.Left.Title.Caption;
SetMinMaxComp.VrLabel5.Caption:=DBChart1.Axes.Bottom.Title.Caption;
SetMinMaxComp.ESBFloatEdit1.Text:=FloatToStr(DBChart1.Axes.Left.Minimum);
SetMinMaxComp.ESBFloatEdit2.Text:=FloatToStr(DBChart1.Axes.Left.Maximum);
SetMinMaxComp.ESBFloatEdit3.Text:=FloatToStr(DBChart1.Axes.Bottom.Minimum);
SetMinMaxComp.ESBFloatEdit4.Text:=FloatToStr(DBChart1.Axes.Bottom.Maximum);
SetMinMaxComp.ShowModal;
SetMinMaxComp.Free;
if Canceled then Exit;
if (ChartMin1<ChartMax1) then
  begin
    DBChart1.LeftAxis.Items.Clear;
    DBChart1.LeftAxis.SetMinMax(ChartMin1,ChartMax1);
  end;
if (ChartMin2<ChartMax2) then
  begin
    DBChart1.BottomAxis.Items.Clear;
    DBChart1.BottomAxis.SetMinMax(ChartMin2,ChartMax2);
  end;
end;

procedure TCrossPlots.SetMinMax1Click(Sender: TObject);
begin
Canceled:=False;
SetMinMaxComp:=TSetMinMaxComp.Create(CrossPlots);
SetMinMaxComp.VrLabel4.Caption:=DBChart2.Axes.Left.Title.Caption;
SetMinMaxComp.VrLabel5.Caption:=DBChart2.Axes.Bottom.Title.Caption;
SetMinMaxComp.ESBFloatEdit1.Text:=FloatToStr(DBChart2.Axes.Left.Minimum);
SetMinMaxComp.ESBFloatEdit2.Text:=FloatToStr(DBChart2.Axes.Left.Maximum);
SetMinMaxComp.ESBFloatEdit3.Text:=FloatToStr(DBChart2.Axes.Bottom.Minimum);
SetMinMaxComp.ESBFloatEdit4.Text:=FloatToStr(DBChart2.Axes.Bottom.Maximum);
SetMinMaxComp.ShowModal;
SetMinMaxComp.Free;
if Canceled then Exit;
if (ChartMin1<ChartMax1) then
  begin
    DBChart2.LeftAxis.Items.Clear;
    DBChart2.LeftAxis.SetMinMax(ChartMin1,ChartMax1);
  end;
if (ChartMin2<ChartMax2) then
  begin
    DBChart2.BottomAxis.Items.Clear;
    DBChart2.BottomAxis.SetMinMax(ChartMin2,ChartMax2);
  end;
end;

procedure TCrossPlots.SetMinMax2Click(Sender: TObject);
begin
Canceled:=False;
SetMinMaxComp:=TSetMinMaxComp.Create(CrossPlots);
SetMinMaxComp.VrLabel4.Caption:=DBChart3.Axes.Left.Title.Caption;
SetMinMaxComp.VrLabel5.Caption:=DBChart3.Axes.Bottom.Title.Caption;
SetMinMaxComp.ESBFloatEdit1.Text:=FloatToStr(DBChart3.Axes.Left.Minimum);
SetMinMaxComp.ESBFloatEdit2.Text:=FloatToStr(DBChart3.Axes.Left.Maximum);
SetMinMaxComp.ESBFloatEdit3.Text:=FloatToStr(DBChart3.Axes.Bottom.Minimum);
SetMinMaxComp.ESBFloatEdit4.Text:=FloatToStr(DBChart3.Axes.Bottom.Maximum);
SetMinMaxComp.ShowModal;
SetMinMaxComp.Free;
if Canceled then Exit;
if (ChartMin1<ChartMax1) then
  begin
    DBChart3.LeftAxis.Items.Clear;
    DBChart3.LeftAxis.SetMinMax(ChartMin1,ChartMax1);
  end;
if (ChartMin2<ChartMax2) then
  begin
    DBChart3.BottomAxis.Items.Clear;
    DBChart3.BottomAxis.SetMinMax(ChartMin2,ChartMax2);
  end;
end;

procedure TCrossPlots.SetMinMax3Click(Sender: TObject);
begin
Canceled:=False;
SetMinMaxComp:=TSetMinMaxComp.Create(CrossPlots);
SetMinMaxComp.VrLabel4.Caption:=DBChart4.Axes.Left.Title.Caption;
SetMinMaxComp.VrLabel5.Caption:=DBChart4.Axes.Bottom.Title.Caption;
SetMinMaxComp.ESBFloatEdit1.Text:=FloatToStr(DBChart4.Axes.Left.Minimum);
SetMinMaxComp.ESBFloatEdit2.Text:=FloatToStr(DBChart4.Axes.Left.Maximum);
SetMinMaxComp.ESBFloatEdit3.Text:=FloatToStr(DBChart4.Axes.Bottom.Minimum);
SetMinMaxComp.ESBFloatEdit4.Text:=FloatToStr(DBChart4.Axes.Bottom.Maximum);
SetMinMaxComp.ShowModal;
SetMinMaxComp.Free;
if Canceled then Exit;
if (ChartMin1<ChartMax1) then
  begin
    DBChart4.LeftAxis.Items.Clear;
    DBChart4.LeftAxis.SetMinMax(ChartMin1,ChartMax1);
  end;
if (ChartMin2<ChartMax2) then
  begin
    DBChart4.BottomAxis.Items.Clear;
    DBChart4.BottomAxis.SetMinMax(ChartMin2,ChartMax2);
  end;
end;

end.
