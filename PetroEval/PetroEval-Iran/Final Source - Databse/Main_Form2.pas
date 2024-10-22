unit Main_Form2;

interface

uses
  TeeEdit, Dialogs,  Menus, Controls, Forms, Graphics, ExtActns,
  StrUtils, Math, TeEngine, jpeg, ExtCtrls, Classes, StdCtrls, Windows,
  SysUtils, TeeStore, TeeProcs, TeeTools, Series,TeeEditCha, Printers,
  TeeThemeEditor, TeeShape, TreeEd, ComCtrls, ImgList, ToolWin, Types,
  {$IFNDEF CLR}
  TeeJPEG,
  TeeGIF,
  TeePNG,
  TeePCX,
  TeePDFCanvas,
  {$ENDIF}
  TeeSVGCanvas,
  TeePSCanvas,
  TeeVMLCanvas,
  TeeXAMLCanvas,
  TeExport, DB, DBTables, DBChart,
  VrGradient, VrControls, Chart;
type
  TMainForm2 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    ChangeScale1: TMenuItem;
    ChartEditor1: TChartEditor;
    ChartPreviewer1: TChartPreviewer;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    Separator1: TToolButton;
    ToolButton9: TToolButton;
    Separator3: TToolButton;
    Print1: TMenuItem;
    ToolButton2: TToolButton;
    ToolButton10: TToolButton;
    ImageList2: TImageList;
    PrintDialog1: TPrintDialog;
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    General1: TMenuItem;
    Models1: TMenuItem;
    Determin1: TMenuItem;
    Lithology1: TMenuItem;
    Multimin1: TMenuItem;
    DualCompositionModel1: TMenuItem;
    Fluid1: TMenuItem;
    DBChart1: TDBChart;
    Series1: THorizLineSeries;
    Series2: THorizLineSeries;
    Series3: THorizLineSeries;
    DBChart2: TDBChart;
    Series4: THorizLineSeries;
    DBChart3: TDBChart;
    Series5: THorizLineSeries;
    Series6: THorizLineSeries;
    Series7: THorizLineSeries;
    DBChart4: TDBChart;
    HorizLineSeries1: THorizLineSeries;
    HorizLineSeries2: THorizLineSeries;
    HorizLineSeries3: THorizLineSeries;
    ScrollBox2: TScrollBox;
    DBChart5: TDBChart;
    DBChart6: TDBChart;
    DBChart7: TDBChart;
    DBChart8: TDBChart;
    Series8: THorizLineSeries;
    Series9: THorizLineSeries;
    Series10: THorizLineSeries;
    Series11: THorizLineSeries;
    Series12: THorizLineSeries;
    Series13: THorizLineSeries;
    Series14: THorizLineSeries;
    Series15: THorizLineSeries;
    Series16: THorizLineSeries;
    Series17: THorizLineSeries;
    Splitter2: TSplitter;
    Panel2: TPanel;
    Image1: TImage;
    Label2: TLabel;
    Label1: TLabel;
    ChartTool1: TMarksTipTool;
    ChartTool2: TMarksTipTool;
    ChartTool3: TMarksTipTool;
    DBChart9: TDBChart;
    DBChart10: TDBChart;
    Litholog: TTable;
    DataSource3: TDataSource;
    LithologSST: TFloatField;
    LithologSHL: TFloatField;
    LithologLST: TFloatField;
    LithologDOL: TFloatField;
    LithologGPS: TFloatField;
    LithologANH: TFloatField;
    LithologDEPTH: TFloatField;
    Series24: THorizLineSeries;
    Series25: THorizLineSeries;
    Series26: THorizLineSeries;
    Series27: THorizLineSeries;
    Series28: THorizLineSeries;
    Series29: THorizLineSeries;
    VrGradient1: TVrGradient;
    ImageList1: TImageList;
    Image2: TImage;
    Series30: THorizLineSeries;
    Series31: THorizLineSeries;
    Series18: THorizAreaSeries;
    Series19: THorizAreaSeries;
    Series20: THorizAreaSeries;
    Series21: THorizAreaSeries;
    Series22: THorizAreaSeries;
    Series23: THorizAreaSeries;
    ToolButton3: TToolButton;
    MoveTracks1: TMenuItem;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure ChangeScale1Click(Sender: TObject);
    procedure Zooming(Sender: TObject);
    procedure ChartsDragOver(Sender, Source: TObject; X, Y: Integer;
                             State: TDragState; var Accept: Boolean);
    procedure ChartsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TopAxisDrawLabel(Sender:TChartAxis; var X,Y,Z:Integer;
                                                  var Text:String;
                                                  var DrawLabel:Boolean);
    procedure TopAxisInverseDrawLabel(Sender:TChartAxis; var X,Y,Z:Integer;
                                                  var Text:String;
                                                  var DrawLabel:Boolean);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure CheckAxes;
    procedure Print1Click(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
    procedure Determin1Click(Sender: TObject);
    procedure CalculateLithoValues;
    procedure SOLVINGEQU;
    procedure Multimin1Click(Sender: TObject);
    procedure DualCompositionModel1Click(Sender: TObject);
    procedure Fluid1Click(Sender: TObject);
    procedure DBChart1DblClick(Sender: TObject);
    procedure DBChart3DblClick(Sender: TObject);
    procedure DBChart4DblClick(Sender: TObject);
    procedure DBChart1Scroll(Sender: TObject);
    procedure DBChart1UndoZoom(Sender: TObject);
    procedure DBChart9DblClick(Sender: TObject);
    procedure DBChart3Scroll(Sender: TObject);
    procedure DBChart3UndoZoom(Sender: TObject);
    procedure DBChart4UndoZoom(Sender: TObject);
    procedure DBChart4Scroll(Sender: TObject);
    procedure MoveTracks1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);

  private
    { Private declarations }
  public
    Log_Values                 :THorizLineSeries;
    InputLithoMatrix           :array [1..5, 1..6] of single;
    OutputLithoMatrix          :array [1..5] of single;

    Temp_Zoom_File_No     :Smallint;

    RHO_SST,
    RHO_SST_MAX ,
    RHO_SST_MIN ,

    RHO_LST ,
    RHO_LST_MAX ,
    RHO_LST_MIN ,

    RHO_DOL ,
    RHO_DOL_MAX ,
    RHO_DOL_MIN ,

    RHO_SHL ,
    RHO_SHL_MAX ,
    RHO_SHL_MIN ,

    RHO_GPS ,
    RHO_GPS_MAX ,
    RHO_GPS_MIN ,

    RHO_ANH ,
    RHO_ANH_MAX ,
    RHO_ANH_MIN ,

    RHO_WTR ,
    RHO_WTR_MAX ,
    RHO_WTR_MIN ,

    RHO_OIL ,
    RHO_OIL_MAX ,
    RHO_OIL_MIN ,

    DT_SST ,
    DT_SST_MAX ,
    DT_SST_MIN ,

    DT_LST ,
    DT_LST_MAX ,
    DT_LST_MIN ,

    DT_DOL ,
    DT_DOL_MAX ,
    DT_DOL_MIN ,

    DT_SHL ,
    DT_SHL_MAX ,
    DT_SHL_MIN ,

    DT_GPS ,
    DT_GPS_MAX ,
    DT_GPS_MIN ,

    DT_ANH ,
    DT_ANH_MAX ,
    DT_ANH_MIN ,

    DT_WTR ,
    DT_WTR_MAX ,
    DT_WTR_MIN ,

    DT_OIL ,
    DT_OIL_MAX ,
    DT_OIL_MIN ,

    GR_SST ,
    GR_SST_MAX ,
    GR_SST_MIN ,

    GR_LST ,
    GR_LST_MAX ,
    GR_LST_MIN ,

    GR_DOL ,
    GR_DOL_MAX ,
    GR_DOL_MIN ,

    GR_SHL ,
    GR_SHL_MAX ,
    GR_SHL_MIN ,

    GR_GPS ,
    GR_GPS_MAX ,
    GR_GPS_MIN ,

    GR_ANH ,
    GR_ANH_MAX ,
    GR_ANH_MIN ,

    GR_WTR ,
    GR_WTR_MAX ,
    GR_WTR_MIN ,

    GR_OIL ,
    GR_OIL_MAX ,
    GR_OIL_MIN ,

    PEF_SST ,
    PEF_SST_MAX ,
    PEF_SST_MIN ,

    PEF_LST ,
    PEF_LST_MAX ,
    PEF_LST_MIN ,

    PEF_DOL ,
    PEF_DOL_MAX ,
    PEF_DOL_MIN ,

    PEF_SHL ,
    PEF_SHL_MAX ,
    PEF_SHL_MIN ,

    PEF_GPS ,
    PEF_GPS_MAX ,
    PEF_GPS_MIN ,

    PEF_ANH ,
    PEF_ANH_MAX ,
    PEF_ANH_MIN ,

    PEF_WTR ,
    PEF_WTR_MAX ,
    PEF_WTR_MIN ,

    PEF_OIL ,
    PEF_OIL_MAX ,
    PEF_OIL_MIN ,

    NPHI_SST ,
    NPHI_SST_MAX ,
    NPHI_SST_MIN ,

    NPHI_LST ,
    NPHI_LST_MAX ,
    NPHI_LST_MIN ,

    NPHI_DOL ,
    NPHI_DOL_MAX ,
    NPHI_DOL_MIN ,

    NPHI_SHL ,
    NPHI_SHL_MAX ,
    NPHI_SHL_MIN ,

    NPHI_GPS ,
    NPHI_GPS_MAX ,
    NPHI_GPS_MIN ,

    NPHI_ANH ,
    NPHI_ANH_MAX ,
    NPHI_ANH_MIN ,

    NPHI_WTR ,
    NPHI_WTR_MAX ,
    NPHI_WTR_MIN ,

    NPHI_OIL ,
    NPHI_OIL_MAX ,
    NPHI_OIL_MIN ,

    RES_SST ,
    RES_SST_MAX ,
    RES_SST_MIN ,

    RES_LST ,
    RES_LST_MAX ,
    RES_LST_MIN ,

    RES_DOL ,
    RES_DOL_MAX ,
    RES_DOL_MIN ,

    RES_SHL ,
    RES_SHL_MAX ,
    RES_SHL_MIN ,

    RES_GPS ,
    RES_GPS_MAX ,
    RES_GPS_MIN ,

    RES_ANH ,
    RES_ANH_MAX ,
    RES_ANH_MIN ,

    RES_WTR ,
    RES_WTR_MAX ,
    RES_WTR_MIN ,

    Sst_Percentage,
    Lst_Percentage,
    Dolomite_Percentage,
    Shale_Percentage             :Single;

    SST_Checked,
    SHL_Checked,
    LST_Checked,
    WTR_Checked,
    OIL_Checked,
    Operation_Canceled          :Boolean;

    Temp_Zoom_File             :String;


    { Public declarations }
  end;

const
  Precision_Value = -4;
  NoLithologies   = 5;
  RHO_RNG  = 0.25;
  DT_RNG   = 25;
  GR_RNG   = 25;
  PEF_RNG  = 0.5;
  RES_RNG  = 250;
  NPHI_RNG = 1;

var
  MainForm2               :TMainForm2;
  Lines                   :TStringList;
  Depth_Value             :Single;
  Log_Value               :Single;
  Log_Scale               :Single;
  File_Opened             :Boolean;
  DBCharts                :array [1..5] of TDBChart;

implementation

uses ZoomedChart, PreviewForm, FirstForm,
     LithoMultiminForm, FluidModelForm, PHISelectForm, LithoDualForm,
     LoadForm;


{$R *.dfm}

procedure TMainForm2.FormCreate(Sender: TObject);
begin

  DBCharts[1]:=DBChart1;
  DBCharts[2]:=DBChart2;
  DBCharts[3]:=DBChart3;
  DBCharts[4]:=DBChart4;
  DBCharts[5]:=DBChart9;

  DT_SST := 50.5;
  DT_SST_MAX := DT_SST + DT_RNG;
  DT_SST_MIN := DT_SST - DT_RNG;

  DT_LST := 47.8;
  DT_LST_MAX := DT_LST + DT_RNG;
  DT_LST_MIN := DT_LST - DT_RNG;

  DT_DOL := 44;
  DT_DOL_MAX := DT_DOL + DT_RNG;
  DT_DOL_MIN := DT_DOL - DT_RNG;

  DT_SHL := 85.4;
  DT_SHL_MAX := DT_SHL + DT_RNG;
  DT_SHL_MIN := DT_SHL - DT_RNG;

  DT_GPS := 52;
  DT_GPS_MAX := DT_GPS + DT_RNG;
  DT_GPS_MIN := DT_GPS - DT_RNG;

  DT_ANH := 50;
  DT_ANH_MAX := DT_ANH + DT_RNG;
  DT_ANH_MIN := DT_ANH - DT_RNG;

  DT_WTR := 189;
  DT_WTR_MAX := DT_WTR + DT_RNG;
  DT_WTR_MIN := DT_WTR - DT_RNG;

  DT_OIL := 189;
  DT_OIL_MAX := DT_OIL + DT_RNG;
  DT_OIL_MIN := DT_OIL - DT_RNG;

  RHO_SST := 2.65;
  RHO_SST_MAX := RHO_SST + RHO_RNG;
  RHO_SST_MIN := RHO_SST - RHO_RNG;

  RHO_LST := 2.71;
  RHO_LST_MAX := RHO_LST + RHO_RNG;
  RHO_LST_MIN := RHO_LST - RHO_RNG;

  RHO_DOL := 2.87;
  RHO_DOL_MAX := RHO_DOL + RHO_RNG;
  RHO_DOL_MIN := RHO_DOL - RHO_RNG;

  RHO_SHL := 2.78;
  RHO_SHL_MAX := RHO_SHL + RHO_RNG;
  RHO_SHL_MIN := RHO_SHL - RHO_RNG;

  RHO_GPS := 2.32;
  RHO_GPS_MAX := RHO_GPS + RHO_RNG;
  RHO_GPS_MIN := RHO_GPS - RHO_RNG;

  RHO_ANH := 2.9;
  RHO_ANH_MAX := RHO_ANH + RHO_RNG;
  RHO_ANH_MIN := RHO_ANH - RHO_RNG;

  RHO_WTR := 1.05;
  RHO_WTR_MAX := RHO_WTR + RHO_RNG;
  RHO_WTR_MIN := RHO_WTR - RHO_RNG;

  RHO_OIL := 0.634;
  RHO_OIL_MAX := RHO_OIL + RHO_RNG;
  RHO_OIL_MIN := RHO_OIL - RHO_RNG;

  GR_SST := 1;
  GR_SST_MAX := GR_SST + GR_RNG;
  GR_SST_MIN := GR_SST - GR_RNG;

  GR_LST := 11;
  GR_LST_MAX := GR_LST + GR_RNG;
  GR_LST_MIN := GR_LST - GR_RNG;

  GR_DOL := 8;
  GR_DOL_MAX := GR_DOL + GR_RNG;
  GR_DOL_MIN := GR_DOL - GR_RNG;

  GR_SHL := 160;
  GR_SHL_MAX := GR_SHL + GR_RNG;
  GR_SHL_MIN := GR_SHL - GR_RNG;

  GR_GPS := 10;
  GR_GPS_MAX := GR_GPS + GR_RNG;
  GR_GPS_MIN := GR_GPS - GR_RNG;

  GR_ANH := 10;
  GR_ANH_MAX := GR_ANH + GR_RNG;
  GR_ANH_MIN := GR_ANH - GR_RNG;

  GR_WTR := 0.01;
  GR_WTR_MAX := GR_WTR + GR_RNG;
  GR_WTR_MIN := GR_WTR - GR_RNG;

  GR_OIL := 0.01;
  GR_OIL_MAX := GR_OIL + GR_RNG;
  GR_OIL_MIN := GR_OIL - GR_RNG;

  PEF_SST := 1.8;
  PEF_SST_MAX := PEF_SST + PEF_RNG;
  PEF_SST_MIN := PEF_SST - PEF_RNG;

  PEF_LST := 5.1;
  PEF_LST_MAX := PEF_LST + PEF_RNG;
  PEF_LST_MIN := PEF_LST - PEF_RNG;

  PEF_DOL := 3.1;
  PEF_DOL_MAX := PEF_DOL + PEF_RNG;
  PEF_DOL_MIN := PEF_DOL - PEF_RNG;

  PEF_SHL := 3.5;
  PEF_SHL_MAX := PEF_SHL + PEF_RNG;
  PEF_SHL_MIN := PEF_SHL - PEF_RNG;

  PEF_GPS := 4;
  PEF_GPS_MAX := PEF_GPS + PEF_RNG;
  PEF_GPS_MIN := PEF_GPS - PEF_RNG;

  PEF_ANH := 5.1;
  PEF_ANH_MAX := PEF_ANH + PEF_RNG;
  PEF_ANH_MIN := PEF_ANH - PEF_RNG;

  PEF_WTR := 0.01;
  PEF_WTR_MAX := PEF_WTR + PEF_RNG;
  PEF_WTR_MIN := PEF_WTR - PEF_RNG;

  PEF_OIL := 0.01;
  PEF_OIL_MAX := PEF_OIL + PEF_RNG;
  PEF_OIL_MIN := PEF_OIL - PEF_RNG;

  NPHI_SST := -2;
  NPHI_SST_MAX := NPHI_SST + NPHI_RNG;
  NPHI_SST_MIN := NPHI_SST - NPHI_RNG;

  NPHI_LST := 1;
  NPHI_LST_MAX := NPHI_LST + NPHI_RNG;
  NPHI_LST_MIN := NPHI_LST - NPHI_RNG;

  NPHI_DOL := 1;
  NPHI_DOL_MAX := NPHI_DOL + NPHI_RNG;
  NPHI_DOL_MIN := NPHI_DOL - NPHI_RNG;

  NPHI_SHL := 30;
  NPHI_SHL_MAX := NPHI_SHL + NPHI_RNG;
  NPHI_SHL_MIN := NPHI_SHL - NPHI_RNG;

  NPHI_GPS := 70;
  NPHI_GPS_MAX := NPHI_GPS + NPHI_RNG;
  NPHI_GPS_MIN := NPHI_GPS - NPHI_RNG;

  NPHI_ANH := -2;
  NPHI_ANH_MAX := NPHI_ANH + NPHI_RNG;
  NPHI_ANH_MIN := NPHI_ANH - NPHI_RNG;

  NPHI_WTR := 1;
  NPHI_WTR_MAX := NPHI_WTR + NPHI_RNG;
  NPHI_WTR_MIN := NPHI_WTR - NPHI_RNG;

  RES_SST := 5000;
  RES_SST_MAX := RES_SST + RES_RNG;
  RES_SST_MIN := RES_SST - RES_RNG;

  RES_LST := 10000;
  RES_LST_MAX := RES_LST + RES_RNG;
  RES_LST_MIN := RES_LST - RES_RNG;

  RES_DOL := 10000;
  RES_DOL_MAX := RES_DOL + RES_RNG;
  RES_DOL_MIN := RES_DOL - RES_RNG;

  RES_SHL := 10;
  RES_SHL_MAX := RES_SHL + RES_RNG;
  RES_SHL_MIN := RES_SHL - RES_RNG;

  RES_GPS := 5000;
  RES_GPS_MAX := RES_GPS + RES_RNG;
  RES_GPS_MIN := RES_GPS - RES_RNG;

  RES_ANH := 5000;
  RES_ANH_MAX := RES_ANH + RES_RNG;
  RES_ANH_MIN := RES_ANH - RES_RNG;

  RES_WTR := 1;
  RES_WTR_MAX := RES_WTR + RES_RNG;
  RES_WTR_MIN := RES_WTR - RES_RNG;

end;

procedure TMainForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Visible:=False;
end;

procedure TMainForm2.TopAxisDrawLabel(Sender:TChartAxis; var X,Y,Z:Integer;
                                               var Text:String;
                                               var DrawLabel:Boolean);
begin
with Sender do
  begin
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
end;

procedure TMainForm2.TopAxisInverseDrawLabel(Sender:TChartAxis; var X,Y,Z:Integer;
                                               var Text:String;
                                               var DrawLabel:Boolean);
begin
with Sender do
  begin
    if X=CalcPosValue(Minimum) then  // first label
      begin
        with ParentChart.Canvas do
          begin
            TextAlign:=TextAlign - TA_CENTER + TA_RIGHT;  // align to right
            Font.Style:=[fsBold];
          end;
      end
    else
      if X=CalcPosValue(Maximum) then  // last label
        begin
          with ParentChart.Canvas do
            begin
              TextAlign:=TextAlign - TA_CENTER + TA_LEFT; // align to left
              Font.Style:=[fsBold];
            end;
        end;
  end;
end;

procedure TMainForm2.Exit1Click(Sender: TObject);
begin
    Close;
end;

procedure TMainForm2.ChangeScale1Click(Sender: TObject);
var
Scale_Value:String;
Clicked_Ok:Boolean;
Temp_Value:Integer;
ConversionUnit:Single;
begin
  if not Load_Form.Database_Opened then Exit;
  ConversionUnit:=0;
  Scale_Value:=FloatToStr(Log_Scale);
  Clicked_Ok:=InputQuery('Scale Value', 'Please enter the scale value:', Scale_Value);
  if Clicked_Ok then
    begin
      Log_Scale:=StrToFloat(Scale_Value);
      if OpenedFile.DepthUnit='FT' then
        begin
          ConversionUnit:=1152;
        end;
      if OpenedFile.DepthUnit='F' then
        begin
          ConversionUnit:=1152;
        end;
      if OpenedFile.DepthUnit='M' then
        begin
          ConversionUnit:=3779.527559055;
        end;
      if OpenedFile.DepthUnit='SEC' then
        begin
          ConversionUnit:=Log_Scale;
        end;
      Temp_Value:=DBChart1.MarginBottom + DBChart1.ChartRect.Top;
      with DBChart1 do
        DBChart1.Height:=Round((Series[0].MaxYValue - Series[0].MinYValue) * ConversionUnit / Log_Scale) + Temp_Value;
      DBChart2.Height:=DBChart1.Height;
      DBChart3.Height:=DBChart1.Height;
      DBChart4.Height:=DBChart1.Height;
      DBChart9.Height:=DBChart1.Height;
    end;
end;

procedure TMainForm2.Zooming( Sender: TObject);
begin
  with Sender as TDBChart do
    begin
      Temp_Zoom_File_No:=Temp_Zoom_File_No+1;
      Temp_Zoom_File:='petroeval_temp'+IntToStr(Tag)+IntToStr(Temp_Zoom_File_No);
      SaveChartToFile(TCustomChart(Sender),Temp_Zoom_File,True);
      ZoomChart:=TZoomChart.Create(Application);
      UndoZoom;
      ZoomChart.Show;
    end;
end;

procedure TMainForm2.ChartsDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TDBChart;
end;

procedure TMainForm2.ChartsDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  i: Smallint;
  TempChart: TDBChart;
  Source_Tag:Shortint;
  Sender_Tag:Shortint;
begin
  if Sender=Source then Exit;
  Source_Tag:=-1;
  Sender_Tag:=-1;
  if (Sender is TDBChart)and(Source is TDBChart) then
    begin

      with Source as TDBChart do
        begin
          for i:=1 to 5 do
            if Source=DBCharts[i] then Source_Tag:=i;
        end;
      with Sender as TDBChart do
        begin
          for i:=1 to 5 do
            if Sender=DBCharts[i] then Sender_Tag:=i;
        end;

      TempChart:=DBCharts[Source_Tag];
      DBCharts[Source_Tag]:=DBCharts[Sender_Tag];
      DBCharts[Sender_Tag]:=TempChart;

      DBCharts[1].Left:=0;
      for i:=2 to 5 do
        begin
          DBCharts[i].Left:= DBCharts[i-1].Left + DBCharts[i-1].Width;
        end;

      DBChart5.Left:=DBChart1.Left;
      DBChart6.Left:=DBChart2.Left;
      DBChart7.Left:=DBChart3.Left;
      DBChart8.Left:=DBChart4.Left;
      DBChart10.Left:=DBChart9.Left;
    end;

end;

procedure TMainForm2.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Separator3.Width:=NewWidth - (Width - Separator3.Width);
end;

procedure TMainForm2.Print1Click(Sender: TObject);
begin
  if not Load_Form.Database_Opened then Exit;
 Preview_Form:=TPreview_Form.Create(Self);
 Preview_Form.ShowModal;
 Preview_Form.Free;
end;

procedure TMainForm2.Panel2Resize(Sender: TObject);
begin
  Label1.Left:=Trunc((Panel2.Width-Label1.Width)/2);
  Label2.Left:=Trunc((Panel2.Width-Label2.Width)/2);
  Image2.Left:=Trunc((Panel2.Width-Image2.Width-8));
end;

procedure TMainForm2.Determin1Click(Sender: TObject);
var
i,j: integer;
Depth_Value, TempValue: Single;
Normalizer: Single;
ErrorCode:integer;
begin
  if not Load_Form.Database_Opened then Exit;
  Operation_Canceled:=False;

  Lithology_Multimin_Form:=TLithology_Multimin_Form.Create(Self);
  Lithology_Multimin_Form.ShowModal;
  if Operation_Canceled then Exit;

  if SST_Checked then
    begin
      InputLithoMatrix[1,1]:=DT_SST;
      InputLithoMatrix[2,1]:=RHO_SST;
      InputLithoMatrix[3,1]:=GR_SST;
      InputLithoMatrix[4,1]:=PEF_SST;
    end
  else
    begin
      InputLithoMatrix[1,1]:=0;
      InputLithoMatrix[2,1]:=0;
      InputLithoMatrix[3,1]:=0;
      InputLithoMatrix[4,1]:=0;
    end;

  if SHL_Checked then
    begin
      InputLithoMatrix[1,2]:=DT_SHL;
      InputLithoMatrix[2,2]:=RHO_SHL;
      InputLithoMatrix[3,2]:=GR_SHL;
      InputLithoMatrix[4,2]:=PEF_SHL;
    end
  else
    begin
      InputLithoMatrix[1,2]:=0;
      InputLithoMatrix[2,2]:=0;
      InputLithoMatrix[3,2]:=0;
      InputLithoMatrix[4,2]:=0;
    end;

  if LST_Checked then
    begin
      InputLithoMatrix[1,3]:=DT_LST;
      InputLithoMatrix[2,3]:=RHO_LST;
      InputLithoMatrix[3,3]:=GR_LST;
      InputLithoMatrix[4,3]:=PEF_LST;
    end
  else
    begin
      InputLithoMatrix[1,3]:=0;
      InputLithoMatrix[2,3]:=0;
      InputLithoMatrix[3,3]:=0;
      InputLithoMatrix[4,3]:=0;
    end;

  if WTR_Checked then
    begin
      InputLithoMatrix[1,4]:=DT_WTR;
      InputLithoMatrix[2,4]:=RHO_WTR;
      InputLithoMatrix[3,4]:=GR_WTR;
      InputLithoMatrix[4,4]:=PEF_WTR;
    end
  else
    begin
      InputLithoMatrix[1,4]:=0;
      InputLithoMatrix[2,4]:=0;
      InputLithoMatrix[3,4]:=0;
      InputLithoMatrix[4,4]:=0;
    end;

  if OIL_Checked then
    begin
      InputLithoMatrix[1,5]:=DT_OIL;
      InputLithoMatrix[2,5]:=RHO_OIL;
      InputLithoMatrix[3,5]:=GR_OIL;
      InputLithoMatrix[4,5]:=PEF_OIL;
    end
  else
    begin
      InputLithoMatrix[1,5]:=0;
      InputLithoMatrix[2,5]:=0;
      InputLithoMatrix[3,5]:=0;
      InputLithoMatrix[4,5]:=0;
    end;

  InputLithoMatrix[5,1]:=1;
  InputLithoMatrix[5,2]:=1;
  InputLithoMatrix[5,3]:=1;
  InputLithoMatrix[5,4]:=1;
  InputLithoMatrix[5,5]:=1;
  InputLithoMatrix[5,6]:=1;

  with OpenedFile do
    begin
      Values.Open;
      Values.DisableControls;
      Values.First;
    end;

  if LithoLog.Exists then
    begin
      Litholog.Close;
      LithoLog.EmptyTable;
      lithoLog.DeleteTable;
    end;

  Litholog.CreateTable;
  LithoLog.Open;
  LithoLog.Edit;
  LithoLog.DisableControls;

  with Load_Form do
  for i:=0 to OpenedFile.NoRecords-1 do
    begin

      if DT_Track_Number>=0 then
        begin
          Val(OpenedFile.Values.Fields[DT_Track_Number].AsString, TempValue, ErrorCode);
          if (ErrorCode=0)and(TempValue<>OpenedFile.NullValue) then
            begin
              InputLithoMatrix[1,6]:=TempValue;
            end
          else
            InputLithoMatrix[1,6]:=0;
        end
      else
        InputLithoMatrix[1,6]:=0;

      if RHO_Track_Number>=0 then
        begin
          Val(OpenedFile.Values.Fields[RHO_Track_Number].AsString, TempValue, ErrorCode);
          if (ErrorCode=0)and(TempValue<>OpenedFile.NullValue) then
            begin
              InputLithoMatrix[2,6]:=TempValue;
            end
          else
            InputLithoMatrix[2,6]:=0;
        end
      else
        InputLithoMatrix[2,6]:=0;

      if GR_Track_Number>=0 then
        begin
          Val(OpenedFile.Values.Fields[GR_Track_Number].AsString, TempValue, ErrorCode);
          if (ErrorCode=0)and(TempValue<>OpenedFile.NullValue) then
            begin
              InputLithoMatrix[3,6]:=TempValue;
            end
          else
            InputLithoMatrix[3,6]:=0;
        end
      else
        InputLithoMatrix[3,6]:=0;

      if PEF_Track_Number>=0 then
        begin
          Val(OpenedFile.Values.Fields[PEF_Track_Number].AsString, TempValue, ErrorCode);
          if (ErrorCode=0)and(TempValue<>OpenedFile.NullValue) then
            begin
              InputLithoMatrix[4,6]:=TempValue;
            end
          else
            InputLithoMatrix[4,6]:=0;
        end
      else
        InputLithoMatrix[4,6]:=0;

      for j:=1 to NoLithologies do
        OutputLithoMatrix[j]:=0;

      Normalizer:=0;
      Depth_Value:=OpenedFile.Values.Fields[0].Value;

      CalculateLithoValues;
//      SOLVINGEQU;

      for j:=1 to NoLithologies do
        if OutputLithoMatrix[j]<0 then OutputLithoMatrix[j]:=0;

      for j:=1 to NoLithologies do
        Normalizer:=Normalizer + OutputLithoMatrix[j];

      if Normalizer<>0 then
        for j:=1 to NoLithologies do
          OutputLithoMatrix[j]:= OutputLithoMatrix[j] / Normalizer;

      LithoLog.Append;
      LithoLog.Fields[0].Value:=Depth_Value;
      LithoLog.Fields[1].Value:=OutputLithoMatrix[1];
      LithoLog.Fields[2].Value:=OutputLithoMatrix[2];
      LithoLog.Fields[3].Value:=OutputLithoMatrix[3];
      LithoLog.Fields[4].Value:=OutputLithoMatrix[4];
      LithoLog.Fields[5].Value:=OutputLithoMatrix[5];

      OpenedFile.Values.Next;

      with Lithology_Multimin_Form do
        begin
          DT_Track_Number:=ComboBox1.ItemIndex;
          RHO_Track_Number:=ComboBox2.ItemIndex;
          GR_Track_Number:=ComboBox3.ItemIndex;
          PEF_Track_Number:=ComboBox4.ItemIndex;
          LLD_Track_Number:=ComboBox5.ItemIndex;
          NPHI_Track_Number:=ComboBox6.ItemIndex;
        end;

    end;
  Lithology_Multimin_Form.Free;
  LithoLog.EnableControls;
  OpenedFile.Values.EnableControls;

  DBChart9.Series[0].YValues.ValueSource:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[0].YValues.Name:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[0].XValues.ValueSource:=LithoLog.FieldDefs[1].Name;
  DBChart9.Series[0].XValues.Name:=LithoLog.FieldDefs[1].Name;
  DBChart9.Series[0].DataSource:=LithoLog;

  DBChart9.Series[1].YValues.ValueSource:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[1].YValues.Name:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[1].XValues.ValueSource:=LithoLog.FieldDefs[2].Name;
  DBChart9.Series[1].XValues.Name:=LithoLog.FieldDefs[2].Name;
  DBChart9.Series[1].DataSource:=LithoLog;

  DBChart9.Series[2].YValues.ValueSource:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[2].YValues.Name:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[2].XValues.ValueSource:=LithoLog.FieldDefs[3].Name;
  DBChart9.Series[2].XValues.Name:=LithoLog.FieldDefs[3].Name;
  DBChart9.Series[2].DataSource:=LithoLog;

  DBChart9.Series[3].YValues.ValueSource:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[3].YValues.Name:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[3].XValues.ValueSource:=LithoLog.FieldDefs[4].Name;
  DBChart9.Series[3].XValues.Name:=LithoLog.FieldDefs[4].Name;
  DBChart9.Series[3].DataSource:=LithoLog;

  DBChart9.Series[4].YValues.ValueSource:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[4].YValues.Name:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[4].XValues.ValueSource:=LithoLog.FieldDefs[5].Name;
  DBChart9.Series[4].XValues.Name:=LithoLog.FieldDefs[5].Name;
  DBChart9.Series[4].DataSource:=LithoLog;

  DBChart9.Series[5].YValues.ValueSource:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[5].YValues.Name:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[5].XValues.ValueSource:=LithoLog.FieldDefs[6].Name;
  DBChart9.Series[5].XValues.Name:=LithoLog.FieldDefs[6].Name;
  DBChart9.Series[5].DataSource:=LithoLog;

    for i:=0 to 5 do
      DBChart9.Series[i].CheckDataSource;
  CheckAxes;
end;

procedure TMainForm2.CalculateLithoValues;
var
n,i,j,k:integer;
u:single;
begin
n:=NoLithologies;
for k:=1 to n-1 do
  begin
    for i:=k+1 to n do
      begin
        if InputLithoMatrix[k,k]<>0 then
          u:=InputLithoMatrix[i,k]/InputLithoMatrix[k,k]
        else
          u:=0;
        for j:=k to n+1 do
          InputLithoMatrix[i,j]:=InputLithoMatrix[i,j]-u*InputLithoMatrix[k,j];
      end;
  end;
for i:=n downto 1 do
  begin
    if InputLithoMatrix[i,i]<>0 then
      OutputLithoMatrix[i]:=(InputLithoMatrix[i,n+1]/InputLithoMatrix[i,i])
    else
      OutputLithoMatrix[i]:=0;
    for j:=n+1 downto i+1 do
      if InputLithoMatrix[i,i]<>0 then
        OutputLithoMatrix[i]:=((-InputLithoMatrix[i,j]*OutputLithoMatrix[j])/InputLithoMatrix[i,i])+OutputLithoMatrix[i]
      else
        OutputLithoMatrix[i]:=0;
  end;
end;


procedure TMainForm2.SOLVINGEQU;
var
N,I,J,K,ITMP:integer;
INDX: array [1..5] of Integer;
B,C: array [1..5] of single;
C1,PI,PI1,PJ:Single;
begin
 N:=NoLithologies;
 for i:=1 to N do
   begin
     INDX[i]:=0;
     C[i]:=0;
     B[i]:=0;
   end;

 for I := 1 to N do
   INDX[I] := I;

 for I := 1 to N do
  begin
   C1 := 0.0;
   for J := 1 to N do
     C1 := Max(C1,ABS(InputLithoMatrix[I,J]));

   C[I] := C1;
  END;

 for J :=1 to N-1 do
  begin
   PI1 := 0.0;
   K:=0;
   for I := J to N do
    begin
     if C[INDX[I]]<>0 then
       PI := ABS(InputLithoMatrix[INDX[I],J])/C[INDX[I]]
     else
       PI:=0;
     IF (PI>PI1) THEN
       begin
         PI1 := PI;
         K   := I;
       END;
    END;
   ITMP    := INDX[J];
   INDX[J] := INDX[K];
   INDX[K] := ITMP;
   for I := J+1 to N do
    begin
     if InputLithoMatrix[INDX[J],J]<>0 then
       PJ  := InputLithoMatrix[INDX[I],J]/InputLithoMatrix[INDX[J],J]
     else
       PJ:=0;
     InputLithoMatrix[INDX[I],J] := PJ;
     for K :=J+1 to N do
       InputLithoMatrix[INDX[I],K] := InputLithoMatrix[INDX[I],K]-PJ*InputLithoMatrix[INDX[J],K];
    END;
  END;

 for I := 1 to N-1 do
   for J := I+1 to N do
     B[INDX[J]]:=B[INDX[J]]-InputLithoMatrix[INDX[J],I]*B[INDX[I]];

 for I := N downto 1 do
  begin
   OutputLithoMatrix[I] := B[INDX[I]];
   for J := I+1 to N do
    begin
     OutputLithoMatrix[I] := OutputLithoMatrix[I]-InputLithoMatrix[INDX[I],J]*OutputLithoMatrix[J];
    end;
   if InputLithoMatrix[INDX[I],I]<>0 then
     OutputLithoMatrix[I] := OutputLithoMatrix[I]/InputLithoMatrix[INDX[I],I]
   else
     OutputLithoMatrix[I]:=0;
  END;
end;


procedure TMainForm2.Multimin1Click(Sender: TObject);
var
i,j: integer;
Depth_Value, TempValue: Single;
LithoMatrix: array [1..3] of Byte;
FinalLithoMatrix: array [1..3] of Single;
ValueMatrix: array [1..4] of Single;
NoLithologies: Shortint;
ErrorCode:integer;
begin
  if not Load_Form.Database_Opened then Exit;
  Operation_Canceled:=False;
  Lithology_Multimin_Form:=TLithology_Multimin_Form.Create(Self);
  with Lithology_Multimin_Form do
    begin
      ComboBox5.Visible:=False;
      ComboBox6.Visible:=False;
      Label5.Visible:=False;
      Label6.Visible:=False;
    end;
  Lithology_Multimin_Form.ShowModal;
  if Operation_Canceled then Exit;

  with OpenedFile do
    begin
      Values.Open;
      Values.DisableControls;
      Values.First;
    end;

  if LithoLog.Exists then
    begin
      Litholog.Close;
      LithoLog.EmptyTable;
      lithoLog.DeleteTable;
    end;

  Litholog.CreateTable;
  LithoLog.Open;
  LithoLog.Edit;
  LithoLog.DisableControls;

  with Load_Form do
  for i:=0 to OpenedFile.NoRecords-1 do
    begin

      if DT_Track_Number>=0 then
        begin
          Val(OpenedFile.Values.Fields[DT_Track_Number].AsString, TempValue, ErrorCode);
          if (ErrorCode=0)and(TempValue<>OpenedFile.NullValue) then
            begin
              ValueMatrix[1]:=TempValue;
            end
          else
            ValueMatrix[1]:=0;
        end
      else
        ValueMatrix[1]:=0;
      if RHO_Track_Number>=0 then
        begin
          Val(OpenedFile.Values.Fields[RHO_Track_Number].AsString, TempValue, ErrorCode);
          if (ErrorCode=0)and(TempValue<>OpenedFile.NullValue) then
            begin
              ValueMatrix[2]:=TempValue;
            end
          else
            ValueMatrix[2]:=0;
        end
      else
        ValueMatrix[2]:=0;
      if GR_Track_Number>=0 then
        begin
          Val(OpenedFile.Values.Fields[GR_Track_Number].AsString, TempValue, ErrorCode);
          if (ErrorCode=0)and(TempValue<>OpenedFile.NullValue) then
            begin
              ValueMatrix[3]:=TempValue;
            end
          else
            ValueMatrix[3]:=0;
        end
      else
        ValueMatrix[3]:=0;
      if PEF_Track_Number>=0 then
        begin
          Val(OpenedFile.Values.Fields[PEF_Track_Number].AsString, TempValue, ErrorCode);
          if (ErrorCode=0)and(TempValue<>OpenedFile.NullValue) then
            begin
              ValueMatrix[4]:=TempValue;
            end
          else
            ValueMatrix[4]:=0;
        end
      else
        ValueMatrix[4]:=0;

      for j:=1 to 4 do
        LithoMatrix[j]:=0;

//Sandstone
        if SST_Checked then
{DT}      if (ValueMatrix[1]>=DT_SST_MIN)and(ValueMatrix[1]<=DT_SST_MAX) then
{RHOB}      if (ValueMatrix[2]>=RHO_SST_MIN)and(ValueMatrix[2]<=RHO_SST_MAX) then
{GR}          if (ValueMatrix[3]>=GR_SST_MIN)and(ValueMatrix[3]<=GR_SST_MAX) then
{PEF}           if (ValueMatrix[4]>=PEF_SST_MIN)and(ValueMatrix[4]<=PEF_SST_MAX) then
                  LithoMatrix[1]:=1;
//Shale
        if SHL_Checked then
{DT}      if (ValueMatrix[1]>=DT_SHL_MIN)and(ValueMatrix[1]<=DT_SHL_MAX) then
{RHOB}      if (ValueMatrix[2]>=RHO_SHL_MIN)and(ValueMatrix[2]<=RHO_SHL_MAX) then
{GR}          if (ValueMatrix[3]>=GR_SHL_MIN)and(ValueMatrix[3]<=GR_SHL_MAX) then
{PEF}           if (ValueMatrix[4]>=PEF_SHL_MIN)and(ValueMatrix[4]<=PEF_SHL_MAX) then
                  LithoMatrix[2]:=1;

//Calcite
        if LST_Checked then
{DT}      if (ValueMatrix[1]>=DT_LST_MIN)and(ValueMatrix[1]<=DT_LST_MAX) then
{RHOB}      if (ValueMatrix[2]>=RHO_LST_MIN)and(ValueMatrix[2]<=RHO_LST_MAX) then
{GR}          if (ValueMatrix[3]>=GR_LST_MIN)and(ValueMatrix[3]<=GR_LST_MAX) then
{PEF}           if (ValueMatrix[4]>=PEF_LST_MIN)and(ValueMatrix[4]<=PEF_LST_MAX) then
                  LithoMatrix[3]:=1;

///////////////////////////////////////////////////////////////////////////////

      NoLithologies:=0;
      for j:=1 to 3 do
        NoLithologies:=NoLithologies + LithoMatrix[j];

      if NoLithologies>0 then
        for j:=1 to 3 do
          FinalLithoMatrix[j]:= LithoMatrix[j] / NoLithologies;


      Depth_Value:=OpenedFile.Values.Fields[0].Value;

      LithoLog.Edit;
      LithoLog.Append;
      LithoLog.Fields[0].Value:=Depth_Value;
      LithoLog.Fields[1].Value:=FinalLithoMatrix[1];
      LithoLog.Fields[2].Value:=FinalLithoMatrix[2];
      LithoLog.Fields[3].Value:=FinalLithoMatrix[3];

      OpenedFile.Values.Next;

      with Lithology_Multimin_Form do
        begin
          DT_Track_Number:=ComboBox1.ItemIndex;
          RHO_Track_Number:=ComboBox2.ItemIndex;
          GR_Track_Number:=ComboBox3.ItemIndex;
          PEF_Track_Number:=ComboBox4.ItemIndex;
        end;

    end;
  Lithology_Multimin_Form.Free;
  LithoLog.EnableControls;
  OpenedFile.Values.EnableControls;

  DBChart9.Series[0].YValues.ValueSource:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[0].YValues.Name:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[0].XValues.ValueSource:=LithoLog.FieldDefs[1].Name;
  DBChart9.Series[0].XValues.Name:=LithoLog.FieldDefs[1].Name;
  DBChart9.Series[0].DataSource:=LithoLog;

  DBChart9.Series[1].YValues.ValueSource:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[1].YValues.Name:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[1].XValues.ValueSource:=LithoLog.FieldDefs[2].Name;
  DBChart9.Series[1].XValues.Name:=LithoLog.FieldDefs[2].Name;
  DBChart9.Series[1].DataSource:=LithoLog;

  DBChart9.Series[2].YValues.ValueSource:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[2].YValues.Name:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[2].XValues.ValueSource:=LithoLog.FieldDefs[3].Name;
  DBChart9.Series[2].XValues.Name:=LithoLog.FieldDefs[3].Name;
  DBChart9.Series[2].DataSource:=LithoLog;

  DBChart9.Series[3].YValues.ValueSource:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[3].YValues.Name:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[3].XValues.ValueSource:=LithoLog.FieldDefs[4].Name;
  DBChart9.Series[3].XValues.Name:=LithoLog.FieldDefs[4].Name;
  DBChart9.Series[3].DataSource:=LithoLog;

  DBChart9.Series[4].YValues.ValueSource:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[4].YValues.Name:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[4].XValues.ValueSource:=LithoLog.FieldDefs[5].Name;
  DBChart9.Series[4].XValues.Name:=LithoLog.FieldDefs[5].Name;
  DBChart9.Series[4].DataSource:=LithoLog;

  DBChart9.Series[5].YValues.ValueSource:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[5].YValues.Name:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[5].XValues.ValueSource:=LithoLog.FieldDefs[6].Name;
  DBChart9.Series[5].XValues.Name:=LithoLog.FieldDefs[6].Name;
  DBChart9.Series[5].DataSource:=LithoLog;

    for i:=0 to 5 do
      DBChart9.Series[i].CheckDataSource;
    CheckAxes;

end;

procedure TMainForm2.DualCompositionModel1Click(Sender: TObject);
var
i,j: integer;
Depth_Value, TempValue, LogValue, PHIValue: Single;
RHO_V_Values, PEF_V_Values, DT_V_Values, GR_V_Values: array of array of Single;
RHO_f_Values, RHO_C_Values : array [1..5] of single;
PEF_f_Values, PEF_C_Values : array [1..5] of single;
DT_f_Values, DT_C_Values : array [1..5] of single;
GR_f_Values, GR_C_Values: array [1..5] of single;
SST_TOTAL, SHL_TOTAL, LST_TOTAL, WTR_TOTAL, OIL_TOTAL: array [1..5] of single;
SST_WV, SHL_WV, LST_WV, WTR_WV, OIL_WV : Single;
SST_P_Values,SHL_P_Values,LST_P_Values, WTR_P_Values, OIL_P_Values:array [1..4] of single;
Normalizer:Single;
C_Max_Values: array [1..5] of Single;
ErrorCode:integer;
const
 Alpha = 1;
begin
  if not Load_Form.Database_Opened then Exit;
  Operation_Canceled:=False;

  Litho_Dual_Form:=TLitho_Dual_Form.Create(Self);
  Litho_Dual_Form.ShowModal;
  for i:=1 to 5 do
    C_Max_Values[i]:=Litho_Dual_Form.CValues[i];
  Litho_Dual_Form.Free;
  if Operation_Canceled then Exit;

  for i:=1 to 5 do
    begin
      SST_TOTAL[i]:=0;
      SHL_TOTAL[i]:=0;
      LST_TOTAL[i]:=0;
      WTR_TOTAL[i]:=0;
      OIL_TOTAL[i]:=0;
    end;

  SetLength(DT_V_Values, OpenedFile.NoRecords+1, 6);
  SetLength(RHO_V_Values, OpenedFile.NoRecords+1,6);
  SetLength(GR_V_Values, OpenedFile.NoRecords+1, 6);
  SetLength(PEF_V_Values, OpenedFile.NoRecords+1,6);

  OpenedFile.Values.Open;
  OpenedFile.Values.DisableControls;
  OpenedFile.Values.First;

  with Load_Form do
  for i:=0 to OpenedFile.NoRecords-1 do
    begin

      Depth_Value:=OpenedFile.Values.Fields[0].Value; //DBChart2.Series[0].YValue[i];

/////////////////  Lithology identification by DT log  ///////////////////////////
      if DT_Track_Number>=0 then
        begin

          Val(OpenedFile.Values.Fields[DT_Track_Number].AsString, TempValue,ErrorCode);
          if (ErrorCode=0)and(TempValue<>OpenedFile.NullValue) then
            LogValue:=TempValue
          else
            LogValue:=0;

          if SST_Checked then
            if LogValue>=DT_SST then
              DT_f_Values[1]:=Power((LogValue - DT_SST)/(DT_SST_MAX - DT_SST), Alpha)
            else
              DT_f_Values[1]:=Power((DT_SST - LogValue)/(DT_SST - DT_SST_MIN), Alpha)
          else
            DT_f_Values[1]:=1;

          if SHL_Checked then
            if LogValue>=DT_SHL then
              DT_f_Values[2]:=Power((LogValue - DT_SHL)/(DT_SHL_MAX - DT_SHL), Alpha)
            else
              DT_f_Values[2]:=Power((DT_SHL - LogValue)/(DT_SHL - DT_SHL_MIN), Alpha)
          else
            DT_f_Values[2]:=1;

          if LST_Checked then
            if LogValue>=DT_LST then
              DT_f_Values[3]:=Power((LogValue - DT_LST)/(DT_LST_MAX - DT_LST), Alpha)
            else
              DT_f_Values[3]:=Power((DT_LST - LogValue)/(DT_LST - DT_LST_MIN), Alpha)
          else
            DT_f_Values[3]:=1;

          if WTR_Checked then
            if LogValue>=DT_LST then
              DT_f_Values[4]:=Power((LogValue - DT_WTR)/(DT_WTR_MAX - DT_WTR), Alpha)
            else
              DT_f_Values[4]:=Power((DT_WTR - LogValue)/(DT_WTR - DT_WTR_MIN), Alpha)
          else
            DT_f_Values[4]:=1;

          if OIL_Checked then
            if LogValue>=DT_OIL then
              DT_f_Values[5]:=Power((LogValue - DT_OIL)/(DT_OIL_MAX - DT_OIL), Alpha)
            else
              DT_f_Values[5]:=Power((DT_OIL - LogValue)/(DT_OIL - DT_OIL_MIN), Alpha)
          else
            DT_f_Values[5]:=1;

          for j:=1 to 5 do
            if DT_f_Values[j]>1 then
              DT_f_Values[j]:=1;

          for j:=1 to 5 do
            DT_C_Values[j]:= C_Max_Values[j] * (1 - DT_f_Values[j]);

          TempValue:=0;
          for j:=1 to 5 do
            TempValue:= TempValue + DT_C_Values[j];
          if TempValue<>0 then
            for j:=1 to 5 do
              DT_V_Values[i,j]:= DT_C_Values[j] / TempValue
          else
            for j:=1 to 5 do
              DT_V_Values[i,j]:= 0;

          SST_TOTAL[1]:= SST_TOTAL[1] + DT_V_Values[i,1];
          SST_TOTAL[5]:= SST_TOTAL[5] + DT_V_Values[i,1];
          SHL_TOTAL[1]:= SHL_TOTAL[1] + DT_V_Values[i,2];
          SHL_TOTAL[5]:= SHL_TOTAL[5] + DT_V_Values[i,2];
          LST_TOTAL[1]:= LST_TOTAL[1] + DT_V_Values[i,3];
          LST_TOTAL[5]:= LST_TOTAL[5] + DT_V_Values[i,3];
          WTR_TOTAL[1]:= WTR_TOTAL[1] + DT_V_Values[i,4];
          WTR_TOTAL[5]:= WTR_TOTAL[5] + DT_V_Values[i,4];
          OIL_TOTAL[1]:= OIL_TOTAL[1] + DT_V_Values[i,5];
          OIL_TOTAL[5]:= OIL_TOTAL[5] + DT_V_Values[i,5];
        end;

/////////////////  Lithology identification by Density log  ///////////////////////////
      if RHO_Track_Number>=0 then
        begin

          Val(OpenedFile.Values.Fields[RHO_Track_Number].AsString, TempValue,ErrorCode);
          if (ErrorCode=0)and(TempValue<>OpenedFile.NullValue) then
            LogValue:=TempValue
          else
            LogValue:=0;

          if SST_Checked then
            if LogValue>=RHO_SST then
              RHO_f_Values[1]:=Power((LogValue - RHO_SST)/(RHO_SST_MAX - RHO_SST), Alpha)
            else
              RHO_f_Values[1]:=Power((RHO_SST - LogValue)/(RHO_SST - RHO_SST_MIN), Alpha)
          else
            RHO_f_Values[1]:=1;

          if SHL_Checked then
            if LogValue>=RHO_SHL then
              RHO_f_Values[2]:=Power((LogValue - RHO_SHL)/(RHO_SHL_MAX - RHO_SHL), Alpha)
            else
              RHO_f_Values[2]:=Power((RHO_SHL - LogValue)/(RHO_SHL - RHO_SHL_MIN), Alpha)
          else
            RHO_f_Values[2]:=1;

          if LST_Checked then
            if LogValue>=RHO_LST then
              RHO_f_Values[3]:=Power((LogValue - RHO_LST)/(RHO_LST_MAX - RHO_LST), Alpha)
            else
              RHO_f_Values[3]:=Power((RHO_LST - LogValue)/(RHO_LST - RHO_LST_MIN), Alpha)
          else
            RHO_f_Values[3]:=1;

          if WTR_Checked then
            if LogValue>=RHO_WTR then
              RHO_f_Values[4]:=Power((LogValue - RHO_WTR)/(RHO_WTR_MAX - RHO_WTR), Alpha)
            else
              RHO_f_Values[4]:=Power((RHO_WTR - LogValue)/(RHO_WTR - RHO_WTR_MIN), Alpha)
          else
            RHO_f_Values[4]:=1;

          if OIL_Checked then
            if LogValue>=RHO_OIL then
              RHO_f_Values[5]:=Power((LogValue - RHO_OIL)/(RHO_OIL_MAX - RHO_OIL), Alpha)
            else
              RHO_f_Values[5]:=Power((RHO_OIL - LogValue)/(RHO_OIL - RHO_OIL_MIN), Alpha)
          else
            RHO_f_Values[5]:=1;

          for j:=1 to 5 do
            if RHO_f_Values[j]>1 then
              RHO_f_Values[j]:=1;

          for j:=1 to 5 do
            RHO_C_Values[j]:=  C_Max_Values[j] * (1 - RHO_f_Values[j]);

          TempValue:=0;
          for j:=1 to 5 do
            TempValue:= TempValue + RHO_C_Values[j];
          if TempValue<>0 then
            for j:=1 to 5 do
              RHO_V_Values[i,j]:= RHO_C_Values[j] / TempValue
          else
            for j:=1 to 5 do
              RHO_V_Values[i,j]:=0;

          SST_TOTAL[2]:= SST_TOTAL[2] + RHO_V_Values[i,1];
          SST_TOTAL[5]:= SST_TOTAL[5] + RHO_V_Values[i,1];
          SHL_TOTAL[2]:= SHL_TOTAL[2] + RHO_V_Values[i,2];
          SHL_TOTAL[5]:= SHL_TOTAL[5] + RHO_V_Values[i,2];
          LST_TOTAL[2]:= LST_TOTAL[2] + RHO_V_Values[i,3];
          LST_TOTAL[5]:= LST_TOTAL[5] + RHO_V_Values[i,3];
          WTR_TOTAL[2]:= WTR_TOTAL[2] + RHO_V_Values[i,4];
          WTR_TOTAL[5]:= WTR_TOTAL[5] + RHO_V_Values[i,4];
          OIL_TOTAL[2]:= OIL_TOTAL[2] + RHO_V_Values[i,5];
          OIL_TOTAL[5]:= OIL_TOTAL[5] + RHO_V_Values[i,5];
        end;

/////////////////  Lithology identification by GR log  ///////////////////////////
      if GR_Track_Number>=0 then
        begin

          Val(OpenedFile.Values.Fields[GR_Track_Number].AsString, TempValue,ErrorCode);
          if (ErrorCode=0)and(TempValue<>OpenedFile.NullValue) then
            LogValue:=TempValue
          else
            LogValue:=0;

          if SST_Checked then
            if LogValue>=GR_SST then
              GR_f_Values[1]:=Power((LogValue - GR_SST)/(GR_SST_MAX - GR_SST), Alpha)
            else
              GR_f_Values[1]:=Power((GR_SST - LogValue)/(GR_SST - GR_SST_MIN), Alpha)
          else
            GR_f_Values[1]:=1;

          if SHL_Checked then
            if LogValue>=GR_SHL then
              GR_f_Values[2]:=Power((LogValue - GR_SHL)/(GR_SHL_MAX - GR_SHL), Alpha)
            else
              GR_f_Values[2]:=Power((GR_SHL - LogValue)/(GR_SHL - GR_SHL_MIN), Alpha)
          else
            GR_f_Values[2]:=1;

          if LST_Checked then
            if LogValue>=GR_LST then
              GR_f_Values[3]:=Power((LogValue - GR_LST)/(GR_LST_MAX - GR_LST), Alpha)
            else
              GR_f_Values[3]:=Power((GR_LST - LogValue)/(GR_LST - GR_LST_MIN), Alpha)
          else
            GR_f_Values[3]:=1;

          if WTR_Checked then
            if LogValue>=GR_WTR then
              GR_f_Values[4]:=Power((LogValue - GR_WTR)/(GR_WTR_MAX - GR_WTR), Alpha)
            else
              GR_f_Values[4]:=Power((GR_WTR - LogValue)/(GR_WTR - GR_WTR_MIN), Alpha)
          else
            GR_f_Values[4]:=1;

          if OIL_Checked then
            if LogValue>=GR_OIL then
              GR_f_Values[5]:=Power((LogValue - GR_OIL)/(GR_OIL_MAX - GR_OIL), Alpha)
            else
              GR_f_Values[5]:=Power((GR_OIL - LogValue)/(GR_OIL - GR_OIL_MIN), Alpha)
          else
            GR_f_Values[5]:=1;

          for j:=1 to 5 do
            if GR_f_Values[j]>1 then
              GR_f_Values[j]:=1;

          for j:=1 to 5 do
            GR_C_Values[j]:=  C_Max_Values[j] * (1 - GR_f_Values[j]);

          TempValue:=0;
          for j:=1 to 5 do
            TempValue:= TempValue + GR_C_Values[j];
          if TempValue<>0 then
            for j:=1 to 5 do
              GR_V_Values[i,j]:= GR_C_Values[j] / TempValue
          else
            for j:=1 to 5 do
              GR_V_Values[i,j]:= 0;

          SST_TOTAL[3]:= SST_TOTAL[3] + GR_V_Values[i,1];
          SST_TOTAL[5]:= SST_TOTAL[5] + GR_V_Values[i,1];
          SHL_TOTAL[3]:= SHL_TOTAL[3] + GR_V_Values[i,2];
          SHL_TOTAL[5]:= SHL_TOTAL[5] + GR_V_Values[i,2];
          LST_TOTAL[3]:= LST_TOTAL[3] + GR_V_Values[i,3];
          LST_TOTAL[5]:= LST_TOTAL[5] + GR_V_Values[i,3];
          WTR_TOTAL[3]:= WTR_TOTAL[3] + GR_V_Values[i,4];
          WTR_TOTAL[5]:= WTR_TOTAL[5] + GR_V_Values[i,4];
          OIL_TOTAL[3]:= OIL_TOTAL[3] + GR_V_Values[i,5];
          OIL_TOTAL[5]:= OIL_TOTAL[5] + GR_V_Values[i,5];
        end;

/////////////////  Lithology identification by PEF log  ///////////////////////////
      if PEF_Track_Number>=0 then
        begin

          Val(OpenedFile.Values.Fields[PEF_Track_Number].AsString, TempValue,ErrorCode);
          if (ErrorCode=0)and(TempValue<>OpenedFile.NullValue) then
            LogValue:=TempValue
          else
            LogValue:=0;

          if SST_Checked then
            if LogValue>=PEF_SST then
              PEF_f_Values[1]:=Power((LogValue - PEF_SST)/(PEF_SST_MAX - PEF_SST), Alpha)
            else
              PEF_f_Values[1]:=Power((PEF_SST - LogValue)/(PEF_SST - PEF_SST_MIN), Alpha)
          else
            PEF_f_Values[1]:=1;

          if SHL_Checked then
            if LogValue>=PEF_SHL then
              PEF_f_Values[2]:=Power((LogValue - PEF_SHL)/(PEF_SHL_MAX - PEF_SHL), Alpha)
            else
              PEF_f_Values[2]:=Power((PEF_SHL - LogValue)/(PEF_SHL - PEF_SHL_MIN), Alpha)
          else
            PEF_f_Values[2]:=1;

          if LST_Checked then
            if LogValue>=PEF_LST then
              PEF_f_Values[3]:=Power((LogValue - PEF_LST)/(PEF_LST_MAX - PEF_LST), Alpha)
            else
              PEF_f_Values[3]:=Power((PEF_LST - LogValue)/(PEF_LST - PEF_LST_MIN), Alpha)
          else
            PEF_f_Values[3]:=1;

          if WTR_Checked then
            if LogValue>=PEF_WTR then
              PEF_f_Values[4]:=Power((LogValue - PEF_WTR)/(PEF_WTR_MAX - PEF_WTR), Alpha)
            else
              PEF_f_Values[4]:=Power((PEF_WTR - LogValue)/(PEF_WTR - PEF_WTR_MIN), Alpha)
          else
            PEF_f_Values[4]:=1;

          if OIL_Checked then
            if LogValue>=PEF_OIL then
              PEF_f_Values[5]:=Power((LogValue - PEF_OIL)/(PEF_OIL_MAX - PEF_OIL), Alpha)
            else
              PEF_f_Values[5]:=Power((PEF_OIL - LogValue)/(PEF_OIL - PEF_OIL_MIN), Alpha)
          else
            PEF_f_Values[5]:=1;

          for j:=1 to 5 do
            if PEF_f_Values[j]>1 then
              PEF_f_Values[j]:=1;

          for j:=1 to 5 do
            PEF_C_Values[j]:=  C_Max_Values[j] * (1 - PEF_f_Values[j]);

          TempValue:=0;
          for j:=1 to 5 do
            TempValue:= TempValue + PEF_C_Values[j];
          if TempValue<>0 then
            for j:=1 to 5 do
              PEF_V_Values[i,j]:= PEF_C_Values[j] / TempValue
          else
            for j:=1 to 5 do
              PEF_V_Values[i,j]:= 0;

          SST_TOTAL[4]:= SST_TOTAL[4] + PEF_V_Values[i,1];
          SST_TOTAL[5]:= SST_TOTAL[5] + PEF_V_Values[i,1];
          SHL_TOTAL[4]:= SHL_TOTAL[4] + PEF_V_Values[i,2];
          SHL_TOTAL[5]:= SHL_TOTAL[5] + PEF_V_Values[i,2];
          LST_TOTAL[4]:= LST_TOTAL[4] + PEF_V_Values[i,3];
          LST_TOTAL[5]:= LST_TOTAL[5] + PEF_V_Values[i,3];
          WTR_TOTAL[4]:= WTR_TOTAL[4] + PEF_V_Values[i,4];
          WTR_TOTAL[5]:= WTR_TOTAL[5] + PEF_V_Values[i,4];
          OIL_TOTAL[4]:= OIL_TOTAL[4] + PEF_V_Values[i,5];
          OIL_TOTAL[5]:= OIL_TOTAL[5] + PEF_V_Values[i,5];
        end;
      OpenedFile.Values.Next;
    end;

///////////////// DUAL COMPOSITIONAL MODEL ////////////////

  for i:=1 to 4 do
    begin
      if (SST_Checked)and(SST_TOTAL[5]<>0) then
        SST_P_Values[i]:= SST_TOTAL[i] / SST_TOTAL[5]
      else
        SST_P_Values[i]:=0;
      if (SHL_Checked)and(SHL_TOTAL[5]<>0) then
        SHL_P_Values[i]:= SHL_TOTAL[i] / SHL_TOTAL[5]
      else
        SHL_P_Values[i]:=0;
      if (LST_Checked)and(LST_TOTAL[5]<>0) then
        LST_P_Values[i]:= LST_TOTAL[i] / LST_TOTAL[5]
      else
        LST_P_Values[i]:=0;
      if (WTR_Checked)and(WTR_TOTAL[5]<>0) then
        WTR_P_Values[i]:= WTR_TOTAL[i] / WTR_TOTAL[5]
      else
        WTR_P_Values[i]:=0;
      if (OIL_Checked)and(OIL_TOTAL[5]<>0) then
        OIL_P_Values[i]:= OIL_TOTAL[i] / OIL_TOTAL[5]
      else
        OIL_P_Values[i]:=0;
    end;

  TempValue:=0;
  for i:=1 to 4 do
    TempValue:= TempValue + SST_P_Values[i];
  if TempValue<>0 then
    for i:=1 to 4 do
      SST_P_Values[i]:= SST_P_Values[i] / TempValue;

  TempValue:=0;
  for i:=1 to 4 do
    TempValue:= TempValue + SHL_P_Values[i];
  if TempValue<>0 then
    for i:=1 to 4 do
      SHL_P_Values[i]:= SHL_P_Values[i] / TempValue;

  TempValue:=0;
  for i:=1 to 4 do
    TempValue:= TempValue + LST_P_Values[i];
  if TempValue<>0 then
    for i:=1 to 4 do
      LST_P_Values[i]:= LST_P_Values[i] / TempValue;

  TempValue:=0;
  for i:=1 to 4 do
    TempValue:= TempValue + WTR_P_Values[i];
  if TempValue<>0 then
    for i:=1 to 4 do
      WTR_P_Values[i]:= WTR_P_Values[i] / TempValue;

  TempValue:=0;
  for i:=1 to 4 do
    TempValue:= TempValue + OIL_P_Values[i];
  if TempValue<>0 then
    for i:=1 to 4 do
      OIL_P_Values[i]:= OIL_P_Values[i] / TempValue;

  if LithoLog.Exists then
    begin
      Litholog.Close;
      LithoLog.EmptyTable;
      lithoLog.DeleteTable;
    end;

  Litholog.CreateTable;
  LithoLog.Open;
  LithoLog.Edit;
  LithoLog.DisableControls;

  for i:=0 to OpenedFile.NoRecords-1 do
    begin

      Depth_Value:=DBChart2.Series[0].YValue[i];

      SST_WV:= DT_V_Values[i,1] * SST_P_Values[1] + RHO_V_Values[i,1] * SST_P_Values[2] +
               GR_V_Values[i,1] * SST_P_Values[3] + PEF_V_Values[i,1] * SST_P_Values[4];
      SHL_WV:= DT_V_Values[i,2] * SHL_P_Values[1] + RHO_V_Values[i,2] * SHL_P_Values[2] +
               GR_V_Values[i,2] * SHL_P_Values[3] + PEF_V_Values[i,2] * SHL_P_Values[4];
      LST_WV:= DT_V_Values[i,3] * LST_P_Values[1] + RHO_V_Values[i,3] * LST_P_Values[2] +
               GR_V_Values[i,3] * LST_P_Values[3] + PEF_V_Values[i,3] * LST_P_Values[4];
      WTR_WV:= DT_V_Values[i,3] * WTR_P_Values[1] + RHO_V_Values[i,3] * WTR_P_Values[2] +
               GR_V_Values[i,3] * WTR_P_Values[3] + PEF_V_Values[i,3] * WTR_P_Values[4];
      OIL_WV:= DT_V_Values[i,3] * OIL_P_Values[1] + RHO_V_Values[i,3] * OIL_P_Values[2] +
               GR_V_Values[i,3] * OIL_P_Values[3] + PEF_V_Values[i,3] * OIL_P_Values[4];

      if (SST_WV+LST_WV+WTR_WV+OIL_WV{DOL_WV+GPS_WV+ANH_WV})<>0 then
        begin
          Normalizer:= (1 - SHL_WV) / (SST_WV+LST_WV+WTR_WV+OIL_WV);
          SST_WV:= SST_WV * Normalizer;
          LST_WV:= LST_WV * Normalizer;
          WTR_WV:= WTR_WV * Normalizer;
          OIL_WV:= OIL_WV * Normalizer;
        end;

          LithoLog.Edit;
          LithoLog.Append;
          LithoLog.Fields[0].Value:=Depth_Value;
          LithoLog.Fields[1].Value:=SST_WV;
          LithoLog.Fields[2].Value:=SHL_WV;
          LithoLog.Fields[3].Value:=LST_WV;
          LithoLog.Fields[4].Value:=WTR_WV;
          LithoLog.Fields[5].Value:=OIL_WV;

    end;
  LithoLog.EnableControls;
  OpenedFile.Values.EnableControls;

  DBChart9.Series[0].YValues.ValueSource:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[0].YValues.Name:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[0].XValues.ValueSource:=LithoLog.FieldDefs[1].Name;
  DBChart9.Series[0].XValues.Name:=LithoLog.FieldDefs[1].Name;
  DBChart9.Series[0].DataSource:=LithoLog;

  DBChart9.Series[1].YValues.ValueSource:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[1].YValues.Name:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[1].XValues.ValueSource:=LithoLog.FieldDefs[2].Name;
  DBChart9.Series[1].XValues.Name:=LithoLog.FieldDefs[2].Name;
  DBChart9.Series[1].DataSource:=LithoLog;

  DBChart9.Series[2].YValues.ValueSource:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[2].YValues.Name:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[2].XValues.ValueSource:=LithoLog.FieldDefs[3].Name;
  DBChart9.Series[2].XValues.Name:=LithoLog.FieldDefs[3].Name;
  DBChart9.Series[2].DataSource:=LithoLog;

  DBChart9.Series[3].YValues.ValueSource:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[3].YValues.Name:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[3].XValues.ValueSource:=LithoLog.FieldDefs[4].Name;
  DBChart9.Series[3].XValues.Name:=LithoLog.FieldDefs[4].Name;
  DBChart9.Series[3].DataSource:=LithoLog;

  DBChart9.Series[4].YValues.ValueSource:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[4].YValues.Name:=LithoLog.FieldDefs[0].Name;
  DBChart9.Series[4].XValues.ValueSource:=LithoLog.FieldDefs[5].Name;
  DBChart9.Series[4].XValues.Name:=LithoLog.FieldDefs[5].Name;
  DBChart9.Series[4].DataSource:=LithoLog;

  for i:=0 to 4 do
    DBChart9.Series[i].CheckDataSource;
  CheckAxes;

end;

procedure TMainForm2.CheckAxes;
begin
  DBChart1.CustomAxes[0]:=DBChart5.CustomAxes[0];
  DBChart1.CustomAxes[1]:=DBChart5.CustomAxes[1];
  DBChart1.CustomAxes[2]:=DBChart5.CustomAxes[2];

  DBChart3.CustomAxes[0]:=DBChart7.CustomAxes[0];
  DBChart3.CustomAxes[1]:=DBChart7.CustomAxes[1];
  DBChart3.CustomAxes[2]:=DBChart7.CustomAxes[2];

  DBChart4.CustomAxes[0]:=DBChart8.CustomAxes[0];
  DBChart4.CustomAxes[1]:=DBChart8.CustomAxes[1];
  DBChart4.CustomAxes[2]:=DBChart8.CustomAxes[2];
  DBChart4.CustomAxes[3]:=DBChart8.CustomAxes[3];

  DBChart9.CustomAxes[0]:=DBChart10.CustomAxes[0];
  DBChart9.CustomAxes[1]:=DBChart10.CustomAxes[1];
  DBChart9.CustomAxes[2]:=DBChart10.CustomAxes[2];
  DBChart9.CustomAxes[3]:=DBChart10.CustomAxes[3];
  DBChart9.CustomAxes[4]:=DBChart10.CustomAxes[4];
  DBChart9.CustomAxes[5]:=DBChart10.CustomAxes[5];
end;

procedure TMainForm2.Fluid1Click(Sender: TObject);
begin
  if not Load_Form.Database_Opened then Exit;
  Fluid_Model_Form:=TFLuid_Model_Form.Create(Self);
  Fluid_Model_Form.ShowModal;
  Fluid_Model_Form.Free;
end;

procedure TMainForm2.DBChart1DblClick(Sender: TObject);
begin
  ChartEditor1.Chart:=DBChart1;
  ChartEditor1.Execute;
  CheckAxes;
end;

procedure TMainForm2.DBChart3DblClick(Sender: TObject);
begin
  ChartEditor1.Chart:=DBChart3;
  ChartEditor1.Execute;
  CheckAxes;
end;

procedure TMainForm2.DBChart4DblClick(Sender: TObject);
begin
  ChartEditor1.Chart:=DBChart4;
  ChartEditor1.Execute;
  CheckAxes;
end;

procedure TMainForm2.DBChart1Scroll(Sender: TObject);
var
i:integer;
begin
  for i:=0 to 2 do
    begin
      DBChart5.CustomAxes[i].Minimum:=DBChart1.CustomAxes[i].Minimum;
      DBChart5.CustomAxes[i].Maximum:=DBChart1.CustomAxes[i].Maximum;
    end;
end;

procedure TMainForm2.DBChart1UndoZoom(Sender: TObject);
var
i:integer;
begin
  for i:=0 to 2 do
    begin
      DBChart5.CustomAxes[i].Minimum:=DBChart1.CustomAxes[i].Minimum;
      DBChart5.CustomAxes[i].Maximum:=DBChart1.CustomAxes[i].Maximum;
    end;
end;

procedure TMainForm2.DBChart9DblClick(Sender: TObject);
begin
  ChartEditor1.Chart:=DBChart9;
  ChartEditor1.Execute;
  CheckAxes;
end;

procedure TMainForm2.DBChart3Scroll(Sender: TObject);
var
i:integer;
begin
  for i:=0 to 2 do
    begin
      DBChart7.CustomAxes[i].Minimum:=DBChart3.CustomAxes[i].Minimum;
      DBChart7.CustomAxes[i].Maximum:=DBChart3.CustomAxes[i].Maximum;
    end;
end;

procedure TMainForm2.DBChart3UndoZoom(Sender: TObject);
var
i:integer;
begin
  for i:=0 to 2 do
    begin
      DBChart7.CustomAxes[i].Minimum:=DBChart3.CustomAxes[i].Minimum;
      DBChart7.CustomAxes[i].Maximum:=DBChart3.CustomAxes[i].Maximum;
    end;
end;

procedure TMainForm2.DBChart4UndoZoom(Sender: TObject);
var
i:integer;
begin
  for i:=0 to 2 do
    begin
      DBChart8.CustomAxes[i].Minimum:=DBChart4.CustomAxes[i].Minimum;
      DBChart8.CustomAxes[i].Maximum:=DBChart4.CustomAxes[i].Maximum;
    end;
end;

procedure TMainForm2.DBChart4Scroll(Sender: TObject);
var
i:integer;
begin
  for i:=0 to 2 do
    begin
      DBChart8.CustomAxes[i].Minimum:=DBChart4.CustomAxes[i].Minimum;
      DBChart8.CustomAxes[i].Maximum:=DBChart4.CustomAxes[i].Maximum;
    end;
end;

procedure TMainForm2.MoveTracks1Click(Sender: TObject);
begin
  if not Load_Form.Database_Opened then Exit;
  if MoveTracks1.Checked then
    begin
      DBChart1.DragMode:=dmManual;
      DBChart2.DragMode:=dmManual;
      DBChart3.DragMode:=dmManual;
      DBChart4.DragMode:=dmManual;
      DBChart9.DragMode:=dmManual;
      MoveTracks1.Checked:=False;
      ToolButton3.Down:=False;
    end
  else
    begin
      DBChart1.DragMode:=dmAutomatic;
      DBChart2.DragMode:=dmAutomatic;
      DBChart3.DragMode:=dmAutomatic;
      DBChart4.DragMode:=dmAutomatic;
      DBChart9.DragMode:=dmAutomatic;
      MoveTracks1.Checked:=True;
      ToolButton3.Down:=True;
    end;
end;

procedure TMainForm2.ToolButton3Click(Sender: TObject);
begin
  if MoveTracks1.Checked then
    begin
      DBChart1.DragMode:=dmManual;
      DBChart2.DragMode:=dmManual;
      DBChart3.DragMode:=dmManual;
      DBChart4.DragMode:=dmManual;
      DBChart9.DragMode:=dmManual;
      MoveTracks1.Checked:=False;
      ToolButton3.Down:=False;
    end
  else
    begin
      DBChart1.DragMode:=dmAutomatic;
      DBChart2.DragMode:=dmAutomatic;
      DBChart3.DragMode:=dmAutomatic;
      DBChart4.DragMode:=dmAutomatic;
      DBChart9.DragMode:=dmAutomatic;
      MoveTracks1.Checked:=True;
      ToolButton3.Down:=True;
    end;
end;

end.


