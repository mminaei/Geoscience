unit Main_Form;

interface

uses
  TeeEdit, Dialogs, XpMan, Menus, Controls, Forms, Graphics, ExtActns,
  StrUtils, Math, TeEngine, jpeg, ExtCtrls, Classes, StdCtrls, Windows,
  SysUtils, TeeStore, TeeProcs, Chart, TeeTools, Series,TeeEditCha, Printers,
  TeeThemeEditor, TeeShape, TeeTree, TreeEd, ComCtrls, ImgList, ToolWin, Types,
  TeExport;
type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    View1: TMenuItem;
    ChangeScale1: TMenuItem;
    NoScale1: TMenuItem;
    LAS1: TMenuItem;
    Petrophysics1: TMenuItem;
    VsEstimation1: TMenuItem;
    MudLine1: TMenuItem;
    Castagna2: TMenuItem;
    Han1: TMenuItem;
    Krief1: TMenuItem;
    Poisson1: TMenuItem;
    Castagna1: TMenuItem;
    CorrelationCoefficient1: TMenuItem;
    Velocity1: TMenuItem;
    Tools1: TMenuItem;
    CrossPLOT1: TMenuItem;
    CompositeLog1: TMenuItem;
    ChartEditor1: TChartEditor;
    Litholog1: TMenuItem;
    LithosphericEstimation1: TMenuItem;
    Tree1: TTree;
    ChartPreviewer1: TChartPreviewer;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    WaterResistivity1: TMenuItem;
    ArpWorthington1: TMenuItem;
    ASCIIFile1: TMenuItem;
    RQI1: TMenuItem;
    FZI1: TMenuItem;
    TiabFactor1: TMenuItem;
    FreeFluidIndex1: TMenuItem;
    Svgr1: TMenuItem;
    FormationResistivityFactor1: TMenuItem;
    TortuosityTau1: TMenuItem;
    ReservoirParameters1: TMenuItem;
    HorizontalPermeability1: TMenuItem;
    Anisotropy1: TMenuItem;
    Heterogeneity1: TMenuItem;
    VerticalPermeability1: TMenuItem;
    Averaging1: TMenuItem;
    RwfromConcentration1: TMenuItem;
    WaterSaturation1: TMenuItem;
    ResistivityIndex1: TMenuItem;
    GammaRayIndex1: TMenuItem;
    ShaleVolume1: TMenuItem;
    RwfromSPLog1: TMenuItem;
    CECMethod1: TMenuItem;
    CationExchangeCapacityCEC1: TMenuItem;
    Permeability1: TMenuItem;
    ToolBar1: TToolBar;
    Separator1: TToolButton;
    ToolButton9: TToolButton;
    Separator3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Print1: TMenuItem;
    N4: TMenuItem;
    Calculation1: TMenuItem;
    Velocity2: TMenuItem;
    Simandoux1: TMenuItem;
    CleanSandstone1: TMenuItem;
    ShalySandstone1: TMenuItem;
    Save1: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton10: TToolButton;
    Porosity1: TMenuItem;
    Sonic1: TMenuItem;
    Density1: TMenuItem;
    AverageNeutronDensity1: TMenuItem;
    ImageList2: TImageList;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    PrintDialog1: TPrintDialog;
    Indonesia1: TMenuItem;
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    General1: TMenuItem;
    Models1: TMenuItem;
    Fluid1: TMenuItem;
    Lithology1: TMenuItem;
    Determinisstic1: TMenuItem;
    MultiMineral1: TMenuItem;
    DualCompositional1: TMenuItem;
    MoveTracks1: TMenuItem;
    ToolButton15: TToolButton;
    Saturations1: TMenuItem;
    Oil1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure CreateChart(Chart_Title: String; Chart_Index: Smallint);
    procedure CreateChild(Root_Caption: String; Child_Caption: String);
    procedure CreateRoot(Root_Caption: String);
    procedure CreateSeries(Sender: TChart; Chart_Index: Smallint);
    procedure CreatePopupMenu(Sender: TChart);
    procedure Charts_Resize(Sender: TObject; var NewWidth, NewHeight: Integer;
                                             var Resize: Boolean);
    procedure PopupClicked(Sender: TObject);
    procedure PopLogarithmic(Sender: TObject);
    procedure ChangeScale1Click(Sender: TObject);
    procedure NoScale1Click(Sender: TObject);
    procedure Zooming(Sender: TObject);
    procedure LAS1Click(Sender: TObject);
    procedure MudLine1Click(Sender: TObject);
    procedure Preparation(Root_Caption: string; Title_Caption: string);
    procedure Velocity1Click(Sender: TObject);
    procedure CorrelationCoefficient1Click(Sender: TObject);
    procedure CrossPLOT1Click(Sender: TObject);
    procedure CompositeLog1Click(Sender: TObject);
    procedure Han1Click(Sender: TObject);
    procedure Poisson1Click(Sender: TObject);
    procedure Krief1Click(Sender: TObject);
{    procedure ChartsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ChartsDragDrop(Sender, Source: TObject; X, Y: Integer);  }
    procedure Litholog1Click(Sender: TObject);
    procedure LithosphericEstimation1Click(Sender: TObject);
    procedure TreeRootClicked(Sender: TTreeNodeShape; Button:TMouseButton; Shift: TShiftState; X: Integer; Y: Integer);
    procedure TreeChildClicked(Sender: TTreeNodeShape; Button:TMouseButton; Shift: TShiftState; X: Integer; Y: Integer);
    procedure ArpWorthington1Click(Sender: TObject);
    procedure ReadLAS(File_Name: string);
    procedure ReadASCII(File_Name: string);
    procedure ASCIIFile1Click(Sender: TObject);
    procedure RQI1Click(Sender: TObject);
    procedure FZI1Click(Sender: TObject);
    procedure TiabFactor1Click(Sender: TObject);
    procedure FreeFluidIndex1Click(Sender: TObject);
    procedure Svgr1Click(Sender: TObject);
    procedure FormationResistivityFactor1Click(Sender: TObject);
    procedure TortuosityTau1Click(Sender: TObject);
    procedure PHI_Calculate(MethodIndex: integer);
    procedure HorizontalPermeability1Click(Sender: TObject);
    procedure VerticalPermeability1Click(Sender: TObject);
    procedure Anisotropy1Click(Sender: TObject);
    procedure Heterogeneity1Click(Sender: TObject);
    procedure Averaging1Click(Sender: TObject);
    procedure CalculateLithoValues;
    procedure EnableMenu;
    procedure DisableMenu;
    procedure SortCharts;
    procedure EnlargePic;
    procedure LessenPic;
    procedure ChartsDragOver(Sender, Source: TObject; X, Y: Integer;
                             State: TDragState; var Accept: Boolean);
    procedure ChartsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TopAxisDrawLabel(Sender:TChartAxis; var X,Y,Z:Integer;
                                                  var Text:String;
                                                  var DrawLabel:Boolean);
    procedure RemoveChart(Chart_Title: String; Chart_Index: Smallint);
    procedure RemoveChild(Root_Caption: String; Child_Caption: String);
    procedure UndoPreparation(Root_Caption: string; Title_Caption: string);
    procedure RwfromConcentration1Click(Sender: TObject);
    procedure ResistivityIndex1Click(Sender: TObject);
    procedure GammaRayIndex1Click(Sender: TObject);
    procedure ShaleVolume1Click(Sender: TObject);
    procedure RwfromSPLog1Click(Sender: TObject);
    procedure CECMethod1Click(Sender: TObject);
    procedure Sw_Calculation(TabIndex: Integer);
    procedure Castagna2Click(Sender: TObject);
    procedure CationExchangeCapacityCEC1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Print1Click(Sender: TObject);
    procedure Simandoux1Click(Sender: TObject);
    procedure CleanSandstone1Click(Sender: TObject);
    procedure ShalySandstone1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Sonic1Click(Sender: TObject);
    procedure Density1Click(Sender: TObject);
    procedure AverageNeutronDensity1Click(Sender: TObject);
    procedure Indonesia1Click(Sender: TObject);
    procedure ScrollBox1Resize(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
    procedure Fluid1Click(Sender: TObject);
    procedure Determinisstic1Click(Sender: TObject);
    procedure MultiMineral1Click(Sender: TObject);
    procedure DualCompositional1Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure MoveTracks1Click(Sender: TObject);
    procedure Oil1Click(Sender: TObject);
//    procedure ChangePath;

  private
    { Private declarations }
  public
    Charts                     :array of TChart;
    Value_Is_Constant          :array [1..10] of Boolean;
    Constant_Value             :array [1..10] of Single;
    Log_Values                 :THorizLineSeries;
    InputLithoMatrix           :array [1..6, 1..7] of single;
    OutputLithoMatrix          :array [1..6] of single;

    Vp_Track_Number,
    DTS_Track_Number,
    DTP_Track_Number,
    VS_Track_Number,
    RHO_Track_Number,
    PHI_Track_Number,
    Poisson_Track_Number,
    DTP_Mineral_Track_Number,
    DTP_Saturated_Track_Number,
    DTP_Fluid_Track_Number,
    DTS_Mineral_Track_Number,
    LithoLog_Track_Number,
    JF_Track_Number,
    Sw_Track_Number,
    Svgr_Track_Number,
    Kh_Track_Number,
    Kv_Track_Number,
    RQI_Track_Number,
    FZI_Track_Number,
    ANMR_Track_Number,
    RHO_Matrix_Track_Number,
    T2ML_Track_Number,
    For_PHI_Track_Number,
    For_Kh_Track_Number,
    Shale_Volume_Track_Number,
    Rw_Track_Number,
    Rt_Track_Number,
    Ro_Track_Number,
    FR_Track_Number,
    PHI_T_Track_Number,
    PHI_D_Track_Number,
    LLD_Track_Number,
    NPHI_Track_Number,
    CALI_Track_Number,
    BS_Track_Number,
    MSFL_Track_Number,
    LLM_Track_Number,
    Neutron_Track_Number,
    PEF_Track_Number,
    GR_Track_Number,
    DT_Track_Number,
    GRI_Track_Number,
    Swir_Track_Number,
    XAxis_Track_Number,
    YAxis_Track_Number,
    Temp_Zoom_File_No,
    ZAxis_Track_Number,
    SP_Track_Number,
    T_Track_Number,
    CEC_Track_Number,
    n_Track_Number,
    Tau_Track_Number,
    Kaolinites_Track_Number,
    Illites_Track_Number,
    Smectites_Track_Number,
    Chlorites_Track_Number,
    Vermiculites_Track_Number,
    Polygorskites_Track_Number,
    Number_of_Pixels_Chart_Title{,
    Litho_RHO_Track_Number,
    Litho_GR_Track_Number,
    Litho_DT_Track_Number,
    Litho_RES_Track_Number,
    Litho_NPHI_Track_Number,
    Litho_PEF_Track_Number}     :Smallint;

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

    RHO_FLD ,
    RHO_FLD_MAX ,
    RHO_FLD_MIN ,

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

    DT_FLD ,
    DT_FLD_MAX ,
    DT_FLD_MIN ,

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

    GR_FLD ,
    GR_FLD_MAX ,
    GR_FLD_MIN ,

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

    PEF_FLD ,
    PEF_FLD_MAX ,
    PEF_FLD_MIN ,

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

    NPHI_FLD ,
    NPHI_FLD_MAX ,
    NPHI_FLD_MIN ,

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

    RES_FLD ,
    RES_FLD_MAX ,
    RES_FLD_MIN ,

    Shale_Volume_Value,
    Matrix_Value,
    Fluid_Value,
    Mean_Grain_Diameter,
    Shaly_Beds_Resistivity,
    GR_Sand,
    GR_Shale,
    SP_Sand,
    SP_Shale,
    BHT_Value,
    SAT_Value,
    TD_Value,
    FD_Value,
    Rmf_Value,
    Saturation_Exponent,
    Grain_Radius,
    Svp_Value,
    Svgr_Value,
    Rw_Value,
    Pore_Shape_Factor,
    J1_Value,
    Swir_Value,
    a_Value,
    Cementation_Factor,
    Sst_Percentage,
    Lst_Percentage,
    Dolomite_Percentage,
    Shale_Percentage,
    Kaolinites_CEC_Value,
    Illites_CEC_Value,
    Smectites_CEC_Value,
    Chlorites_CEC_Value,
    Vermiculites_CEC_Value,
    Polygorskites_CEC_Value         :Single;

    Litho_SST_Checked,
    Litho_SHL_Checked,
    Litho_LST_Checked,
    Litho_DOL_Checked,
    Litho_GPS_Checked,
    Litho_ANH_Checked,
    Paging_Shown,
    Is_CrossPlot_3D,
    Operation_Canceled,
    DTS_Selected,
    LithoLog_Open              :Boolean;

    Vp_Unit,
    DTS_Unit,
    DTP_Unit,
    VS_Unit,
    RHO_Unit,
    PHI_Unit,
    K_Unit,
    DTP_Mineral_Unit,
    DTP_Saturated_Unit,
    DTP_Fluid_Unit,
    DTS_Mineral_Unit,
    Temp_Zoom_File             :String;

    Han_Method,
    Han_Volume,
    Koenzy_Method_No,
    K_Calculation_Method,
    PHI_Calculation_Method,
    Kv_Sst_Content,
    Kv_Illite_Content,
    Kv_Shaly_Method_No,
    Kv_Calcultion_Method_No,
    Shale_Volume_Method,
    Shale_Calculation_Method,
    FR_Calculation_Method,
    Sw_Calculation_Method      :Shortint;
    Log_Scale             :Single;

    SST_Checked,
    SHL_Checked,
    LST_Checked,
    DOL_Checked,
    GPS_Checked,
    ANH_Checked:           Boolean;

    No_Lines_Skip:string;
    No_Columns:string;
    Depth_Column:string;
    DepthUnitString:string;
    NullValueString:string;
    StepValueString:string;
    Null_Value_String:string;
//    DepthUnit               :array of string[5];
//    Step_Values             :array of Single;

    { Public declarations }
  end;

  TLAS2File = class(TObject)
  private
    { Private declarations }
  public
     FileName              :String ;
     LASVersion            :ShortString ;
     IsWrapped             :Boolean ;
     DLMChar               :Char ;
     StartValue            :Single ;
     StopValue             :Single ;
     StepValue             :Single ;
     NullValue             :Single;
     DepthUnit             :ShortString ;
     NoTracks              :Byte;
     NoColumns             :Integer;
     NoLinesPerDepth       :Shortint;
     NoRecords             :Integer;
     DataStartLineNo       :Integer;
     TrackNames            :array of string[20];
     TrackUnits            :array of string[10];
     MaxValues             :array of Single;
     MinValues             :array of Single;

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
  Colors   : array[1..15] of TColor = ( clBlue, clGreen, clMaroon,
                                      clNavy, clPurple, clTeal, clRed,
                                      clFuchsia, $00FF8000, $00000040,
                                      $00004000, $008000FF, $00FF0080,
                                      $00800040, $00C08000);


  About_String=' P.U.T Petro-Eval         ver. 1.2.6.11' + #13 +
               'Petrophysical Evaluation Software' + #13 + #13 +
               'By:' + #13 +
               '       Dr. M.K. Ghassem Alaskari   askari5027@yahoo.com' + #13 +
               '       Mohsen Minaei                      minaeim@ifp-school.com';

var
  MainForm                :TMainForm;
  Lines                   :TStringList;
  Error_Code              :integer;
  Number_of_Charts        :Smallint;
  Depth_Value             :Single;
  Log_Value               :Single;
  ForFree1                :TLabel;
//  TempFile                :TextFile;
  Is_ForFree1_Created     :Boolean;
  Chart_Number            :Smallint;
  Charts_Scaled           :Boolean;
  Execute_File            :TFileRun;
//  Max_Points_Per_Page     :array of Smallint;
  Conversion_Unit         :array of Single;
  TopAxes                 :array of TChartAxis;
  Number_of_Composites    :Smallint;
  Composite_Tracks_Number :array of Byte;
  Composites              :array of Smallint;
  LithoLog_Created        :Boolean;
  MarkTool                :TMarksTipTool;
  LasFiles                :array of TLAS2File;
//  OpenedFile              :TLAS2File;
  File_Opened             :Boolean;
  ChartColor              :TColor;

implementation

uses ZoomedChart, DTSelection,
     CorrelationCoefficient, DTPSelection, CrossPlotTracks,
     CrossPlot, CompositeLog, HanModel, PoissonPage, KriefPage, LithoLog,
     ArpWorthington, RQIForm, FZIForm, HTForm, FFIForm, SvgrForm, FRForm,
     TauForm, PorosityForm, KvForm, KhForm, AnisotropyForm,
     HeterogeneityForm, AveragingForm, RwConcentration, ResistivityIndexForm,
     GRIndexForm, ShaleVolumeForm, RwSPForm, CECMethodForm, SwForm,
     GreenbergCastagnaForm, CECForm, PreviewForm, SaveForm,
     LithoMultiminForm, FluidModelForm, PHISelectForm, LithoDualForm,
  FirstForm, Main_Form2, SoForm;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  EnlargePic;
  DisableMenu;
  Chart_Number:=0;
  Is_ForFree1_Created:=False;
  Charts_Scaled:=False;
  Paging_Shown:=False;
  Execute_File:=TFileRun.Create(Application);
  Number_of_Composites:=0;
  LithoLog_Created:=False;
  LithoLog_Track_Number:=-1;
  Number_of_Pixels_Chart_Title:=0;

  DT_SST := 55.5;
  DT_SST_MAX := DT_SST + DT_RNG;
  DT_SST_MIN := DT_SST - DT_RNG;

  DT_LST := 49;
  DT_LST_MAX := DT_LST + DT_RNG;
  DT_LST_MIN := DT_LST - DT_RNG;

  DT_DOL := 44;
  DT_DOL_MAX := DT_DOL + DT_RNG;
  DT_DOL_MIN := DT_DOL - DT_RNG;

  DT_SHL := 110;
  DT_SHL_MAX := DT_SHL + DT_RNG;
  DT_SHL_MIN := DT_SHL - DT_RNG;

  DT_GPS := 52;
  DT_GPS_MAX := DT_GPS + DT_RNG;
  DT_GPS_MIN := DT_GPS - DT_RNG;

  DT_ANH := 50;
  DT_ANH_MAX := DT_ANH + DT_RNG;
  DT_ANH_MIN := DT_ANH - DT_RNG;

  DT_FLD := 189;
  DT_FLD_MAX := DT_FLD + DT_RNG;
  DT_FLD_MIN := DT_FLD - DT_RNG;

  RHO_SST := 2.65;
  RHO_SST_MAX := RHO_SST + RHO_RNG;
  RHO_SST_MIN := RHO_SST - RHO_RNG;

  RHO_LST := 2.71;
  RHO_LST_MAX := RHO_LST + RHO_RNG;
  RHO_LST_MIN := RHO_LST - RHO_RNG;

  RHO_DOL := 2.87;
  RHO_DOL_MAX := RHO_DOL + RHO_RNG;
  RHO_DOL_MIN := RHO_DOL - RHO_RNG;

  RHO_SHL := 2.5;
  RHO_SHL_MAX := RHO_SHL + RHO_RNG;
  RHO_SHL_MIN := RHO_SHL - RHO_RNG;

  RHO_GPS := 2.32;
  RHO_GPS_MAX := RHO_GPS + RHO_RNG;
  RHO_GPS_MIN := RHO_GPS - RHO_RNG;

  RHO_ANH := 2.9;
  RHO_ANH_MAX := RHO_ANH + RHO_RNG;
  RHO_ANH_MIN := RHO_ANH - RHO_RNG;

  RHO_FLD := 1.1;
  RHO_FLD_MAX := RHO_FLD + RHO_RNG;
  RHO_FLD_MIN := RHO_FLD - RHO_RNG;

  GR_SST := 10;
  GR_SST_MAX := GR_SST + GR_RNG;
  GR_SST_MIN := GR_SST - GR_RNG;

  GR_LST := 15;
  GR_LST_MAX := GR_LST + GR_RNG;
  GR_LST_MIN := GR_LST - GR_RNG;

  GR_DOL := 20;
  GR_DOL_MAX := GR_DOL + GR_RNG;
  GR_DOL_MIN := GR_DOL - GR_RNG;

  GR_SHL := 120;
  GR_SHL_MAX := GR_SHL + GR_RNG;
  GR_SHL_MIN := GR_SHL - GR_RNG;

  GR_GPS := 10;
  GR_GPS_MAX := GR_GPS + GR_RNG;
  GR_GPS_MIN := GR_GPS - GR_RNG;

  GR_ANH := 10;
  GR_ANH_MAX := GR_ANH + GR_RNG;
  GR_ANH_MIN := GR_ANH - GR_RNG;

  GR_FLD := 1;
  GR_FLD_MAX := GR_FLD + GR_RNG;
  GR_FLD_MIN := GR_FLD - GR_RNG;

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

  PEF_FLD := 1;
  PEF_FLD_MAX := PEF_FLD + PEF_RNG;
  PEF_FLD_MIN := PEF_FLD - PEF_RNG;

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

  NPHI_FLD := 1;
  NPHI_FLD_MAX := NPHI_FLD + NPHI_RNG;
  NPHI_FLD_MIN := NPHI_FLD - NPHI_RNG;

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

  RES_FLD := 1;
  RES_FLD_MAX := RES_FLD + RES_RNG;
  RES_FLD_MIN := RES_FLD - RES_RNG;

end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Visible:=False;
end;

procedure TMainForm.ReadLAS(File_Name: string);
var
i,j,k,m,n: integer;
p1,p2,p3:Smallint;
s1,s2,s3,s4:string;
Depth_Value:Single;
Log_Value:Single;
OneChar: Char;
Temp_Integer:integer;
Int1,Int2,Int3:integer;
NVS, LGS: String;
ChildName:String;
begin
with LasFiles[Length(LasFiles)-1] do
  begin
    File_Opened:=False;
  try
(********* Get file name without its complete path *)
    s1:=ReverseString(File_Name);
    p1:=Pos('\',s1);
    s1:=ReverseString(s1);
    p2:=Length(s1)-p1+2;
    s2:=Copy(s1,p2,p1);
    FileName:=s2;
(**********Create a root with the file name*********)
    CreateRoot(FileName);
(**********Load file into the memory*********)
    Lines:=TStringList.Create;
    Lines.LoadFromFile(File_Name);
(**********To find version number *********)
    for i:=0 to Lines.Count-1 do
      begin
        s1:=Trim(Lines[i]);
        p1:=Pos('VERS',s1);
          if (p1<>0)then Break;
      end;
    j:=i;
    s1:=(Lines[j]);
    s1:=Trim(s1);
    m:=Pos('.',s1);
    n:=PosEx(':', s1, m);
    s2:=Copy(s1,m+1,n-m-1);
    s2:=Trim(UpperCase(s2));
    LASVersion:=s2;
(**********To find if it is wrapped *********)
    for i:=j to Lines.Count-1 do
      begin
        s1:=(Lines[i]);
        p1:=Pos('WRAP',s1);
        if (p1<>0)then Break;
      end;
    j:=i;
    s1:=(Lines[j]);
    s1:=Trim(s1);
    m:=Pos('.',s1);
    n:=PosEx(':', s1, m);
    s2:=Copy(s1,m+1,n-m-1);
    s2:=Trim(UpperCase(s2));
    if UpperCase(s2)='YES' then
      IsWrapped:=True
    else
      IsWrapped:=False;
  (********* To find DLM character *********************)
    for i:=j to Lines.Count-1 do
      begin
        s1:=(Lines[i]);
        p1:=Pos('DLM',s1);
        p2:=Pos('~W',s1);
        if (p1<>0)or(p2<>0) then Break;
      end;
    j:=i;
    s1:=(Lines[j]);
    s1:=Trim(s1);
    m:=Pos('.',s1);
    n:=PosEx(':', s1, m);
    s2:=Copy(s1,m+1,n-m-1);
    s2:=Trim(UpperCase(s2));
    if s2='COMMA' then DLMChar:=','
    else if s2='SPACE' then DLMChar:=' '
    else if s2='TAB' then DLMChar:=#9
    else DLMChar:=' ';
(********* To find start value *********************)
    for i:=j to Lines.Count-1 do
        begin
        s1:=(Lines[i]);
        p1:=Pos('STRT',s1);
        if p1<>0 then Break;
        end;
    j:=i;
    s1:=Trim(Lines[j]);

//  To find depth units
    m:=Pos('.',s1);
    s2:=Copy(s1,m+1,1);
    DepthUnit:=UpperCase(s2);
//
    p3:=0;
    p2:=0;
    p1:=PosEx(' ',s1, m);
    for k := p1 to Length(s1) do
      begin
        OneChar:=s1[k];
        if OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+'] then
          begin
            p2:=k;
            Break;
          end;
      end;
    for k := p2 to Length(s1) do
      begin
        OneChar:=s1[k];
        if not(OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+']) then
          begin
            p3:=k;
            Break;
          end;
      end;
    s2:=Copy(s1,p2,p3-p2);
    s2:=Trim(s2);
    StartValue:=StrToFloat(s2);
(********* To find stop value *********************)
    for i:=j to Lines.Count-1 do
      begin
          s1:=(Lines[i]);
        p1:=Pos('STOP',s1);
        if p1<>0 then Break;
      end;
    j:=i;
    s1:=(Lines[j]);
    p3:=0;
    p2:=0;
    m:=Pos('.',s1);
    p1:=PosEx(' ',s1, m);
    for k := p1 to Length(s1) do
      begin
        OneChar:=s1[k];
        if OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+'] then
          begin
            p2:=k;
            Break;
          end;
      end;
    for k := p2 to Length(s1) do
      begin
        OneChar:=s1[k];
        if not(OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+']) then
          begin
            p3:=k;
            Break;
          end;
      end;
    s2:=Copy(s1,p2,p3-p2);
    s2:=Trim(s2);
    StopValue:=StrToFloat(s2);
(********* To find step value *********************)
    for i:=j to Lines.Count-1 do
      begin
        s1:=(Lines[i]);
        p1:=Pos('STEP',s1);
        if p1<>0 then Break;
      end;
    j:=i;
    s1:=Trim(Lines[j]);
    p3:=0;
    p2:=0;
    m:=Pos('.',s1);
    p1:=PosEx(' ',s1, m);
    for k := p1 to Length(s1) do
      begin
        OneChar:=s1[k];
       if OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+'] then
         begin
           p2:=k;
           Break;
         end;
     end;
    for k := p2 to Length(s1) do
      begin
        OneChar:=s1[k];
        if not(OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+']) then
          begin
            p3:=k;
            Break;
          end;
      end;
    s2:=Copy(s1,p2,p3-p2);
    s2:=Trim(s2);
    StepValue:=StrToFloat(s2);
(********* To find number of records *********************)
    NoRecords:=Trunc(ABS((StartValue-StopValue) / StepValue)) + 1;
(********* To find null value *********************)
    for i:=j to Lines.Count-1 do
      begin
        s1:=(Lines[i]);
        p1:=Pos('NULL',s1);
        if p1<>0 then Break;
      end;
    j:=i;
    s1:=Trim(Lines[j]);
    p3:=0;
    p2:=0;
    p1:=Pos('.',s1);
    for k := p1+1 to Length(s1) do
      begin
        OneChar:=s1[k];
        if OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+'] then
          begin
            p2:=k;
            Break;
          end;
      end;
    for k := p2 to Length(s1) do
      begin
        OneChar:=s1[k];
        if not(OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+']) then
          begin
            p3:=k;
            Break;
          end;
      end;
    s2:=Copy(s1,p2,p3-p2);
    s2:=Trim(s2);
    NullValue:=StrToFloat(s2);
    NVS:=FloatToStr(NullValue);
(*******************To find number of tracks ***********)
    for i:=j+1 to Lines.Count-1 do
      begin
        s1:=Trim(Lines[i]);
        p1:=Pos('~C',s1);
        p2:=Pos('~LOG_DEFINITION', s1);
        if (p1<>0)or(p2<>0) then Break;
      end;
    k:=i;
    Temp_Integer:=0;
    for j := k+1 to Lines.Count - 1 do
      begin
        s1:=Trim(Lines[j]);
        if (s1<>' ')and(s1<>'') then
          begin
            s2:=s1[1];
            if (s2<>'~')and(s2<>'#') then
              begin
                Inc(Temp_Integer);
                s3:=Lines[j+1];
                if (s3<>' ')and(s3<>'') then
                  begin
                    s4:=s3[1];
                    if (s4='~')or(s4='#') then
                      Break;
                  end
                else
                  Break;
              end;
          end;
      end;
    NoTracks:=Temp_Integer;
(*******************To find tracks names and units ***********)
    j:=k+1;
    k:=0;
    SetLength(TrackNames, NoTracks+1);
    SetLength(TrackUnits, NoTracks+1);
    SetLength(MaxValues, NoTracks+1);
    SetLength(MinValues, NoTracks+1);
    repeat
      try
(* To find track name *)
        s1:=Trim(Lines[j]);
        if (s1<>' ')and(s1<>'') then
          begin
            s2:=Trim(s1[1]);
            if (s2='#')or(s2='')or(s2='~') then
              begin
                Inc(j);
                Continue;
              end;
          end
        else
          begin
            Inc(j);
            Continue;
          end;
        ChildName:='';
        p1:=Pos('.', s1);
        s2:= Copy( s1, 1, p1-1);
        TrackNames[k]:=s2;
        ChildName:=s2;
(* to find track unit  *)
        p1:=Pos('.', s1);
        p2:=PosEx(' ', s1, p1);
        s2:= Copy( s1, p1+1, p2-p1);
        TrackUnits[k]:=s2;
        ChildName:=ChildName+'.'+s2;
        Inc(j);
        Inc(k);
        p1:=Pos('DEPT',ChildName);
        p2:=Pos('TIME',ChildName);
        if (p1=0)and(p2=0) then
          Preparation(FileName, ChildName);
      except
        UndoPreparation(FileName, ChildName);
      end;
    until k=NoTracks;
(**************** Reading file data ************************)
    for k:=j-2 to Lines.Count-1 do
      begin
        s1:=Trim(Lines[k]);
        p1:=Pos('~A',s1);
        p2:=Pos('~LOG_DATA',s1);
        if (p1<>0)or(p2<>0) then
          begin
            DataStartLineNo:=k+1;
            Break;
          end;
      end;

   n:=0;
// If the LAS file is not wrapped, version 1.2, 2 and 3
   if not IsWrapped then
     begin
       for i := 0 to NoRecords-1 do
         begin
           s1:=Trim(Lines[DataStartLineNo+i]);
           p3:=1;

(*****************Read depth value***********************)
           for k := p3 to Length(s1) do
             begin
               OneChar:=s1[k];
               if not(OneChar in [DLMChar,' ']) then
                 begin
                   p2:=k;
                   Break;
                 end;
             end;
           for k := p2 to Length(s1) do
             begin
               OneChar:=s1[k];
               if OneChar in [DLMChar,' '] then
                 begin
                   p3:=k;
                   Break;
                 end;
             end;
           if p2>p3 then
             p3:=Length(s1);
           s2:=Copy(s1,p2,p3-p2);
           s2:=Trim(s2);
           Depth_Value:=StrToFloat(Trim(s2));
           LGS:=FloatToStr(Depth_Value);
           if LGS<>NVS then
             begin
               if Depth_Value>MaxValues[0] then
                 MaxValues[0]:=RoundTo(Depth_Value, -4);
               if Depth_Value<MinValues[0] then
                 MinValues[0]:=RoundTo(Depth_Value, -4);
             end;

(**************Read track values********************************)
           for j:=0 to NoTracks-2 do
             begin
               for k := p3 to Length(s1) do
                 begin
                   OneChar:=s1[k];
                   if not(OneChar in [DLMChar,' ']) then
                     begin
                       p2:=k;
                       Break;
                     end;
                 end;
               for k := p2 to Length(s1) do
                 begin
                   OneChar:=s1[k];
                   if OneChar in [DLMChar,' '] then
                     begin
                       p3:=k;
                       Break;
                     end;
                 end;
               if p2>p3 then
                 p3:=Length(s1);
               s2:=Copy(s1,p2,p3-p2);
               s2:=Trim(s2);
               Log_Value:=StrToFloat(Trim(s2));
               LGS:=FloatToStr(Log_Value);
               if LGS<>NVS then
                 begin
                   Charts[j].Series[0].AddXY(Log_Value,Depth_Value);
                   if Log_Value>MaxValues[j] then
                     MaxValues[j]:=RoundTo(Log_Value, -4);
                   if Log_Value<MinValues[j] then
                     MinValues[j]:=RoundTo(Log_Value, -4);
                 end
               else
                   Charts[j].Series[0].AddNullXY(Log_Value,Depth_Value);
             end;
         end;
     end
// if it is wrapped
   else
     begin
       try
         NoColumns:=0;
         NoColumns:=StrToInt(InputBox('Number of Columns', 'Your LAS file is wrapped:'+#13+'File: '+FileName+#13+'Please enter number of columns in the file:', '0'));
         if NoColumns<=0 then
           Exit;
       except
           begin
             MessageDlg('You did not enter a valid number!'+#13+'The program will continue with 6 columns', mtError, [MbOk], 0);
             NoColumns:=6;
           end;
       end;
       NoLinesPerDepth:=Trunc((NoTracks-1)/NoColumns)+1;
       for i := 0 to NoRecords-1 do
         begin
           s1:=Trim(Lines[DataStartLineNo+n]);
           Inc(n);
{           for k := 1 to Length(s1) do
             begin
               OneChar:=s1[k];
               if not(OneChar in [DLMChar,' ']) then
                 begin
                   p2:=k;
                   Break;
                 end;
             end;
           for k := p2 to Length(s1) do
             begin
               OneChar:=s1[k];
               if OneChar in [DLMChar,' '] then
                 begin
                   p3:=k;
                   Break;
                 end;
             end;
           if p2>p3 then
             p3:=Length(s1);
           s2:=Copy(s1,p2,p3-p2);
           s2:=Trim(s2);                                }
           Depth_Value:=StrToFloat(Trim(s1));
           LGS:=FloatToStr(Depth_Value);
           if LGS<>NVS then
             begin
               if Depth_Value>MaxValues[0] then
                 MaxValues[0]:=RoundTo(Depth_Value, -4);
               if Depth_Value<MinValues[0] then
                 MinValues[0]:=RoundTo(Depth_Value, -4);
             end;
           for m := 1 to NoLinesPerDepth-1 do
             begin
               s1:=Trim(Lines[DataStartLineNo+n]);
               Inc(n);
               p3:=1;
               for j:=0 to NoColumns-1 do
                 begin
                   for k := p3 to Length(s1) do
                     begin
                       OneChar:=s1[k];
                       if not(OneChar in [DLMChar,' ']) then
                         begin
                           p2:=k;
                           Break;
                         end;
                     end;
                   for k := p2 to Length(s1) do
                     begin
                       OneChar:=s1[k];
                       if OneChar in [DLMChar,' '] then
                         begin
                           p3:=k;
                           Break;
                         end;
                     end;
                   if p2>p3 then
                     p3:=Length(s1);
                   s2:=Copy(s1,p2,p3-p2);
                   s2:=Trim(s2);
                   Log_Value:=StrToFloat(Trim(s2));
                   LGS:=FloatToStr(Log_Value);
                   if LGS<>NVS then
                     begin
                       Charts[(m-1)*NoColumns+j].Series[0].AddXY(Log_Value,Depth_Value);
                       if Log_Value>MaxValues[(m-1)*NoColumns+j] then
                         MaxValues[(m-1)*NoColumns+j]:=RoundTo(Log_Value, -4);
                       if Log_Value<MinValues[(m-1)*NoColumns+j] then
                         MinValues[(m-1)*NoColumns+j]:=RoundTo(Log_Value, -4);
                     end
                   else
                     Charts[(m-1)*NoColumns+j].Series[0].AddNullXY(Log_Value,Depth_Value);
                 end;
             end;
// Last Line for wrapped file
           Temp_integer:=(NoTracks-1) mod NoColumns;
           if Temp_Integer<>0 then
             begin
               s1:=Trim(Lines[DataStartLineNo+n]);
               Inc(n);
               for j:=0 to ((NoTracks-1) mod NoColumns)-1 do
                 begin
                   for k := 1 to Length(s1) do
                     begin
                       OneChar:=s1[k];
                       if not(OneChar in [DLMChar,' ']) then
                         begin
                           p2:=k;
                           Break;
                         end;
                     end;
                   for k := p2 to Length(s1) do
                     begin
                       OneChar:=s1[k];
                       if OneChar in [DLMChar,' '] then
                         begin
                           p3:=k;
                           Break;
                         end;
                     end;
                   if p2>p3 then
                     p3:=Length(s1);
                   s2:=Copy(s1,p2,p3-p2);
                   s2:=Trim(s2);
                   Log_Value:=StrToFloat(Trim(s2));
                   LGS:=FloatToStr(Log_Value);
                   if LGS<>NVS then
                    begin
                      Charts[(NoLinesPerDepth-1)*NoColumns+j].Series[0].AddXY(Log_Value,Depth_Value);
                      if Log_Value>MaxValues[(NoLinesPerDepth-1)*NoColumns+j] then
                         MaxValues[(NoLinesPerDepth-1)*NoColumns+j]:=RoundTo(Log_Value, -4);
                       if Log_Value<MinValues[(NoLinesPerDepth-1)*NoColumns+j] then
                         MinValues[(NoLinesPerDepth-1)*NoColumns+j]:=RoundTo(Log_Value, -4);
                     end
                   else
                     Charts[(NoLinesPerDepth-1)*NoColumns+j].Series[0].AddNullXY(Log_Value,Depth_Value);
                 end;
             end;
         end;
     end;
(***********************************************************)
    Lines.Free;
    Number_of_Charts:=Chart_Number;
  except
    Lines.Free;
    UndoPreparation(FileName, ChildName);
    Tree1.BeginUpdate;
    Tree1.DeleteShape(Tree1.Roots.Last);
    Tree1.EndUpdate;
  end;
end;
end;

procedure TMainForm.ReadASCII(File_Name: string);
var
j, m, n, k: integer;
p1,p2,p3:Smallint;
s1,s2,s3,s4:string;
DepthUnit_String: string[5];
Step_Value_String: string[8];
NVS,LGS: string[8];
Root_Name:string;
Child_Name: String;
File_Opened: Boolean;
TempFile:TextFile;
OneChar:Char;
begin
with LasFiles[0] do
  begin
    File_Opened:=False;
    try
(********* Get file name without its complete path *)
      s1:=ReverseString(File_Name);
      p1:=Pos('\',s1);
      s1:=ReverseString(s1);
      p2:=Length(s1)-p1+2;
      s2:=Copy(s1,p2,p1);
      Root_Name:=s2;
(**********Create a root with the file name*********)
      CreateRoot(Root_Name);
      Lines:=TStringList.Create;
      Lines.LoadFromFile(File_Name);
(********* To find depth units *********************)
      DepthUnit_String:=MainForm2.DepthUnitString;
      DepthUnit:=DepthUnit_String;
(***************************************************)
(********* To find step values *********************)
      Step_Value_String:=StepValueString;
      StepValue:=StrToFloat(Step_Value_String);
(***************************************************)
(********* To find null values *********************)
      NullValue:=StrToFloat(NullValueString);
      NVS:=FloatToStr(NullValue);
(***************************************************)
(********* To add curves information ***************)
      j:=StrToInt(No_Lines_Skip);
      s1:=(Lines[j]);
      p3:=1;
      p2:=0;
//      p1:=1;
//      m:=0;
      s3:='';
      s4:='';
      NoTracks:=0;
      repeat
        try
          for k := p3 to Length(s1) do
            begin
              OneChar:=s1[k];
              if OneChar<>DLMChar then
                begin
                  p2:=k;
                  Break;
                end;
            end;
          for k := p2 to Length(s1) do
            begin
              OneChar:=s1[k];
              if OneChar=DLMChar then
                begin
                  p3:=k;
                  Break;
                end;
            end;
          if p2>p3 then
            begin
              p3:=Length(s1)+1;
              s4:='FINISHED';
            end;
          s2:=Copy(s1,p2,p3-p2);
          Child_Name:= s2;
          p1:=pos('DEPT', Uppercase(s2));
          if p1=0 then
            Preparation(Root_Name, Child_Name);
{          Values.FieldDefs.Add(Trim(s2), ftFloat, 0, False);

          Properties.Append;
          p1:=Pos('.', s2);
          s3:= Copy( s2, p1+1, Length(s2)-1);
          s2:=Copy(s2,1,p1);

          Properties.Fields[0].Value:=Trim(s2);
          Properties.Fields[1].Value:=Trim(s3);
          Properties.Fields[2].Value:=-99999999;
          Properties.Fields[3].Value:=99999999;}
//          Inc(j);
          Inc(NoTracks);

        except
{          on E:EdataBaseError do
            begin
              MessageDlg('Field '+s2+' already exists.'+#13+'Please check your file.', mtError, [mbok], 0);
              Values.FieldDefs.Add(Trim(s2)+IntToStr(k), ftFloat, 0, False);
              p1:=Pos('.', s2);
              s3:= Copy( s2, p1+1, Length(s2)-1);
              Properties.Fields[1].Value:=Trim(s3);
              Properties.Fields[2].Value:=-99999999;
              Properties.Fields[3].Value:=99999999;
              Inc(NoTracks);
              Inc(j);
            end;}
        end;
      until s4='FINISHED';
{    Values.CreateTable;
    Values.Open;
    Properties.First;
    for n := 0 to NoTracks-1 do
      begin
        s1:=Properties.FieldByName('TRACK_NAME').AsString+'.'+Properties.FieldByName('TRACK_UNIT').AsString;
        Values.Fields[n].DisplayLabel:=s1;
        Properties.Next;
      end;
    Values.Open;
    Values.First;    }
(**************** Reading file data ************************)
  AssignFile(TempFile,File_Name);
  Reset(TempFile);
  File_Opened:=True;
//  Values.DisableControls;
//  Properties.DisableControls;
  for n:=0 to StrToInt(No_Lines_Skip)+1 do
    Readln(TempFile);
  while not(EoF(TempFile)) do
    begin
      try
        Read(TempFile,Depth_Value);
//           Properties.First;
//           p3:=1;
//           Values.Edit;
//           Values.Append;
        for j:=0 to NoTracks-2 do
          begin
            Read(TempFile,Log_Value);
               LGS:=FloatToStr(Log_Value);
               if LGS<>NVS then
                 Charts[j].Series[0].AddXY(Log_Value,Depth_Value)
               else
                 Charts[j].Series[0].AddNullXY(Log_Value,Depth_Value);

{                   Values.Fields[j].AsString:=Trim(LGS);
                   Properties.Edit;
                   if Log_Value>Properties.Fields[2].AsFloat then
                     Properties.Fields[2].AsFloat:=RoundTo(Log_Value, -4);
                   if Log_Value<Properties.Fields[3].AsFloat then
                     Properties.Fields[3].AsFloat:=RoundTo(Log_Value, -4);
                 end
               else
                 Values.Fields[j].AsString:='';

               Properties.Next;}
          end;
        Readln(TempFile);
      except
        Messagedlg('Corrupted data!', mtError, [mbOk], 0);
//        Values.Fields[j].AsString:='';
        Readln(TempFile);
      end;
    end;
(***********************************************************)
{  Values.Edit;
  Values.Post;
  Properties.Edit;
  Properties.Post;
  DataSource1.DataSet:=Properties;
  DataSource2.DataSet:=Values;
  Values.EnableControls;
  Properties.EnableControls;}
  Number_of_Charts:=Chart_Number;
  CloseFile(TempFile);
  Lines.Free;
except
  UndoPreparation(Root_Name, Child_Name);
  if File_Opened then
    CloseFile(TempFile);
  Lines.Free;
  Tree1.DeleteShape(Tree1.Roots.Last);
{  Values.Edit;
  Values.Post;
  Properties.Edit;
  Properties.Post;
  DataSource1.DataSet:=Properties;
  DataSource2.DataSet:=Values;
  Values.Close;
  Properties.Close;
  Values.EnableControls;
  Properties.EnableControls;}
end;
end;

{  File_Opened:=False;
try
(********* Get file name without its complete path *)
  s1:=ReverseString(File_Name);
  p1:=Pos('\',s1);
  s1:=ReverseString(s1);
  p2:=Length(s1)-p1+2;
  s2:=Copy(s1,p2,p1);
  Root_Name:=s2;
(**********Create a root with the file name*********)
  CreateRoot(Root_Name);
  Lines:=TStringList.Create;
  Lines.LoadFromFile(File_Name);
(********* To find step value *********************)
  s1:=Lines[0];
  s1:=Trim(s1);
  p1:=Pos(':',s1);
  s2:=Copy(s1,p1+1,20);
  s2:=Trim(s2);
  Step_Value_String:=s2;
(***************************************************)
(********* To find null values *********************)
  s1:=Lines[1];
  p1:=Pos(':',s1);
  s2:=Copy (s1,p1+1,20);
  s2:=Trim(s2);
  Null_Value_String:=s2;
(***************************************************)
(********* To find depth units *********************)
  for i:=2 to Lines.Count-1 do
    begin
      s1:=Lines[i];
      p1:=Pos('Column 1',s1);
      if p1<>0 then Break;
    end;
  j:=i;
  s1:=Lines[j];
  s1:=Trim(s1);
  p1:=Pos('Unit',s1);
  p2:=PosEx(':', s1, p1);
  s2:=Copy(s1,p2+1,10);
  s2:=Trim(s2);
  DepthUnit_String:=UpperCase(s2);
(***************************************************)
(********* To add curves information ***************)
  j:=i+1;
  s1:=Lines[j];
  while (Pos('Column', s1)<>0) do
    begin
      p1:=Pos(':', s1);
      p2:=Pos('-', s1);
      s2:=Copy(s1, p1+1, p2-p1-1);
      s2:=Trim(s2);
      p1:=Pos('Unit', s1);
      p2:=PosEx(':', s1, p1);
      s3:=Copy(s1, p2+1, 20);
      s3:=Trim(s3);
      s4:=s2 + '.' + s3;
      Child_Name:= s4;
      Preparation(Root_Name, Child_Name);
      j:=j+1;
      s1:=Lines[j];
    end;
(**************** Reading file data ************************)
  AssignFile(TempFile,File_Name);
  Reset(TempFile);
  File_Opened:=True;
  for j:=2 to Lines.Count-1 do
    begin
      s1:=Lines[j];
      p1:=Pos('Column',s1);
      if p1=0 then Break;
    end;
  for i:=0 to j do
    Readln(TempFile);
  while not(EoF(TempFile)) do
    begin
      try
        Read(TempFile,Depth_Value);
        for j:=Number_of_Charts to Chart_Number-1 do
          begin
             Read(TempFile,Log_Value);
            if  not(Null_Value_String=FloatToStr(Log_Value)) then
              Charts[j].Series[0].AddXY(Log_Value,Depth_Value)
            else
              Charts[j].Series[0].AddNullXY(Log_Value,Depth_Value);
          end;
        Readln(TempFile);
      except
        Messagedlg('Corrupted data!', mtError, [mbOk], 0);
        Charts[Length(Charts)-1].Series[0].AddNull('');
        Readln(TempFile);
      end;
    end;
(***********************************************************)
  Number_of_Charts:=Chart_Number;
  CloseFile(TempFile);
  Lines.Free;
except
  UndoPreparation(Root_Name, Child_Name);
  if File_Opened then
    CloseFile(TempFile);
  Lines.Free;
  Tree1.DeleteShape(Tree1.Roots.Last);
end;}
end;

procedure TMainForm.CreateChart(Chart_Title: String; Chart_Index: Smallint);
begin
  SetLength(Charts, Length(Charts)+1);
  Charts[Chart_Index]:=TChart.Create(ForFree1);
  Charts[Chart_Index].Top:=0;
  Charts[Chart_Index].Width:=200;
  Charts[Chart_Index].PrintProportional:=True;
  if Chart_Index=0 then
    Charts[Chart_Index].Height:=ScrollBox1.ClientHeight - 17 //Tracks_Form.ClientHeight - 17
  else
    Charts[Chart_Index].Height:= Charts[0].Height;

//  Charts[Chart_Index].Left:=Tree1.Left+Tree1.Width+150*(Chart_Index-1)+10;
  Charts[Chart_Index].Align:=alNone;
  Charts[Chart_Index].View3D:=False;
  Charts[Chart_Index].Color:=clWhite;
  Charts[Chart_Index].Legend.Visible:=False;
  Charts[Chart_Index].MarginUnits:=muPixels;
  Charts[Chart_Index].MarginTop:=0;
  Charts[Chart_Index].MarginLeft:=2;
  Charts[Chart_Index].MarginRight:=2;
  Charts[Chart_Index].MarginBottom:=10;
  Charts[Chart_Index].Title.Visible:=False;
  Charts[Chart_Index].MarginTop:= Number_of_Pixels_Chart_Title * 40;

  Charts[Chart_Index].Axes.Top.Title.Caption:=Chart_Title;
  Charts[Chart_Index].Axes.Top.Title.Visible:=True;
  Charts[Chart_Index].Axes.Top.Title.Font.Color:=ChartColor;
  Charts[Chart_Index].Axes.Top.Title.Font.Size:=8;
  Charts[Chart_Index].Axes.Top.Title.Font.Name:='Tahoma';
  Charts[Chart_Index].Axes.Top.Title.Font.Style:=[fsBold];
  Charts[Chart_Index].Axes.Top.Grid.Width:=0;
  Charts[Chart_Index].Axes.Top.LabelStyle:=talValue;
  Charts[Chart_Index].Axes.Top.TickLength:=8;
  Charts[Chart_Index].Axes.Top.Ticks.Width:=2;
  Charts[Chart_Index].Axes.Top.MinorTickLength:=6;
  Charts[Chart_Index].Axes.Top.MinorTickCount:=4;
  Charts[Chart_Index].Axes.Top.MinorTicks.Width:=2;
  Charts[Chart_Index].Axes.Top.MinorGrid.Color:=clGray;
  Charts[Chart_Index].Axes.Top.MinorGrid.Style:=psDot;
  Charts[Chart_Index].Axes.Top.LabelsOnAxis:=True;
  Charts[Chart_Index].Axes.Top.RoundFirstLabel:=True;
  Charts[Chart_Index].Axes.Top.MaximumOffset:=15;
  Charts[Chart_Index].Axes.Top.MinimumOffset:=15;
  Charts[Chart_Index].Axes.Top.LabelsSeparation:=20;
  Charts[Chart_Index].Axes.Top.AxisValuesFormat:='#0.####';
  Charts[Chart_Index].Axes.Top.LabelsFont.Color:=ChartColor;
  Charts[Chart_Index].Axes.Top.LabelsFont.Style:=[fsBold];
  Charts[Chart_Index].Axes.Top.Axis.Color:=ChartColor;
  Charts[Chart_Index].Axes.Top.Ticks.Color:=ChartColor;
  Charts[Chart_Index].Axes.Top.MinorTicks.Color:=ChartColor;
  Charts[Chart_Index].Axes.Top.MinorTicks.Color:=ChartColor;

  Charts[Chart_Index].Axes.Right.Title.Caption:='Depth('+LasFiles[0].DepthUnit+')';
  Charts[Chart_Index].Axes.Right.Title.Font.Color:=$00FF8000;
  Charts[Chart_Index].Axes.Right.Title.Font.Size:=8;
  Charts[Chart_Index].Axes.Right.Title.Font.Style:=[fsBold];
  Charts[Chart_Index].Axes.Right.Title.Font.Name:='Tahoma';
  Charts[Chart_Index].Axes.Right.Title.Font.InterCharSize:=10;
  Charts[Chart_Index].Axes.Right.Inverted:=True;
  Charts[Chart_Index].Axes.Right.LabelsFont.Color:=clBlack;
  Charts[Chart_Index].Axes.Right.LabelsFont.Style:=[fsBold];
  Charts[Chart_Index].Axes.Right.LabelsSeparation:=100;
  Charts[Chart_Index].Axes.Right.Grid.Width:=0;
  Charts[Chart_Index].Axes.Right.Visible:=True;
  Charts[Chart_Index].Axes.Right.MinorGrid.Visible:=False;
  Charts[Chart_Index].Axes.Right.TickLength:=8;
  Charts[Chart_Index].Axes.Right.Ticks.Width:=2;
  Charts[Chart_Index].Axes.Right.Ticks.Color:=clBlack;
  Charts[Chart_Index].Axes.Right.MinorTickLength:=6;
  Charts[Chart_Index].Axes.Right.MinorTickCount:=4;
  Charts[Chart_Index].Axes.Right.MinorTicks.Width:=2;
  Charts[Chart_Index].Axes.Right.MinorTicks.Color:=clBlack;
  Charts[Chart_Index].Axes.Right.LabelsOnAxis:=True;
  Charts[Chart_Index].Axes.Right.RoundFirstLabel:=True;
  Charts[Chart_Index].Axes.Right.AxisValuesFormat:='#0.####';

  Charts[Chart_Index].Axes.Bottom.Visible:=False;

  Charts[Chart_Index].Axes.Left.Title.Caption:='Depth('+LasFiles[0].DepthUnit+')';
  Charts[Chart_Index].Axes.Left.Title.Font.Color:=$00FF8000;
  Charts[Chart_Index].Axes.Left.Title.Font.Size:=8;
  Charts[Chart_Index].Axes.Left.Title.Font.Style:=[fsBold];
  Charts[Chart_Index].Axes.Left.Title.Font.Name:='Tahoma';
  Charts[Chart_Index].Axes.Left.Title.Font.InterCharSize:=10;
  Charts[Chart_Index].Axes.Left.Inverted:=True;
  Charts[Chart_Index].Axes.Left.LabelsFont.Color:=clBlack;
  Charts[Chart_Index].Axes.Left.LabelsSeparation:=100;
  Charts[Chart_Index].Axes.Left.Grid.Width:=0;
  Charts[Chart_Index].Axes.Left.Visible:=True;
  Charts[Chart_Index].Axes.Left.MinorGrid.Visible:=False;
  Charts[Chart_Index].Axes.Left.TickLength:=8;
  Charts[Chart_Index].Axes.Left.Ticks.Width:=2;
  Charts[Chart_Index].Axes.Left.Ticks.Color:=clBlack;
  Charts[Chart_Index].Axes.Left.MinorTickLength:=6;
  Charts[Chart_Index].Axes.Left.MinorTickCount:=4;
  Charts[Chart_Index].Axes.Left.MinorTicks.Width:=2;
  Charts[Chart_Index].Axes.Left.MinorTicks.Color:=clBlack;
  Charts[Chart_Index].Axes.Left.LabelsOnAxis:=True;
  Charts[Chart_Index].Axes.Left.RoundFirstLabel:=True;
  Charts[Chart_Index].Axes.Left.AxisValuesFormat:='#0.####';
  Charts[Chart_Index].Axes.Left.LabelsFont.Style:=[fsBold];
//  Charts[Chart_Index].Axes.Top.OnDrawLabel:=TopAxisDrawLabel;

  Charts[Chart_Index].Walls.Visible:=False;

  if Chart_Index<>0 then
    begin
      Charts[Chart_Index].Axes.Left.Title.Visible:=False;
      Charts[Chart_Index].Left:=250 + 200*(Chart_Index-1);
      Charts[Chart_Index].Axes.Left.TickOnLabelsOnly:=False;
      Charts[Chart_Index].Axes.Left.Axis.Visible:=False;
      Charts[Chart_Index].Axes.Left.Ticks.Visible:=False;
      Charts[Chart_Index].Axes.Left.Labels:=False;
      Charts[Chart_Index].Axes.Left.MinorTicks.Visible:=False;
    end
  else
    begin
      Charts[Chart_Index].Axes.Left.Title.Visible:=True;
      Charts[Chart_Index].Width:=250;
      Charts[Chart_Index].Left:=0;
      Charts[Chart_Index].Axes.Left.TickOnLabelsOnly:=True;
      Charts[Chart_Index].Axes.Left.Axis.Visible:=True;
      Charts[Chart_Index].Axes.Left.Ticks.Visible:=True;
      Charts[Chart_Index].Axes.Left.Labels:=True;
      Charts[Chart_Index].Axes.Left.MinorTicks.Visible:=True;
    end;

  Charts[Chart_Index].BevelInner:=bvNone;
  Charts[Chart_Index].BevelOuter:=bvNone;
  Charts[Chart_Index].Zoom.Brush.Color:=clYellow;
  Charts[Chart_Index].Zoom.Brush.Style:=bsSolid;
  Charts[Chart_Index].Zoom.Pen.Color:=clRed;
  Charts[Chart_Index].Zoom.Direction:=tzdVertical;
  Charts[Chart_Index].AllowPanning:=pmNone;
  Charts[Chart_Index].ScrollMouseButton:=mbMiddle;
  Charts[Chart_Index].Tag:=Chart_Number;
  Charts[Chart_Index].Walls.Back.Pen.Width:=2;
  Charts[Chart_Index].OnZoom:=Zooming;
  Charts[Chart_Index].OnCanResize:=Charts_Resize;
  Charts[Chart_Index].OnDragDrop:=ChartsDragDrop;
  Charts[Chart_Index].OnDragOver:=ChartsDragOver;
//  Charts[Chart_Index].Zoom.MouseButton:=mbMiddle;
  if ToolButton15.Down then
    Charts[Chart_Index].DragMode:=dmAutomatic
  else
    Charts[Chart_Index].DragMode:=dmManual;
  CreatePopupMenu(Charts[Chart_Index]);
//  SortCharts;
end;

procedure TMainForm.TopAxisDrawLabel(Sender:TChartAxis; var X,Y,Z:Integer;
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

procedure TMainForm.RemoveChart(Chart_Title: String; Chart_Index: Smallint);
begin
  if Length(Charts)>0 then
    begin
      Charts[Chart_Index-1].Free;
      SetLength(Charts, Length(Charts)-1);
    end;
//  SortCharts;
end;

procedure TMainForm.CreateSeries(Sender: TChart; Chart_Index: Smallint);
begin
  Log_Values:=THorizLineSeries.Create(Charts[Chart_Index]);
  Log_Values.Name:='Track_'+IntToStr(Chart_Index+1);
  Log_Values.Title:=Charts[Chart_Index].Axes.Top.Title.Caption;
  Log_Values.Stairs:=True;
  Log_Values.Pen.Width:=2;
//  Log_Values.HorizAxis:=aTopAxis;
  Log_Values.Color:=CHartColor;
//  Log_Values.TreatNulls:=tnDontPaint;
  Log_Values.ParentChart:=Sender;
  MarkTool:=TMarksTipTool.Create(Charts[Chart_Index]);
  MarkTool.ParentChart:=Charts[Chart_Index];
  MarkTool.Style:=smsXY;
  MarkTool.MouseAction:=mtmClick;
  MarkTool.Series:=Log_Values;
//  SortCharts;
end;

procedure TMainForm.CreateChild(Root_Caption: String; Child_Caption: String);
var
  i:Smallint;
begin
// Check if a root with the same Root_Caption exists ...
  for i:=0 to Tree1.Roots.Count-1 do
    begin
      if Root_Caption=Tree1.Roots[i].SimpleText then
        begin
          Tree1.Roots[i].AddChild(Child_Caption).Font.Color:=clNavy;
          Tree1.Roots[i].Childs[Tree1.Roots[i].Childs.Count-1].OnClick:=TreeChildClicked;
          Tree1.Roots[i].Childs[Tree1.Roots[i].Childs.Count-1].Tag:=Chart_Number;
          Tree1.Roots[i].Childs[Tree1.Roots[i].Childs.Count-1].Font.Style:=[];
          Exit;
        end;
    end;
// Else ...
  Tree1.Roots[Tree1.Roots.Count-1].AddChild(Child_Caption).Font.Color:=clNavy;
  Tree1.Roots[Tree1.Roots.Count-1].Childs[Tree1.Roots[Tree1.Roots.Count-1].Childs.Count-1].OnClick:=TreeChildClicked;
  Tree1.Roots[Tree1.Roots.Count-1].Childs[Tree1.Roots[Tree1.Roots.Count-1].Childs.Count-1].Tag:=Chart_Number;
  Tree1.Roots[Tree1.Roots.Count-1].Childs[Tree1.Roots[Tree1.Roots.Count-1].Childs.Count-1].Font.Style:=[];
end;

procedure TMainForm.RemoveChild(Root_Caption: String; Child_Caption: String);
var
  i,j:Smallint;
begin
  Tree1.BeginUpdate;
  for i:=0 to Tree1.Roots.Count-1 do
    if Root_Caption=Tree1.Roots[i].SimpleText then
      for j:=0 to Tree1.Roots[i].Children.Count-1 do
        if Child_Caption=Tree1.Roots[i].Childs[j].SimpleText then
          Tree1.Roots[i].Childs[j].Destroy;
  Tree1.EndUpdate;
end;

procedure TMainForm.CreateRoot(Root_Caption: String);
var
  i:Smallint;
begin
  for i:=0 to Tree1.Roots.Count-1 do
    begin
      if Root_Caption=Tree1.Roots[i].SimpleText then Exit;
    end;
  with Tree1.GlobalFormat do
    begin
      Border.Visible:=False;
      Transparent:=True;
      ImageIndex:=tiChecked;
      Connection.ArrowTo.Style:=casCircle;
      Font.Name:='Tahoma';
      Font.Color:=clGreen;
      Font.Style:=[fsBold];
    end;
  Tree1.BeginUpdate;
  Tree1.AddRoot(Root_Caption).OnClick:=TreeRootClicked;
  Tree1.Roots.Last.Expanded:=True;
  Tree1.EndUpdate;
end;

procedure TMainForm.TreeRootClicked(Sender: TTreeNodeShape; Button:TMouseButton; Shift: TShiftState; X: Integer; Y: Integer);
var
i: Smallint;
begin
  with Sender as TTreeNodeShape do
    begin
      if Button=mbLeft then
        begin
          if ImageIndex=tiChecked then
            begin
              ImageIndex:=tiUnChecked;
              for i:=Childs.Count-1 downto 0 do
                TreeChildClicked(Childs[i], mbLeft, [ssLeft], 0, 0);
            end
          else
            begin
              ImageIndex:=tiChecked;
              for i:=0 to Childs.Count-1 do
                TreeChildClicked(Childs[i], mbLeft, [ssLeft], 0, 0);
            end;
        end;
    end;
end;

procedure TMainForm.TreeChildClicked(Sender: TTreeNodeShape; Button:TMouseButton; Shift: TShiftState; X: Integer; Y: Integer);
begin
  with Sender as TTreeNodeShape do
    begin
      if Button=mbLeft then
        begin
          if ImageIndex=tiChecked then
            begin
              ImageIndex:=tiUnChecked;
              Charts[Tag].Visible:=False;
//              HorzScrollBar.Position:=HorzScrollBar.Position - 200;
            end
          else
            begin
              ImageIndex:=tiChecked;
              Charts[Tag].Visible:=True;
//              HorzScrollBar.Position:=HorzScrollBar.Position + 200;
            end;
        end;
    end;
  SortCharts;
end;

procedure TMainForm.Charts_Resize(Sender: TObject;
                                  var NewWidth, NewHeight: Integer;
                                  var Resize: Boolean);
begin
{  with Sender as TChart do
    begin
      if Charts_Scaled then
        begin
          for i:=0 to Number_of_Charts-1 do
            begin
              if i<>LithoLog_Track_Number then
                begin
                  Charts[i].Height:=Tracks_Form.ClientHeight-22;
//                  Max_Points_Per_Page[i]:=Round(Log_Scale/ABS(Step_Values[i])*(NewHeight-47-MarginBottom)/Conversion_Unit[i]);
(**************** 47 is difference between chart.height and the height of its chart.rect ***********************)
//                  MaxPointsPerPage:=Max_Points_Per_Page[i];
                end;
            end;
        end;
    end;}
end;

procedure TMainForm.CreatePopupMenu(Sender: TChart);
var
NewItem: TMenuItem;
Popup:TPopupMenu;
begin
  with Sender do
    begin
      Popup:=TPopupMenu.Create(Charts[Length(Charts)-1]);
      Popup.AutoPopup:=True;
      Popup.Tag:=Tag;
      NewItem:=TMenuItem.Create(PopupMenu);
      NewItem.Tag:=Tag;
      Popup.Items.Add(NewItem);
      NewItem.Caption:='Print';
      NewItem.OnClick:=PopupClicked;
      NewItem:=TMenuItem.Create(PopupMenu);
      Popup.Items.Add(NewItem);
      NewItem.Caption:='Export';
      NewItem.OnClick:=PopupClicked;
      NewItem:=TMenuItem.Create(PopupMenu);
      Popup.Items.Add(NewItem);
      NewItem.Caption:='-';
      NewItem:=TMenuItem.Create(PopupMenu);
      Popup.Items.Add(NewItem);
      NewItem.Caption:='Axes Ranges';
      NewItem.OnClick:=PopupClicked;
      NewItem:=TMenuItem.Create(PopupMenu);
      Popup.Items.Add(NewItem);
      NewItem.Caption:='Make Logarithmic';
      NewItem.OnClick:=PopLogarithmic;
      NewItem:=TMenuItem.Create(PopupMenu);
      Popup.Items.Add(NewItem);
      NewItem.Caption:='Values';
      NewItem.OnClick:=PopupClicked;
      NewItem:=TMenuItem.Create(PopupMenu);
      Popup.Items.Add(NewItem);
      NewItem.Caption:='-';
      NewItem:=TMenuItem.Create(PopupMenu);
      Popup.Items.Add(NewItem);
      NewItem.Caption:='Edit';
      NewItem.OnClick:=PopupClicked;
      PopupMenu:=Popup;
    end;
end;

procedure TMainForm.PopupClicked(Sender: TObject);
begin
  with Sender as TMenuItem do
    begin
      Case MenuIndex of
        0:begin
            ChartPreviewer1.Chart:=Charts[GetParentMenu.Tag];
            ChartPreviewer1.Execute;
          end;
        1:begin
            ChartEditor1.Chart:=Charts[GetParentMenu.Tag];
            ChartEditor1.DefaultTab:=cetExport;
            ChartEditor1.Execute;
          end;
        2:;
        3:begin
            ChartEditor1.Chart:=Charts[GetParentMenu.Tag];
            ChartEditor1.DefaultTab:=cetAxis;
            ChartEditor1.Execute;
          end;
        4:;
        5:begin
            ChartEditor1.Chart:=Charts[GetParentMenu.Tag];
            ChartEditor1.DefaultTab:=cetSeriesData;
            ChartEditor1.Execute;
          end;
        6:;
        7:begin
            ChartEditor1.Chart:=Charts[GetParentMenu.Tag];
            ChartEditor1.DefaultTab:=cetPanel;
            ChartEditor1.Execute;
          end;
      end;
    end;
end;

procedure TMainForm.PopLogarithmic(Sender: TObject);
var
Is_Logarithmic:Boolean;
XMIN: Single;
i,j: Integer;
begin
  with Sender as TMenuItem do
    begin
      j:=Charts[GetParentMenu.Tag].CustomAxes.Count;
      if j=0 then
        begin
          XMIN:=Charts[GetParentMenu.Tag].Axes.Top.Minimum;
          if XMIN>=0 then
            begin
              Is_Logarithmic:=Charts[GetParentMenu.Tag].Axes.Top.Logarithmic;
              if Is_Logarithmic then
                begin
                  Charts[GetParentMenu.Tag].Axes.Top.Logarithmic:=False;
                  Charts[GetParentMenu.Tag].Axes.Top.MinorTickCount:=4;
                  Caption:='Make Logarithmic';
                end
              else
                begin
                  Charts[GetParentMenu.Tag].Axes.Top.Logarithmic:=True;
                  Charts[GetParentMenu.Tag].Axes.Top.MinorTickCount:=8;
                  Caption:='Make Ordinal';
                end;
            end
          else
            MessageDlg('Minimum has to be greater than or equal to zero (Change range minimum value).', mtWarning, [mbOk],0);
        end
      else
        begin
          for i:=j downto 1 do
            begin
              XMIN:=Charts[GetParentMenu.Tag].Axes[Charts[GetParentMenu.Tag].Axes.Count-i].Minimum;
              if XMIN>=0 then
                begin
                  Is_Logarithmic:=Charts[GetParentMenu.Tag].Axes[Charts[GetParentMenu.Tag].Axes.Count-i].Logarithmic;
                  if Is_Logarithmic then
                    begin
                      Charts[GetParentMenu.Tag].Axes[Charts[GetParentMenu.Tag].Axes.Count-i].Logarithmic:=False;
                      Charts[GetParentMenu.Tag].Axes[Charts[GetParentMenu.Tag].Axes.Count-i].MinorTickCount:=4;
                      Caption:='Make Logarithmic';
                    end
                  else
                    begin
                      Charts[GetParentMenu.Tag].Axes[Charts[GetParentMenu.Tag].Axes.Count-i].Logarithmic:=True;
                      Charts[GetParentMenu.Tag].Axes[Charts[GetParentMenu.Tag].Axes.Count-i].MinorTickCount:=8;
                      Caption:='Make Ordinal';
                    end;
                end;
            end
        end;
    end;
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  Visible:=False;
end;

procedure TMainForm.ChangeScale1Click(Sender: TObject);
var
i: Smallint;
Scale_Value:String;
Clicked_Ok:Boolean;
Temp_Value:Integer;
begin
  if Tree1.Roots.Count=0 then Exit;
  if Length(Charts)<>0 then
    begin
      Scale_Value:=FloatToStr(Log_Scale);
      Clicked_Ok:=InputQuery('Scale Value', 'Please enter the scale value:', Scale_Value);
      if Clicked_Ok then
        begin
          Charts_Scaled:=True;
          Log_Scale:=StrToFloat(Scale_Value);
          for i:=0 to Number_of_Charts-1 do
            begin
              SetLength(Conversion_Unit, Length(Conversion_Unit)+1);
//              SetLength(Max_Points_Per_Page, Length(Max_Points_Per_Page)+1);
              if (i<>LithoLog_Track_Number) then
                begin
                  if LasFiles[0].DepthUnit='FT' then
                    begin
                      Conversion_Unit[i]:=1152;
                    end;
                  if LasFiles[0].DepthUnit='F' then
                    begin
                      Conversion_Unit[i]:=1152;
                    end;
                  if LasFiles[0].DepthUnit='M' then
                    begin
                      Conversion_Unit[i]:=3779.527559055;
                    end;
                  if LasFiles[0].DepthUnit='SEC' then
                    begin
                      Conversion_Unit[i]:=Log_Scale;
                    end;
                  Temp_Value:=Charts[i].MarginBottom + Charts[i].ChartRect.Top;
//                  with Tracks_Form do
                  with Charts[i] do
                    begin
//                      align:=alNone;
                      Height:=Round((Series[0].MaxYValue - Series[0].MinYValue) * Conversion_Unit[i] / Log_Scale) + Temp_Value;
                    end;
{                  with Charts[i] do
                    Max_Points_Per_Page[i]:=Round(Log_Scale/ABS(Step_Values[i])*(ChartRect.Bottom-ChartRect.Top)/Conversion_Unit[i]);
                  Charts[i].MaxPointsPerPage:=Max_Points_Per_Page[i];
                  Charts[i].ScaleLastPage:=False;
                  Charts[i].AllowPanning:=pmVertical;
                  Charts[i].PopupMenu.Items[1].Enabled:=True;}
                end;
            end;
{          if not Paging_Shown then
            begin
              Paging:=TPaging.Create(ForFree1);
              Paging.Show;
              Paging_Shown:=True;
            end;}
      end;
    end;
end;

procedure TMainForm.NoScale1Click(Sender: TObject);
var
i:integer;
begin
  if Tree1.Roots.Count=0 then Exit;
//  Tracks_Form.Height:=ClientHeight - 55;
  if Charts_Scaled then
    begin
      for i:=0 to Number_of_Charts-1 do
        begin
          Charts[i].Height:= ScrollBox1.ClientHeight - 17; //Tracks_Form.ClientHeight ;
{          Charts[i].MaxPointsPerPage:=0;
          Charts[i].AllowPanning:=pmNone;
          Charts[i].PopupMenu.Items[1].Enabled:=False;}
        end;
//      Paging.Free;
      Charts_Scaled:=False;
      Paging_Shown:=False;
    end;
end;

procedure TMainForm.Zooming( Sender: TObject);
begin
  with Sender as TChart do
    begin
//      Axes.Top.MinimumRound:=False;
//      Axes.Top.MaximumRound:=False;
//      Axes.Top.SetMinMax(Series[0].MinXValue, Series[0].MaxXValue);
      Temp_Zoom_File_No:=Temp_Zoom_File_No+1;
      Temp_Zoom_File:='petroeval_temp'+IntToStr(Tag)+IntToStr(Temp_Zoom_File_No);
      SaveChartToFile(TCustomChart(Sender),Temp_Zoom_File,True);
      ZoomChart:=TZoomChart.Create(Application);
      ZoomChart.Zoom_From:=0;
      UndoZoom;
//      Axes.Top.MinimumRound:=True;
//      Axes.Top.MaximumRound:=True;
      ZoomChart.Show;
    end;
end;

procedure TMainForm.LAS1Click(Sender: TObject);
var
i: Smallint;
ConversionUnit:Single;
Temp_Value:Integer;
s1,s2:string;
p1,p2:integer;
File_Name:string;
begin
try
{  with OpenDialog1 do
    begin
      DefaultExt:='LAS';
      Filter:='LAS files|*.LAS';
      Title:='Open LAS files';
    end;
  if OpenDialog1.Execute then
    begin
      for i:=0 to OpenDialog1.Files.Count-1 do
        begin}
          StatusBar1.Panels[0].Text:='Reading file(s) data. Please wait ...';
          Repaint;
          LessenPic;
          ConversionUnit:=0;
          if not(Is_ForFree1_Created) then
            begin
              ForFree1:=TLabel.Create(Self);
              Is_ForFree1_Created:=True;
            end;
          s1:=ReverseString(MainForm2.OpenDialog1.FileName);
          p1:=Pos('\',s1);
          s1:=ReverseString(s1);
          p2:=Length(s1)-p1+2;
          s2:=Copy(s1,p2,p1-5);
          File_Name:=s2;
//          ChangePath;
//          SetLength(Files, Length(Files)+1);
//          Files[Length(Files)]:=MainForm2.OpenDialog1.FileName[i];
{          with Tracks_Form do
            begin
              Label1.Visible:=False;
              Label2.Visible:=False;
              Image1.Visible:=False;
              VrScrollText1.Visible:=False;
            end;}
          try
            SetLength(LASFiles, Length(LASFiles)+1);
            LASFiles[Length(LASFiles)-1]:=TLAS2File.Create;
            ReadLAS(MainForm2.OpenDialog1.FileName);
            with LasFiles[Length(LasFiles)-1] do
              begin
                Log_Scale:=400;
                if DepthUnit='FT' then
                  begin
                    ConversionUnit:=1152;
                  end;
                if DepthUnit='F' then
                  begin
                    ConversionUnit:=1152;
                  end;
                if DepthUnit='M' then
                  begin
                    ConversionUnit:=3779.527559055;
                  end;
                if DepthUnit='SEC' then
                  begin
                    ConversionUnit:=Log_Scale;
                  end;
                Temp_Value:=Charts[0].MarginBottom + Charts[0].ChartRect.Top;
                for i:=0 to Number_of_Charts-1 do
                  Charts[i].Height:=Round((Charts[0].Series[0].MaxYValue - Charts[0].Series[0].MinYValue) * ConversionUnit / Log_Scale) + Temp_Value;

{                with MainForm2 do
                  begin
                    with OpenedFile do
                      begin
                        Properties.First;
                        Log_Scale:=400;
                        if DepthUnit='FT' then
                          begin
                            ConversionUnit:=1152;
                          end;
                        if DepthUnit='F' then
                          begin
                            ConversionUnit:=1152;
                          end;
                        if DepthUnit='M' then
                          begin
                            ConversionUnit:=3779.527559055;
                          end;
                        if DepthUnit='SEC' then
                          begin
                            ConversionUnit:=Log_Scale;
                          end;
                        Temp_Value:=DBChart1.MarginBottom + DBChart1.ChartRect.Top;
                        DBChart1.Height:=Round((Properties.Fields[2].Value - Properties.Fields[3].Value) * ConversionUnit / Log_Scale) + Temp_Value;
                        DBChart2.Height:=DBChart1.Height;
                        DBChart3.Height:=DBChart1.Height;
                        DBChart4.Height:=DBChart1.Height;
                        DBChart9.Height:=DBChart1.Height;

                        DBChart2.Series[0].XValues.ValueSource:=Values.FieldDefs[0].Name;
                        DBChart2.Series[0].XValues.Name:=Values.FieldDefs[0].Name;
                        DBChart2.Series[0].YValues.ValueSource:=Values.FieldDefs[0].Name;
                        DBChart2.Series[0].YValues.Name:=Values.FieldDefs[0].Name;
                        DBChart2.Series[0].DataSource:=Values;
                        Properties.First;
                        DBChart6.CustomAxes[0].Title.Caption:=Properties.FieldByName('TRACK_NAME').Value + ' ('+ Properties.FieldByName('TRACK_UNIT').Value + ')';
                        DBChart2.Axes.Left.Increment:=ABS(StepValue);
                        DBChart2.Axes.Right.Increment:=ABS(StepValue);
                      end;
                    Find_GR;
                    Find_CALIPER;
                    Find_BS;
                    Find_MSFL;
                    Find_LLD;
                    Find_LLS;
                    Find_NPHI;
                    Find_RHO;
                    Find_PEF;
                    Find_DT;
                  end;
                      }


              end;

            EnableMenu;
//            SortCharts;
          except
            MessageDlg('Error occured while reading '+#13+MainForm2.OpenDialog1.FileName, mtError, [mbOk], 0);
            DisableMenu;
          end;
{        end;
    end;    }
finally
  StatusBar1.Panels[0].Text:='Ready';
end;
end;

{procedure TMainForm.ChangePath;
var
Pat, Path:String;
P:integer;
begin
  Pat:=Application.ExeName;
  P:=Pos('PetroEval.exe',Pat);
  if P=0 then
    P:=Pos('PETROEVAL.EXE',Pat);
  Path := Copy(Pat, 1, P - 1);
  ChDir(Path);
end;
 }
{var
i: Smallint;
begin
try
  with MainForm2.OpenDialog1 do
    begin
      DefaultExt:='LAS';
      Filter:='LAS files|*.LAS';
      Title:='Open LAS files';
    end;
  if MainForm2.OpenDialog1.Execute then
    begin
      for i:=0 to MainForm2.OpenDialog1.Files.Count-1 do
        begin
          StatusBar1.Panels[0].Text:='Reading file(s) data. Please wait ...';
          Repaint;
          if not(Is_ForFree1_Created) then
            begin
              ForFree1:=TLabel.Create(Self);
              Is_ForFree1_Created:=True;
            end;
          with Tracks_Form do
            begin
              Label1.Visible:=False;
              Label2.Visible:=False;
              Image1.Visible:=False;
              VrScrollText1.Visible:=False;
            end;
          try
            ReadLAS(MainForm2.OpenDialog1.Files[i]);
          except
            Continue;
          end;
        end;
      EnableMenu;
      SortCharts;
      StatusBar1.Panels[0].Text:='Ready';
    end;
finally
  StatusBar1.Panels[0].Text:='Ready.';
end;
end;}

procedure TMainForm.MudLine1Click(Sender: TObject);
var
No_Vp_Values: Integer;
Vp_Value: Single;
Vs_Value: Single;
Vp_Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  Vp_Value:=0;
  Vp_Track_Number:=-1;
  Operation_Canceled:=False;
  Vp_Selection:=TVp_Selection.Create(Self);
  Vp_Selection.ShowModal;
  Vp_Selection.Free;
  if Operation_Canceled then Exit;
  No_Vp_Values:=Charts[VP_Track_Number].Series[0].Count;
  CreateRoot('Vs Estimation');
  Preparation('Vs Estimation','VS_MUDROCK.');
  for i:=0 to No_Vp_Values-1 do
    begin
      Vp_Depth_Value:=Charts[Vp_Track_Number].Series[0].YValue[i];
      if Charts[Vp_Track_Number].Series[0].XValue[i]<> LasFiles[0].NullValue then
        begin
          if Vp_Unit='FT/S' then
            Vp_Value:=0.001*0.3048*Charts[Vp_Track_Number].Series[0].XValue[i]
          else if Vp_Unit='KM/S' then
            Vp_Value:=Charts[Vp_Track_Number].Series[0].XValue[i]
          else
            begin
              MessageDlg('No measurment unit selected for Vp.',mtError,[mbOk],0);
              Exit;
          end;
          Vs_Value:=0.862*Vp_Value-1.172;
          if Vs_Unit='KM/S' then
            Charts[Length(Charts)-1].Series[0].AddXY(Vs_Value,Vp_Depth_Value)
          else if Vs_Unit='FT/S' then
            Charts[Length(Charts)-1].Series[0].AddXY(1000/0.3048*Vs_Value,Vp_Depth_Value)
          else
            begin
              MessageDlg('No measurment unit selected for Vs.',mtError,[mbOk],0);
              Exit;
            end;
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Vp_Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Vs Estimation','VS_MUDROCK.'+Vs_Unit);
end;
end;

procedure TMainForm.UndoPreparation(Root_Caption: string; Title_Caption: string);
begin
  RemoveChild(Root_Caption, Title_Caption);
  RemoveChart(Title_Caption, Chart_Number);
  Chart_Number:=Chart_Number-1;
  SortCharts;
end;

procedure TMainForm.Preparation(Root_Caption: string; Title_Caption: string);
begin
  Randomize;
  ChartColor:=Colors[Random(15)];
  CreateChild(Root_Caption, Title_Caption);
  CreateChart(Title_Caption, Chart_Number);
  CreateSeries(Charts[Chart_Number], Chart_Number);
  Charts[Chart_Number].Parent:=ScrollBox1;
  Charts[Chart_Number].Show;
  Chart_Number:=Chart_Number+1;
  SortCharts;
end;

procedure TMainForm.Velocity1Click(Sender: TObject);
var
No_Values: Integer;
DTP_Value: Single;
DTS_Value: Single;
Vs_Value: Single;
Vp_Value: Single;
Depth_Value1: Single;
Depth_Value2: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  DTP_Track_Number:=-1;
  DTS_Track_Number:=-1;
  Operation_Canceled:=False;
  DT_Selection:=TDT_Selection.Create(Self);
  DT_Selection.ShowModal;
  DT_Selection.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Velocity Logs');
  Preparation('Velocity Logs', 'VP.' + Vp_Unit);

  for i:=0 to No_Values-1 do
    begin
      if DTP_Track_Number<>-1 then
        Depth_Value1:=Charts[DTP_Track_Number].Series[0].YValue[i]
      else
        Depth_Value1:=Charts[0].Series[0].YValue[i];

      if DTP_Track_Number<>-1 then
        DTP_Value:=Charts[DTP_Track_Number].Series[0].XValue[i]
      else
        DTP_Value:=Constant_Value[1];
      if DTP_Value <> LasFiles[0].NullValue then
        begin
          if DTP_Unit='US/FT' then
            DTP_Value:=0.000001/0.3048*DTP_Value
          else if DTP_Unit='US/M' then
            DTP_Value:=0.000001*DTP_Value
          else
            begin
              MessageDlg('No measurment unit selected for DT of P-wave!',mtError,[mbOk],0);
              Exit;
            end;
          if DTP_Value<>0 then
            Vp_Value:=RoundTo(0.001/DTP_Value, Precision_Value)
          else
            Vp_Value:=0;
          if Vp_Unit='KM/S' then
            Charts[Length(Charts)-1].Series[0].AddXY(Vp_Value,Depth_Value1)
          else if Vp_Unit='FT/S' then
            Charts[Length(Charts)-1].Series[0].AddXY(1000/0.3048*Vp_Value,Depth_Value1)
          else
            begin
              MessageDlg('No measurment unit selected for Vp.',mtError,[mbOk],0);
              Exit;
            end;
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value1)
        end;
    end;
  if DTS_Selected then//DTS_Track_Number<>-1 then
    begin
      Preparation('Velocity Logs', 'VS.' + Vs_Unit);
      for i:=0 to No_Values-1 do
        begin
          if DTS_Track_Number<>-1 then
            Depth_Value2:=Charts[DTS_Track_Number].Series[0].YValue[i]
          else
            Depth_Value2:=Charts[0].Series[0].YValue[i];

          if DTS_Track_Number<>-1 then
            DTS_Value:=Charts[DTS_Track_Number].Series[0].XValue[i]
          else
            DTS_Value:=Constant_Value[2];

          if DTS_Value <> LasFiles[0].NullValue then
            begin
              if DTS_Unit='US/FT' then
                DTS_Value:=0.000001/0.3048 * DTS_Value
              else if DTS_Unit='US/M' then
                DTS_Value:=0.000001 * DTS_Value
              else
                begin
                  MessageDlg('No measurment unit selected for DT of S-wave!',mtError,[mbOk],0);
                  Exit;
              end;
              if DTS_Value<>0 then
                Vs_Value:=RoundTo(0.001/DTS_Value, Precision_Value)
              else
                Vs_Value:=0;
              if Vs_Unit='KM/S' then
                Charts[Length(Charts)-1].Series[0].AddXY(Vs_Value,Depth_Value2)
              else if Vs_Unit='FT/S' then
                Charts[Length(Charts)-1].Series[0].AddXY(1000/0.3048*Vs_Value,Depth_Value2)
              else
                begin
                  MessageDlg('No measurment unit selected for Vs!',mtError,[mbOk],0);
                  Exit;
                end;
            end
          else
            begin
              Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value2)
            end;
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Velocity Logs', 'VS.' + Vs_Unit);
end;
end;

procedure TMainForm.CorrelationCoefficient1Click(Sender: TObject);
begin
  if Tree1.Roots.Count=0 then Exit;
  Correlation_Coefficient:=TCorrelation_Coefficient.Create(Self);
  Correlation_Coefficient.ShowModal;
  Correlation_Coefficient.Free;
end;

procedure TMainForm.CrossPLOT1Click(Sender: TObject);
begin
  if Tree1.Roots.Count=0 then Exit;
  Operation_Canceled:=False;
  Is_CrossPlot_3D:=False;
  XAxis_Track_Number:=-1;
  YAxis_Track_Number:=-1;
  ZAxis_Track_Number:=-1;
  Cross_Plot_Tracks:=TCross_Plot_Tracks.Create(Self);
  Cross_Plot_Tracks.ShowModal;
  Cross_Plot_Tracks.Free;
end;

procedure TMainForm.CompositeLog1Click(Sender: TObject);
var
i,j: Smallint;
begin
  if Tree1.Roots.Count=0 then Exit;
  Operation_Canceled:=False;
  Composite_Log:=TComposite_Log.Create(Self);
  Composite_Log.ShowModal;
  If Operation_Canceled then Exit;
  for i:=0 to Length(Composite_Log.Tracks_Number)-1 do
    begin
      SetLength(Composite_Tracks_Number, Length(Composite_Tracks_Number)+1);
      Composite_Tracks_Number[i]:=Composite_Log.Tracks_Number[i];
    end;
  CreateRoot('Composite Log');

  CreateChild('Composite Log', 'Composite Log '+IntToStr(Number_of_Composites+1));
  CreateChart('Composite Log '+IntToStr(Number_of_Composites+1), Chart_Number);
  SetLength(Composites, Length(Composites)+1);
  Composites[Length(Composites)-1]:=Chart_Number;
  for i:=0 to Length(Composite_Tracks_Number)-1 do
    begin
      Log_Values:=THorizLineSeries.Create(ForFree1);
      Log_Values.ParentChart:=Charts[Chart_Number];
      Charts[Chart_Number].CustomAxes.Add;
      SetLength(TopAxes, Length(Topaxes)+1);
      TopAxes[i]:=Charts[Chart_Number].CustomAxes[i];
      TopAxes[i].Horizontal:=True;
      TopAxes[i].Axis.Color:=Charts[Chart_Number].Series[i].Color;
      TopAxes[i].Title.Font.Color:=Charts[Chart_Number].Series[i].Color;
      TopAxes[i].Title.Font.Size:=8;
      TopAxes[i].Title.Font.Name:='Tahoma';
      TopAxes[i].Title.Font.Style:=[fsBold];
      TopAxes[i].Title.Caption:=Charts[Composite_Tracks_Number[i]].Axes.Top.Title.Caption;
      TopAxes[i].LabelsFont.Color:=Charts[Chart_Number].Series[i].Color;
      TopAxes[i].LabelStyle:=talValue;
      TopAxes[i].TickLength:=6;
      TopAxes[i].Ticks.Width:=2;
      TopAxes[i].MinorTickLength:=4;
      TopAxes[i].MinorTickCount:=4;
      TopAxes[i].MinorGrid.Color:=clGray;
      TopAxes[i].MinorGrid.Style:=psDot;
      TopAxes[i].LabelsOnAxis:=True;
      TopAxes[i].RoundFirstLabel:=True;
      TopAxes[i].MaximumOffset:=10;
      TopAxes[i].MinimumOffset:=10;
      TopAxes[i].LabelsSeparation:=20;
      TopAxes[i].AxisValuesFormat:='#0.####';
//      TopAxes[i].MaximumRound:=True;
//      TopAxes[i].MinimumRound:=True;
      TopAxes[i].Horizontal:=True;
      TopAxes[i].OtherSide:=True;
      TopAxes[i].PositionUnits:=muPixels;
      TopAxes[i].PositionPercent:=(i)*(-40);
      TopAxes[i].Grid.Width:=0;
//      Charts[Chart_Number].MarginTop:=(i+2)*40-20;
      Charts[Chart_Number].MarginTop:=(Number_of_Pixels_Chart_Title+1)* 40 ;
      Charts[Chart_Number].Title.Top:=0;
      Charts[Chart_Number].Title.Left:=50;
      Log_Values.CustomHorizAxis:=TopAxes[i];
      Log_Values.XValues.Count := Charts[Composite_Tracks_Number[i]].Series[0].XValues.Count;
      Log_Values.XValues.Value := Charts[Composite_Tracks_Number[i]].Series[0].XValues.Value;
      Log_Values.XValues.Modified:=True;
      Log_Values.YValues.Count := Charts[Composite_Tracks_Number[i]].Series[0].YValues.Count;
      Log_Values.YValues.Value := Charts[Composite_Tracks_Number[i]].Series[0].YValues.Value;
      Log_Values.YValues.Modified:=True;
      Log_Values.Stairs:=True;
      Log_Values.Pen.Width:=1;

      if i>Number_of_Pixels_Chart_Title then
        Number_of_Pixels_Chart_Title:=i;
      for j:=0 to Chart_Number-1 do
        begin
          Charts[j].MarginTop:= Number_of_Pixels_Chart_Title * 40 ;
        end;
      for j:=0 to Number_of_Composites do
        begin
          Charts[Composites[j]].MarginTop:= (Number_of_Pixels_Chart_Title+1) * 40 - 4;
        end;
    end;
  Charts[Chart_Number].Parent:=ScrollBox1;//Tracks_Form;
  Charts[Chart_Number].Show;
  Chart_Number:=Chart_Number+1;
  Number_of_Charts:=Chart_Number;
  Number_of_Composites:=Number_of_Composites+1;
  Finalize(Composite_Tracks_Number);
  Finalize(Composite_Log.Tracks_Number);
  Composite_Log.Free;
end;

procedure TMainForm.Han1Click(Sender: TObject);
var
No_Vp_Values: Integer;
Vp_Value: Single;
Vs_Value: Single;
Vp_Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  Vp_Value:=0;
  Han_Method:=-1;
  Han_Volume:=-1;
  Vp_Track_Number:=-1;
  Operation_Canceled:=False;
  Han_Model:=THan_Model.Create(Self);
  Han_Model.ShowModal;
  Han_Model.Free;
  if Operation_Canceled then exit;
  Vp_Selection:=TVp_Selection.Create(Self);
  Vp_Selection.ShowModal;
  Vp_Selection.Free;
  if Operation_Canceled then Exit;
  No_Vp_Values:=Charts[Vp_Track_Number].Series[0].Count;
  CreateRoot('Vs Estimation');
  Preparation('Vs Estimation', 'VS_HAN.' + Vs_Unit);
  for i:=0 to No_Vp_Values-1 do
    begin
      Vp_Depth_Value:=Charts[Vp_Track_Number].Series[0].YValue[i];
      if Charts[Vp_Track_Number].Series[0].XValue[i]<> LasFiles[0].NullValue then
        begin
          if Vp_Unit='FT/S' then
            Vp_Value:=0.001*0.3048*Charts[Vp_Track_Number].Series[0].XValue[i]
          else if Vp_Unit='KM/S' then
            Vp_Value:=Charts[Vp_Track_Number].Series[0].XValue[i]
          else
            begin
              MessageDlg('No measurment unit selected for Vp.',mtError,[mbOk],0);
              Exit;
            end;
          Case Han_Method of
            0:Case Han_Volume of   // Effect of Clay
                0:begin            // Clay volume > 25 %
                    Vs_Value:=0.842*Vp_Value-1.099;
                    if Vs_Unit='KM/S' then
                      Charts[Length(Charts)-1].Series[0].AddXY(Vs_Value,Vp_Depth_Value)
                    else if Vs_Unit='FT/S' then
                      Charts[Length(Charts)-1].Series[0].AddXY(1000/0.3048*Vs_Value,Vp_Depth_Value)
                    else
                      begin
                        MessageDlg('No measurment unit selected for Vs.',mtError,[mbOk],0);
                        Exit;
                      end;
                  end;
                1:begin            // Clay volume < 25 %
                    Vs_Value:=0.754*Vp_Value-0.657;
                    if Vs_Unit='KM/S' then
                      Charts[Length(Charts)-1].Series[0].AddXY(Vs_Value,Vp_Depth_Value)
                    else if Vs_Unit='FT/S' then
                      Charts[Length(Charts)-1].Series[0].AddXY(1000/0.3048*Vs_Value,Vp_Depth_Value)
                    else
                      begin
                        MessageDlg('No measurment unit selected for Vs.',mtError,[mbOk],0);
                        Exit;
                      end;
                  end;
              end;
            1:Case Han_Volume of   // Effect of Porosity
                0:begin            // Porosity volume > 15 %
                    Vs_Value:=0.756*Vp_Value-0.662;
                    if Vs_Unit='KM/S' then
                      Charts[Length(Charts)-1].Series[0].AddXY(Vs_Value,Vp_Depth_Value)
                    else if Vs_Unit='FT/S' then
                      Charts[Length(Charts)-1].Series[0].AddXY(1000/0.3048*Vs_Value,Vp_Depth_Value)
                    else
                      begin
                        MessageDlg('No measurment unit selected for Vs.',mtError,[mbOk],0);
                        Exit;
                      end;
                  end;
                1:begin            // Porosity volume < 15 %
                    Vs_Value:=0.853*Vp_Value-1.137;
                    if Vs_Unit='KM/S' then
                      Charts[Length(Charts)-1].Series[0].AddXY(Vs_Value,Vp_Depth_Value)
                    else if Vs_Unit='FT/S' then
                      Charts[Length(Charts)-1].Series[0].AddXY(1000/0.3048*Vs_Value,Vp_Depth_Value)
                    else
                      begin
                        MessageDlg('No measurment unit selected for Vs.',mtError,[mbOk],0);
                        Exit;
                      end;
                  end;
              end;
          end;
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Vp_Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Vs Estimation', 'VS_HAN.' + Vs_Unit);
end;
end;

procedure TMainForm.Poisson1Click(Sender: TObject);
var
VP_Value: Single;
Poisson_Value: Single;
VS_Value: Single;
No_Values: Integer;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  VP_Track_Number:=-1;
  Poisson_Track_Number:=-1;
  Operation_Canceled:=False;
  Poisson_Page:=TPoisson_Page.Create(Self);
  Poisson_Page.ShowModal;
  Poisson_Page.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Vs Estimation');
  Preparation('Vs Estimation', 'VS_POISSON.'+Vs_Unit);

  for i:=0 to No_Values-1 do
    begin
      if VP_Track_Number<>-1 then
        Depth_Value:=Charts[VP_Track_Number].Series[0].YValue[i]
      else if Poisson_Track_Number<>-1 then
        Depth_Value:=Charts[Poisson_Track_Number].Series[0].YValue[i]
      else
        Depth_Value:=Charts[0].Series[0].YValue[i];

      if not Value_Is_Constant[1] then
        VP_Value:=Charts[VP_Track_Number].Series[0].XValue[i]
      else
        VP_Value:=Constant_Value[1];
      if not Value_Is_Constant[2] then
        Poisson_Value:=Charts[Poisson_Track_Number].Series[0].XValue[i]
      else
        Poisson_Value:=Constant_Value[2];

      if (VP_Value<> LasFiles[0].NullValue)and(Poisson_Value<> LasFiles[0].NullValue) then
        begin
          if Vp_Unit='FT/S' then
            Vp_Value:=0.001*0.3048*Vp_Value
          else if Vp_Unit='KM/S' then
            Vp_Value:=Vp_Value
          else
            begin
              MessageDlg('No measurment unit selected for Vp.',mtError,[mbOk],0);
              Exit;
          end;
          Poisson_Value:=Charts[Poisson_Track_Number].Series[0].XValue[i];
          if (Poisson_Value<=0.5)and(Poisson_Value>=-0.25) then
            begin
              Vs_Value:=RoundTo(Vp_Value*sqrt((2*Poisson_Value-1)/(2*Poisson_Value-2)), Precision_Value);
              if Vs_Unit='KM/S' then
                Vs_Value:=RoundTo(Vs_Value, Precision_Value)
              else if Vs_Unit='FT/S' then
                Vs_Value:=RoundTo(1000/0.3048*Vs_Value, Precision_Value)
              else
                begin
                  MessageDlg('No measurment unit selected for Vs.',mtError,[mbOk],0);
                  Exit;
                end;
              Charts[Length(Charts)-1].Series[0].AddXY(VS_Value, Depth_Value);
            end
          else
            begin
              Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue, Depth_Value);
            end;
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Vs Estimation', 'VS_POISSON.'+Vs_Unit);
end;

end;

procedure TMainForm.Krief1Click(Sender: TObject);
var
DTP_Mineral_Value: Single;
DTP_Saturated_Value: Single;
DTP_Fluid_Value: Single;
DTS_Mineral_Value: Single;
Vp_Mineral: Single;
Vp_Saturated: Single;
Vp_Fluid: Single;
Vs_Mineral: Single;
Vs_Value: Single;
No_Values: Integer;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  DTP_Mineral_Track_Number:=-1;
  DTP_Saturated_Track_Number:=-1;
  DTP_Fluid_Track_Number:=-1;
  DTS_Mineral_Track_Number:=-1;
  Operation_Canceled:=False;
  Krief_Page:=TKrief_Page.Create(Self);
  Krief_Page.ShowModal;
  Krief_Page.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Vs Estimation');
  Preparation('Vs Estimation', 'VS_KRIEF.' +VS_Unit);


  for i:=0 to No_Values-1 do
    begin
      if DTP_Mineral_Track_Number<>-1 then
        Depth_Value:=Charts[DTP_Mineral_Track_Number].Series[0].YValue[i]
      else if DTP_Saturated_Track_Number<>-1 then
        Depth_Value:=Charts[DTP_Saturated_Track_Number].Series[0].YValue[i]
      else if DTP_Fluid_Track_Number<>-1 then
        Depth_Value:=Charts[DTP_Fluid_Track_Number].Series[0].YValue[i]
      else if DTS_Mineral_Track_Number<>-1 then
        Depth_Value:=Charts[DTS_Mineral_Track_Number].Series[0].YValue[i]
      else
        Depth_Value:=Charts[0].Series[0].YValue[i];

      if not Value_Is_Constant[1] then
        DTP_Mineral_Value:=Charts[DTP_Mineral_Track_Number].Series[0].XValue[i]
      else
        DTP_Mineral_Value:=Constant_Value[1];
      if not Value_Is_Constant[2] then
        DTP_Saturated_Value:=Charts[DTP_Saturated_Track_Number].Series[0].XValue[i]
      else
        DTP_Saturated_Value:=Constant_Value[2];
      if not Value_Is_Constant[3] then
        DTP_Fluid_Value:=Charts[DTP_Fluid_Track_Number].Series[0].XValue[i]
      else
        DTP_Fluid_Value:=Constant_Value[3];
      if not Value_Is_Constant[4] then
        DTS_Mineral_Value:=Charts[DTS_Mineral_Track_Number].Series[0].XValue[i]
      else
        DTS_Mineral_Value:=Constant_Value[4];

      if
        (DTP_Mineral_Value<> LasFiles[0].NullValue)and(DTP_Saturated_Value<> LasFiles[0].NullValue)and
        (DTP_Fluid_Value<> LasFiles[0].NullValue)and(DTS_Mineral_Value<> LasFiles[0].NullValue)
      then
        begin
          if DTP_Mineral_Unit='US/FT' then
            DTP_Mineral_Value:=0.000001/0.3048*DTP_Mineral_Value
          else if DTP_Mineral_Unit='US/M' then
            DTP_Mineral_Value:=0.000001*DTP_Mineral_Value
          else
            begin
              MessageDlg('No measurment unit selected for P-wave DT of the rock mineral!',mtError,[mbOk],0);
              Exit;
          end;
          if DTP_Saturated_Unit='US/FT' then
            DTP_Saturated_Value:=0.000001/0.3048*DTP_Saturated_Value
          else if DTP_Saturated_Unit='US/M' then
            DTP_Saturated_Value:=0.000001*DTP_Saturated_Value
          else
            begin
              MessageDlg('No measurment unit selected for P-wave DT of the saturated rock!',mtError,[mbOk],0);
              Exit;
          end;
          if DTP_Fluid_Unit='US/FT' then
            DTP_Fluid_Value:=0.000001/0.3048*DTP_Fluid_Value
          else if DTP_Fluid_Unit='US/M' then
            DTP_Fluid_Value:=0.000001*DTP_Fluid_Value
          else
            begin
              MessageDlg('No measurment unit selected for P-wave DT of the pore fluid!',mtError,[mbOk],0);
              Exit;
          end;
          if DTS_Mineral_Unit='US/FT' then
            DTS_Mineral_Value:=0.000001/0.3048*DTS_Mineral_Value
          else if DTS_Mineral_Unit='US/M' then
            DTS_Mineral_Value:=0.000001*DTS_Mineral_Value
          else
            begin
              MessageDlg('No measurment unit selected for S-wave DT of the rock mineral!',mtError,[mbOk],0);
              Exit;
          end;
          Vp_Mineral:=RoundTo(0.001/DTP_Mineral_Value, Precision_Value);
          Vp_Saturated:=RoundTo(0.001/DTP_Saturated_Value, Precision_Value);
          Vp_Fluid:=RoundTo(0.001/DTP_Fluid_Value, Precision_Value);
          Vs_Mineral:=RoundTo(0.001/DTS_Mineral_Value, Precision_Value);
    { vs**2 = vs_min**2 * (vp**2 - vp_f**2) / (vp_min**2-vp_f**2)}
          Vs_Value:=RoundTo(sqrt(ABS(sqr(Vs_Mineral)*(sqr(Vp_Saturated)-sqr(Vp_Fluid))/(sqr(Vp_Mineral)-2*sqr(Vp_Fluid)))), Precision_Value);
          if Vs_Unit='KM/S' then
            Charts[Length(Charts)-1].Series[0].AddXY(Vs_Value,Depth_Value)
          else if Vs_Unit='FT/S' then
            Charts[Length(Charts)-1].Series[0].AddXY(1000/0.3048*Vs_Value,Depth_Value)
          else
            begin
              MessageDlg('No measurment unit selected for Vs!',mtError,[mbOk],0);
              Exit;
            end;
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Reservoir Parameters', 'VS_KRIEF');
end;




end;

procedure TMainForm.ChartsDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TChart;
end;

procedure TMainForm.ChartsDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  Source_Left,
  Sender_Left
{  Source_Width,
  Sender_Width} :integer;
  i,j: Smallint;
  TempChart: TChart;
  Source_Tag:Byte;
  Sender_Tag:Byte;
  TempText: String;
  Sender_ShapeNo:integer;
  Source_ShapeNo:integer;
begin
{  if Sender=Source then Exit;
  if (Sender is TChart)and(Source is TChart) then
    begin
      with Source as TChart do
        begin
          Source_Left:=Left;
//          Source_Width:=Width;
        end;
      with Sender as TChart do
        begin
          Sender_Left:=Left;
//          Sender_Width:=Width;
        end;

      with Source as TChart do
        begin
          Left:=Sender_Left;
        end;
      with Sender as TChart do
        begin
          Left:=Source_Left;
        end;
    end;}

  if Sender=Source then Exit;
  if (Sender is TChart)and(Source is TChart) then
    begin
      with Source as TChart do
        begin
          for i:=0 to Number_of_Charts-1 do
            if Source=Charts[i] then Source_Tag:=i;
        end;
      with Sender as TChart do
        begin
          for i:=0 to Number_of_Charts-1 do
            if Sender=Charts[i] then Sender_Tag:=i;
        end;



      TempText:=Charts[Source_Tag].Axes.Top.Title.Caption;
      for i:=0 to Tree1.Roots.Count-1 do
        for j:=0 to Tree1.Roots[i].Childs.Count-1 do
          if TempText=Tree1.Roots[i].Childs[j].SimpleText then
            begin
//              TempText:=Tree1.Shapes[Source_Tag + i].SimpleText;
              Source_ShapeNo:=Source_Tag + i + 1;
            end;
      TempText:=Charts[Sender_Tag].Axes.Top.Title.Caption;
      for i:=0 to Tree1.Roots.Count-1 do
        for j:=0 to Tree1.Roots[i].Childs.Count-1 do
          if TempText=Tree1.Roots[i].Childs[j].SimpleText then
            begin
//              TempText:=Tree1.Shapes[Source_Tag + i].SimpleText;
              Sender_ShapeNo:=Sender_Tag + i + 1;
            end;
      TempText:=Tree1.Shapes[Source_ShapeNo].SimpleText;
      Tree1.Shapes[Source_ShapeNo].SimpleText:=Tree1.Shapes[Sender_ShapeNo].SimpleText;
      Tree1.Shapes[Sender_ShapeNo].SimpleText:=TempText;
//      Tree1.Roots[0].Childs[Source_Tag].SimpleText:=Tree1.Roots[0].Childs[Sender_Tag].SimpleText;
//      Tree1.Roots[0].Childs[Sender_Tag].SimpleText:=TempText;



      TempChart:=Charts[Source_Tag];
      Charts[Source_Tag]:=Charts[Sender_Tag];
      Charts[Sender_Tag]:=TempChart;

      Charts[0].Left:=0;
      for i:=1 to Number_of_Charts-1 do
        begin
          Charts[i].Left:= Charts[i-1].Left + Charts[i-1].Width;
        end;

     SortCharts;
    end;
end;

procedure TMainForm.Litholog1Click(Sender: TObject);
begin
  if Tree1.Roots.Count=0 then Exit;
  if not(LithoLog_Created) then
    begin
      CreateRoot('Lithology Log');
      CreateChild('Lithology Log', 'LITHOLOG');
      CreateChart('LITHOLOG', Chart_Number);
      Charts[Chart_Number].Axes.Top.Grid.Visible:=False;
      Charts[Chart_Number].Axes.Left.Grid.Visible:=False;
      Charts[Chart_Number].Axes.Top.LabelsFont.Color:=clWhite;
      Charts[Chart_Number].Axes.Top.Ticks.Color:=clWhite;
      Charts[Chart_Number].Axes.Left.Ticks.Hide;
      LithoLog_Track_Number:=Chart_Number;
      Log_Values:=THorizLineSeries.Create(ForFree1);
      Log_Values.Name:='Track_'+IntToStr(Chart_Number+1);
      Log_Values.Stairs:=True;
      Log_Values.Pen.Width:=1;
      Log_Values.HorizAxis:=aTopAxis;
      Log_Values.ParentChart:=Charts[Chart_Number];
      Charts[Chart_Number].Parent:=ScrollBox1;//Tracks_Form;
      Charts[Chart_Number].Show;
      Litho_Log:=TLitho_Log.Create(Charts[Chart_Number]);
      Litho_Log.Show;
      LithoLog_Open:=True;
      Chart_Number:=Chart_Number+1;
      Number_of_Charts:=Chart_Number;
      LithoLog_Created:=True;
    end
  else
    begin
      if not(LithoLog_Open) then
        begin
          Litho_Log:=TLitho_Log.Create(Charts[LithoLog_Track_Number]);
          Litho_Log.Show;
          LithoLog_Open:=True;
        end;
    end;
end;

procedure TMainForm.LithosphericEstimation1Click(Sender: TObject);
var
No_Vp_Values: Integer;
Vp_Value: Single;
Vs_Value: Single;
Vp_Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  Vp_Value:=0;
  Vp_Track_Number:=-1;
  Operation_Canceled:=False;
  Vp_Selection:=TVp_Selection.Create(Self);
  Vp_Selection.ShowModal;
  Vp_Selection.Free;
  if Operation_Canceled then Exit;
  No_Vp_Values:=Charts[Vp_Track_Number].Series[0].Count;
  CreateRoot('Vs Estimation');
  Preparation('Vs Estimation', 'VS_LITHOSPHER.'+Vs_Unit);
  for i:=0 to No_Vp_Values-1 do
    begin
      Vp_Depth_Value:=Charts[Vp_Track_Number].Series[0].YValue[i];
      if Charts[Vp_Track_Number].Series[0].XValue[i]<> LasFiles[0].NullValue then
        begin
          if Vp_Unit='FT/S' then
            Vp_Value:=0.001*0.3048*Charts[Vp_Track_Number].Series[0].XValue[i]
          else if Vp_Unit='KM/S' then
            Vp_Value:=Charts[Vp_Track_Number].Series[0].XValue[i]
          else
            begin
              MessageDlg('No measurment unit selected for Vp.',mtError,[mbOk],0);
              Exit;
          end;
          Vs_Value:=RoundTo(Vp_Value/sqrt(2), Precision_Value);
          if Vs_Unit='KM/S' then
            Charts[Length(Charts)-1].Series[0].AddXY(Vs_Value,Vp_Depth_Value)
          else if Vs_Unit='FT/S' then
            Charts[Length(Charts)-1].Series[0].AddXY(1000/0.3048*Vs_Value,Vp_Depth_Value)
          else
            begin
              MessageDlg('No measurment unit selected for Vs.',mtError,[mbOk],0);
              Exit;
            end;
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Vp_Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Vs Estimation', 'VS_LITHOSPHER.'+Vs_Unit);
end;
end;

procedure TMainForm.ArpWorthington1Click(Sender: TObject);
begin
  if Tree1.Roots.Count=0 then Exit;
  R_wt:=-1;
  Arp_Worthington:=TArp_Worthington.Create(Self);
  Arp_Worthington.ShowModal;
  Arp_Worthington.Free;
end;

procedure TMainForm.ASCIIFile1Click(Sender: TObject);
{var
i: Smallint;}
begin
{  with MainForm2.OpenDialog1 do
    begin
      DefaultExt:='txt';
      Filter:='Text files|*.txt';
      Title:='Open ASCII files';
    end;
  if MainForm2.OpenDialog1.Execute then
    begin
      for i:=0 to MainForm2.OpenDialog1.Files.Count-1 do
        begin}
          StatusBar1.Panels[0].Text:='Reading file(s) data. Please wait ...';
          Repaint;
          if not(Is_ForFree1_Created) then
            begin
              ForFree1:=TLabel.Create(Self);
              Is_ForFree1_Created:=True;
            end;
{          with Tracks_Form do
            begin
              Label1.Visible:=False;
              Label2.Visible:=False;
              Image1.Visible:=False;
              VrScrollText1.Visible:=False;
            end;}
          try
            ReadASCII(MainForm2.OpenDialog2.FileName);
          except
            Tree1.Roots.Last.Clear;
          end;
//        end;
      EnableMenu;
//      SortCharts;
      StatusBar1.Panels[0].Text:='Ready';
//    end;
end;

procedure TMainForm.RQI1Click(Sender: TObject);
var
PHI_Value: Single;
Kh_Value: Single;
RQI_Value: Single;
No_Values: Integer;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  PHI_Track_Number:=-1;
  Kh_Track_Number:=-1;
  Operation_Canceled:=False;
  RQI_Form:=TRQI_Form.Create(Self);
  RQI_Form.ShowModal;
  RQI_Form.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Reservoir Parameters');
  Preparation('Reservoir Parameters', 'RQI.um');

  for i:=0 to No_Values-1 do
    begin
      if PHI_Track_Number<>-1 then
        Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
      else if Kh_Track_Number<>-1 then
        Depth_Value:=Charts[Kh_Track_Number].Series[0].YValue[i]
      else
        Depth_Value:=Charts[0].Series[0].YValue[i];

      if not Value_Is_Constant[1] then
        PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
      else
        PHI_Value:=Constant_Value[1];
      if not Value_Is_Constant[2] then
        Kh_Value:=Charts[Kh_Track_Number].Series[0].XValue[i]
      else
        Kh_Value:=Constant_Value[2];

      if (PHI_Value<> LasFiles[0].NullValue)and(Kh_Value<> LasFiles[0].NullValue) then
        begin
          RQI_Value:=RoundTo(0.0314 * sqrt(Kh_Value/PHI_Value), Precision_Value);
          Charts[Length(Charts)-1].Series[0].AddXY(RQI_Value, Depth_Value);
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Reservoir Parameters', 'RQI.um');
end;

end;

procedure TMainForm.FZI1Click(Sender: TObject);
var
PHI_Value: Single;
RQI_Value: Single;
PHI_Z:Single;
FZI_Value: Single;
No_Values: Integer;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  PHI_Track_Number:=-1;
  RQI_Track_Number:=-1;
  Operation_Canceled:=False;
  FZI_Form:=TFZI_Form.Create(Self);
  FZI_Form.ShowModal;
  FZI_Form.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Reservoir Parameters');
  Preparation('Reservoir Parameters', 'FZI.');


  for i:=0 to No_Values-1 do
    begin
      if PHI_Track_Number<>-1 then
        Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
      else if RQI_Track_Number<>-1 then
        Depth_Value:=Charts[RQI_Track_Number].Series[0].YValue[i]
      else
        Depth_Value:=Charts[0].Series[0].YValue[i];

      if not Value_Is_Constant[1] then
        PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
      else
        PHI_Value:=Constant_Value[1];
      if not Value_Is_Constant[2] then
        RQI_Value:=Charts[RQI_Track_Number].Series[0].XValue[i]
      else
        RQI_Value:=Constant_Value[2];

      if (PHI_Value<> LasFiles[0].NullValue)and(RQI_Value<> LasFiles[0].NullValue) then
        begin
          if PHI_Value<>0 then
            begin
              PHI_Z:= RoundTo(PHI_Value/(1-PHI_Value), Precision_Value);
              FZI_Value:=RoundTo(RQI_Value/PHI_Z, Precision_Value);
              Charts[Length(Charts)-1].Series[0].AddXY(FZI_Value, Depth_Value);
            end
          else
            begin
              Charts[Length(Charts)-1].Series[0].AddNullXY(0, Depth_Value);
            end;
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Reservoir Parameters', 'FZI.');
end;

end;


procedure TMainForm.TiabFactor1Click(Sender: TObject);
var
FZI_Value: Single;
HT_Value: Single;
No_Values: Integer;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  FZI_Track_Number:=-1;
  Operation_Canceled:=False;
  HT_Form:=THT_Form.Create(Self);
  HT_Form.ShowModal;
  HT_Form.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Reservoir Parameters');
  Preparation('Reservoir Parameters', 'HT.');

  for i:=0 to No_Values-1 do
    begin
      if FZI_Track_Number<>-1 then
        Depth_Value:=Charts[FZI_Track_Number].Series[0].YValue[i]
      else
        Depth_Value:=Charts[0].Series[0].YValue[i];

      if not Value_Is_Constant[1] then
        FZI_Value:=Charts[FZI_Track_Number].Series[0].XValue[i]
      else
        FZI_Value:=Constant_Value[1];

      if (FZI_Value<> LasFiles[0].NullValue) then
        begin
          if FZI_Value>0 then
            begin
              HT_Value:=RoundTo(1/sqr(FZI_Value), Precision_Value);
              Charts[Length(Charts)-1].Series[0].AddXY(HT_Value, Depth_Value);
            end
          else
            Charts[Length(Charts)-1].Series[0].AddNullXY(0, Depth_Value);
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Reservoir Parameters', 'HT.');
end;

end;

procedure TMainForm.FreeFluidIndex1Click(Sender: TObject);
var
No_Values: Integer;
PHI_Value: Single;
Swir_Value:Single;
FFI_Value: Single;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  PHI_Track_Number:=-1;
  PHI_Value:=-999.25;
  Depth_Value:=0;
  Operation_Canceled:=False;
  FFI_Form:=TFFI_Form.Create(Self);
  FFI_Form.ShowModal;
  FFI_Form.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Reservoir Parameters');
  Preparation('Reservoir Parameters', 'FFI.');

  for i:=0 to No_Values-1 do
    begin
      if PHI_Track_Number<>-1 then
        Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
      else if Value_Is_Constant[1] then
        Depth_Value:=Charts[0].Series[0].YValue[i];

      if PHI_Track_Number<>-1 then
        PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
      else if Value_Is_Constant[1] then
        PHI_Value:= Constant_Value[1];

      if Swir_Track_Number<>-1 then
        Swir_Value:=Charts[Swir_Track_Number].Series[0].XValue[i]
      else if Value_Is_Constant[2] then
        Swir_Value:= Constant_Value[2];

      if PHI_Value<> LasFiles[0].NullValue then
        begin
          FFI_Value:=PHI_Value * (1 - Swir_Value);
          Charts[Length(Charts)-1].Series[0].AddXY(FFI_Value, Depth_Value)
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue, Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Reservoir Parameters', 'FFI.');
end;
end;

procedure TMainForm.Svgr1Click(Sender: TObject);
var
ANMR_Value: Single;
RHO_Matrix_Value: Single;
Svgr_Value: Single;
No_Values: Integer;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  ANMR_Track_Number:=-1;
  RHO_Matrix_Track_Number:=-1;
  Operation_Canceled:=False;
  Svgr_Form:=TSvgr_Form.Create(Self);
  Svgr_Form.ShowModal;
  Svgr_Form.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Reservoir Parameters');
  Preparation('Reservoir Parameters', 'SVGR.M2/CM3');


  for i:=0 to No_Values-1 do
    begin
      if ANMR_Track_Number<>-1 then
        Depth_Value:=Charts[ANMR_Track_Number].Series[0].YValue[i]
      else if RHO_Matrix_Track_Number<>-1 then
        Depth_Value:=Charts[RHO_Matrix_Track_Number].Series[0].YValue[i]
      else
        Depth_Value:=Charts[0].Series[0].YValue[i];

      if not Value_Is_Constant[1] then
        ANMR_Value:=Charts[ANMR_Track_Number].Series[0].XValue[i]
      else
        ANMR_Value:=Constant_Value[1];
      if not Value_Is_Constant[2] then
        RHO_Matrix_Value:=Charts[RHO_Matrix_Track_Number].Series[0].XValue[i]
      else
        RHO_Matrix_Value:=Constant_Value[2];

      if (ANMR_Value<> LasFiles[0].NullValue)and(RHO_Matrix_Value<> LasFiles[0].NullValue) then
        begin
          if ANMR_Value<>0 then
            begin
              Svgr_Value:=RoundTo(ANMR_Value*RHO_Matrix_Value, Precision_Value);
              Charts[Length(Charts)-1].Series[0].AddXY(Svgr_Value, Depth_Value);
            end
          else
            begin
              Charts[Length(Charts)-1].Series[0].AddNullXY(0, Depth_Value);
            end;
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Reservoir Parameters', 'SVGR.M2/CM3');
end;

end;

procedure TMainForm.FormationResistivityFactor1Click(Sender: TObject);
var
Ro_Value: Single;
Rw_Value: Single;
PHI_Value: Single;
FRF_Value: Single;
No_Values: Integer;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  Ro_Track_Number:=-1;
  Rw_Track_Number:=-1;
  PHI_Track_Number:=-1;
  Operation_Canceled:=False;
  FR_Form:=TFR_Form.Create(Self);
  FR_Form.ShowModal;
  FR_Form.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  Case FR_Calculation_Method of
    0:begin
        CreateRoot('Reservoir Parameters');
        Preparation('Reservoir Parameters', 'FRF_PHI.');

        for i:=0 to No_Values-1 do
          begin
            if PHI_Track_Number<>-1 then
              Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
            else
              Depth_Value:=Charts[0].Series[0].YValue[i];

            if not Value_Is_Constant[1] then
              PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
            else
              PHI_Value:=Constant_Value[1];

            if (PHI_Value<> LasFiles[0].NullValue) then
              begin
                if PHI_Value<>0 then
                  begin
                    FRF_Value:=RoundTo(a_Value / Power(PHI_Value, Cementation_Factor), Precision_Value);
                    Charts[Length(Charts)-1].Series[0].AddXY(FRF_Value, Depth_Value);
                  end
                else
                  begin
                    Charts[Length(Charts)-1].Series[0].AddNullXY(0, Depth_Value);
                  end;
              end
            else
              begin
                Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
              end;
          end;
        Number_of_Charts:=Chart_Number;
      end;
    1:begin
        CreateRoot('Reservoir Parameters');
        Preparation('Reservoir Parameters', 'FRF_R.');

        for i:=0 to No_Values-1 do
          begin
            if Ro_Track_Number<>-1 then
              Depth_Value:=Charts[Ro_Track_Number].Series[0].YValue[i]
            else if Rw_Track_Number<>-1 then
              Depth_Value:=Charts[Rw_Track_Number].Series[0].YValue[i]
            else
              Depth_Value:=Charts[0].Series[0].YValue[i];

            if not Value_Is_Constant[1] then
              Ro_Value:=Charts[Ro_Track_Number].Series[0].XValue[i]
            else
              Ro_Value:=Constant_Value[1];
            if not Value_Is_Constant[2] then
              Rw_Value:=Charts[Rw_Track_Number].Series[0].XValue[i]
            else
              Rw_Value:=Constant_Value[2];

            if (Ro_Value<> LasFiles[0].NullValue)and(Rw_Value<> LasFiles[0].NullValue) then
              begin
                if Rw_Value<>0 then
                  begin
                    FRF_Value:=RoundTo(Ro_Value/Rw_Value, Precision_Value);
                    Charts[Length(Charts)-1].Series[0].AddXY(FRF_Value, Depth_Value);
                  end
                else
                  begin
                    Charts[Length(Charts)-1].Series[0].AddNullXY(0, Depth_Value);
                  end;
              end
            else
              begin
                Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
              end;
          end;
        Number_of_Charts:=Chart_Number;
      end;
  end;
except
  Case FR_Calculation_Method of
    0:UndoPreparation('Reservoir Parameters', 'FRF_PHI.');
    1:UndoPreparation('Reservoir Parameters', 'FRF_R.');
  end;
end;

end;

procedure TMainForm.TortuosityTau1Click(Sender: TObject);
var
PHI_Value: Single;
Tau_Value: Single;
No_Values: Integer;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  PHI_Track_Number:=-1;
  Operation_Canceled:=False;
  Tau_Form:=TTau_Form.Create(Self);
  Tau_Form.ShowModal;
  Tau_Form.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Reservoir Parameters');
  Preparation('Reservoir Parameters', 'TAU.');

  for i:=0 to No_Values-1 do
    begin
      if PHI_Track_Number<>-1 then
        Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
      else
        Depth_Value:=Charts[0].Series[0].YValue[i];

      if not Value_Is_Constant[1] then
        PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
      else
        PHI_Value:=Constant_Value[1];

      if (PHI_Value<> LasFiles[0].NullValue) then
        begin
          Tau_Value:=RoundTo(Power(PHI_Value, 1-Cementation_Factor), Precision_Value);
          Charts[Length(Charts)-1].Series[0].AddXY(Tau_Value, Depth_Value);
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Reservoir Parameters', 'TAU.');
end;

end;

procedure TMainForm.PHI_Calculate(MethodIndex: integer);
var
No_Values: Integer;
PHI_Value: Single;
For_PHI_Value:Single;
Neutron_Value:Single;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  Operation_Canceled:=False;
  For_PHI_Track_Number:=-1;
  PHI_Calculation_Method:=-1;
  Porosity_Form:=TPorosity_Form.Create(Self);
  with Porosity_Form do
  Case MethodIndex of
    0:begin
        RadioGroup1.ItemIndex:=0;
        RadioGroup1.Visible:=False;
        GroupBox3.Visible:=False;
        Height:= Height - RadioGroup1.Height - GroupBox3.Height;
      end;
    1:begin
        RadioGroup1.ItemIndex:=1;
        RadioGroup1.Visible:=False;
        GroupBox3.Visible:=False;
        Height:= Height - RadioGroup1.Height - GroupBox3.Height;
      end;
    2:begin
        RadioGroup1.ItemIndex:=2;
        GroupBox1.Visible:=False;
        RadioGroup1.Visible:=False;
        Height:= Height - RadioGroup1.Height - GroupBox1.Height;
      end;
  end;
  Porosity_Form.ShowModal;
  Porosity_Form.Free;
  if Operation_Canceled then Exit;
  PHI_Value:=0;
  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Porosity Estimation');
  Case PHI_Calculation_Method of
    0: Preparation('Porosity Estimation', 'PHI_T.V/V');
    1: Preparation('Porosity Estimation', 'PHI_D.V/V');
    2: Preparation('Porosity Estimation', 'PHI_ND.V/V');
  end;

  for i:=0 to No_Values-1 do
    begin
      if For_PHI_Track_Number<>-1 then
        Depth_Value:=Charts[For_PHI_Track_Number].Series[0].YValue[i]
      else if Neutron_Track_Number<>-1 then
        Depth_Value:=Charts[Neutron_Track_Number].Series[0].YValue[i]
      else
        Depth_Value:=Charts[0].Series[0].YValue[i];

      if not Value_Is_Constant[1] then
        For_PHI_Value:=Charts[For_PHI_Track_Number].Series[0].XValue[i]
      else
        For_PHI_Value:=Constant_Value[1];
      if not Value_Is_Constant[2] then
        Neutron_Value:=Charts[Neutron_Track_Number].Series[0].XValue[i]
      else
        Neutron_Value:=Constant_Value[2];

      if (For_PHI_Value<> LasFiles[0].NullValue) then
        begin
          if For_PHI_Value<0 then For_PHI_Value:=0;
          Case PHI_Calculation_Method of
            0: PHI_Value:=RoundTo((For_PHI_Value - Matrix_Value)/(Fluid_Value - Matrix_Value), Precision_Value);
            1: PHI_Value:=RoundTo((Matrix_Value - For_PHI_Value)/(Matrix_Value - Fluid_Value), Precision_Value);
            2: begin
                 if (Neutron_Value<> LasFiles[0].NullValue) then
                   begin
                     if Neutron_Value<0 then Neutron_Value:=0;
                     PHI_Value:=RoundTo( 0.707 * sqrt(sqr(For_PHI_Value)+sqr(Neutron_Value)), Precision_Value);
                   end;
               end;
          end;
          if PHI_Value<0 then PHI_Value:=0;
          if PHI_Value>1 then PHI_Value:=1;
          Charts[Length(Charts)-1].Series[0].AddXY(PHI_Value,Depth_Value)
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  Case PHI_Calculation_Method of
    0:  UndoPreparation('Porosity Estimation', 'PHI_T.V/V');
    1:  UndoPreparation('Porosity Estimation', 'PHI_D.V/V');
    2:  UndoPreparation('Porosity Estimation', 'PHI_ND.V/V');
  end;
end;
end;

procedure TMainForm.HorizontalPermeability1Click(Sender: TObject);
var
No_Values: Integer;
PHI_Value,
K_Value,
Depth_Value,
Svgr_Value,
T2ML_Value,
Tau_Value,
PHI_R, KT,
Temp_Value: Single;
i: Smallint;
begin
  if Tree1.Roots.Count=0 then Exit;
  Operation_Canceled:=False;
  T2ML_Track_Number:=-1;
  Svgr_Track_Number:=-1;
  PHI_Track_Number:=-1;
  Grain_Radius:=-1;
  Svp_Value:=-1;
  Svgr_Value:=-1;
  Kh_Form:=TKh_Form.Create(Self);
  Kh_Form.ShowModal;
  Kh_Form.Free;
  if Operation_Canceled then Exit;
  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Horizontal Permeability Estimation');

  K_Value:=0;
  Case K_Calculation_Method of
    0:begin
        try
          Preparation('Horizontal Permeability Estimation', 'KH_K.MD');
          for i:=0 to No_Values-1 do
            begin
              if PHI_Track_Number<>-1 then
                Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
              else if Tau_Track_Number<>-1 then
                Depth_Value:=Charts[Tau_Track_Number].Series[0].YValue[i]
              else
                Depth_Value:=Charts[0].Series[0].YValue[i];

              if not Value_Is_Constant[1] then
                PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
              else
                PHI_Value:=Constant_Value[1];

              if not Value_Is_Constant[2] then
                Tau_Value:=Charts[Tau_Track_Number].Series[0].XValue[i]
              else
                Tau_Value:=Constant_Value[2];

              if (PHI_Value<>LasFiles[0].NullValue)and(Tau_Value<>LasFiles[0].NullValue) then
                begin
                  Case Koenzy_Method_No of
                    1:begin
                        K_Value:=RoundTo(PHI_Value*(sqr(Grain_Radius)/(4*Pore_Shape_Factor*Tau_Value))* 1.013 * 100000000000, Precision_Value);
                      end;
                    2:begin
                        K_Value:=RoundTo(PHI_Value*(1/(Pore_Shape_Factor*Tau_Value*sqr(Svp_Value)))* 1.013 * 100000000000, Precision_Value);
                      end;
                    3:begin
                        K_Value:=RoundTo((Power(PHI_Value,3)/sqr(1-PHI_Value))*(1/(Pore_Shape_Factor*Tau_Value*sqr(Svgr_Value)))* 1.013 * 100000000000, Precision_Value);
                      end;
                  end;
                  Charts[Length(Charts)-1].Series[0].AddXY(K_Value,Depth_Value);
                end
              else
                begin
                  Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                end;
            end;
          Number_of_Charts:=Chart_Number;
        except
          UndoPreparation('Horizontal Permeability Estimation', 'KH_K.MD');
        end;
      end;
    1:begin
        try
          Preparation('Horizontal Permeability Estimation', 'KH_KC.MD');
          for i:=0 to No_Values-1 do
            begin
              if PHI_Track_Number<>-1 then
                Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
              else if Svgr_Track_Number<>-1 then
                Depth_Value:=Charts[Svgr_Track_Number].Series[0].YValue[i]
              else
                Depth_Value:=Charts[0].Series[0].YValue[i];

              if not Value_Is_Constant[1] then
                PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
              else
                PHI_Value:=Constant_Value[1];

              if not Value_Is_Constant[2] then
                Svgr_Value:=Charts[Svgr_Track_Number].Series[0].XValue[i]
              else
                Svgr_Value:=Constant_Value[2];

              if (PHI_Value<>LasFiles[0].NullValue)and(Svgr_Value<>LasFiles[0].NullValue) then
                begin
                  PHI_R:=Power(PHI_Value, 3)/sqr(1-PHI_Value);
                  KT:=1/J1_Value;
                  K_Value:=RoundTo(PHI_R/(KT * sqr(Svgr_Value))/ (9.871 * 0.0001), Precision_Value);
                  Charts[Length(Charts)-1].Series[0].AddXY(K_Value,Depth_Value);
                end
              else
                begin
                  Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                end;
            end;
          Number_of_Charts:=Chart_Number;
        except
          UndoPreparation('Horizontal Permeability Estimation', 'KH_KC.MD');
        end;
      end;
    2:begin
        try
          Preparation('Horizontal Permeability Estimation', 'KH_SDR.MD');
          for i:=0 to No_Values-1 do
            begin
              if PHI_Track_Number<>-1 then
                Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
              else if T2ML_Track_Number<>-1 then
                Depth_Value:=Charts[T2ML_Track_Number].Series[0].YValue[i]
              else
                Depth_Value:=Charts[0].Series[0].YValue[i];

              if not Value_Is_Constant[1] then
                PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
              else
                PHI_Value:=Constant_Value[1];

              if not Value_Is_Constant[2] then
                T2ML_Value:=Charts[T2ML_Track_Number].Series[0].XValue[i]
              else
                T2ML_Value:=Constant_Value[2];

              if (PHI_Value<>LasFiles[0].NullValue)and(T2ML_Value<>LasFiles[0].NullValue) then
                begin
                  K_Value:=RoundTo(4 * Power(T2ML_Value, 4) * sqr(PHI_Value), Precision_Value);
                  Charts[Length(Charts)-1].Series[0].AddXY(K_Value,Depth_Value);
                end
              else
                begin
                  Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                end;
            end;
          Number_of_Charts:=Chart_Number;
        except
          UndoPreparation('Horizontal Permeability Estimation', 'KH_SDR.MD');
        end;
      end;
    3:begin
        try
          Preparation('Horizontal Permeability Estimation', 'KH_CD.MD');
          for i:=0 to No_Values-1 do
            begin
              if PHI_Track_Number<>-1 then
                Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
              else if Swir_Track_Number<>-1 then
                Depth_Value:=Charts[Swir_Track_Number].Series[0].YValue[i]
              else
                Depth_Value:=Charts[0].Series[0].YValue[i];

              if not Value_Is_Constant[1] then
                PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
              else
                PHI_Value:=Constant_Value[1];

              if not Value_Is_Constant[2] then
                Swir_Value:=Charts[Swir_Track_Number].Series[0].XValue[i]
              else
                Swir_Value:=Constant_Value[2];

              Temp_Value:=(1-Swir_Value)/Swir_Value;
              if (PHI_Value<>LasFiles[0].NullValue)and(Swir_Value<>LasFiles[0].NullValue)and(Temp_Value>0) then
                begin
                  K_Value:=RoundTo(Power(10*PHI_Value, 4) * Power(Temp_Value, 2.4855), Precision_Value);
                  Charts[Length(Charts)-1].Series[0].AddXY(K_Value,Depth_Value);
                end
              else
                begin
                  Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                end;
            end;
          Number_of_Charts:=Chart_Number;
        except
          UndoPreparation('Horizontal Permeability Estimation', 'KH_CD.MD');
        end;
      end;
  end;

end;

procedure TMainForm.VerticalPermeability1Click(Sender: TObject);
var
No_Values: Integer;
PHI_Value: Single;
Kh_Value: Single;
Kv_Value: Single;
Shale_Volume_Value,
Temp_Value:Single;
Depth_Value: Single;
i: Smallint;
begin
  if Tree1.Roots.Count=0 then Exit;
  Operation_Canceled:=False;
  Kh_Track_Number:=-1;
  Shale_Volume_Track_Number:=-1;
  PHI_Track_Number:=-1;
  Mean_Grain_Diameter:=0;
  Kv_Form:=TKv_Form.Create(Self);
  Kv_Form.ShowModal;
  Kv_Form.Free;
  if Operation_Canceled then Exit;
  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Vertical Permeability Estimation');

  Case Kv_Sst_Content of
    0:begin
        Case Kv_Illite_Content of
          0:begin
            try
              Preparation('Vertical Permeability Estimation', 'KV_C_MHR.MD');
              for i:=0 to No_Values-1 do
                begin
                  if PHI_Track_Number<>-1 then
                    Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
                  else if Kh_Track_Number<>-1 then
                    Depth_Value:=Charts[Kh_Track_Number].Series[0].YValue[i]
                  else
                    Depth_Value:=Charts[0].Series[0].YValue[i];

                  if not Value_Is_Constant[1] then
                    PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
                  else
                    PHI_Value:=Constant_Value[1];

                  if not Value_Is_Constant[2] then
                    Kh_Value:=Charts[Kh_Track_Number].Series[0].XValue[i]
                  else
                    Kh_Value:=Constant_Value[2];
                  if (PHI_Value<>LasFiles[0].NullValue)and(Kh_Value<>LasFiles[0].NullValue)and(PHI_Value<>0) then
                    begin
                      Temp_Value:=Kh_Value/PHI_Value;
                      if (Temp_Value>0) then
                        begin
                          Kv_Value:=RoundTo(0.0429 * Power( sqrt(Temp_Value), 2.4855), Precision_Value);
                          Charts[Length(Charts)-1].Series[0].AddXY(Kv_Value, Depth_Value);
                        end
                      else
                        Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                    end
                  else
                    begin
                      Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                    end;
                end;
              Number_of_Charts:=Chart_Number;
            except
              UndoPreparation('Vertical Permeability Estimation', 'KV_C_MHR.MD');
            end;
            end;
          1:begin
            try
              Preparation('Vertical Permeability Estimation', 'KV_C_MGD.MD');
              for i:=0 to No_Values-1 do
                begin
                  if PHI_Track_Number<>-1 then
                    Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
                  else if Kh_Track_Number<>-1 then
                    Depth_Value:=Charts[Kh_Track_Number].Series[0].YValue[i]
                  else
                    Depth_Value:=Charts[0].Series[0].YValue[i];

                  if not Value_Is_Constant[1] then
                    PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
                  else
                    PHI_Value:=Constant_Value[1];

                  if not Value_Is_Constant[2] then
                    Kh_Value:=Charts[Kh_Track_Number].Series[0].XValue[i]
                  else
                    Kh_Value:=Constant_Value[2];
                  if (PHI_Value<>LasFiles[0].NullValue)and(Kh_Value<>LasFiles[0].NullValue)and(PHI_Value<>0) then
                    begin
                      Temp_Value:=Kh_Value/PHI_Value;
                      if (Temp_Value>0) then
                        begin
                          Kv_Value:=RoundTo(13.336 * Power( Mean_Grain_Diameter * sqrt(Kh_Value/PHI_Value), 1.3333), Precision_Value);
                          Charts[Length(Charts)-1].Series[0].AddXY(Kv_Value, Depth_Value);
                        end
                      else
                        Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                    end
                  else
                    begin
                      Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                    end;
                end;
              Number_of_Charts:=Chart_Number;
            except
              UndoPreparation('Vertical Permeability Estimation', 'KV_C_MGD.MD');
            end;
            end;
        end;
      end;
    1:begin
        Case Kv_Shaly_Method_No of
          0:begin
              Case Kv_Illite_Content of
                0:begin
                  try
                    Preparation('Vertical Permeability Estimation', 'KV_SH_TH.MD');
                    for i:=0 to No_Values-1 do
                      begin
                        if Kh_Track_Number<>-1 then
                          Depth_Value:=Charts[Kh_Track_Number].Series[0].YValue[i]
                        else
                          Depth_Value:=Charts[0].Series[0].YValue[i];

                        if not Value_Is_Constant[1] then
                          Kh_Value:=Charts[Kh_Track_Number].Series[0].XValue[i]
                        else
                          Kh_Value:=Constant_Value[1];

                        if (Kh_Value<>LasFiles[0].NullValue)and(Kh_Value>0) then
                          begin
                            Kv_Value:=RoundTo(0.159 * Power( Kh_Value, 0.6675), Precision_Value);
                            Charts[Length(Charts)-1].Series[0].AddXY(Kv_Value, Depth_Value);
                          end
                        else
                          begin
                            Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                          end;
                      end;
                    Number_of_Charts:=Chart_Number;
                  except
                    UndoPreparation('Vertical Permeability Estimation', 'KV_SH_TH.MD');
                  end;
                  end;
                1:begin
                  try
                    Preparation('Vertical Permeability Estimation', 'KV_SH_TE.MD');
                    for i:=0 to No_Values-1 do
                      begin
                        if Kh_Track_Number<>-1 then
                          Depth_Value:=Charts[Kh_Track_Number].Series[0].YValue[i]
                        else
                          Depth_Value:=Charts[0].Series[0].YValue[i];

                        if not Value_Is_Constant[1] then
                          Kh_Value:=Charts[Kh_Track_Number].Series[0].XValue[i]
                        else
                          Kh_Value:=Constant_Value[1];

                        if (Kh_Value<>LasFiles[0].NullValue)and(Kh_Value>0) then
                          begin
                            Kv_Value:=0.598 * Power( Kh_Value, 0.9707);
                            Charts[Length(Charts)-1].Series[0].AddXY(Kv_Value, Depth_Value)
                          end
                        else
                          begin
                            Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                          end;
                      end;
                    Number_of_Charts:=Chart_Number;
                  except
                    UndoPreparation('Vertical Permeability Estimation', 'KV_SH_TE.MD');
                  end;
                  end;
              end;
            end;
///////////////////////////////////////////////////////////////////////////////
          1:begin
              Case Kv_Calcultion_Method_No of
                0:begin
                    Case Kv_Illite_Content of
                      0:begin
                          try
                            Preparation('Vertical Permeability Estimation', 'KV_P_MHR_H.MD');
                            for i:=0 to No_Values-1 do
                              begin
                                if PHI_Track_Number<>-1 then
                                  Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
                                else if Kh_Track_Number<>-1 then
                                  Depth_Value:=Charts[Kh_Track_Number].Series[0].YValue[i]
                                else
                                  Depth_Value:=Charts[0].Series[0].YValue[i];

                                if not Value_Is_Constant[1] then
                                  PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
                                else
                                  PHI_Value:=Constant_Value[1];

                                if not Value_Is_Constant[2] then
                                  Kh_Value:=Charts[Kh_Track_Number].Series[0].XValue[i]
                                else
                                  Kh_Value:=Constant_Value[2];
                                if (PHI_Value<>LasFiles[0].NullValue)and(Kh_Value<>LasFiles[0].NullValue)and(PHI_Value<>0) then
                                  begin
                                    Temp_Value:=sqrt(Kh_Value/PHI_Value);
                                    if (Temp_Value>0) then
                                      begin
                                        Kv_Value:=RoundTo(0.049 * Power(Temp_Value, 1.3939), Precision_Value);
                                        Charts[Length(Charts)-1].Series[0].AddXY(Kv_Value, Depth_Value);
                                      end
                                    else
                                      Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                                  end
                                else
                                  begin
                                    Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                                  end;
                              end;
                            Number_of_Charts:=Chart_Number;
                            except
                              UndoPreparation('Vertical Permeability Estimation', 'KV_P_MHR_H.MD');
                            end;
                        end;
                      1:begin
                          try
                            Preparation('Vertical Permeability Estimation', 'KV_P_MHR_E.MD');
                            for i:=0 to No_Values-1 do
                              begin
                                if PHI_Track_Number<>-1 then
                                  Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
                                else if Kh_Track_Number<>-1 then
                                Depth_Value:=Charts[Kh_Track_Number].Series[0].YValue[i]
                                else
                                  Depth_Value:=Charts[0].Series[0].YValue[i];

                                if not Value_Is_Constant[1] then
                                  PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
                                else
                                  PHI_Value:=Constant_Value[1];

                                if not Value_Is_Constant[2] then
                                  Kh_Value:=Charts[Kh_Track_Number].Series[0].XValue[i]
                                else
                                  Kh_Value:=Constant_Value[2];
                                if (PHI_Value<>LasFiles[0].NullValue)and(Kh_Value<>LasFiles[0].NullValue)and(PHI_Value<>0) then
                                  begin
                                    Temp_Value:=sqrt(Kh_Value/PHI_Value);
                                    if (Temp_Value>0) then
                                      begin
                                        Kv_Value:=RoundTo(0.535 * Power( Temp_Value, 2.1675), Precision_Value);
                                        Charts[Length(Charts)-1].Series[0].AddXY(Kv_Value, Depth_Value)
                                      end
                                    else
                                      Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                                  end
                                else
                                  Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                              end;
                            Number_of_Charts:=Chart_Number;
                          except
                            UndoPreparation('Vertical Permeability Estimation', 'KV_P_MHR_E.MD');
                          end;
                        end;
                    end;
                  end;
                1:begin
                    Case Kv_Illite_Content of
                      0:begin
                          try
                            Preparation('Vertical Permeability Estimation', 'KV_P_MGD_E.MD');
                            for i:=0 to No_Values-1 do
                              begin
                                if PHI_Track_Number<>-1 then
                                  Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
                                else if Kh_Track_Number<>-1 then
                                Depth_Value:=Charts[Kh_Track_Number].Series[0].YValue[i]
                                else
                                  Depth_Value:=Charts[0].Series[0].YValue[i];

                                if not Value_Is_Constant[1] then
                                  PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
                                else
                                  PHI_Value:=Constant_Value[1];

                                if not Value_Is_Constant[2] then
                                  Kh_Value:=Charts[Kh_Track_Number].Series[0].XValue[i]
                                else
                                  Kh_Value:=Constant_Value[2];
                                if (PHI_Value<>LasFiles[0].NullValue)and(Kh_Value<>LasFiles[0].NullValue)and(PHI_Value<>0) then
                                  begin
                                    Temp_Value:=Mean_Grain_Diameter * sqrt(Kh_Value/PHI_Value);
                                    if (Temp_Value>0) then
                                      begin
                                        Kv_Value:=RoundTo(2.5054 * Power( Temp_Value, 0.9383), Precision_Value);
                                        Charts[Length(Charts)-1].Series[0].AddXY(Kv_Value, Depth_Value)
                                      end
                                    else
                                      Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                                  end
                                else
                                  Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                              end;
                            Number_of_Charts:=Chart_Number;
                          except
                            UndoPreparation('Vertical Permeability Estimation', 'KV_P_MGD_E.MD');
                          end;
                        end;
                      1:begin
                          try
                            Preparation('Vertical Permeability Estimation', 'KV_P_MGD_E.MD');
                            for i:=0 to No_Values-1 do
                              begin
                                if PHI_Track_Number<>-1 then
                                  Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
                                else if Kh_Track_Number<>-1 then
                                Depth_Value:=Charts[Kh_Track_Number].Series[0].YValue[i]
                                else
                                  Depth_Value:=Charts[0].Series[0].YValue[i];

                                if not Value_Is_Constant[1] then
                                  PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
                                else
                                  PHI_Value:=Constant_Value[1];

                                if not Value_Is_Constant[2] then
                                  Kh_Value:=Charts[Kh_Track_Number].Series[0].XValue[i]
                                else
                                  Kh_Value:=Constant_Value[2];
                                if (PHI_Value<>LasFiles[0].NullValue)and(Kh_Value<>LasFiles[0].NullValue)and(PHI_Value<>0) then
                                  begin
                                    Temp_Value:=Mean_Grain_Diameter * sqrt(Kh_Value/PHI_Value);
                                    if (Temp_Value>0) then
                                      begin
                                        Kv_Value:=RoundTo(7.7445 * Power(Temp_Value, 1.8009), Precision_Value);
                                        Charts[Length(Charts)-1].Series[0].AddXY(Kv_Value, Depth_Value)
                                      end
                                    else
                                      Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue, Depth_Value);
                                  end
                                else
                                  Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                              end;
                            Number_of_Charts:=Chart_Number;
                          except
                            UndoPreparation('Vertical Permeability Estimation', 'KV_P_MGD_E.MD');
                          end;
                        end;
                    end;
                  end;
                2:begin
                    Case Kv_Illite_Content of
                      0:begin
                          try
                            Preparation('Vertical Permeability Estimation', 'KV_P_SV_H.MD');
                            for i:=0 to No_Values-1 do
                              begin
                                if PHI_Track_Number<>-1 then
                                  Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
                                else if Kh_Track_Number<>-1 then
                                  Depth_Value:=Charts[Kh_Track_Number].Series[0].YValue[i]
                                else if Shale_Volume_Track_Number<>-1 then
                                  Depth_Value:=Charts[Shale_Volume_Track_Number].Series[0].YValue[i]
                                else
                                  Depth_Value:=Charts[0].Series[0].YValue[i];

                                if not Value_Is_Constant[1] then
                                  PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
                                else
                                  PHI_Value:=Constant_Value[1];

                                if not Value_Is_Constant[2] then
                                  Kh_Value:=Charts[Kh_Track_Number].Series[0].XValue[i]
                                else
                                  Kh_Value:=Constant_Value[2];

                                if not Value_Is_Constant[3] then
                                  Shale_Volume_Value:=Charts[Shale_Volume_Track_Number].Series[0].XValue[i]
                                else
                                  Shale_Volume_Value:=Constant_Value[3];

                                if (PHI_Value<>LasFiles[0].NullValue)and(Kh_Value<>LasFiles[0].NullValue)and(Shale_Volume_Value<>LasFiles[0].NullValue)and(PHI_Value<>0) then
                                  begin
                                    Temp_Value:=(1 - Shale_Volume_Value) * sqrt(Kh_Value/PHI_Value);
                                    if (Temp_Value>0) then
                                      begin
                                        Kv_Value:=RoundTo(0.0461 * Power(Temp_Value, 1.58), Precision_Value);
                                        Charts[Length(Charts)-1].Series[0].AddXY(Kv_Value, Depth_Value)
                                      end
                                    else
                                      Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                                  end
                                else
                                  Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                              end;
                            Number_of_Charts:=Chart_Number;
                          except
                            UndoPreparation('Vertical Permeability Estimation', 'KV_P_SV_H.MD');
                          end;
                        end;
                      1:begin
                          try
                            Preparation('Vertical Permeability Estimation', 'KV_P_SV_E.MD');
                            for i:=0 to No_Values-1 do
                              begin
                                if PHI_Track_Number<>-1 then
                                  Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
                                else if Kh_Track_Number<>-1 then
                                  Depth_Value:=Charts[Kh_Track_Number].Series[0].YValue[i]
                                else if Shale_Volume_Track_Number<>-1 then
                                  Depth_Value:=Charts[Shale_Volume_Track_Number].Series[0].YValue[i]
                                else
                                  Depth_Value:=Charts[0].Series[0].YValue[i];

                                if not Value_Is_Constant[1] then
                                  PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
                                else
                                  PHI_Value:=Constant_Value[1];

                                if not Value_Is_Constant[2] then
                                  Kh_Value:=Charts[Kh_Track_Number].Series[0].XValue[i]
                                else
                                  Kh_Value:=Constant_Value[2];

                                if not Value_Is_Constant[3] then
                                  Shale_Volume_Value:=Charts[Shale_Volume_Track_Number].Series[0].XValue[i]
                                else
                                  Shale_Volume_Value:=Constant_Value[3];

                                if (PHI_Value<>LasFiles[0].NullValue)and(Kh_Value<>LasFiles[0].NullValue)and(Shale_Volume_Value<>LasFiles[0].NullValue)and(PHI_Value<>0) then
                                  begin
                                    Temp_Value:=(1 - Shale_Volume_Value) * sqrt(Kh_Value/PHI_Value);
                                    if (Temp_Value>0) then
                                      begin
                                        Kv_Value:=RoundTo(0.1283 * Power( Temp_Value, 1.9658), Precision_Value);
                                        Charts[Length(Charts)-1].Series[0].AddXY(Kv_Value, Depth_Value)
                                      end
                                    else
                                      Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                                  end
                                else
                                  Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                              end;
                            Number_of_Charts:=Chart_Number;
                          except
                            UndoPreparation('Vertical Permeability Estimation', 'KV_P_SV_E.MD');
                          end;
                        end;
                    end;
                  end;
              end;
            end;
        end;
      end;
  end;
end;

procedure TMainForm.Anisotropy1Click(Sender: TObject);
var
Kh_Value: Single;
Kv_Value: Single;
Anisotropy_Value: Single;
No_Values: Integer;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  Kh_Track_Number:=-1;
  Kv_Track_Number:=-1;
  Operation_Canceled:=False;
  Anisotropy_Form:=TAnisotropy_Form.Create(Self);
  Anisotropy_Form.ShowModal;
  Anisotropy_Form.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Reservoir Parameters');
  Preparation('Reservoir Parameters', 'AI.');

  for i:=0 to No_Values-1 do
    begin
      if Kh_Track_Number<>-1 then
        Depth_Value:=Charts[Kh_Track_Number].Series[0].YValue[i]
      else if Kv_Track_Number<>-1 then
        Depth_Value:=Charts[Kv_Track_Number].Series[0].YValue[i]
      else
        Depth_Value:=Charts[0].Series[0].YValue[i];

      if not Value_Is_Constant[1] then
        Kh_Value:=Charts[Kh_Track_Number].Series[0].XValue[i]
      else
        Kh_Value:=Constant_Value[1];
      if not Value_Is_Constant[2] then
        Kv_Value:=Charts[Kv_Track_Number].Series[0].XValue[i]
      else
        Kv_Value:=Constant_Value[2];

      if (Kh_Value<> LasFiles[0].NullValue)and(Kv_Value<> LasFiles[0].NullValue) then
        begin
          if Kv_Value<>0 then
            begin
              if Kv_Value>0 then
                Anisotropy_Value:=RoundTo(Kh_Value/Kv_Value, Precision_Value)
              else
                Anisotropy_Value:=0;
              Charts[Length(Charts)-1].Series[0].AddXY(Anisotropy_Value, Depth_Value);
            end
          else
            begin
              Charts[Length(Charts)-1].Series[0].AddNullXY(0, Depth_Value);
            end;
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Reservoir Parameters', 'AI.');
end;

end;

procedure TMainForm.Heterogeneity1Click(Sender: TObject);
begin
  if Tree1.Roots.Count=0 then Exit;
  Heterogeneity_Form:=THeterogeneity_Form.Create(Self);
  Heterogeneity_Form.ShowModal;
  Heterogeneity_Form.Free;
end;

procedure TMainForm.Averaging1Click(Sender: TObject);
begin
  if Tree1.Roots.Count=0 then Exit;
  Averaging_Form:=TAveraging_Form.Create(Self);
  Averaging_Form.Show;
//  Averaging_Form.Free;
end;

procedure TMainForm.EnableMenu;
begin
//  View1.Enabled:=True;
//  Calculation1.Enabled:=True;
//  Tools1.Enabled:=True;
  Petrophysics1.Enabled:=True;
  General1.Enabled:=True;
//  Close1.Enabled:=True;
  Save1.Enabled:=True;
  Print1.Enabled:=True;
  Open1.Enabled:=False;
  ToolButton2.Enabled:=True;
  ToolButton3.Enabled:=True;
  ToolButton4.Enabled:=True;
  ToolButton5.Enabled:=True;
  ToolButton6.Enabled:=True;
  ToolButton7.Enabled:=True;
  ToolButton8.Enabled:=True;
  ToolButton10.Enabled:=True;
  ToolButton12.Enabled:=True;
  ToolButton13.Enabled:=True;
  ToolButton15.Enabled:=True;
  ToolButton1.Enabled:=False;
end;

procedure TMainForm.DisableMenu;
begin
//  View1.Enabled:=False;
//  Calculation1.Enabled:=False;
//  Tools1.Enabled:=False;
  Petrophysics1.Enabled:=False;
  General1.Enabled:=False;
//  Close1.Enabled:=False;
  Open1.Enabled:=True;
  Save1.Enabled:=False;
  Print1.Enabled:=False;
  ToolButton2.Enabled:=False;
  ToolButton3.Enabled:=False;
  ToolButton4.Enabled:=False;
  ToolButton5.Enabled:=False;
  ToolButton6.Enabled:=False;
  ToolButton7.Enabled:=False;
  ToolButton8.Enabled:=False;
  ToolButton10.Enabled:=False;
  ToolButton12.Enabled:=False;
  ToolButton13.Enabled:=False;
  ToolButton15.Enabled:=False;
  ToolButton1.Enabled:=True;
end;

procedure TMainForm.RwfromConcentration1Click(Sender: TObject);
begin
  Rw_Concentration:=TRw_Concentration.Create(Self);
  Rw_Concentration.ShowModal;
  Rw_Concentration.Free;
end;

procedure TMainForm.ResistivityIndex1Click(Sender: TObject);
var
Rt_Value: Single;
Ro_Value: Single;
RI_Value: Single;
No_Values: Integer;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  Rt_Track_Number:=-1;
  Ro_Track_Number:=-1;
  Operation_Canceled:=False;
  ResistivityIndex_Form:=TResistivityIndex_Form.Create(Self);
  ResistivityIndex_Form.ShowModal;
  ResistivityIndex_Form.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Reservoir Parameters');
  Preparation('Reservoir Parameters', 'RI.');


  for i:=0 to No_Values-1 do
    begin
      if Rt_Track_Number<>-1 then
        Depth_Value:=Charts[Rt_Track_Number].Series[0].YValue[i]
      else if Ro_Track_Number<>-1 then
        Depth_Value:=Charts[Ro_Track_Number].Series[0].YValue[i]
      else
        Depth_Value:=Charts[0].Series[0].YValue[i];

      if not Value_Is_Constant[1] then
        Rt_Value:=Charts[Rt_Track_Number].Series[0].XValue[i]
      else
        Rt_Value:=Constant_Value[1];
      if not Value_Is_Constant[2] then
        Ro_Value:=Charts[Ro_Track_Number].Series[0].XValue[i]
      else
        Ro_Value:=Constant_Value[2];

      if (Rt_Value<> LasFiles[0].NullValue)and(Ro_Value<> LasFiles[0].NullValue) then
        begin
          if Rt_Value<>0 then
            begin
              RI_Value:=RoundTo(Rt_Value/Ro_Value, Precision_Value);
              Charts[Length(Charts)-1].Series[0].AddXY(RI_Value, Depth_Value);
            end
          else
            begin
              Charts[Length(Charts)-1].Series[0].AddNullXY(0, Depth_Value);
            end;
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Reservoir Parameters', 'RI.');
end;

end;

procedure TMainForm.GammaRayIndex1Click(Sender: TObject);
var
GR_Value: Single;
GRI_Value: Single;
No_Values: Integer;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  GR_Track_Number:=-1;
  Operation_Canceled:=False;
  GRIndex_Form:=TGRIndex_Form.Create(Self);
  GRIndex_Form.ShowModal;
  GRIndex_Form.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Reservoir Parameters');
  Preparation('Reservoir Parameters', 'GRI.');


  for i:=0 to No_Values-1 do
    begin
      if GR_Track_Number<>-1 then
        Depth_Value:=Charts[GR_Track_Number].Series[0].YValue[i]
      else
        Depth_Value:=Charts[0].Series[0].YValue[i];

      if not Value_Is_Constant[1] then
        GR_Value:=Charts[GR_Track_Number].Series[0].XValue[i]
      else
        GR_Value:=Constant_Value[1];

      if (GR_Value<> LasFiles[0].NullValue) then
        begin
          GRI_Value:=RoundTo((GR_Value-GR_Sand)/(GR_Shale-GR_Sand), Precision_Value);
          if GRI_Value<0 then GRI_Value:=0;
          if GRI_Value>1 then GRI_Value:=1;
          Charts[Length(Charts)-1].Series[0].AddXY(GRI_Value, Depth_Value);
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Reservoir Parameters', 'GRI.');
end;

end;

procedure TMainForm.ShaleVolume1Click(Sender: TObject);
var
GRI_Value: Single;
No_Values: Integer;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  GRI_Track_Number:=-1;
  Operation_Canceled:=False;
  ShaleVolume_Form:=TShaleVolume_Form.Create(Self);
  ShaleVolume_Form.ShowModal;
  ShaleVolume_Form.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Reservoir Parameters');
  Preparation('Reservoir Parameters', 'SV.%');


  for i:=0 to No_Values-1 do
    begin
      if GRI_Track_Number<>-1 then
        Depth_Value:=Charts[GRI_Track_Number].Series[0].YValue[i]
      else
        Depth_Value:=Charts[0].Series[0].YValue[i];

      if not Value_Is_Constant[1] then
        GRI_Value:=Charts[GRI_Track_Number].Series[0].XValue[i]
      else
        GRI_Value:=Constant_Value[1];

      if (GRI_Value<> LasFiles[0].NullValue) then
        begin
          Case Shale_Volume_Method of
            0:Shale_Volume_Value:=RoundTo(8.3*(Power(2,3.7*GRI_Value)-1), Precision_Value);
            1:Shale_Volume_Value:=RoundTo(33*(Power(2,2*GRI_Value)-1), Precision_Value);
          end;
          if Shale_Volume_Value>100 then Shale_Volume_Value:=100;
          if Shale_Volume_Value<0 then Shale_Volume_Value:=0;
          Charts[Length(Charts)-1].Series[0].AddXY(Shale_Volume_Value, Depth_Value);
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Reservoir Parameters', 'SV.%');
end;

end;


procedure TMainForm.RwfromSPLog1Click(Sender: TObject);
var
T_Value: Single;
K_Value: Single;
Rw_Value: Single;
Rmfeq_Value:Single;
Rweq_Value:Single;
No_Values: Integer;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  SP_Track_Number:=-1;
  T_Track_Number:=-1;
  Operation_Canceled:=False;
  Rw_SP_Form:=TRw_SP_Form.Create(Self);
  Rw_SP_Form.ShowModal;
  Rw_SP_Form.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Reservoir Parameters');
  Preparation('Reservoir Parameters', 'RW_SP.OHM');

  for i:=0 to No_Values-1 do
    begin
      if T_Track_Number<>-1 then
        Depth_Value:=Charts[T_Track_Number].Series[0].YValue[i]
      else
        Depth_Value:=Charts[0].Series[0].YValue[i];

      if not Value_Is_Constant[2] then
        T_Value:=Charts[T_Track_Number].Series[0].XValue[i]
      else
        T_Value:=(BHT_Value-SAT_Value)*(FD_VAlue/TD_Value)+SAT_Value;


      if (T_Value<> LasFiles[0].NullValue) then
        begin

          if Rmf_Value>=0.1 then
            Rmfeq_Value:=Rmf_Value * 0.85
          else
            Rmfeq_Value:=(146 * Rmf_Value - 5)/(337 * Rmf_Value + 77);

          K_Value:= 60 + 0.133 * T_Value;
          Rweq_Value:= Rmfeq_Value / Power(10, -(SP_Sand - SP_Shale)/K_Value);

          if Rweq_Value>=0.12 then
            Rw_Value:=RoundTo( (77 * Rweq_Value + 5)/(146 - 337 * Rweq_Value)  , Precision_Value)
          else
            Rw_Value:= RoundTo(-0.58 + Power(10, 0.69 * Rweq_Value -0.24), Precision_Value);

          Rw_Value:=Rw_Value * (75 + 6.77)/(T_Value + 6.77);

          Charts[Length(Charts)-1].Series[0].AddXY(Rw_Value, Depth_Value);
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Reservoir Parameters', 'RW_SP.OHM');
end;
end;

procedure TMainForm.CECMethod1Click(Sender: TObject);
var
PHI_Value: Single;
FR_Value: Single;
CEC_Value: Single;
T_Value: Single;
Rw_Value: Single;
Rt_Value: Single;
RHO_Value: Single;
n_Value: Single;
Sw_Value: Single;
Qv_Value: Single;
B_Value: Single;
Temp_Value1,
Temp_Value2: Double;
a,b,c: Single;
delta:single;
No_Values: Integer;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  Sw_Value:=0;
  PHI_Track_Number:=-1;
  FR_Track_Number:=-1;
  CEC_Track_Number:=-1;
  T_Track_Number:=-1;
  Rw_Track_Number:=-1;
  Rt_Track_Number:=-1;
  RHO_Track_Number:=-1;
  n_Track_Number:=-1;
  Operation_Canceled:=False;
  CECMethod_Form:=TCECMethod_Form.Create(Self);
  CECMethod_Form.ShowModal;
  CECMethod_Form.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Water Saturation');
  Preparation('Water Saturation', 'SW_CEC.V/V');


  for i:=0 to No_Values-1 do
    begin
      if PHI_Track_Number<>-1 then
        Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
      else if FR_Track_Number<>-1 then
        Depth_Value:=Charts[FR_Track_Number].Series[0].YValue[i]
      else if CEC_Track_Number<>-1 then
        Depth_Value:=Charts[CEC_Track_Number].Series[0].YValue[i]
      else if T_Track_Number<>-1 then
        Depth_Value:=Charts[T_Track_Number].Series[0].YValue[i]
      else if Rw_Track_Number<>-1 then
        Depth_Value:=Charts[Rw_Track_Number].Series[0].YValue[i]
      else if Rt_Track_Number<>-1 then
        Depth_Value:=Charts[Rt_Track_Number].Series[0].YValue[i]
      else if RHO_Track_Number<>-1 then
        Depth_Value:=Charts[RHO_Track_Number].Series[0].YValue[i]
      else if n_Track_Number<>-1 then
        Depth_Value:=Charts[n_Track_Number].Series[0].YValue[i]
      else
        Depth_Value:=Charts[0].Series[0].YValue[i];



      if not Value_Is_Constant[1] then
        PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
      else
        PHI_Value:=Constant_Value[1];

      if not Value_Is_Constant[2] then
        FR_Value:=Charts[FR_Track_Number].Series[0].XValue[i]
      else
        FR_Value:=Constant_Value[2];

      if not Value_Is_Constant[3] then
        CEC_Value:=Charts[CEC_Track_Number].Series[0].XValue[i]
      else
        CEC_Value:=Constant_Value[3];

      if not Value_Is_Constant[4] then
        T_Value:=Charts[T_Track_Number].Series[0].XValue[i]
      else
        T_Value:=Constant_Value[4];

      if not Value_Is_Constant[5] then
        Rw_Value:=Charts[Rw_Track_Number].Series[0].XValue[i]
      else
        Rw_Value:=Constant_Value[5];

      if not Value_Is_Constant[6] then
        Rt_Value:=Charts[Rt_Track_Number].Series[0].XValue[i]
      else
        Rt_Value:=Constant_Value[6];

      if not Value_Is_Constant[7] then
        RHO_Value:=Charts[RHO_Track_Number].Series[0].XValue[i]
      else
        RHO_Value:=Constant_Value[7];

      if not Value_Is_Constant[8] then
        n_Value:=Charts[n_Track_Number].Series[0].XValue[i]
      else
        n_Value:=Constant_Value[8];

      if
        (PHI_Value<> LasFiles[0].NullValue)and(FR_Value<> LasFiles[0].NullValue)and
        (CEC_Value<> LasFiles[0].NullValue)and(T_Value<> LasFiles[0].NullValue)and
        (Rw_Value<> LasFiles[0].NullValue)and(Rt_Value<> LasFiles[0].NullValue)and
        (RHO_Value<> LasFiles[0].NullValue)and(n_Value<> LasFiles[0].NullValue)
      then
        begin
          if Rt_Value<>0 then
            begin
              Qv_Value:=RoundTo( CEC_Value*(1-PHI_Value)*RHO_Value/PHI_Value, Precision_Value);
              B_Value:=RoundTo(4.66*(1-0.6*EXP(-0.77/Rw_Value)), Precision_Value);
              a:=RoundTo(Rt_Value, Precision_Value);
              b:=RoundTo(Rt_Value*Rw_Value*B_Value*Qv_Value, Precision_Value);
              c:=RoundTo(-FR_Value*Rw_Value, Precision_Value);
              delta:=sqr(b)-4*a*c;
              if delta>=0 then
                begin
                  Temp_Value1:= RoundTo((-b+sqrt(delta))/(2*a), -3);
                  Temp_Value2:= RoundTo((-b-sqrt(delta))/(2*a), -3);
                  if (Temp_Value1>=0)and(Temp_Value2<0) then
                    begin
                      Sw_Value:=Temp_Value1;
                    end
                  else if (Temp_Value1<=0)and(Temp_Value2>=0) then
                    begin
                      Sw_Value:=Temp_Value2;
                    end
                  else if (Temp_Value1<=0)and(Temp_Value2<=0) then
                    begin
                      Sw_Value:=0;
                    end
                  else if (Temp_Value1>=0)and(Temp_Value2>=0) then
                    begin
                      if Temp_Value1>=Temp_Value2 then
                        Sw_Value:=Temp_Value1
                      else
                        Sw_Value:=Temp_Value2;
                    end;


                  if Sw_Value<0 then Sw_Value:=0;
                  if Sw_Value>1 then Sw_Value:=1;
                  Charts[Length(Charts)-1].Series[0].AddXY(Sw_Value, Depth_Value);
                end
              else
                begin
                  Charts[Length(Charts)-1].Series[0].AddNullXY(0, Depth_Value);
                end;
            end
          else
            begin
              Charts[Length(Charts)-1].Series[0].AddNullXY(0, Depth_Value);
            end;
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Water Saturation', 'SW_CEC.V/V');
end;
end;

procedure TMainForm.Sw_Calculation(TabIndex: Integer);
var
No_Values: Integer;
Rw_Value: Single;
Rt_Value: Single;
FR_Value:Single;
PHI_Value: Single;
PHI_T_Value: Single;
PHI_D_Value: Single;
Sw_Value: Single;
fshd_Value:Single;
Depth_Value: Single;
i: Smallint;
begin
  if Tree1.Roots.Count=0 then Exit;
  PHI_Track_Number:=-1;
  PHI_D_Track_Number:=-1;
  PHI_T_Track_Number:=-1;
  FR_Track_Number:=-1;
  Rt_Track_Number:=-1;
  Rw_Track_Number:=-1;
  Shale_Volume_Track_Number:=-1;
  Operation_Canceled:=False;
  Sw_Form:=TSw_Form.Create(Self);
  for i:=0 to Sw_Form.PageControl1.PageCount-1 do
    begin
      Sw_Form.TabSheet1.TabVisible:=(TabIndex=0);
      Sw_Form.TabSheet2.TabVisible:=(TabIndex=1);
      Sw_Form.TabSheet3.TabVisible:=(TabIndex=2);
      Sw_Form.TabSheet4.TabVisible:=(TabIndex=3);
    end;
  Sw_Form.ShowModal;
  Sw_Form.Free;
  if Operation_Canceled then Exit;
  No_Values:=LasFiles[0].NoRecords;
  CreateRoot('Water Saturation');

  Case Sw_Calculation_Method of
    0:begin
        try
          Preparation('Water Saturation', 'SW_SMX.V/V');
          for i:=0 to No_Values-1 do
            begin
              if Rw_Track_Number<>-1 then
                Depth_Value:=Charts[Rw_Track_Number].Series[0].YValue[i]
              else if Rt_Track_Number<>-1 then
                Depth_Value:=Charts[Rt_Track_Number].Series[0].YValue[i]
              else if PHI_Track_Number<>-1 then
                Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
              else if Shale_Volume_Track_Number<>-1 then
                Depth_Value:=Charts[Shale_Volume_Track_Number].Series[0].YValue[i]
              else
                Depth_Value:=Charts[0].Series[0].YValue[i];

              if not Value_Is_Constant[1] then
                Rw_Value:=Charts[Rw_Track_Number].Series[0].XValue[i]
              else
                Rw_Value:=Constant_Value[1];

              if not Value_Is_Constant[2] then
                Rt_Value:=Charts[Rt_Track_Number].Series[0].XValue[i]
              else
                Rt_Value:=Constant_Value[2];

              if not Value_Is_Constant[3] then
                PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
              else
                PHI_Value:=Constant_Value[3];

              if not Value_Is_Constant[4] then
                Shale_Volume_Value:=Charts[Shale_Volume_Track_Number].Series[0].XValue[i]/100
              else
                Shale_Volume_Value:=Constant_Value[4]/100;

              if (Rw_Value<>LasFiles[0].NullValue)and(Rt_Value<>LasFiles[0].NullValue)and(PHI_Value<>LasFiles[0].NullValue)and(Shale_Volume_Value<>LasFiles[0].NullValue) then
                begin
                  Sw_Value:=RoundTo(( a_Value*Rw_Value/(2*Power(PHI_Value,Cementation_Factor) )*
                            ( (-Shale_Volume_Value/Shaly_Beds_Resistivity)+
                            sqrt(sqr(Shale_Volume_Value/(100*Shaly_Beds_Resistivity))+
                            (4*Power(PHI_Value,Cementation_Factor)/(a_Value*Rw_Value*Rt_Value))))), Precision_Value);

                  if Sw_Value<0 then Sw_Value:=0;
                  if Sw_Value>1 then Sw_Value:=1;
                  Charts[Length(Charts)-1].Series[0].AddXY(Sw_Value,Depth_Value);
                end
              else
                begin
                  Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                end;
            end;
          Number_of_Charts:=Chart_Number;
        except
          UndoPreparation('Water Saturation', 'SW_SMX.V/V');
        end;
      end;
    1:begin
        try
          Preparation('Water Saturation', 'SW_AR.V/V');
          for i:=0 to No_Values-1 do
            begin
              if Rw_Track_Number<>-1 then
                Depth_Value:=Charts[Rw_Track_Number].Series[0].YValue[i]
              else if Rt_Track_Number<>-1 then
                Depth_Value:=Charts[Rt_Track_Number].Series[0].YValue[i]
              else if FR_Track_Number<>-1 then
                Depth_Value:=Charts[FR_Track_Number].Series[0].YValue[i]
              else
                Depth_Value:=Charts[0].Series[0].YValue[i];

              if not Value_Is_Constant[1] then
                Rw_Value:=Charts[Rw_Track_Number].Series[0].XValue[i]
              else
                Rw_Value:=Constant_Value[1];

              if not Value_Is_Constant[2] then
                Rt_Value:=Charts[Rt_Track_Number].Series[0].XValue[i]
              else
                Rt_Value:=Constant_Value[2];

              if not Value_Is_Constant[3] then
                FR_Value:=Charts[FR_Track_Number].Series[0].XValue[i]
              else
                FR_Value:=Constant_Value[3];

              if (Rw_Value<>LasFiles[0].NullValue)and(Rt_Value<>LasFiles[0].NullValue)and(FR_Value<>LasFiles[0].NullValue) then
                begin
                  Sw_Value:= Power(Fr_Value * Rw_Value / Rt_Value, 1/Saturation_Exponent);

                  if Sw_Value<0 then Sw_Value:=0;
                  if Sw_Value>1 then Sw_Value:=1;
                  Charts[Length(Charts)-1].Series[0].AddXY(Sw_Value,Depth_Value);
                end
              else
                begin
                  Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                end;
            end;
          Number_of_Charts:=Chart_Number;
        except
          UndoPreparation('Water Saturation', 'SW_AR.V/V');
        end;
      end;
    2:begin
        Case Shale_Calculation_Method of
          0:begin
              try
                Preparation('Water Saturation', 'SW_SH_LAM.V/V');
                for i:=0 to No_Values-1 do
                  begin
                    if Rw_Track_Number<>-1 then
                      Depth_Value:=Charts[Rw_Track_Number].Series[0].YValue[i]
                    else if Rt_Track_Number<>-1 then
                      Depth_Value:=Charts[Rt_Track_Number].Series[0].YValue[i]
                    else if PHI_Track_Number<>-1 then
                      Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
                    else if Shale_Volume_Track_Number<>-1 then
                      Depth_Value:=Charts[Shale_Volume_Track_Number].Series[0].YValue[i]
                    else
                      Depth_Value:=Charts[0].Series[0].YValue[i];

                    if not Value_Is_Constant[1] then
                      Rw_Value:=Charts[Rw_Track_Number].Series[0].XValue[i]
                    else
                      Rw_Value:=Constant_Value[1];

                    if not Value_Is_Constant[2] then
                      Rt_Value:=Charts[Rt_Track_Number].Series[0].XValue[i]
                    else
                      Rt_Value:=Constant_Value[2];

                    if not Value_Is_Constant[3] then
                      PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
                    else
                      PHI_Value:=Constant_Value[3];

                    if not Value_Is_Constant[4] then
                      Shale_Volume_Value:=Charts[Shale_Volume_Track_Number].Series[0].XValue[i]/100
                    else
                      Shale_Volume_Value:=Constant_Value[4]/100;

                    if (Rw_Value<>LasFiles[0].NullValue)and(Rt_Value<>LasFiles[0].NullValue)and(PHI_Value<>LasFiles[0].NullValue)and(Shale_Volume_Value<>LasFiles[0].NullValue) then
                      begin
                        Sw_Value:= RoundTo(Power( ( (1/Rt_Value) - (Shale_Volume_Value/Shaly_Beds_Resistivity) )*
                                  (a_Value * Rw_Value * Power((1 - Shale_Volume_Value), Cementation_Factor - 1)) /
                                  Power (PHI_Value, Cementation_Factor), 1 / Saturation_Exponent), Precision_Value);
      
                        if Sw_Value<0 then Sw_Value:=0;
                        if Sw_Value>1 then Sw_Value:=1;
                        Charts[Length(Charts)-1].Series[0].AddXY(Sw_Value,Depth_Value);
                      end
                    else
                      begin
                        Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                      end;
                  end;
                Number_of_Charts:=Chart_Number;
              except
                UndoPreparation('Water Saturation', 'SW_SH_LAM.V/V');
              end;
            end;
          1:begin
              try
                Preparation('Water Saturation', 'SW_SH_DIS.V/V');
                for i:=0 to No_Values-1 do
                  begin
                    if Rw_Track_Number<>-1 then
                      Depth_Value:=Charts[Rw_Track_Number].Series[0].YValue[i]
                    else if Rt_Track_Number<>-1 then
                      Depth_Value:=Charts[Rt_Track_Number].Series[0].YValue[i]
                    else if PHI_T_Track_Number<>-1 then
                      Depth_Value:=Charts[PHI_T_Track_Number].Series[0].YValue[i]
                    else if PHI_D_Track_Number<>-1 then
                      Depth_Value:=Charts[PHI_D_Track_Number].Series[0].YValue[i]
                    else
                      Depth_Value:=Charts[0].Series[0].YValue[i];

                    if not Value_Is_Constant[1] then
                      Rw_Value:=Charts[Rw_Track_Number].Series[0].XValue[i]
                    else
                      Rw_Value:=Constant_Value[1];

                    if not Value_Is_Constant[2] then
                      Rt_Value:=Charts[Rt_Track_Number].Series[0].XValue[i]
                    else
                      Rt_Value:=Constant_Value[2];

                    if not Value_Is_Constant[3] then
                      PHI_T_Value:=Charts[PHI_T_Track_Number].Series[0].XValue[i]
                    else
                      PHI_T_Value:=Constant_Value[3];

                    if not Value_Is_Constant[4] then
                      PHI_D_Value:=Charts[PHI_D_Track_Number].Series[0].XValue[i]
                    else
                      PHI_D_Value:=Constant_Value[4];

                    if (Rw_Value<>LasFiles[0].NullValue)and(Rt_Value<>LasFiles[0].NullValue)and(PHI_T_Value<>LasFiles[0].NullValue)and(PHI_D_Value<>LasFiles[0].NullValue) then
                      begin
                        if PHI_T_Value<>0 then
                          fshd_Value:= 1 - (PHI_D_Value / PHI_T_Value)
                        else
                          fshd_Value:= 0;
                        Sw_Value:= RoundTo((1 / (1 - fshd_Value)) * (sqrt((a_Value * Rw_Value /
                                   Power(PHI_T_Value, Cementation_Factor) * Rt_Value) +
                                   (fshd_Value / 4)) - (fshd_Value / 2)), Precision_Value);

                        if Sw_Value<0 then Sw_Value:=0;
                        if Sw_Value>1 then Sw_Value:=1;
                        Charts[Length(Charts)-1].Series[0].AddXY(Sw_Value,Depth_Value);
                      end
                    else
                      begin
                        Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                      end;
                  end;
                Number_of_Charts:=Chart_Number;
              except
                UndoPreparation('Water Saturation', 'SW_SH_DIS.V/V');
              end;
            end;
        end;
      end;
    3:begin
        try
          Preparation('Water Saturation', 'SW_IND.V/V');
          for i:=0 to No_Values-1 do
            begin
              if Rw_Track_Number<>-1 then
                Depth_Value:=Charts[Rw_Track_Number].Series[0].YValue[i]
              else if Rt_Track_Number<>-1 then
                Depth_Value:=Charts[Rt_Track_Number].Series[0].YValue[i]
              else if PHI_Track_Number<>-1 then
                Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
              else if Shale_Volume_Track_Number<>-1 then
                Depth_Value:=Charts[Shale_Volume_Track_Number].Series[0].YValue[i]
              else
                Depth_Value:=Charts[0].Series[0].YValue[i];

              if not Value_Is_Constant[1] then
                Rw_Value:=Charts[Rw_Track_Number].Series[0].XValue[i]
              else
                Rw_Value:=Constant_Value[1];

              if not Value_Is_Constant[2] then
                Rt_Value:=Charts[Rt_Track_Number].Series[0].XValue[i]
              else
                Rt_Value:=Constant_Value[2];

              if not Value_Is_Constant[3] then
                PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
              else
                PHI_Value:=Constant_Value[3];

              if not Value_Is_Constant[4] then
                Shale_Volume_Value:=Charts[Shale_Volume_Track_Number].Series[0].XValue[i]/100
              else
                Shale_Volume_Value:=Constant_Value[4]/100;

              if (Rw_Value<>LasFiles[0].NullValue)and(Rt_Value<>LasFiles[0].NullValue)and(PHI_Value<>LasFiles[0].NullValue)and(Shale_Volume_Value<>LasFiles[0].NullValue) then
                begin
                  Sw_Value:=RoundTo(Power(1/( sqrt(Rt_Value) *
                                            (
                                              ( Power(Shale_Volume_Value, (1-Shale_Volume_Value/2))/sqrt(Shaly_Beds_Resistivity)) +
                                              ( Power(PHI_Value, Cementation_Factor/2)/sqrt(a_Value*Rw_Value)))
                                            )
                                          , 2/Saturation_Exponent)
                                          , Precision_Value);

                  if Sw_Value<0 then Sw_Value:=0;
                  if Sw_Value>1 then Sw_Value:=1;
                  Charts[Length(Charts)-1].Series[0].AddXY(Sw_Value,Depth_Value);
                end
              else
                begin
                  Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
                end;
            end;
          Number_of_Charts:=Chart_Number;
        except
          UndoPreparation('Water Saturation', 'SW_IND.V/V');
        end;
      end;

  end;
end;

procedure TMainForm.Castagna2Click(Sender: TObject);
var
Vp_Value: Single;
Vs_Value: Single;
No_Values: Integer;
Depth_Value: Single;
aij:array [1..4, 0..2] of Single;
Xi : array [1..4] of Single;
i,j,k: integer;
Temp_Value1: Single;
Temp_Value2: Single;
Temp_Value3: Single;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  Vp_Track_Number:=-1;
  Operation_Canceled:=False;
  Greenberg_Castagna_Form:=TGreenberg_Castagna_Form.Create(Self);
  Greenberg_Castagna_Form.ShowModal;
  Greenberg_Castagna_Form.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Vs Estimation');
  Preparation('Vs Estimation', 'VS_GC.');

  Xi[1]:=Sst_Percentage;
  Xi[2]:=Lst_Percentage;
  Xi[3]:=Dolomite_Percentage;
  Xi[4]:=Shale_Percentage;

  aij[1,0]:=-0.85588;
  aij[1,1]:=0.80416;
  aij[1,2]:=0;
  aij[2,0]:=-1.03049;
  aij[2,1]:=1.01677;
  aij[2,2]:=-0.055088;
  aij[3,0]:=-0.07775;
  aij[3,1]:=0.58321;
  aij[3,2]:=0;
  aij[4,0]:=-0.86735;
  aij[4,1]:=0.76969;
  aij[4,2]:=0;

  for i:=0 to No_Values-1 do
    begin
      if Vp_Track_Number<>-1 then
        Depth_Value:=Charts[Vp_Track_Number].Series[0].YValue[i]
      else
        Depth_Value:=Charts[0].Series[0].YValue[i];

      if not Value_Is_Constant[1] then
        Vp_Value:=Charts[Vp_Track_Number].Series[0].XValue[i]
      else
        Vp_Value:=Constant_Value[1];

      if (Vp_Value<> LasFiles[0].NullValue) then
        begin
          if Vp_Unit='FT/S' then
            Vp_Value:=0.001*0.3048*Vp_Value
          else if Vp_Unit='KM/S' then
            Vp_Value:=Vp_Value
          else
            begin
              MessageDlg('No measurment unit selected for Vp!',mtError,[mbOk],0);
              Exit;
            end;

          Temp_Value2:=0;
          Temp_Value3:=0;
          for j:=1 to 4 do
            begin
              Temp_Value1:=0;
              for k:=0 to 2 do
                begin
                  Temp_Value1:=Temp_Value1 + (aij[j,k] * Power(Vp_Value,k));
                end;
              Temp_Value2:=Temp_Value2 + (Xi[j] * Temp_Value1);
              Temp_Value3:=Temp_Value3 + (Xi[j] / Temp_Value1);
            end;
          Vs_Value:=0.5 * (Temp_Value2 + (1 / Temp_Value3));

          if Vs_Unit='KM/S' then
            Vs_Value:=RoundTo(Vs_Value, Precision_Value)
          else if Vs_Unit='FT/S' then
            Vs_Value:=RoundTo(1000/0.3048*Vs_Value, Precision_Value)
          else
            begin
              MessageDlg('No measurment unit selected for Vs!',mtError,[mbOk],0);
              Exit;
            end;
          Charts[Length(Charts)-1].Series[0].AddXY(Vs_Value, Depth_Value);
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Vs Estimation', 'VS_GC.'+Vs_Unit);
end;

end;

procedure TMainForm.CationExchangeCapacityCEC1Click(Sender: TObject);
var
Kaolinites_Value: Single;
Illites_Value: Single;
Smectites_Value: Single;
Chlorites_Value: Single;
Vermiculites_Value: Single;
Polygorskites_Value: Single;
CEC_Value: Single;
No_Values: Integer;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  Kaolinites_Track_Number:=-1;
  Illites_Track_Number:=-1;
  Smectites_Track_Number:=-1;
  Chlorites_Track_Number:=-1;
  Vermiculites_Track_Number:=-1;
  Polygorskites_Track_Number:=-1;
  Operation_Canceled:=False;
  CEC_Form:=TCEC_Form.Create(Self);
  CEC_Form.ShowModal;
  CEC_Form.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Reservoir Parameters');
  Preparation('Reservoir Parameters', 'CEC.meq/100g');
  for i:=0 to No_Values-1 do
    begin
      Depth_Value:=Charts[0].Series[0].YValue[i];

      if not Value_Is_Constant[1] then
        Kaolinites_Value:=Charts[Kaolinites_Track_Number].Series[0].XValue[i]
      else
        Kaolinites_Value:=Constant_Value[1];

      if not Value_Is_Constant[2] then
        Illites_Value:=Charts[Illites_Track_Number].Series[0].XValue[i]
      else
        Illites_Value:=Constant_Value[2];

      if not Value_Is_Constant[3] then
        Smectites_Value:=Charts[Smectites_Track_Number].Series[0].XValue[i]
      else
        Smectites_Value:=Constant_Value[3];

      if not Value_Is_Constant[4] then
        Chlorites_Value:=Charts[Chlorites_Track_Number].Series[0].XValue[i]
      else
        Chlorites_Value:=Constant_Value[4];

      if not Value_Is_Constant[5] then
        Vermiculites_Value:=Charts[Vermiculites_Track_Number].Series[0].XValue[i]
      else
        Vermiculites_Value:=Constant_Value[5];

      if not Value_Is_Constant[6] then
        Polygorskites_Value:=Charts[Polygorskites_Track_Number].Series[0].XValue[i]
      else
        Polygorskites_Value:=Constant_Value[6];

      if
        (Kaolinites_Value<> LasFiles[0].NullValue)and(Illites_Value<> LasFiles[0].NullValue)and
        (Smectites_Value<> LasFiles[0].NullValue)and(Chlorites_Value<> LasFiles[0].NullValue)and
        (Vermiculites_Value<> LasFiles[0].NullValue)and(Polygorskites_Value<> LasFiles[0].NullValue)
      then
        begin
          CEC_Value:=RoundTo((Kaolinites_Value * Kaolinites_CEC_Value +
                      Illites_Value * Illites_CEC_Value +
                      Smectites_Value * Smectites_CEC_Value +
                      Chlorites_Value * Chlorites_CEC_Value +
                      Vermiculites_Value * Vermiculites_CEC_Value +
                      Polygorskites_Value * Polygorskites_CEC_Value) /
                     (Kaolinites_CEC_Value +
                      Illites_CEC_Value +
                      Smectites_CEC_Value +
                      Chlorites_CEC_Value +
                      Vermiculites_CEC_Value +
                      Polygorskites_CEC_Value), Precision_Value) ;

          Charts[Length(Charts)-1].Series[0].AddXY(CEC_Value, Depth_Value);
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Reservoir Parameters', 'CEC.meq/100g');
end;

end;

procedure TMainForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Separator3.Width:=NewWidth - (Width - Separator3.Width);
end;

procedure TMainForm.Print1Click(Sender: TObject);
begin
 Preview_Form:=TPreview_Form.Create(Self);
 Preview_Form.Print_From:=0;
 Preview_Form.ShowModal;
 Preview_Form.Free;
end;

procedure TMainForm.SortCharts;
var
i,j: integer;
begin
  j:=0;
  ScrollBox1.HorzScrollBar.Position:=0;
  for i:=0 to Length(Charts)-1 do
    begin
      if Charts[i].Visible=True then
        begin
          if j<>0 then
            begin
              Charts[i].Width:=200;
              if Charts[i].SeriesCount>0 then
                Charts[i].Series[0].VertAxis:=aLeftAxis;
              Charts[i].Axes.Left.TickOnLabelsOnly:=False;
              Charts[i].Axes.Left.Axis.Visible:=False;
              Charts[i].Axes.Left.Ticks.Visible:=False;
              Charts[i].Axes.Left.Labels:=False;
              Charts[i].Axes.Left.MinorTicks.Visible:=False;
              Charts[i].Axes.Left.Title.Visible:=False;
              Charts[i].Left:=250 + 200*(j-1);
            end
          else
            begin
              Charts[i].Width:=250;
              if Charts[i].SeriesCount>0 then
                Charts[i].Series[0].VertAxis:=aLeftAxis;
              Charts[i].Axes.Left.TickOnLabelsOnly:=True;
              Charts[i].Axes.Left.Axis.Visible:=True;
              Charts[i].Axes.Left.Ticks.Visible:=True;
              Charts[i].Axes.Left.Labels:=True;
              Charts[i].Axes.Left.MinorTicks.Visible:=True;
              Charts[i].Axes.Left.Title.Visible:=True;
              Charts[i].Left:=0;
            end;
          Inc(j);
        end;
    end;

  for i:=Length(Charts)-1 downto 0 do
    begin
      if Charts[i].Visible=True then
        begin
          if j>1 then
            begin
              Charts[i].Width:=250;
              if Charts[i].SeriesCount>0 then
                Charts[i].Series[0].VertAxis:=aRightAxis;
              Charts[i].Axes.Right.TickOnLabelsOnly:=True;
              Charts[i].Axes.Right.Axis.Visible:=True;
              Charts[i].Axes.Right.Ticks.Visible:=True;
              Charts[i].Axes.Right.Labels:=True;
              Charts[i].Axes.Right.MinorTicks.Visible:=True;
              Charts[i].Axes.Right.Title.Visible:=True;
              Exit;
            end;
        end;
    end;


end;

procedure TMainForm.Simandoux1Click(Sender: TObject);
begin
  Sw_Calculation(0);
end;

procedure TMainForm.CleanSandstone1Click(Sender: TObject);
begin
  Sw_Calculation(1);
end;

procedure TMainForm.ShalySandstone1Click(Sender: TObject);
begin
  Sw_Calculation(2);
end;

procedure TMainForm.Save1Click(Sender: TObject);
begin
  Save_Form:=TSave_Form.Create(Self);
  Save_Form.ShowModal;
  Save_Form.Free;
end;

procedure TMainForm.Sonic1Click(Sender: TObject);
begin
  PHI_Calculate(0);
end;

procedure TMainForm.Density1Click(Sender: TObject);
begin
  PHI_Calculate(1);
end;

procedure TMainForm.AverageNeutronDensity1Click(Sender: TObject);
begin
  PHI_Calculate(2);
end;

procedure TMainForm.Indonesia1Click(Sender: TObject);
begin
  Sw_Calculation(3);
end;

procedure TMainForm.ScrollBox1Resize(Sender: TObject);
var
i:integer;
begin
{    if not Charts_Scaled then
      begin
        for i:=0 to Length(Charts)-1 do
          begin
            Charts[i].Height := ScrollBox1.Height - 17; //Tracks_Form.Height - 55;
          end;
      end
    else
      begin
      end;}
//  end;
end;

procedure TMainForm.Panel2Resize(Sender: TObject);
begin
//  Image1.Left:=Trunc((Panel2.Width-Image1.Width)/2);
//  VrScrollText1.Left:=Trunc((Panel2.Width-VrScrollText1.Width)/2);
end;

procedure TMainForm.EnlargePic;
begin
{  Image1.Height:=173;
  Image1.Width:=228;
  Image1.Parent:=ScrollBox1;
  VrScrollText1.Parent:=ScrollBox1;
  Image1.Left:=Trunc((ScrollBox1.Width-Image1.Width)/2);
  Image1.Top:=Trunc((ScrollBox1.Height - Panel2.Height - Image1.Height)/2);
  VrScrollText1.Left:=Trunc((ScrollBox1.Width-VrScrollText1.Width)/2);
  VrScrollText1.Top:=Trunc((ScrollBox1.Height - Panel2.Height + Image1.Height)/2);}
end;

procedure TMainForm.LessenPic;
begin
{  Image1.Height:=43;
  Image1.Width:=57;
  Image1.Parent:=Panel2;
  VrScrollText1.Parent:=Panel2;
  Image1.Left:=Trunc((Panel2.Width-Image1.Width)/2);
  Image1.Top:=0;
  VrScrollText1.Left:=Trunc((Panel2.Width-VrScrollText1.Width)/2);
  VrScrollText1.Top:=43;}
end;

procedure TMainForm.Fluid1Click(Sender: TObject);
begin
  Fluid_Model_Form:=TFLuid_Model_Form.Create(Self);
  Fluid_Model_Form.ShowModal;
  Fluid_Model_Form.Free;
end;

procedure TMainForm.Determinisstic1Click(Sender: TObject);
var
i,j: integer;
Depth_Value, TempValue: Single;
Normalizer: Single;
PHIValue:Single;
begin
  Operation_Canceled:=False;
  Lithology_Multimin_Form:=TLithology_Multimin_Form.Create(Self);
  Lithology_Multimin_Form.MainFormNo:=1;
  Lithology_Multimin_Form.ShowModal;
  if Operation_Canceled then Exit;

  PHI_Track_Number:=NPHI_Track_Number;;
  PHI_Select_Form:=TPHI_Select_Form.Create(Self);
  PHI_Select_Form.MainFormNo:=1;
  PHI_Select_Form.ShowModal;
  PHI_Select_Form.Free;
  if Operation_Canceled then Exit;

  if SST_Checked then
    begin
      InputLithoMatrix[1,1]:=DT_SST;
      InputLithoMatrix[2,1]:=RHO_SST;
      InputLithoMatrix[3,1]:=GR_SST;
      InputLithoMatrix[4,1]:=RES_SST;
      InputLithoMatrix[5,1]:=NPHI_SST;
      InputLithoMatrix[6,1]:=PEF_SST;
    end
  else
    begin
      InputLithoMatrix[1,1]:=0;
      InputLithoMatrix[2,1]:=0;
      InputLithoMatrix[3,1]:=0;
      InputLithoMatrix[4,1]:=0;
      InputLithoMatrix[5,1]:=0;
      InputLithoMatrix[6,1]:=0;
    end;

  if SHL_Checked then
    begin
      InputLithoMatrix[1,2]:=DT_SHL;
      InputLithoMatrix[2,2]:=RHO_SHL;
      InputLithoMatrix[3,2]:=GR_SHL;
      InputLithoMatrix[4,2]:=RES_SHL;
      InputLithoMatrix[5,2]:=NPHI_SHL;
      InputLithoMatrix[6,2]:=PEF_SHL;
    end
  else
    begin
      InputLithoMatrix[1,2]:=0;
      InputLithoMatrix[2,2]:=0;
      InputLithoMatrix[3,2]:=0;
      InputLithoMatrix[4,2]:=0;
      InputLithoMatrix[5,2]:=0;
      InputLithoMatrix[6,2]:=0;
    end;

  if LST_Checked then
    begin
      InputLithoMatrix[1,3]:=DT_LST;
      InputLithoMatrix[2,3]:=RHO_LST;
      InputLithoMatrix[3,3]:=GR_LST;
      InputLithoMatrix[4,3]:=RES_LST;
      InputLithoMatrix[5,3]:=NPHI_LST;
      InputLithoMatrix[6,3]:=PEF_LST;
    end
  else
    begin
      InputLithoMatrix[1,3]:=0;
      InputLithoMatrix[2,3]:=0;
      InputLithoMatrix[3,3]:=0;
      InputLithoMatrix[4,3]:=0;
      InputLithoMatrix[5,3]:=0;
      InputLithoMatrix[6,3]:=0;
    end;

  if DOL_Checked then
    begin
      InputLithoMatrix[1,4]:=DT_DOL;
      InputLithoMatrix[2,4]:=RHO_DOL;
      InputLithoMatrix[3,4]:=GR_DOL;
      InputLithoMatrix[4,4]:=RES_DOL;
      InputLithoMatrix[5,4]:=NPHI_DOL;
      InputLithoMatrix[6,4]:=PEF_DOL;
    end
  else
    begin
      InputLithoMatrix[1,4]:=0;
      InputLithoMatrix[2,4]:=0;
      InputLithoMatrix[3,4]:=0;
      InputLithoMatrix[4,4]:=0;
      InputLithoMatrix[5,4]:=0;
      InputLithoMatrix[6,4]:=0;
    end;

  if GPS_Checked then
    begin
      InputLithoMatrix[1,5]:=DT_GPS;
      InputLithoMatrix[2,5]:=RHO_GPS;
      InputLithoMatrix[3,5]:=GR_GPS;
      InputLithoMatrix[4,5]:=RES_GPS;
      InputLithoMatrix[5,5]:=NPHI_GPS;
      InputLithoMatrix[6,5]:=PEF_GPS;
    end
  else
    begin
      InputLithoMatrix[1,5]:=0;
      InputLithoMatrix[2,5]:=0;
      InputLithoMatrix[3,5]:=0;
      InputLithoMatrix[4,5]:=0;
      InputLithoMatrix[5,5]:=0;
      InputLithoMatrix[6,5]:=0;
    end;

  if ANH_Checked then
    begin
      InputLithoMatrix[1,6]:=DT_ANH;
      InputLithoMatrix[2,6]:=RHO_ANH;
      InputLithoMatrix[3,6]:=GR_ANH;
      InputLithoMatrix[4,6]:=RES_ANH;
      InputLithoMatrix[5,6]:=NPHI_ANH;
      InputLithoMatrix[6,6]:=PEF_ANH;
    end
  else
    begin
      InputLithoMatrix[1,6]:=0;
      InputLithoMatrix[2,6]:=0;
      InputLithoMatrix[3,6]:=0;
      InputLithoMatrix[4,6]:=0;
      InputLithoMatrix[5,6]:=0;
      InputLithoMatrix[6,6]:=0;
    end;

{  InputLithoMatrix[1,7]:=DT_FLD;
  InputLithoMatrix[2,7]:=RHO_FLD;
  InputLithoMatrix[3,7]:=GR_FLD;
  InputLithoMatrix[4,7]:=RES_FLD;
  InputLithoMatrix[5,7]:=NPHI_FLD;
  InputLithoMatrix[6,7]:=RES_FLD;
  InputLithoMatrix[6,7]:=PEF_FLD;

  InputLithoMatrix[7,1]:=1;
  InputLithoMatrix[7,2]:=1;
  InputLithoMatrix[7,3]:=1;
  InputLithoMatrix[7,4]:=1;
  InputLithoMatrix[7,5]:=1;
  InputLithoMatrix[7,6]:=1;
  InputLithoMatrix[7,7]:=1;       }

{  InputLithoMatrix[1,1]:=DT_SST;
  InputLithoMatrix[1,2]:=DT_SHL;
  InputLithoMatrix[1,3]:=DT_LST;
  InputLithoMatrix[1,4]:=DT_DOL;
  InputLithoMatrix[1,5]:=DT_GPS;
  InputLithoMatrix[1,6]:=DT_ANH;
  InputLithoMatrix[1,7]:=DT_FLD;

  InputLithoMatrix[2,1]:=RHO_SST;
  InputLithoMatrix[2,2]:=RHO_SHL;
  InputLithoMatrix[2,3]:=RHO_LST;
  InputLithoMatrix[2,4]:=RHO_DOL;
  InputLithoMatrix[2,5]:=RHO_GPS;
  InputLithoMatrix[2,6]:=RHO_ANH;
  InputLithoMatrix[2,7]:=RHO_FLD;

  InputLithoMatrix[3,1]:=GR_SST;
  InputLithoMatrix[3,2]:=GR_SHL;
  InputLithoMatrix[3,3]:=GR_LST;
  InputLithoMatrix[3,4]:=GR_DOL;
  InputLithoMatrix[3,5]:=GR_GPS;
  InputLithoMatrix[3,6]:=GR_ANH;
  InputLithoMatrix[3,7]:=GR_FLD;

  InputLithoMatrix[4,1]:=RES_SST;
  InputLithoMatrix[4,2]:=RES_SHL;
  InputLithoMatrix[4,3]:=RES_LST;
  InputLithoMatrix[4,4]:=RES_DOL;
  InputLithoMatrix[4,5]:=RES_GPS;
  InputLithoMatrix[4,6]:=RES_ANH;
  InputLithoMatrix[4,7]:=RES_FLD;

  InputLithoMatrix[5,1]:=NPHI_SST;
  InputLithoMatrix[5,2]:=NPHI_SHL;
  InputLithoMatrix[5,3]:=NPHI_LST;
  InputLithoMatrix[5,4]:=NPHI_DOL;
  InputLithoMatrix[5,5]:=NPHI_GPS;
  InputLithoMatrix[5,6]:=NPHI_ANH;
  InputLithoMatrix[5,7]:=NPHI_FLD;

  InputLithoMatrix[6,1]:=PEF_SST;
  InputLithoMatrix[6,2]:=PEF_SHL;
  InputLithoMatrix[6,3]:=PEF_LST;
  InputLithoMatrix[6,4]:=PEF_DOL;
  InputLithoMatrix[6,5]:=PEF_GPS;
  InputLithoMatrix[6,6]:=PEF_ANH;
  InputLithoMatrix[6,7]:=PEF_FLD;}


  CreateRoot('Lithology Interpretation');
//  Preparation('Lithology Interpretation', 'DETERMIN_FLUID.V/V');
  Preparation('Lithology Interpretation', 'DETERMIN_SST.V/V');
  Preparation('Lithology Interpretation', 'DETERMIN_SHALE.V/V');
  Preparation('Lithology Interpretation', 'DETERMIN_LST.V/V');
  Preparation('Lithology Interpretation', 'DETERMIN_DOL.V/V');
  Preparation('Lithology Interpretation', 'DETERMIN_GYPSUM.V/V');
  Preparation('Lithology Interpretation', 'DETERMIN_ANHYDRITE.V/V');
  for i:=0 to LasFiles[0].NoRecords-1 do
    begin
      if PHI_Track_Number>=0 then
        begin
          TempValue:=Charts[PHI_Track_Number].Series[0].Xvalues[i];
          if (TempValue<>LASFiles[0].NullValue) then
            PHIValue:=TempValue
          else
            PHIValue:=0;
        end;

      if DT_Track_Number>=0 then
        begin
          TempValue:=RoundTo(Charts[DT_Track_Number].Series[0].XValue[i], Precision_Value);
          if TempValue<>LASFiles[0].NullValue then
            begin
              TempValue:= (TempValue - (PHIValue * DT_FLD)) / (1 - PHIValue);
              InputLithoMatrix[1,7]:=TempValue;
            end
          else
            InputLithoMatrix[1,7]:=0;
        end
      else
        InputLithoMatrix[1,7]:=0;
      if RHO_Track_Number>=0 then
        begin
          TempValue:=RoundTo(Charts[RHO_Track_Number].Series[0].XValue[i], Precision_Value);
          if TempValue<>LASFiles[0].NullValue then
            begin
              TempValue:= (TempValue - (PHIValue * RHO_FLD)) / (1 - PHIValue);
              InputLithoMatrix[2,7]:=TempValue;
            end
          else
            InputLithoMatrix[2,7]:=0;
        end
      else
        InputLithoMatrix[2,7]:=0;
      if GR_Track_Number>=0 then
        begin
          TempValue:=RoundTo(Charts[GR_Track_Number].Series[0].XValue[i], Precision_Value);
          if TempValue<>LASFiles[0].NullValue then
            begin
              TempValue:= (TempValue - (PHIValue * GR_FLD)) / (1 - PHIValue);
              InputLithoMatrix[3,7]:=TempValue;
            end
          else
            InputLithoMatrix[3,7]:=0;
        end
      else
        InputLithoMatrix[3,7]:=0;
      if LLD_Track_Number>=0 then
        begin
          TempValue:=RoundTo(Charts[LLD_Track_Number].Series[0].XValue[i], Precision_Value);
          if TempValue<>LASFiles[0].NullValue then
            begin
              TempValue:= (TempValue - (PHIValue * RES_FLD)) / (1 - PHIValue);
              InputLithoMatrix[4,7]:=TempValue;
            end
          else
            InputLithoMatrix[4,7]:=0;
        end
      else
        InputLithoMatrix[4,7]:=0;
      if NPHI_Track_Number>=0 then
        begin
          TempValue:=RoundTo(Charts[NPHI_Track_Number].Series[0].XValue[i], Precision_Value);
          if TempValue<>LASFiles[0].NullValue then
            begin
              TempValue:= (TempValue - (PHIValue * NPHI_FLD)) / (1 - PHIValue);
              InputLithoMatrix[5,7]:=TempValue;
            end
          else
            InputLithoMatrix[5,7]:=0;
        end
      else
        InputLithoMatrix[5,7]:=0;
      if PEF_Track_Number>=0 then
        begin
          TempValue:=RoundTo(Charts[PEF_Track_Number].Series[0].XValue[i], Precision_Value);
          if TempValue<>LASFiles[0].NullValue then
            begin
              TempValue:= (TempValue - (PHIValue * PEF_FLD)) / (1 - PHIValue);
              InputLithoMatrix[6,7]:=TempValue;
            end
          else
            InputLithoMatrix[6,7]:=0;
        end
      else
        InputLithoMatrix[6,7]:=0;

//      InputLithoMatrix[7,8]:=1;

      for j:=1 to NoLithologies+1 do
        OutputLithoMatrix[j]:=0;

      Normalizer:=0;
      Depth_Value:=Charts[0].Series[0].YValue[i];
      try
        CalculateLithoValues;
//        SOLVINGEQU;
        for j:=1 to NoLithologies+1 do
          begin
//            if OutputLithoMatrix[j]>1 then OutputLithoMatrix[j]:=1;
            if OutputLithoMatrix[j]<0 then OutputLithoMatrix[j]:=0;
          end;
        for j:=1 to NoLithologies+1 do
          begin
            Normalizer:=Normalizer + OutputLithoMatrix[j];
          end;
        if Normalizer<>0 then
          for j:=1 to NoLithologies+1 do
            begin
              OutputLithoMatrix[j]:= OutputLithoMatrix[j] / Normalizer;
            end;
        Charts[Length(Charts)-6].Series[0].AddXY(RoundTo(OutputLithoMatrix[1],-4),Depth_Value);
        Charts[Length(Charts)-5].Series[0].AddXY(RoundTo(OutputLithoMatrix[2],-4),Depth_Value);
        Charts[Length(Charts)-4].Series[0].AddXY(RoundTo(OutputLithoMatrix[3],-4),Depth_Value);
        Charts[Length(Charts)-3].Series[0].AddXY(RoundTo(OutputLithoMatrix[4],-4),Depth_Value);
        Charts[Length(Charts)-2].Series[0].AddXY(RoundTo(OutputLithoMatrix[5],-4),Depth_Value);
        Charts[Length(Charts)-1].Series[0].AddXY(RoundTo(OutputLithoMatrix[6],-4),Depth_Value);
//        Charts[Length(Charts)-7].Series[0].AddXY(RoundTo(OutputLithoMatrix[7],-4),Depth_Value);
      except
        Charts[Length(Charts)-6].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        Charts[Length(Charts)-5].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        Charts[Length(Charts)-4].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        Charts[Length(Charts)-3].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        Charts[Length(Charts)-2].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
//        Charts[Length(Charts)-7].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
      end;
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
  Number_of_Charts:=Chart_Number;
end;

procedure TMainForm.CalculateLithoValues;
var
n,i,j,k:integer;
u:single;
begin
n:=NoLithologies+1;
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
{for i:=n downto 1 do
  begin
    OutputLithoMatrix[i]:=(InputLithoMatrix[i,n+1]/InputLithoMatrix[i,i]);
    for j:=n+1 downto i+1 do
      OutputLithoMatrix[i]:=((-InputLithoMatrix[i,j]*OutputLithoMatrix[j])/InputLithoMatrix[i,i])+OutputLithoMatrix[i];
  end;
}end;

procedure TMainForm.MultiMineral1Click(Sender: TObject);
var
i,j: integer;
Depth_Value, TempValue: Single;
LithoMatrix: array [1..6] of Byte;
FinalLithoMatrix: array [1..6] of Single;
ValueMatrix: array [1..6] of Single;
NoLithologies: Shortint;
PHIValue:Single;
begin
  Operation_Canceled:=False;
  Lithology_Multimin_Form:=TLithology_Multimin_Form.Create(Self);
  Lithology_Multimin_Form.MainFormNo:=1;
  with Lithology_Multimin_Form do
    begin
      ComboBox5.Visible:=False;
      ComboBox6.Visible:=False;
      Label5.Visible:=False;
      Label6.Visible:=False;
    end;
  Lithology_Multimin_Form.ShowModal;
  if Operation_Canceled then Exit;

  PHI_Track_Number:=NPHI_Track_Number;;
  PHI_Select_Form:=TPHI_Select_Form.Create(Self);
  PHI_Select_Form.MainFormNo:=1;
  PHI_Select_Form.ShowModal;
  PHI_Select_Form.Free;
  if Operation_Canceled then Exit;

  CreateRoot('Lithology Interpretation');
  Preparation('Lithology Interpretation', 'MULTI_SST.V/V');
  Preparation('Lithology Interpretation', 'MULTI_SHALE.V/V');
  Preparation('Lithology Interpretation', 'MULTI_LST.V/V');
  Preparation('Lithology Interpretation', 'MULTI_DOL.V/V');
  Preparation('Lithology Interpretation', 'MULTI_GYPSUM.V/V');
  Preparation('Lithology Interpretation', 'MULTI_ANHYDRITE.V/V');

  for i:=0 to LasFiles[0].NoRecords-1 do
    begin
      if PHI_Track_Number>=0 then
        begin
          TempValue:=Charts[PHI_Track_Number].Series[0].Xvalues[i];
          if (TempValue<>LASFiles[0].NullValue) then
            PHIValue:=TempValue
          else
            PHIValue:=0;
        end;

      if DT_Track_Number>=0 then
        begin
          TempValue:=Charts[DT_Track_Number].Series[0].XValue[i];
          if TempValue<>LASFiles[0].NullValue then
            begin
              TempValue:= (TempValue - (PHIValue * DT_FLD)) / (1 - PHIValue);
              ValueMatrix[1]:=TempValue;
            end
          else
            ValueMatrix[1]:=0;
        end
      else
        ValueMatrix[1]:=0;
      if RHO_Track_Number>=0 then
        begin
          TempValue:=Charts[RHO_Track_Number].Series[0].XValue[i];
          if TempValue<>LASFiles[0].NullValue then
            begin
              TempValue:= (TempValue - (PHIValue * RHO_FLD)) / (1 - PHIValue);
              ValueMatrix[2]:=TempValue;
            end
          else
            ValueMatrix[2]:=0;
        end
      else
        ValueMatrix[2]:=0;
      if GR_Track_Number>=0 then
        begin
          TempValue:=Charts[GR_Track_Number].Series[0].XValue[i];
          if TempValue<>LASFiles[0].NullValue then
            begin
              TempValue:= (TempValue - (PHIValue * GR_FLD)) / (1 - PHIValue);
              ValueMatrix[3]:=TempValue;
            end
          else
            ValueMatrix[3]:=0;
        end
      else
        ValueMatrix[3]:=0;
      if LLD_Track_Number>=0 then
        begin
          TempValue:=Charts[LLD_Track_Number].Series[0].XValue[i];
          if TempValue<>LASFiles[0].NullValue then
            begin
              TempValue:= (TempValue - (PHIValue * RES_FLD)) / (1 - PHIValue);
              ValueMatrix[4]:=TempValue;
            end
          else
            ValueMatrix[4]:=0;
        end
      else
        ValueMatrix[4]:=0;
      if NPHI_Track_Number>=0 then
        begin
          TempValue:=Charts[NPHI_Track_Number].Series[0].XValue[i];
          if TempValue<>LASFiles[0].NullValue then
            begin
              TempValue:= (TempValue - (PHIValue * NPHI_FLD)) / (1 - PHIValue);
              ValueMatrix[5]:=TempValue;
            end
          else
            ValueMatrix[5]:=0;
        end
      else
        ValueMatrix[5]:=0;
      if PEF_Track_Number>=0 then
        begin
          TempValue:=Charts[PEF_Track_Number].Series[0].XValue[i];
          if TempValue<>LASFiles[0].NullValue then
            begin
              TempValue:= (TempValue - (PHIValue * PEF_FLD)) / (1 - PHIValue);
              ValueMatrix[6]:=TempValue;
            end
          else
            ValueMatrix[6]:=0;
        end
      else
        ValueMatrix[6]:=0;

      for j:=1 to 6 do
        LithoMatrix[j]:=0;

//Sandstone
        if SST_Checked then
{DT}      if (ValueMatrix[1]>=DT_SST_MIN)and(ValueMatrix[1]<=DT_SST_MAX) then
{RHOB}      if (ValueMatrix[2]>=RHO_SST_MIN)and(ValueMatrix[2]<=RHO_SST_MAX) then
{GR}          if (ValueMatrix[3]>=GR_SST_MIN)and(ValueMatrix[3]<=GR_SST_MAX) then
//{RES}           if (ValueMatrix[4]>=RES_SST_MIN)and(ValueMatrix[4]<=RES_SST_MAX) then
//{NPHI}            if (ValueMatrix[5]>=NPHI_SST_MIN)and(ValueMatrix[5]<=NPHI_SST_MAX) then
{PEF}               if (ValueMatrix[6]>=PEF_SST_MIN)and(ValueMatrix[6]<=PEF_SST_MAX) then
                      LithoMatrix[1]:=1;
//Shale
        if SHL_Checked then
{DT}      if (ValueMatrix[1]>=DT_SHL_MIN)and(ValueMatrix[1]<=DT_SHL_MAX) then
{RHOB}      if (ValueMatrix[2]>=RHO_SHL_MIN)and(ValueMatrix[2]<=RHO_SHL_MAX) then
{GR}          if (ValueMatrix[3]>=GR_SHL_MIN)and(ValueMatrix[3]<=GR_SHL_MAX) then
//{RES}           if (ValueMatrix[4]>=RES_SHL_MIN)and(ValueMatrix[4]<=RES_SHL_MAX) then
//{NPHI}            if (ValueMatrix[5]>=NPHI_SHL_MIN)and(ValueMatrix[5]<=NPHI_SHL_MAX) then
{PEF}               if (ValueMatrix[6]>=PEF_SHL_MIN)and(ValueMatrix[6]<=PEF_SHL_MAX) then
                      LithoMatrix[2]:=1;

//Calcite
        if LST_Checked then
{DT}      if (ValueMatrix[1]>=DT_LST_MIN)and(ValueMatrix[1]<=DT_LST_MAX) then
{RHOB}      if (ValueMatrix[2]>=RHO_LST_MIN)and(ValueMatrix[2]<=RHO_LST_MAX) then
{GR}          if (ValueMatrix[3]>=GR_LST_MIN)and(ValueMatrix[3]<=GR_LST_MAX) then
//{RES}           if (ValueMatrix[4]>=RES_LST_MIN)and(ValueMatrix[4]<=RES_LST_MAX) then
//{NPHI}            if (ValueMatrix[5]>=NPHI_LST_MIN)and(ValueMatrix[5]<=NPHI_LST_MAX) then
{PEF}               if (ValueMatrix[6]>=PEF_LST_MIN)and(ValueMatrix[6]<=PEF_LST_MAX) then
                      LithoMatrix[3]:=1;

//Dolomite
        if DOL_Checked then
{DT}      if (ValueMatrix[1]>=DT_DOL_MIN)and(ValueMatrix[1]<=DT_DOL_MAX) then
{RHOB}      if (ValueMatrix[2]>=RHO_DOL_MIN)and(ValueMatrix[2]<=RHO_DOL_MAX) then
{GR}          if (ValueMatrix[3]>=GR_DOL_MIN)and(ValueMatrix[3]<=GR_DOL_MAX) then
//{RES}           if (ValueMatrix[4]>=RES_DOL_MIN)and(ValueMatrix[4]<=RES_DOL_MAX) then
//{NPHI}            if (ValueMatrix[5]>=NPHI_DOL_MIN)and(ValueMatrix[5]<=NPHI_DOL_MAX) then
{PEF}               if (ValueMatrix[6]>=PEF_DOL_MIN)and(ValueMatrix[6]<=PEF_DOL_MAX) then
                      LithoMatrix[4]:=1;

//Gypsum
        if GPS_Checked then
{DT}      if (ValueMatrix[1]>=DT_GPS_MIN)and(ValueMatrix[1]<=DT_GPS_MAX) then
{RHOB}      if (ValueMatrix[2]>=RHO_GPS_MIN)and(ValueMatrix[2]<=RHO_GPS_MAX) then
{GR}          if (ValueMatrix[3]>=GR_GPS_MIN)and(ValueMatrix[3]<=GR_GPS_MAX) then
//{RES}           if (ValueMatrix[4]>=RES_GPS_MIN)and(ValueMatrix[4]<=RES_GPS_MAX) then
//{NPHI}            if (ValueMatrix[5]>=NPHI_GPS_MIN)and(ValueMatrix[5]<=NPHI_GPS_MAX) then
{PEF}               if (ValueMatrix[6]>=PEF_GPS_MIN)and(ValueMatrix[6]<=PEF_GPS_MAX) then
                      LithoMatrix[5]:=1;

//Anhydrite
        if ANH_Checked then
{DT}      if (ValueMatrix[1]>=DT_ANH_MIN)and(ValueMatrix[1]<=DT_ANH_MAX) then
{RHOB}      if (ValueMatrix[2]>=RHO_ANH_MIN)and(ValueMatrix[2]<=RHO_ANH_MAX) then
{GR}          if (ValueMatrix[3]>=GR_ANH_MIN)and(ValueMatrix[3]<=GR_ANH_MAX) then
//{RES}           if (ValueMatrix[4]>=RES_ANH_MIN)and(ValueMatrix[4]<=RES_ANH_MAX) then
//{NPHI}            if (ValueMatrix[5]>=NPHI_ANH_MIN)and(ValueMatrix[5]<=NPHI_ANH_MAX) then
{PEF}               if (ValueMatrix[6]>=PEF_ANH_MIN)and(ValueMatrix[6]<=PEF_ANH_MAX) then
                      LithoMatrix[6]:=1;


///////////////////////////////////////////////////////
(*

//Sandstone
        if SST_Checked then
{DT}      if (ValueMatrix[1]>=40)and(ValueMatrix[1]<=70) then
{RHOB}      if (ValueMatrix[2]>=2.4)and(ValueMatrix[2]<=2.8) then
{GR}          if (ValueMatrix[3]>=0)and(ValueMatrix[3]<=60) then
//{RES}           if (ValueMatrix[4]>=500)and(ValueMatrix[4]<=1000000) then
//{NPHI}            if (ValueMatrix[5]>=-3)and(ValueMatrix[5]<=0) then
{PEF}               if (ValueMatrix[6]>=1.5)and(ValueMatrix[6]<=2.1) then
                      LithoMatrix[1]:=1;

//Shale
        if SHL_Checked then
{DT}      if (ValueMatrix[1]>=80)and(ValueMatrix[1]<=150) then
{RHOB}      if (ValueMatrix[2]>=2.25)and(ValueMatrix[2]<=2.65) then
{GR}          if (ValueMatrix[3]>=80)and(ValueMatrix[3]<=1000) then
//{RES}           if (ValueMatrix[4]>=0)and(ValueMatrix[4]<=200) then
//{NPHI}            if (ValueMatrix[5]>=10)and(ValueMatrix[5]<=50) then
{PEF}               if (ValueMatrix[6]>=3.1)and(ValueMatrix[6]<=3.8) then
                      LithoMatrix[2]:=1;

//Calcite
        if LST_Checked then
{DT}      if (ValueMatrix[1]>=35)and(ValueMatrix[1]<=65) then
{RHOB}      if (ValueMatrix[2]>=2.55)and(ValueMatrix[2]<=2.85) then
{GR}          if (ValueMatrix[3]>=0)and(ValueMatrix[3]<=30) then
//{RES}           if (ValueMatrix[4]>=500)and(ValueMatrix[4]<=1000000) then
//{NPHI}            if (ValueMatrix[5]>=-1)and(ValueMatrix[5]<=1) then
{PEF}               if (ValueMatrix[6]>=4.8)and(ValueMatrix[6]<=5.4) then
                      LithoMatrix[3]:=1;

//Dolomite
        if DOL_Checked then
{DT}      if (ValueMatrix[1]>=30)and(ValueMatrix[1]<=60) then
{RHOB}      if (ValueMatrix[2]>=2.55)and(ValueMatrix[2]<=2.85) then
{GR}          if (ValueMatrix[3]>=0)and(ValueMatrix[3]<=30) then
//{RES}           if (ValueMatrix[4]>=500)and(ValueMatrix[4]<=1000000) then
//{NPHI}            if (ValueMatrix[5]>=0)and(ValueMatrix[5]<=5) then
{PEF}               if (ValueMatrix[6]>=2.8)and(ValueMatrix[6]<=3.4) then
                      LithoMatrix[4]:=1;

//Gypsum
        if GPS_Checked then
{DT}      if (ValueMatrix[1]>=40)and(ValueMatrix[1]<=70) then
{RHOB}      if (ValueMatrix[2]>=2.2)and(ValueMatrix[2]<=2.5) then
{GR}          if (ValueMatrix[3]>=0)and(ValueMatrix[3]<=30) then
//{RES}           if (ValueMatrix[4]>=500)and(ValueMatrix[4]<=1000000) then
//{NPHI}            if (ValueMatrix[5]>=30)and(ValueMatrix[5]<=80) then
{PEF}               if (ValueMatrix[6]>=3.7)and(ValueMatrix[6]<=4.3) then
                      LithoMatrix[5]:=1;

//Anhydrite
        if ANH_Checked then
{DT}      if (ValueMatrix[1]>=35)and(ValueMatrix[1]<=65) then
{RHOB}      if (ValueMatrix[2]>=2.85)and(ValueMatrix[2]<=3.15) then
{GR}          if (ValueMatrix[3]>=0)and(ValueMatrix[3]<=30) then
//{RES}           if (ValueMatrix[4]>=500)and(ValueMatrix[4]<=1000000) then
//{NPHI}            if (ValueMatrix[5]>=-2)and(ValueMatrix[5]<=0) then
{PEF}               if (ValueMatrix[6]>=4.8)and(ValueMatrix[6]<=5.4) then
                      LithoMatrix[6]:=1;

/////////////////////////////////////////////////////////////////////
*)
      NoLithologies:=0;
      for j:=1 to 6 do
        NoLithologies:=NoLithologies + LithoMatrix[j];

      if NoLithologies>0 then
        for j:=1 to 6 do
          FinalLithoMatrix[j]:= LithoMatrix[j] / NoLithologies;


      Depth_Value:=Charts[0].Series[0].YValue[i];
      try
        Charts[Length(Charts)-6].Series[0].AddXY(RoundTo(FinalLithoMatrix[1],-4),Depth_Value);
        Charts[Length(Charts)-5].Series[0].AddXY(RoundTo(FinalLithoMatrix[2],-4),Depth_Value);
        Charts[Length(Charts)-4].Series[0].AddXY(RoundTo(FinalLithoMatrix[3],-4),Depth_Value);
        Charts[Length(Charts)-3].Series[0].AddXY(RoundTo(FinalLithoMatrix[4],-4),Depth_Value);
        Charts[Length(Charts)-2].Series[0].AddXY(RoundTo(FinalLithoMatrix[5],-4),Depth_Value);
        Charts[Length(Charts)-1].Series[0].AddXY(RoundTo(FinalLithoMatrix[6],-4),Depth_Value);
      except
        Charts[Length(Charts)-6].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        Charts[Length(Charts)-5].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        Charts[Length(Charts)-4].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        Charts[Length(Charts)-3].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        Charts[Length(Charts)-2].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
        Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
      end;
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
  Number_of_Charts:=Chart_Number;
end;

procedure TMainForm.DualCompositional1Click(Sender: TObject);
var
i,j: integer;
Depth_Value, TempValue, LogValue, PHIValue: Single;
RHO_V_Values, PEF_V_Values, DT_V_Values, GR_V_Values: array of array of Single;
RHO_f_Values, RHO_C_Values : array [1..6] of single;
PEF_f_Values, PEF_C_Values : array [1..6] of single;
DT_f_Values, DT_C_Values : array [1..6] of single;
GR_f_Values, GR_C_Values: array [1..6] of single;
SST_TOTAL, SHL_TOTAL, LST_TOTAL, DOL_TOTAL, GPS_TOTAL, ANH_TOTAL : array [1..5] of single;
SST_WV, SHL_WV, LST_WV, DOL_WV, GPS_WV, ANH_WV : Single;
SST_P_Values,SHL_P_Values,LST_P_Values,DOL_P_Values,GPS_P_Values,ANH_P_Values:array [1..4] of single;
Normalizer:Single;
C_Max_Values: array [1..6] of Single;
//NPHI_f_Values, NPHI_C_Values, NPHI_V_Values: array [1..6] of single;
const
 Alpha = 1;
begin
  Operation_Canceled:=False;

  Litho_Dual_Form:=TLitho_Dual_Form.Create(Self);
  Litho_Dual_Form.MainFormNo:=1;
  Litho_Dual_Form.ShowModal;
  for i:=1 to 6 do
    C_Max_Values[i]:=Litho_Dual_Form.CValues[i];
  if Operation_Canceled then Exit;

  PHI_Track_Number:=NPHI_Track_Number;
  PHI_Select_Form:=TPHI_Select_Form.Create(Self);
  PHI_Select_Form.MainFormNo:=1;
  PHI_Select_Form.ShowModal;
  PHI_Select_Form.Free;
  if Operation_Canceled then Exit;

  CreateRoot('Lithology Interpretation');
(*
   if DT_Track_Number<>-1 then
     begin
//        if Litho_SST_Checked then
          Preparation('Lithology Interpretation', 'DUAL_DT_SST.V/V');
//        if Litho_SHL_Checked then
          Preparation('Lithology Interpretation', 'DUAL_DT_SHALE.V/V');
//        if Litho_LST_Checked then
          Preparation('Lithology Interpretation', 'DUAL_DT_LST.V/V');
//        if Litho_DOL_Checked then
          Preparation('Lithology Interpretation', 'DUAL_DT_DOL.V/V');
//        if Litho_GPS_Checked then
          Preparation('Lithology Interpretation', 'DUAL_DT_GYPSUM.V/V');
//        if Litho_ANH_Checked then
          Preparation('Lithology Interpretation', 'DUAL_DT_ANHYDRITE.V/V');
      end;

   if RHO_Track_Number<>-1 then
     begin
//        if Litho_SST_Checked then
          Preparation('Lithology Interpretation', 'DUAL_RHO_SST.V/V');
//        if Litho_SHL_Checked then
          Preparation('Lithology Interpretation', 'DUAL_RHO_SHALE.V/V');
//        if Litho_LST_Checked then
          Preparation('Lithology Interpretation', 'DUAL_RHO_LST.V/V');
//        if Litho_DOL_Checked then
          Preparation('Lithology Interpretation', 'DUAL_RHO_DOL.V/V');
//        if Litho_GPS_Checked then
          Preparation('Lithology Interpretation', 'DUAL_RHO_GYPSUM.V/V');
//        if Litho_ANH_Checked then
          Preparation('Lithology Interpretation', 'DUAL_RHO_ANHYDRITE.V/V');
     end;

   if GR_Track_Number<>-1 then
     begin
//        if Litho_SST_Checked then
          Preparation('Lithology Interpretation', 'DUAL_GR_SST.V/V');
//        if Litho_SHL_Checked then
          Preparation('Lithology Interpretation', 'DUAL_GR_SHALE.V/V');
//        if Litho_LST_Checked then
          Preparation('Lithology Interpretation', 'DUAL_GR_LST.V/V');
//        if Litho_DOL_Checked then
          Preparation('Lithology Interpretation', 'DUAL_GR_DOL.V/V');
//        if Litho_GPS_Checked then
          Preparation('Lithology Interpretation', 'DUAL_GR_GYPSUM.V/V');
//        if Litho_ANH_Checked then
          Preparation('Lithology Interpretation', 'DUAL_GR_ANHYDRITE.V/V');
     end;

   if PEF_Track_Number<>-1 then
     begin
//        if Litho_SST_Checked then
          Preparation('Lithology Interpretation', 'DUAL_PEF_SST.V/V');
//        if Litho_SHL_Checked then
          Preparation('Lithology Interpretation', 'DUAL_PEF_SHALE.V/V');
//        if Litho_LST_Checked then
          Preparation('Lithology Interpretation', 'DUAL_PEF_LST.V/V');
//        if Litho_DOL_Checked then
          Preparation('Lithology Interpretation', 'DUAL_PEF_DOL.V/V');
//        if Litho_GPS_Checked then
          Preparation('Lithology Interpretation', 'DUAL_PEF_GYPSUM.V/V');
//        if Litho_ANH_Checked then
          Preparation('Lithology Interpretation', 'DUAL_PEF_ANHYDRITE.V/V');
     end;

{   if NPHI_Track_Number<>-1 then
     begin
          Preparation('Lithology Interpretation', 'DUAL_NPHI_SST.V/V');
          Preparation('Lithology Interpretation', 'DUAL_NPHI_SHALE.V/V');
          Preparation('Lithology Interpretation', 'DUAL_NPHI_LST.V/V');
          Preparation('Lithology Interpretation', 'DUAL_NPHI_DOL.V/V');
          Preparation('Lithology Interpretation', 'DUAL_NPHI_GYPSUM.V/V');
          Preparation('Lithology Interpretation', 'DUAL_NPHI_ANHYDRITE.V/V');
     end;           }    *)
  PHIValue:=0;
  for i:=1 to 5 do
    begin
      SST_TOTAL[i]:=0;
      SHL_TOTAL[i]:=0;
      LST_TOTAL[i]:=0;
      DOL_TOTAL[i]:=0;
      GPS_TOTAL[i]:=0;
      ANH_TOTAL[i]:=0;
    end;

  SetLength(DT_V_Values, LasFiles[0].NoRecords+1, 7);
  SetLength(RHO_V_Values, LasFiles[0].NoRecords+1, 7);
  SetLength(GR_V_Values, LasFiles[0].NoRecords+1, 7);
  SetLength(PEF_V_Values, LasFiles[0].NoRecords+1, 7);

  for i:=0 to LasFiles[0].NoRecords-1 do
    begin
      if PHI_Track_Number>=0 then
        begin
          TempValue:=Charts[PHI_Track_Number].Series[0].XValue[i];
          if TempValue<>LASFiles[0].NullValue then
            PHIValue:=TempValue
          else
            PHIValue:=0;
        end;
      Depth_Value:=Charts[0].Series[0].YValue[i];

/////////////////  Lithology identification by DT log  ///////////////////////////
      if DT_Track_Number>=0 then
        begin

          TempValue:=Charts[DT_Track_Number].Series[0].XValue[i];
          if TempValue<>LASFiles[0].NullValue then
            LogValue:=TempValue
          else
            LogValue:=0;

          LogValue:= (LogValue - (PHIValue * RHO_FLD)) / (1 - PHIValue);

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

          if DOL_Checked then
            if LogValue>=DT_DOL then
              DT_f_Values[4]:=Power((LogValue - DT_DOL)/(DT_DOL_MAX - DT_DOL), Alpha)
            else
              DT_f_Values[4]:=Power((DT_DOL - LogValue)/(DT_DOL - DT_DOL_MIN), Alpha)
          else
            DT_f_Values[4]:=1;

          if GPS_Checked then
            if LogValue>=DT_GPS then
              DT_f_Values[5]:=Power((LogValue - DT_GPS)/(DT_GPS_MAX - DT_GPS), Alpha)
            else
              DT_f_Values[5]:=Power((DT_GPS - LogValue)/(DT_GPS - DT_GPS_MIN), Alpha)
          else
            DT_f_Values[5]:=1;

          if ANH_Checked then
            if LogValue>=DT_ANH then
              DT_f_Values[6]:=Power((LogValue - DT_ANH)/(DT_ANH_MAX - DT_ANH), Alpha)
            else
              DT_f_Values[6]:=Power((DT_ANH - LogValue)/(DT_ANH - DT_ANH_MIN), Alpha)
          else
            DT_f_Values[6]:=1;

          for j:=1 to 6 do
            if DT_f_Values[j]>1 then
              DT_f_Values[j]:=1;

          for j:=1 to 6 do
            DT_C_Values[j]:= C_Max_Values[j] * (1 - DT_f_Values[j]);

          TempValue:=0;
          for j:=1 to 6 do
            TempValue:= TempValue + DT_C_Values[j];
          if TempValue<>0 then
            for j:=1 to 6 do
              DT_V_Values[i,j]:= DT_C_Values[j] / TempValue
          else
            for j:=1 to 6 do
              DT_V_Values[i,j]:= 0;

          SST_TOTAL[1]:= SST_TOTAL[1] + DT_V_Values[i,1];
          SST_TOTAL[5]:= SST_TOTAL[5] + DT_V_Values[i,1];
          SHL_TOTAL[1]:= SHL_TOTAL[1] + DT_V_Values[i,2];
          SHL_TOTAL[5]:= SHL_TOTAL[5] + DT_V_Values[i,2];
          LST_TOTAL[1]:= LST_TOTAL[1] + DT_V_Values[i,3];
          LST_TOTAL[5]:= LST_TOTAL[5] + DT_V_Values[i,3];
          DOL_TOTAL[1]:= DOL_TOTAL[1] + DT_V_Values[i,4];
          DOL_TOTAL[5]:= DOL_TOTAL[5] + DT_V_Values[i,4];
          GPS_TOTAL[1]:= GPS_TOTAL[1] + DT_V_Values[i,5];
          GPS_TOTAL[5]:= GPS_TOTAL[5] + DT_V_Values[i,5];
          ANH_TOTAL[1]:= ANH_TOTAL[1] + DT_V_Values[i,6];
          ANH_TOTAL[5]:= ANH_TOTAL[5] + DT_V_Values[i,6];
{         try
            Charts[Length(Charts)-24].Series[0].AddXY(RoundTo(DT_V_Values[i,1],-4),Depth_Value);
            Charts[Length(Charts)-23].Series[0].AddXY(RoundTo(DT_V_Values[i,2],-4),Depth_Value);
            Charts[Length(Charts)-22].Series[0].AddXY(RoundTo(DT_V_Values[i,3],-4),Depth_Value);
            Charts[Length(Charts)-21].Series[0].AddXY(RoundTo(DT_V_Values[i,4],-4),Depth_Value);
            Charts[Length(Charts)-20].Series[0].AddXY(RoundTo(DT_V_Values[i,5],-4),Depth_Value);
            Charts[Length(Charts)-19].Series[0].AddXY(RoundTo(DT_V_Values[i,6],-4),Depth_Value);
//            Charts[Length(Charts)-7].Series[0].AddXY(RoundTo(DT_V_Values[i,7],-4),Depth_Value);
          except
            Charts[Length(Charts)-24].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-23].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-22].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-21].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-20].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-19].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
//            Charts[Length(Charts)-7].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
          end;}
        end;

/////////////////  Lithology identification by Density log  ///////////////////////////
      if RHO_Track_Number>=0 then
        begin

          TempValue:=Charts[RHO_Track_Number].Series[0].XValue[i];
          if TempValue<>LASFiles[0].NullValue then
            LogValue:=TempValue
          else
            LogValue:=0;

          LogValue:= (LogValue - (PHIValue * RHO_FLD)) / (1 - PHIValue);

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

          if DOL_Checked then
            if LogValue>=RHO_DOL then
              RHO_f_Values[4]:=Power((LogValue - RHO_DOL)/(RHO_DOL_MAX - RHO_DOL), Alpha)
            else
              RHO_f_Values[4]:=Power((RHO_DOL - LogValue)/(RHO_DOL - RHO_DOL_MIN), Alpha)
          else
            RHO_f_Values[4]:=1;

          if GPS_Checked then
            if LogValue>=RHO_GPS then
              RHO_f_Values[5]:=Power((LogValue - RHO_GPS)/(RHO_GPS_MAX - RHO_GPS), Alpha)
            else
              RHO_f_Values[5]:=Power((RHO_GPS - LogValue)/(RHO_GPS - RHO_GPS_MIN), Alpha)
          else
            RHO_f_Values[5]:=1;

          if ANH_Checked then
            if LogValue>=RHO_ANH then
              RHO_f_Values[6]:=Power((LogValue - RHO_ANH)/(RHO_ANH_MAX - RHO_ANH), Alpha)
            else
              RHO_f_Values[6]:=Power((RHO_ANH - LogValue)/(RHO_ANH - RHO_ANH_MIN), Alpha)
          else
            RHO_f_Values[6]:=1;

          for j:=1 to 6 do
            if RHO_f_Values[j]>1 then
              RHO_f_Values[j]:=1;

          for j:=1 to 6 do
            RHO_C_Values[j]:=  C_Max_Values[j] * (1 - RHO_f_Values[j]);

          TempValue:=0;
          for j:=1 to 6 do
            TempValue:= TempValue + RHO_C_Values[j];
          if TempValue<>0 then
            for j:=1 to 6 do
              RHO_V_Values[i,j]:= RHO_C_Values[j] / TempValue
          else
            for j:=1 to 6 do
              RHO_V_Values[i,j]:=0;

          SST_TOTAL[2]:= SST_TOTAL[2] + RHO_V_Values[i,1];
          SST_TOTAL[5]:= SST_TOTAL[5] + RHO_V_Values[i,1];
          SHL_TOTAL[2]:= SHL_TOTAL[2] + RHO_V_Values[i,2];
          SHL_TOTAL[5]:= SHL_TOTAL[5] + RHO_V_Values[i,2];
          LST_TOTAL[2]:= LST_TOTAL[2] + RHO_V_Values[i,3];
          LST_TOTAL[5]:= LST_TOTAL[5] + RHO_V_Values[i,3];
          DOL_TOTAL[2]:= DOL_TOTAL[2] + RHO_V_Values[i,4];
          DOL_TOTAL[5]:= DOL_TOTAL[5] + RHO_V_Values[i,4];
          GPS_TOTAL[2]:= GPS_TOTAL[2] + RHO_V_Values[i,5];
          GPS_TOTAL[5]:= GPS_TOTAL[5] + RHO_V_Values[i,5];
          ANH_TOTAL[2]:= ANH_TOTAL[2] + RHO_V_Values[i,6];
          ANH_TOTAL[5]:= ANH_TOTAL[5] + RHO_V_Values[i,6];
{         try
            Charts[Length(Charts)-18].Series[0].AddXY(RoundTo(RHO_V_Values[i,1],-4),Depth_Value);
            Charts[Length(Charts)-17].Series[0].AddXY(RoundTo(RHO_V_Values[i,2],-4),Depth_Value);
            Charts[Length(Charts)-16].Series[0].AddXY(RoundTo(RHO_V_Values[i,3],-4),Depth_Value);
            Charts[Length(Charts)-15].Series[0].AddXY(RoundTo(RHO_V_Values[i,4],-4),Depth_Value);
            Charts[Length(Charts)-14].Series[0].AddXY(RoundTo(RHO_V_Values[i,5],-4),Depth_Value);
            Charts[Length(Charts)-13].Series[0].AddXY(RoundTo(RHO_V_Values[i,6],-4),Depth_Value);
//            Charts[Length(Charts)-7].Series[0].AddXY(RoundTo(RHO_V_Values[i,7],-4),Depth_Value);
          except
            Charts[Length(Charts)-18].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-17].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-16].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-15].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-14].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-13].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
//            Charts[Length(Charts)-7].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
          end;}
        end;

/////////////////  Lithology identification by GR log  ///////////////////////////
      if GR_Track_Number>=0 then
        begin

          TempValue:=Charts[GR_Track_Number].Series[0].XValue[i];
          if TempValue<>LASFiles[0].NullValue then
            LogValue:=TempValue
          else
            LogValue:=0;

          LogValue:= (LogValue - (PHIValue * RHO_FLD)) / (1 - PHIValue);

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

          if DOL_Checked then
            if LogValue>=GR_DOL then
              GR_f_Values[4]:=Power((LogValue - GR_DOL)/(GR_DOL_MAX - GR_DOL), Alpha)
            else
              GR_f_Values[4]:=Power((GR_DOL - LogValue)/(GR_DOL - GR_DOL_MIN), Alpha)
          else
            GR_f_Values[4]:=1;

          if GPS_Checked then
            if LogValue>=GR_GPS then
              GR_f_Values[5]:=Power((LogValue - GR_GPS)/(GR_GPS_MAX - GR_GPS), Alpha)
            else
              GR_f_Values[5]:=Power((GR_GPS - LogValue)/(GR_GPS - GR_GPS_MIN), Alpha)
          else
            GR_f_Values[5]:=1;

          if ANH_Checked then
            if LogValue>=GR_ANH then
              GR_f_Values[6]:=Power((LogValue - GR_ANH)/(GR_ANH_MAX - GR_ANH), Alpha)
            else
              GR_f_Values[6]:=Power((GR_ANH - LogValue)/(GR_ANH - GR_ANH_MIN), Alpha)
          else
            GR_f_Values[6]:=1;

          for j:=1 to 6 do
            if GR_f_Values[j]>1 then
              GR_f_Values[j]:=1;

          for j:=1 to 6 do
            GR_C_Values[j]:=  C_Max_Values[j] * (1 - GR_f_Values[j]);

          TempValue:=0;
          for j:=1 to 6 do
            TempValue:= TempValue + GR_C_Values[j];
          if TempValue<>0 then
            for j:=1 to 6 do
              GR_V_Values[i,j]:= GR_C_Values[j] / TempValue
          else
            for j:=1 to 6 do
              GR_V_Values[i,j]:= 0;

          SST_TOTAL[3]:= SST_TOTAL[3] + GR_V_Values[i,1];
          SST_TOTAL[5]:= SST_TOTAL[5] + GR_V_Values[i,1];
          SHL_TOTAL[3]:= SHL_TOTAL[3] + GR_V_Values[i,2];
          SHL_TOTAL[5]:= SHL_TOTAL[5] + GR_V_Values[i,2];
          LST_TOTAL[3]:= LST_TOTAL[3] + GR_V_Values[i,3];
          LST_TOTAL[5]:= LST_TOTAL[5] + GR_V_Values[i,3];
          DOL_TOTAL[3]:= DOL_TOTAL[3] + GR_V_Values[i,4];
          DOL_TOTAL[5]:= DOL_TOTAL[5] + GR_V_Values[i,4];
          GPS_TOTAL[3]:= GPS_TOTAL[3] + GR_V_Values[i,5];
          GPS_TOTAL[5]:= GPS_TOTAL[5] + GR_V_Values[i,5];
          ANH_TOTAL[3]:= ANH_TOTAL[3] + GR_V_Values[i,6];
          ANH_TOTAL[5]:= ANH_TOTAL[5] + GR_V_Values[i,6];
{         try
            Charts[Length(Charts)-12].Series[0].AddXY(RoundTo(GR_V_Values[i,1],-4),Depth_Value);
            Charts[Length(Charts)-11].Series[0].AddXY(RoundTo(GR_V_Values[i,2],-4),Depth_Value);
            Charts[Length(Charts)-10].Series[0].AddXY(RoundTo(GR_V_Values[i,3],-4),Depth_Value);
            Charts[Length(Charts)-9].Series[0].AddXY(RoundTo(GR_V_Values[i,4],-4),Depth_Value);
            Charts[Length(Charts)-8].Series[0].AddXY(RoundTo(GR_V_Values[i,5],-4),Depth_Value);
            Charts[Length(Charts)-7].Series[0].AddXY(RoundTo(GR_V_Values[i,6],-4),Depth_Value);
//            Charts[Length(Charts)-7].Series[0].AddXY(RoundTo(GR_V_Values[i,7],-4),Depth_Value);
          except
            Charts[Length(Charts)-12].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-11].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-10].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-9].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-8].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-7].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
//            Charts[Length(Charts)-7].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
          end;}
        end;

/////////////////  Lithology identification by PEF log  ///////////////////////////
      if PEF_Track_Number>=0 then
        begin

          TempValue:=Charts[PEF_Track_Number].Series[0].XValue[i];
          if TempValue<>LASFiles[0].NullValue then
            LogValue:=TempValue
          else
            LogValue:=0;

          LogValue:= (LogValue - (PHIValue * RHO_FLD)) / (1 - PHIValue);

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

          if DOL_Checked then
            if LogValue>=PEF_DOL then
              PEF_f_Values[4]:=Power((LogValue - PEF_DOL)/(PEF_DOL_MAX - PEF_DOL), Alpha)
            else
              PEF_f_Values[4]:=Power((PEF_DOL - LogValue)/(PEF_DOL - PEF_DOL_MIN), Alpha)
          else
            PEF_f_Values[4]:=1;

          if GPS_Checked then
            if LogValue>=PEF_GPS then
              PEF_f_Values[5]:=Power((LogValue - PEF_GPS)/(PEF_GPS_MAX - PEF_GPS), Alpha)
            else
              PEF_f_Values[5]:=Power((PEF_GPS - LogValue)/(PEF_GPS - PEF_GPS_MIN), Alpha)
          else
            PEF_f_Values[5]:=1;

          if ANH_Checked then
            if LogValue>=PEF_ANH then
              PEF_f_Values[6]:=Power((LogValue - PEF_ANH)/(PEF_ANH_MAX - PEF_ANH), Alpha)
            else
              PEF_f_Values[6]:=Power((PEF_ANH - LogValue)/(PEF_ANH - PEF_ANH_MIN), Alpha)
          else
            PEF_f_Values[6]:=1;

          for j:=1 to 6 do
            if PEF_f_Values[j]>1 then
              PEF_f_Values[j]:=1;

          for j:=1 to 6 do
            PEF_C_Values[j]:=  C_Max_Values[j] * (1 - PEF_f_Values[j]);

          TempValue:=0;
          for j:=1 to 6 do
            TempValue:= TempValue + PEF_C_Values[j];
          if TempValue<>0 then
            for j:=1 to 6 do
              PEF_V_Values[i,j]:= PEF_C_Values[j] / TempValue
          else
            for j:=1 to 6 do
              PEF_V_Values[i,j]:= 0;

          SST_TOTAL[4]:= SST_TOTAL[4] + PEF_V_Values[i,1];
          SST_TOTAL[5]:= SST_TOTAL[5] + PEF_V_Values[i,1];
          SHL_TOTAL[4]:= SHL_TOTAL[4] + PEF_V_Values[i,2];
          SHL_TOTAL[5]:= SHL_TOTAL[5] + PEF_V_Values[i,2];
          LST_TOTAL[4]:= LST_TOTAL[4] + PEF_V_Values[i,3];
          LST_TOTAL[5]:= LST_TOTAL[5] + PEF_V_Values[i,3];
          DOL_TOTAL[4]:= DOL_TOTAL[4] + PEF_V_Values[i,4];
          DOL_TOTAL[5]:= DOL_TOTAL[5] + PEF_V_Values[i,4];
          GPS_TOTAL[4]:= GPS_TOTAL[4] + PEF_V_Values[i,5];
          GPS_TOTAL[5]:= GPS_TOTAL[5] + PEF_V_Values[i,5];
          ANH_TOTAL[4]:= ANH_TOTAL[4] + PEF_V_Values[i,6];
          ANH_TOTAL[5]:= ANH_TOTAL[5] + PEF_V_Values[i,6];
{         try
            Charts[Length(Charts)-6].Series[0].AddXY(RoundTo(PEF_V_Values[i,1],-4),Depth_Value);
            Charts[Length(Charts)-5].Series[0].AddXY(RoundTo(PEF_V_Values[i,2],-4),Depth_Value);
            Charts[Length(Charts)-4].Series[0].AddXY(RoundTo(PEF_V_Values[i,3],-4),Depth_Value);
            Charts[Length(Charts)-3].Series[0].AddXY(RoundTo(PEF_V_Values[i,4],-4),Depth_Value);
            Charts[Length(Charts)-2].Series[0].AddXY(RoundTo(PEF_V_Values[i,5],-4),Depth_Value);
            Charts[Length(Charts)-1].Series[0].AddXY(RoundTo(PEF_V_Values[i,6],-4),Depth_Value);
//            Charts[Length(Charts)-7].Series[0].AddXY(RoundTo(PEF_V_Values[i,7],-4),Depth_Value);
          except
            Charts[Length(Charts)-6].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-5].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-4].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-3].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-2].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
//            Charts[Length(Charts)-7].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
          end;}
        end;

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
      if (DOL_Checked)and(DOL_TOTAL[5]<>0) then
        DOL_P_Values[i]:= DOL_TOTAL[i] / DOL_TOTAL[5]
      else
        DOL_P_Values[i]:=0;
      if (GPS_Checked)and(GPS_TOTAL[5]<>0) then
        GPS_P_Values[i]:= GPS_TOTAL[i] / GPS_TOTAL[5]
      else
        GPS_P_Values[i]:=0;
      if (ANH_Checked)and(ANH_TOTAL[5]<>0) then
        ANH_P_Values[i]:= ANH_TOTAL[i] / ANH_TOTAL[5]
      else
        ANH_P_Values[i]:=0;
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
    TempValue:= TempValue + DOL_P_Values[i];
  if TempValue<>0 then
    for i:=1 to 4 do
      DOL_P_Values[i]:= DOL_P_Values[i] / TempValue;

  TempValue:=0;
  for i:=1 to 4 do
    TempValue:= TempValue + GPS_P_Values[i];
  if TempValue<>0 then
    for i:=1 to 4 do
      GPS_P_Values[i]:= GPS_P_Values[i] / TempValue;

  TempValue:=0;
  for i:=1 to 4 do
    TempValue:= TempValue + ANH_P_Values[i];
  if TempValue<>0 then
    for i:=1 to 4 do
      ANH_P_Values[i]:= ANH_P_Values[i] / TempValue;

//        if SST_Checked then
          Preparation('Lithology Interpretation', 'DUAL_SST.V/V');
//        if SHL_Checked then
          Preparation('Lithology Interpretation', 'DUAL_SHALE.V/V');
//        if LST_Checked then
          Preparation('Lithology Interpretation', 'DUAL_LST.V/V');
//        if DOL_Checked then
          Preparation('Lithology Interpretation', 'DUAL_DOL.V/V');
//        if GPS_Checked then
          Preparation('Lithology Interpretation', 'DUAL_GYPSUM.V/V');
//        if ANH_Checked then
          Preparation('Lithology Interpretation', 'DUAL_ANHYDRITE.V/V');

  for i:=0 to LasFiles[0].NoRecords-1 do
    begin

      Depth_Value:=Charts[0].Series[0].YValue[i];

      SST_WV:= DT_V_Values[i,1] * SST_P_Values[1] + RHO_V_Values[i,1] * SST_P_Values[2] +
               GR_V_Values[i,1] * SST_P_Values[3] + PEF_V_Values[i,1] * SST_P_Values[4];
      SHL_WV:= DT_V_Values[i,2] * SHL_P_Values[1] + RHO_V_Values[i,2] * SHL_P_Values[2] +
               GR_V_Values[i,2] * SHL_P_Values[3] + PEF_V_Values[i,2] * SHL_P_Values[4];
      LST_WV:= DT_V_Values[i,3] * LST_P_Values[1] + RHO_V_Values[i,3] * LST_P_Values[2] +
               GR_V_Values[i,3] * LST_P_Values[3] + PEF_V_Values[i,3] * LST_P_Values[4];
      DOL_WV:= DT_V_Values[i,4] * DOL_P_Values[1] + RHO_V_Values[i,4] * DOL_P_Values[2] +
               GR_V_Values[i,4] * DOL_P_Values[3] + PEF_V_Values[i,4] * DOL_P_Values[4];
      GPS_WV:= DT_V_Values[i,5] * GPS_P_Values[1] + RHO_V_Values[i,5] * GPS_P_Values[2] +
               GR_V_Values[i,5] * GPS_P_Values[3] + PEF_V_Values[i,5] * GPS_P_Values[4];
      ANH_WV:= DT_V_Values[i,6] * ANH_P_Values[1] + RHO_V_Values[i,6] * ANH_P_Values[2] +
               GR_V_Values[i,6] * ANH_P_Values[3] + PEF_V_Values[i,6] * ANH_P_Values[4];

      if (SST_WV+LST_WV+DOL_WV+GPS_WV+ANH_WV)<>0 then
        begin
          Normalizer:= (1 - SHL_WV) / (SST_WV+LST_WV+DOL_WV+GPS_WV+ANH_WV);
          SST_WV:= SST_WV * Normalizer;
          LST_WV:= LST_WV * Normalizer;
          DOL_WV:= DOL_WV * Normalizer;
          GPS_WV:= GPS_WV * Normalizer;
          ANH_WV:= ANH_WV * Normalizer;
        end;

          try
            Charts[Length(Charts)-6].Series[0].AddXY(RoundTo(SST_WV,-4),Depth_Value);
            Charts[Length(Charts)-5].Series[0].AddXY(RoundTo(SHL_WV,-4),Depth_Value);
            Charts[Length(Charts)-4].Series[0].AddXY(RoundTo(LST_WV,-4),Depth_Value);
            Charts[Length(Charts)-3].Series[0].AddXY(RoundTo(DOL_WV,-4),Depth_Value);
            Charts[Length(Charts)-2].Series[0].AddXY(RoundTo(GPS_WV,-4),Depth_Value);
            Charts[Length(Charts)-1].Series[0].AddXY(RoundTo(ANH_WV,-4),Depth_Value);
          except
            Charts[Length(Charts)-6].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-5].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-4].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-3].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-2].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
            Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue,Depth_Value);
          end;
      with Litho_Dual_Form do
        begin
          DT_Track_Number:=ComboBox1.ItemIndex;
          RHO_Track_Number:=ComboBox2.ItemIndex;
          GR_Track_Number:=ComboBox3.ItemIndex;
          PEF_Track_Number:=ComboBox4.ItemIndex;
        end;
    end;

  Litho_Dual_Form.Free;
  Number_of_Charts:=Chart_Number;
end;

procedure TMainForm.ToolButton15Click(Sender: TObject);
var
i:integer;
begin
  if MoveTracks1.Checked then
    begin
      for i:=0 to Number_of_Charts-1 do
        Charts[i].DragMode:=dmManual;

      MoveTracks1.Checked:=False;
      ToolButton15.Down:=False;
    end
  else
    begin
      for i:=0 to Number_of_Charts-1 do
        Charts[i].DragMode:=dmAutomatic;
      MoveTracks1.Checked:=True;
      ToolButton15.Down:=True;
    end;
end;

procedure TMainForm.MoveTracks1Click(Sender: TObject);
var
i:integer;
begin
  if MoveTracks1.Checked then
    begin
      for i:=0 to Number_of_Charts-1 do
        Charts[i].DragMode:=dmManual;

      MoveTracks1.Checked:=False;
      ToolButton15.Down:=False;
    end
  else
    begin
      for i:=0 to Number_of_Charts-1 do
        Charts[i].DragMode:=dmAutomatic;
      MoveTracks1.Checked:=True;
      ToolButton15.Down:=True;
    end;
end;

procedure TMainForm.Oil1Click(Sender: TObject);
var
No_Values: Integer;
PHI_Value: Single;
Sw_Value:Single;
So_Value: Single;
Depth_Value: Single;
i: Smallint;
begin
try
  if Tree1.Roots.Count=0 then Exit;
  PHI_Track_Number:=-1;
  Sw_Track_Number:=-1;
  PHI_Value:=-999.25;
  Depth_Value:=0;
  Operation_Canceled:=False;
  So_Form:=TSo_Form.Create(Self);
  So_Form.ShowModal;
  So_Form.Free;
  if Operation_Canceled then Exit;

  No_Values:=LasFiles[0].NoRecords;

  CreateRoot('Oil Saturation');
  Preparation('Oil Saturation', 'So.V/V');

  for i:=0 to No_Values-1 do
    begin
      if PHI_Track_Number<>-1 then
        Depth_Value:=Charts[PHI_Track_Number].Series[0].YValue[i]
      else if Value_Is_Constant[1] then
        Depth_Value:=Charts[0].Series[0].YValue[i];

      if PHI_Track_Number<>-1 then
        PHI_Value:=Charts[PHI_Track_Number].Series[0].XValue[i]
      else if Value_Is_Constant[1] then
        PHI_Value:= Constant_Value[1];

      if Sw_Track_Number<>-1 then
        Sw_Value:=Charts[Sw_Track_Number].Series[0].XValue[i]
      else if Value_Is_Constant[2] then
        Sw_Value:= Constant_Value[2];

      if (PHI_Value<> LasFiles[0].NullValue)and(Sw_Value<> LasFiles[0].NullValue) then
        begin
          So_Value:=PHI_Value  - Sw_Value;
          if So_Value<0 then So_Value:=0;
          Charts[Length(Charts)-1].Series[0].AddXY(So_Value, Depth_Value)
        end
      else
        begin
          Charts[Length(Charts)-1].Series[0].AddNullXY(LasFiles[0].NullValue, Depth_Value);
        end;
    end;
  Number_of_Charts:=Chart_Number;
except
  UndoPreparation('Oil Saturation', 'So.V/V');
end;
end;

end.


