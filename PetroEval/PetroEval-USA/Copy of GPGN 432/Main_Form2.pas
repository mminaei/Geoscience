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
  TeExport, DB, DBTables, DBChart, Chart, GIFImage, TeeLighting;
type
  TMainForm2 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Open1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    ChangeScale1: TMenuItem;
    LAS1: TMenuItem;
    ChartEditor1: TChartEditor;
    ChartPreviewer1: TChartPreviewer;
    StatusBar1: TStatusBar;
    ASCIIFile1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton9: TToolButton;
    Separator3: TToolButton;
    ToolButton10: TToolButton;
    ImageList2: TImageList;
    PrintDialog1: TPrintDialog;
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    General1: TMenuItem;
    DataSource2: TDataSource;
    DataSource1: TDataSource;
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
    ChartTool1: TMarksTipTool;
    ChartTool2: TMarksTipTool;
    ChartTool3: TMarksTipTool;
    Litholog: TTable;
    DataSource3: TDataSource;
    LithologSST: TFloatField;
    LithologSHL: TFloatField;
    LithologLST: TFloatField;
    LithologDOL: TFloatField;
    LithologGPS: TFloatField;
    LithologANH: TFloatField;
    LithologDEPTH: TFloatField;
    ImageList1: TImageList;
    Series30: THorizLineSeries;
    Series31: THorizLineSeries;
    ToolButton3: TToolButton;
    MoveTracks1: TMenuItem;
    ToolBar2: TToolBar;
    OpenDialog2: TOpenDialog;
    Series18: THorizLineSeries;
    Series19: THorizLineSeries;
    Calculation1: TMenuItem;
    ShaleSandVolumes1: TMenuItem;
    ools1: TMenuItem;
    PickSandLine1: TMenuItem;
    PickShaleLine1: TMenuItem;
    SandLine: TDrawLineTool;
    ShaleLine: TDrawLineTool;
    Porosity1: TMenuItem;
    Series20: THorizLineSeries;
    Series21: THorizLineSeries;
    Series22: THorizLineSeries;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure ChangeScale1Click(Sender: TObject);
    procedure Zooming(Sender: TObject);
    procedure LAS1Click(Sender: TObject);
    procedure ReadLAS(File_Name: string);
    procedure ReadASCII(File_Name: string);
    procedure ASCIIFile1Click(Sender: TObject);
    procedure ChartClick(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);
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
    procedure DragLine_Sand(Sender: TObject);
    procedure DragLine_Shale(Sender: TObject);
    procedure CheckAxes;
//    procedure ChangePath;
    procedure Find_GR;
    procedure Find_SP;
    procedure Find_BS;
    procedure Find_CALIPER;
    procedure Find_MSFL;
    procedure Find_LLD;
    procedure Find_LLS;
    procedure Find_NPHI;
    procedure Find_RHO;
    procedure Find_PEF;
    procedure Find_DT;
    procedure Find_S_VOL;
    procedure Find_SH_VOL;
    procedure Find_DPHI_SST;
    procedure Find_DPHI_LST;
    procedure Find_DPHI_DOL;
    procedure PHI_Calculate(MethodIndex: integer);
    procedure DBChart1DblClick(Sender: TObject);
    procedure DBChart3DblClick(Sender: TObject);
    procedure DBChart4DblClick(Sender: TObject);
    procedure DBChart1Scroll(Sender: TObject);
    procedure DBChart1UndoZoom(Sender: TObject);
    procedure DBChart3Scroll(Sender: TObject);
    procedure DBChart3UndoZoom(Sender: TObject);
    procedure DBChart4UndoZoom(Sender: TObject);
    procedure DBChart4Scroll(Sender: TObject);
    procedure MoveTracks1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure PickSandLine1Click(Sender: TObject);
    procedure PickShaleLine1Click(Sender: TObject);
    procedure ShaleSandVolumes1Click(Sender: TObject);
    procedure DBChart5DblClick(Sender: TObject);
    procedure DBChart7DblClick(Sender: TObject);
    procedure DBChart8DblClick(Sender: TObject);
    procedure Porosity1Click(Sender: TObject);

  private
    { Private declarations }
  public
    Value_Is_Constant          :array [1..10] of Boolean;
    Constant_Value             :array [1..10] of Single;

    Matrix_Value,
    Fluid_Value     :Single;
    Lith_Type:Smallint;

    PHI_Calculation_Method: Smallint;


    For_PHI_Track_Number,
    Neutron_Track_Number: Smallint;
    Log_Values                 :THorizLineSeries;
    RHO_Track_Number,
    SP_Track_Number,
    PHI_Track_Number,
    PEF_Track_Number,
    NPHI_Track_Number,
    GR_Track_Number,
    CALI_Track_Number,
    BS_Track_Number,
    MSFL_Track_Number,
    LLM_Track_Number,
    LLD_Track_Number,
    DT_Track_Number,
    SH_VOL_Track_Number,
    S_VOL_Track_Number,
    DPHI_SST_Track_Number,
    DPHI_LST_Track_Number,
    DPHI_DOL_Track_Number,
    Temp_Zoom_File_No     :Smallint;
    Operation_Canceled          :Boolean;
    Temp_Zoom_File             :String;
    No_Lines_Skip:string;
    No_Columns:string;
    Depth_Column:string;
    DepthUnitString:string;
    NullValueString:string;
    StepValueString:string;
    Null_Value_String:string;
    Line_Drawing:Boolean;
    Shale_Line_Value,
    Sand_Line_Value        :Single;

    { Public declarations }
  end;

  TLASFile = class(TObject)
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
     Properties            :TTable;
     Values                :TTable;
    { Public declarations }
  end;


const
  Precision_Value = -4;

var
  MainForm2               :TMainForm2;
  Lines                   :TStringList;
  Depth_Value             :Single;
  Log_Value               :Single;
  Log_Scale               :Single;
  OpenedFile              :TLASFile;
  File_Opened             :Boolean;
  DBCharts                :array [1..5] of TDBChart;

implementation

uses ZoomedChart, PreviewForm, FirstForm,  LoadForm, PorosityForm;


{$R *.dfm}

procedure TMainForm2.FormCreate(Sender: TObject);
begin
  DBCharts[1]:=DBChart1;
  DBCharts[2]:=DBChart2;
  DBCharts[3]:=DBChart3;
  DBCharts[4]:=DBChart4;
end;

procedure TMainForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{  MainForm.Free;
  First_Form.MainForm_Created:=False;
  First_Form.MainForm2_Created:=False;
  First_Form.Visible:=True;
  Action:=caFree;}
  Visible:=False;
end;

procedure TMainForm2.ReadLAS(File_Name: string);
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
begin
with OpenedFile do
  begin
//    File_Opened:=False;
  try
(********* Get file name without its complete path *)
    s1:=ReverseString(File_Name);
    p1:=Pos('\',s1);
    s1:=ReverseString(s1);
    p2:=Length(s1)-p1+2;
    s2:=Copy(s1,p2,p1);
    FileName:=s2;
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
    p3:=Length(s1);
    for k := p2 to Length(s1) do
      begin
        OneChar:=s1[k];
        if not(OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+']) then
          begin
            p3:=k;
            Break;
          end
      end;
    s2:=Copy(s1,p2,p3-p2+1);
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
    p3:=Length(s1);
    for k := p2 to Length(s1) do
      begin
        OneChar:=s1[k];
        if not(OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+']) then
          begin
            p3:=k;
            Break;
          end;
      end;
    s2:=Copy(s1,p2,p3-p2+1);
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
    p3:=Length(s1);
    for k := p2 to Length(s1) do
      begin
        OneChar:=s1[k];
        if not(OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+']) then
          begin
            p3:=k;
            Break;
          end;
      end;
    s2:=Copy(s1,p2,p3-p2+1);
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
    p3:=Length(s1);
    for k := p2 to Length(s1) do
      begin
        OneChar:=s1[k];
        if not(OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+']) then
          begin
            p3:=k;
            Break;
          end;
      end;
    s2:=Copy(s1,p2,p3-p2+1);
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
    if IsWrapped then
      NoLinesPerDepth:=Trunc((NoTracks-1)/6)+1
    else
      NoLinesPerDepth:=1;
(*******************To find tracks names and units ***********)
    j:=k+1;
    Properties.Edit;
    k:=0;
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
        p1:=Pos('.', s1);
        s2:= Copy( s1, 1, p1-1);
        Properties.Append;
        Properties.Fields[0].Value:=Trim(s2);
(* to find track unit  *)
        p1:=Pos('.', s1);
        p2:=PosEx(' ', s1, p1);
        s3:= Copy( s1, p1+1, p2-p1);
        Values.FieldDefs.Add(Trim(s2)+'.'+Trim(s3), ftFloat, 0, False);
        Properties.Fields[1].Value:=Trim(s3);
        Properties.Fields[2].Value:=-99999999;
        Properties.Fields[3].Value:=99999999;
        Inc(j);
        Inc(k);
      except
        on E:EdataBaseError do
          begin
            MessageDlg('Field '+s2+' already exists.'+#13+'Please check your file.', mtError, [mbok], 0);
            Values.FieldDefs.Add(Trim(s2)+IntToStr(k), ftFloat, 0, False);
            p1:=Pos('.', s1);
            p2:=PosEx(' ', s1, p1);
            s2:= Copy( s1, p1+1, p2-p1);
            Properties.Fields[1].Value:=Trim(s2);
            Properties.Fields[2].Value:=-99999999;
            Properties.Fields[3].Value:=99999999;
            Inc(j);
            Inc(k);
          end;
      end;
    until k=NoTracks;

    Properties.Edit;
    Properties.Append;
    Properties.Fields[0].Value:='S_VOL';
    Properties.Fields[1].Value:='V/V';
    Properties.Fields[2].Value:=1;
    Properties.Fields[3].Value:=0;
    Properties.Append;
    Properties.Fields[0].Value:='SH_VOL';
    Properties.Fields[1].Value:='V/V';
    Properties.Fields[2].Value:=1;
    Properties.Fields[3].Value:=0;
    Properties.Append;
    Properties.Fields[0].Value:='DPHI_SST';
    Properties.Fields[1].Value:='V/V';
    Properties.Fields[2].Value:=0.45;
    Properties.Fields[3].Value:=-0.15;
    Properties.Append;
    Properties.Fields[0].Value:='DPHI_LST';
    Properties.Fields[1].Value:='V/V';
    Properties.Fields[2].Value:=0.45;
    Properties.Fields[3].Value:=-0.15;
    Properties.Append;
    Properties.Fields[0].Value:='DPHI_DOL';
    Properties.Fields[1].Value:='V/V';
    Properties.Fields[2].Value:=0.45;
    Properties.Fields[3].Value:=-0.15;
    Values.FieldDefs.Add('S_VOL', ftFloat, 0, False);
    Values.FieldDefs.Add('SH_VOL', ftFloat, 0, False);
    Values.FieldDefs.Add('DPHI_SST', ftFloat, 0, False);
    Values.FieldDefs.Add('DPHI_LST', ftFloat, 0, False);
    Values.FieldDefs.Add('DPHI_DOL', ftFloat, 0, False);

    Values.CreateTable;
    Values.Open;
    Properties.First;
    for n := 0 to NoTracks-1 do
      begin
        s1:=Properties.FieldByName('TRACK_NAME').AsString+'.'+Properties.FieldByName('TRACK_UNIT').AsString;
        Values.Fields[n].DisplayLabel:=s1;
//        Preparation(s1);
        Properties.Next;
      end;
    Values.Open;
    Values.First;
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
   Values.DisableControls;
   Properties.DisableControls;
// If the LAS file is not wrapped, version 1.1, 2 and 3
   if not IsWrapped then
     begin
       for i := 0 to NoRecords-1 do
         begin
           s1:=Trim(Lines[DataStartLineNo+i]);
           Properties.First;
           p3:=1;
           Values.Edit;
           Values.Append;
           for j:=0 to NoTracks-1 do
             begin
               for k := p3 to Length(s1) do
                 begin
                   OneChar:=s1[k];
                   if not(OneChar in [DLMChar,' ', #9]) then//['0','1','2','3','4','5','6','7','8','9','.','-','+'] then
                     begin
                       p2:=k;
                       Break;
                     end;
                 end;
//               p3:=Length(s1);
               for k := p2 to Length(s1) do
                 begin
                   OneChar:=s1[k];
                   if OneChar in [DLMChar,' ', #9] then//not(OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+']) then
                     begin
                       p3:=k;
                       Break;
                     end;
                 end;
               if p2>p3 then
                 p3:=Length(s1);
               s2:=Copy(s1,p2,p3-p2+1);
               s2:=Trim(s2);
               Log_Value:=StrToFloat(Trim(s2));
               LGS:=FloatToStr(Log_Value);
               if LGS<>NVS then
                 begin
                   Values.Fields[j].AsString:=Trim(s2);
                   Properties.Edit;
                   if Log_Value>Properties.Fields[2].AsFloat then
                     Properties.Fields[2].AsFloat:=RoundTo(Log_Value, -4);
                   if Log_Value<Properties.Fields[3].AsFloat then
                     Properties.Fields[3].AsFloat:=RoundTo(Log_Value, -4);
                 end
               else
                 Values.Fields[j].AsString:='';
               Properties.Next;
             end;
         end;
     end
// if it is wrapped
   else
     begin
       try
         NoColumns:=0;
         NoColumns:=StrToInt(InputBox('Number of Columns', 'Your LAS file is wrapped:'+#13+'File: '+FileName+#13+'Please enter number of columns in the file:', '0'));
         if NoColumns=0 then
           Exit;
       except
         on E:EConvertError do
           begin
             MessageDlg(E.Message+#13+'The program will continue with 6 columns', mtError, [MbOk], 0);
             NoColumns:=6;
           end;
       end;
       for i := 0 to NoRecords-1 do
         begin
           s1:=Trim(Lines[DataStartLineNo+n]);
           Inc(n);
           for k := 0 to Length(s1) do
             begin
               OneChar:=s1[k];
               if not(OneChar in [DLMChar,' ']) then//OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+'] then
                 begin
                   p2:=k;
                   Break;
                 end;
             end;
           for k := p2 to Length(s1) do
             begin
               OneChar:=s1[k];
               if OneChar in [DLMChar,' '] then//not(OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+']) then
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
           Values.Edit;
           Values.Append;
           Values.Fields[0].AsString:=s2;
           Properties.First;
           Properties.Edit;
           if LGS<>NVS then
             begin
               if Log_Value>Properties.Fields[2].AsFloat then
                 Properties.Fields[2].AsFloat:=RoundTo(Log_Value, -4);
               if Log_Value<Properties.Fields[3].AsFloat then
                 Properties.Fields[3].AsFloat:=RoundTo(Log_Value, -4);
             end;
           Properties.Next;
           for m := 1 to NoLinesPerDepth-1 do
             begin
               s1:=Trim(Lines[DataStartLineNo+n]);
               Inc(n);
               p3:=0;
               for j:=1 to NoColumns do
                 begin
                   for k := p3 to Length(s1) do
                     begin
                       OneChar:=s1[k];
                       if not(OneChar in [DLMChar,' ']) then//OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+'] then
                         begin
                           p2:=k;
                           Break;
                         end;
                     end;
                   for k := p2 to Length(s1) do
                     begin
                       OneChar:=s1[k];
                       if OneChar in [DLMChar,' '] then//not(OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+']) then
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
                   Values.Fields[(m-1)*6+j].AsString:=s2;
                   Properties.Edit;
                   if LGS<>NVS then
                     begin
                       if Log_Value>Properties.Fields[2].AsFloat then
                         Properties.Fields[2].AsFloat:=RoundTo(Log_Value, -4);
                       if Log_Value<Properties.Fields[3].AsFloat then
                         Properties.Fields[3].AsFloat:=RoundTo(Log_Value, -4);
                     end;
                   Properties.Next;
                 end;
             end;
// Last Line for wrapped file
           Temp_integer:=(NoTracks-1) mod NoColumns;
           if Temp_Integer<>0 then
             begin
               s1:=Trim(Lines[DataStartLineNo+n]);
               Inc(n);
               for j:=1 to ((NoTracks-1) mod NoColumns) do
                 begin
                   for k := 0 to Length(s1) do
                     begin
                       OneChar:=s1[k];
                       if not(OneChar in [DLMChar,' ']) then//OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+'] then
                         begin
                           p2:=k;
                           Break;
                         end;
                     end;
                   for k := p2 to Length(s1) do
                     begin
                       OneChar:=s1[k];
                       if OneChar in [DLMChar,' '] then//not(OneChar in ['0','1','2','3','4','5','6','7','8','9','.','-','+']) then
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
                   Values.Fields[(NoLinesPerDepth-1)*6+j].AsString:=s2;
                   Properties.Edit;
                   if LGS<>NVS then
                     begin
                       if Log_Value>Properties.Fields[2].AsFloat then
                         Properties.Fields[2].AsFloat:=RoundTo(Log_Value, -4);
                       if Log_Value<Properties.Fields[3].AsFloat then
                         Properties.Fields[3].AsFloat:=RoundTo(Log_Value, -4);
                     end;
                   Properties.Next;
                 end;
             end;
         end;
     end;
(***********************************************************)
    Lines.Free;
    Values.Edit;
    Values.Post;
    Properties.Edit;
    Properties.Post;
    DataSource1.DataSet:=Properties;
    DataSource2.DataSet:=Values;
    Values.EnableControls;
    Properties.EnableControls;
  except
    Lines.Free;
    Values.Edit;
    Values.Post;
    Properties.Edit;
    Properties.Post;
    DataSource1.DataSet:=Properties;
    DataSource2.DataSet:=Values;
    Values.Close;
    Properties.Close;
    Values.EnableControls;
    Properties.EnableControls;
  end;
end;
end;

procedure TMainForm2.ReadASCII(File_Name: string);
var
j,k,n: integer;
p1,p2,p3:Smallint;
s1,s2,s3,s4:string;
DepthUnit_String: string[5];
//DLM_String: string[5];
Step_Value_String: string[8];
LGS: string;
NVS: string;
File_Opened: Boolean;
OneChar: Char;
TempFile: TextFile;
begin
with OpenedFile do
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
      Lines:=TStringList.Create;
      Lines.LoadFromFile(File_Name);
(********* To find depth units *********************)
      DepthUnit_String:=DepthUnitString;
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
      k:=0;
      Properties.Open;
      Properties.Edit;
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
          Values.FieldDefs.Add(Trim(s2), ftFloat, 0, False);

          Properties.Append;
          p1:=Pos('.', s2);
          if p1<>0 then
            begin
              s3:= Copy( s2, p1+1, Length(s2)-1);
              s2:=Copy(s2,1,p1);
            end
          else
            s3:=DepthUnitString;

          Properties.Fields[0].Value:=Trim(s2);
          Properties.Fields[1].Value:=Trim(s3);
          Properties.Fields[2].Value:=-99999999;
          Properties.Fields[3].Value:=99999999;
          Inc(j);
          Inc(NoTracks);
        except
          on E:EdataBaseError do
            begin
              MessageDlg('Field '+s2+' already exists.'+#13+'Please check your file.', mtError, [mbok], 0);
              Values.FieldDefs.Add(Trim(s2)+IntToStr(k), ftFloat, 0, False);
              p1:=Pos('.', s2);
              if p1<>0 then
                s3:= Copy( s2, p1+1, Length(s2)-1)
              else
                s3:=s2;
              Properties.Fields[1].Value:=Trim(s3);
              Properties.Fields[2].Value:=-99999999;
              Properties.Fields[3].Value:=99999999;
              Inc(NoTracks);
              Inc(j);
            end;
        end;
      until s4='FINISHED';

    Properties.Edit;
    Properties.Append;
    Properties.Fields[0].Value:='S_VOL';
    Properties.Fields[1].Value:='V/V';
    Properties.Fields[2].Value:=1;
    Properties.Fields[3].Value:=0;
    Properties.Append;
    Properties.Fields[0].Value:='SH_VOL';
    Properties.Fields[1].Value:='V/V';
    Properties.Fields[2].Value:=1;
    Properties.Fields[3].Value:=0;
    Values.FieldDefs.Add('S_VOL', ftFloat, 0, False);
    Values.FieldDefs.Add('SH_VOL', ftFloat, 0, False);
    Values.CreateTable;
    Values.Open;
    Properties.First;
//    NoTracks:=NoTracks+2;
    for n := 0 to NoTracks+1 do
      begin
        s1:=Properties.FieldByName('TRACK_NAME').AsString+'.'+Properties.FieldByName('TRACK_UNIT').AsString;
        Values.Fields[n].DisplayLabel:=s1;
        Properties.Next;
      end;
    Values.Open;
    Values.First;
(**************** Reading file data ************************)
  AssignFile(TempFile,File_Name);
  Reset(TempFile);
  File_Opened:=True;
  Values.DisableControls;
  Properties.DisableControls;
  for n:=0 to StrToInt(No_Lines_Skip)+1 do
    Readln(TempFile);
  while not(EoF(TempFile)) do
    begin
      try
//        Read(TempFile,Depth_Value);
           Properties.First;
//           p3:=1;
           Values.Edit;
           Values.Append;
        for j:=0 to NoTracks-1 do
          begin
            Read(TempFile,Log_Value);
               LGS:=FloatToStr(Log_Value);
               if LGS<>NVS then
                 begin
                   Values.Fields[j].AsString:=Trim(LGS);
                   Properties.Edit;
                   if Log_Value>Properties.Fields[2].AsFloat then
                     Properties.Fields[2].AsFloat:=RoundTo(Log_Value, -4);
                   if Log_Value<Properties.Fields[3].AsFloat then
                     Properties.Fields[3].AsFloat:=RoundTo(Log_Value, -4);
                 end
               else
                 Values.Fields[j].AsString:='';

               Properties.Next;
          end;
        Readln(TempFile);
      except
        Messagedlg('Corrupted data!', mtError, [mbOk], 0);
        Values.Fields[j].AsString:='';
        Readln(TempFile);
      end;
    end;
(***********************************************************)
  Values.Edit;
  Values.Post;
  Properties.Edit;
  Properties.Post;
  DataSource1.DataSet:=Properties;
  DataSource2.DataSet:=Values;
  Values.EnableControls;
  Properties.EnableControls;
//  Number_of_Charts:=Chart_Number;
  CloseFile(TempFile);
  Lines.Free;
except
//  //UndoPreparation(Root_Name, Child_Name);
  if File_Opened then
//    CloseFile(TempFile);
  Lines.Free;
  Values.Edit;
  Values.Post;
  Properties.Edit;
  Properties.Post;
  DataSource1.DataSet:=Properties;
  DataSource2.DataSet:=Values;
  Values.Close;
  Properties.Close;
  Values.EnableControls;
  Properties.EnableControls;
end;
end;
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
//      Charts_Scaled:=True;
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
//      DBChart9.Height:=DBChart1.Height;
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
      ZoomChart.Zoom_From:=1;
      UndoZoom;
      ZoomChart.Show;
    end;
end;

procedure TMainForm2.LAS1Click(Sender: TObject);
var
i: Smallint;
s1,s2:string;
p1,p2:integer;
File_Name:string;
Temp_Value:Integer;
ConversionUnit:Single;
begin
try
  with OpenDialog1 do
    begin
      DefaultExt:='LAS';
      Filter:='LAS files|*.LAS';
      Title:='Open LAS files';
    end;
  if OpenDialog1.Execute then
    begin
      for i:=0 to OpenDialog1.Files.Count-1 do
        begin
          StatusBar1.Panels[0].Text:='Reading file(s) data. Please wait ...';
//          LessenPic;
          Repaint;
          ConversionUnit:=0;
          s1:=ReverseString(OpenDialog1.Files[i]);
          p1:=Pos('\',s1);
          s1:=ReverseString(s1);
          p2:=Length(s1)-p1+2;
          s2:=Copy(s1,p2,p1-5);
          File_Name:=s2;
//          ChangePath;
          try
//            SetLength(LASFiles, Length(LASFiles)+1);
            OpenedFile:=TLASFile.Create;
//            ChangePath;
            with OpenedFile do
              begin
                Properties:=TTable.Create(Self);
                Properties.TableName:=File_Name+'_Properties'+'.DB';
                Properties.FieldDefs.Add('TRACK_NAME', ftString, 10, False);
                Properties.FieldDefs.Add('TRACK_UNIT', ftString, 7, False);
                Properties.FieldDefs.Add('MAX_VALUE', ftFloat, 0, False);
                Properties.FieldDefs.Add('MIN_VALUE', ftFloat, 0, False);
                Properties.CreateTable;
                Properties.Open;
                Values:=TTable.Create(Self);
                Values.TableName:=File_Name+'_Values'+'.DB';
                Litholog.TableName:=File_Name+'_Litho'+'.DB';
              end;
            ReadLAS(OpenDialog1.Files[i]);
            File_Opened:=True;
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
//                DBChart9.Height:=DBChart1.Height;

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
            Find_SP;
            Find_CALIPER;
            Find_BS;
            Find_MSFL;
            Find_LLD;
            Find_LLS;
            Find_NPHI;
            Find_RHO;
            Find_PEF;
            Find_DT;
            Find_S_VOL;
            Find_SH_VOL;
            Find_DPHI_SST;
            Find_DPHI_LST;
            Find_DPHI_DOL;
          except
            MessageDlg('Error occured while reading '+#13+OpenDialog1.FileName[i], mtError, [mbOk], 0);
//            DisableMenu;
            Continue;
          end;
        end;
      StatusBar1.Panels[0].Text:='Ready';
    end;
finally
  StatusBar1.Panels[0].Text:='Ready.';
end;
end;

procedure TMainForm2.Find_GR;
var
i:integer;
Temp_Name: string;
begin
  with OpenedFile do
    begin
      Properties.First;
      DBChart1.Series[0].YValues.ValueSource:=Values.FieldDefs[0].Name;
      DBChart1.Series[0].YValues.Name:=Values.FieldDefs[0].Name;
      DBChart1.Series[0].DataSource:=Values;
      GR_Track_Number:=-1;
      for i:=0 to NoTracks-1 do
        begin
          Temp_Name:= Properties.Fields[0].AsString;
          if ((Temp_Name='CGR')or(Temp_Name='GR')or(Temp_Name='ECGR')or(Temp_Name='GRC')or(Temp_Name='C_GR')or(Temp_Name='BHC_GR')or(Temp_Name='CCATGR')or(Temp_Name='CSNG')or(Temp_Name='DIELGR')or(Temp_Name='G_GR')or(Temp_Name='GAMMA')or(Temp_Name='GR_DC')or(Temp_Name='GR_DN')or(Temp_Name='GR_DSN')or(Temp_Name='EGR')or(Temp_Name='GRCO')or(Temp_Name='GRTO')or(Temp_Name='RGR')or(Temp_Name='SUMG')or(Temp_Name='IDGR')or(Temp_Name='GSGR')) then
            begin
              DBChart1.Series[0].XValues.ValueSource:=Values.FieldDefs[i].Name;
              DBChart1.Series[0].XValues.Name:=Values.FieldDefs[i].Name;
              DBChart5.CustomAxes[0].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
              GR_Track_Number:=i;
              Break;
            end;
          Properties.Next;
        end;
    end;
end;

procedure TMainForm2.Find_CALIPER;
var
i:integer;
Temp_Name: string;
begin
  with OpenedFile do
    begin
      Properties.First;
      DBChart1.Series[1].YValues.ValueSource:=Values.FieldDefs[0].Name;
      DBChart1.Series[1].YValues.Name:=Values.FieldDefs[0].Name;
      DBChart1.Series[1].DataSource:=Values;
      CALI_Track_Number:=-1;
      for i:=0 to NoTracks-1 do
        begin
          Temp_Name:= Properties.Fields[0].AsString;
          if ((Temp_Name='CALI')or(Temp_Name='CALIPER')or(Temp_Name='HCAL')or(Temp_Name='CAL')) then
            begin
              DBChart1.Series[1].XValues.ValueSource:=Values.FieldDefs[i].Name;
              DBChart1.Series[1].XValues.Name:=Values.FieldDefs[i].Name;
              DBChart5.CustomAxes[1].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
              CALI_Track_Number:=i;
              Break;
            end;
          Properties.Next;
        end;
    end;
end;

procedure TMainForm2.Find_BS;
var
i:integer;
Temp_Name: string;
begin
  with OpenedFile do
    begin
      Properties.First;
      DBChart1.Series[2].YValues.ValueSource:=Values.FieldDefs[0].Name;
      DBChart1.Series[2].YValues.Name:=Values.FieldDefs[0].Name;
      DBChart1.Series[2].DataSource:=Values;
      BS_Track_Number:=-1;
      for i:=0 to NoTracks-1 do
        begin
          Temp_Name:= Properties.Fields[0].AsString;
          if ((Temp_Name='BS')or(Temp_Name='BIT')) then
            begin
              DBChart1.Series[2].XValues.ValueSource:=Values.FieldDefs[i].Name;
              DBChart1.Series[2].XValues.Name:=Values.FieldDefs[i].Name;
              DBChart5.CustomAxes[2].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
              BS_Track_Number:=i;
              Break;
            end;
          Properties.Next;
        end;
    end;
end;

procedure TMainForm2.Find_MSFL;
var
i:integer;
Temp_Name: string;
begin
  with OpenedFile do
    begin
      Properties.First;
      DBChart3.Series[0].YValues.ValueSource:=Values.FieldDefs[0].Name;
      DBChart3.Series[0].YValues.Name:=Values.FieldDefs[0].Name;
      DBChart3.Series[0].DataSource:=Values;
      MSFL_Track_Number:=-1;
      for i:=0 to NoTracks-1 do
        begin
          Temp_Name:= Properties.Fields[0].AsString;
          if ((Temp_Name='MSFL')or(Temp_Name='SFLA')or(Temp_Name='SFLU')or(Temp_Name='AHO10')) then
            begin
              DBChart3.Series[0].XValues.ValueSource:=Values.FieldDefs[i].Name;
              DBChart3.Series[0].XValues.Name:=Values.FieldDefs[i].Name;
              DBChart7.CustomAxes[0].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
              MSFL_Track_Number:=i;
              Break;
            end;
          Properties.Next;
        end;
    end;
end;

procedure TMainForm2.Find_LLS;
var
i:integer;
Temp_Name: string;
begin
  with OpenedFile do
    begin
      Properties.First;
      DBChart3.Series[1].YValues.ValueSource:=Values.FieldDefs[0].Name;
      DBChart3.Series[1].YValues.Name:=Values.FieldDefs[0].Name;
      DBChart3.Series[1].DataSource:=Values;
      LLM_Track_Number:=-1;
      for i:=0 to NoTracks-1 do
        begin
          Temp_Name:= Properties.Fields[0].AsString;
          if ((Temp_Name='LLS')or(Temp_Name='LLM')or(Temp_Name='ILS')or(Temp_Name='ILM')or(Temp_Name='HLLS')or(Temp_Name='AHT30')or(Temp_Name='AHT20')or(Temp_Name='AHT60')) then
            begin
              DBChart3.Series[1].XValues.ValueSource:=Values.FieldDefs[i].Name;
              DBChart3.Series[1].XValues.Name:=Values.FieldDefs[i].Name;
              DBChart7.CustomAxes[1].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
              LLM_Track_Number:=i;
              Break;
            end;
          Properties.Next;
        end;
    end;
end;

procedure TMainForm2.Find_SP;
var
i:integer;
Temp_Name: string;
begin
  with OpenedFile do
    begin
      Properties.First;
      DBChart1.Series[3].YValues.ValueSource:=Values.FieldDefs[0].Name;
      DBChart1.Series[3].YValues.Name:=Values.FieldDefs[0].Name;
      DBChart1.Series[3].DataSource:=Values;
      SP_Track_Number:=-1;
      for i:=0 to NoTracks-1 do
        begin
          Temp_Name:= Properties.Fields[0].AsString;
          if (Temp_Name='SP') then
            begin
              DBChart1.Series[3].XValues.ValueSource:=Values.FieldDefs[i].Name;
              DBChart1.Series[3].XValues.Name:=Values.FieldDefs[i].Name;
              DBChart5.CustomAxes[3].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
              SP_Track_Number:=i;
              Break;
            end;
          Properties.Next;
        end;
    end;
end;

procedure TMainForm2.Find_LLD;
var
i:integer;
Temp_Name: string;
begin
  with OpenedFile do
    begin
      Properties.First;
      DBChart3.Series[2].YValues.ValueSource:=Values.FieldDefs[0].Name;
      DBChart3.Series[2].YValues.Name:=Values.FieldDefs[0].Name;
      DBChart3.Series[2].DataSource:=Values;
      LLD_Track_Number:=-1;
      for i:=0 to NoTracks-1 do
        begin
          Temp_Name:= Properties.Fields[0].AsString;
          if ((Temp_Name='LLD')or(Temp_Name='ILD')or(Temp_Name='HLLD')or(Temp_Name='AHF90')or(Temp_Name='AHF60')or(Temp_Name='AHT90')) then
            begin
              DBChart3.Series[2].XValues.ValueSource:=Values.FieldDefs[i].Name;
              DBChart3.Series[2].XValues.Name:=Values.FieldDefs[i].Name;
              DBChart7.CustomAxes[2].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
              LLD_Track_Number:=i;
              Break;
            end;
          Properties.Next;
        end;
    end;
end;

procedure TMainForm2.Find_RHO;
var
i:integer;
Temp_Name: string;
begin
  with OpenedFile do
    begin
      Properties.First;
      DBChart4.Series[0].YValues.ValueSource:=Values.FieldDefs[0].Name;
      DBChart4.Series[0].YValues.Name:=Values.FieldDefs[0].Name;
      DBChart4.Series[0].DataSource:=Values;
      RHO_Track_Number:=-1;
      for i:=0 to NoTracks-1 do
        begin
          Temp_Name:= Properties.Fields[0].AsString;
          if ((Temp_Name='RHOB')or(Temp_Name='RHOZ')or(Temp_Name='RHOZ_val')or(Temp_Name='RHO8')or(Temp_Name='ZCOR')or(Temp_Name='ZDEN')or(Temp_Name='RHGA')or(Temp_Name='DENR')or(Temp_Name='EDRH')or(Temp_Name='EMRH')or(Temp_Name='ERHO')or(Temp_Name='FDEN')or(Temp_Name='RHEV')or(Temp_Name='RHM2')or(Temp_Name='RHMA')or(Temp_Name='RHOC')or(Temp_Name='RHOF')or(Temp_Name='RHOH')or(Temp_Name='RHOO')or(Temp_Name='RHOW')or(Temp_Name='RHOG')or(Temp_Name='ZDRH')or(Temp_Name='ZRHO')or(Temp_Name='DENC')or(Temp_Name='DENS')or(Temp_Name='CDL')or(Temp_Name='FDT')or(Temp_Name='DLDNH')or(Temp_Name='DLDN')) then
            begin
              DBChart4.Series[0].XValues.ValueSource:=Values.FieldDefs[i].Name;
              DBChart4.Series[0].XValues.Name:=Values.FieldDefs[i].Name;
              DBChart8.CustomAxes[0].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
              RHO_Track_Number:=i;
              Break;
            end;
          Properties.Next;
        end;
    end;
end;

procedure TMainForm2.Find_NPHI;
var
i:integer;
Temp_Name: string;
begin
  with OpenedFile do
    begin
      Properties.First;
      DBChart4.Series[3].YValues.ValueSource:=Values.FieldDefs[0].Name;
      DBChart4.Series[3].YValues.Name:=Values.FieldDefs[0].Name;
      DBChart4.Series[3].DataSource:=Values;
      NPHI_Track_Number:=-1;
      for i:=0 to NoTracks-1 do
        begin
          Temp_Name:= Properties.Fields[0].AsString;
          if ((Temp_Name='NPHI')or(Temp_Name='CNL')or(Temp_Name='TNPH')or(Temp_Name='ENPH')) then
            begin
              DBChart4.Series[3].XValues.ValueSource:=Values.FieldDefs[i].Name;
              DBChart4.Series[3].XValues.Name:=Values.FieldDefs[i].Name;
              DBChart8.CustomAxes[3].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
              NPHI_Track_Number:=i;
              Break;
            end;
          Properties.Next;
        end;
    end;
end;

procedure TMainForm2.Find_PEF;
var
i:integer;
Temp_Name: string;
begin
  with OpenedFile do
    begin
      Properties.First;
      DBChart4.Series[2].YValues.ValueSource:=Values.FieldDefs[0].Name;
      DBChart4.Series[2].YValues.Name:=Values.FieldDefs[0].Name;
      DBChart4.Series[2].DataSource:=Values;
      PEF_Track_Number:=-1;
      for i:=0 to NoTracks-1 do
        begin
          Temp_Name:= Properties.Fields[0].AsString;
          if ((Temp_Name='PEF')or(Temp_Name='PE')or(Temp_Name='PEF8')or(Temp_Name='PEFZ')) then
            begin
              DBChart4.Series[2].XValues.ValueSource:=Values.FieldDefs[i].Name;
              DBChart4.Series[2].XValues.Name:=Values.FieldDefs[i].Name;
              DBChart8.CustomAxes[2].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
              PEF_Track_Number:=i;
              Break;
            end;
          Properties.Next;
        end;
    end;
end;

procedure TMainForm2.Find_DT;
var
i:integer;
TempName: string;
begin
  with OpenedFile do
    begin
      Properties.First;
      DBChart4.Series[3].YValues.ValueSource:=Values.FieldDefs[0].Name;
      DBChart4.Series[3].YValues.Name:=Values.FieldDefs[0].Name;
      DBChart4.Series[3].DataSource:=Values;
      DT_Track_Number:=-1;
      for i:=0 to NoTracks-1 do
        begin
          TempName:= Properties.Fields[0].AsString;
          if ((TempName='DT')or(TempName='DTCO')or(TempName='DT24')or(TempName='DT-P')or(TempName='DTP')or(TempName='DTP_val')or(TempName='DT-PED')or(TempName='ACTCL')) then
            begin
              DBChart4.Series[3].XValues.ValueSource:=Values.FieldDefs[i].Name;
              DBChart4.Series[3].XValues.Name:=Values.FieldDefs[i].Name;
              DBChart8.CustomAxes[3].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
              DT_Track_Number:=i;
//              MainForm.DT_Track_Number:=i-1;
              Break;
            end;
          Properties.Next;
        end;
    end;
end;

procedure TMainForm2.Find_S_VOL;
var
i:integer;
Temp_Name: string;
begin
  with OpenedFile do
    begin
      Properties.First;
      DBChart3.Series[0].YValues.ValueSource:=Values.FieldDefs[0].Name;
      DBChart3.Series[0].YValues.Name:=Values.FieldDefs[0].Name;
      DBChart3.Series[0].DataSource:=Values;
      S_VOL_Track_Number:=-1;
      for i:=0 to NoTracks+1 do
        begin
          Temp_Name:= Properties.Fields[0].AsString;
          if (Temp_Name='S_VOL') then
            begin
              DBChart3.Series[0].XValues.ValueSource:=Values.FieldDefs[i].Name;
              DBChart3.Series[0].XValues.Name:=Values.FieldDefs[i].Name;
              DBChart7.CustomAxes[0].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
              S_VOL_Track_Number:=i;
              Break;
            end;
          Properties.Next;
        end;
    end;
end;

procedure TMainForm2.Find_SH_VOL;
var
i:integer;
Temp_Name: string;
begin
  with OpenedFile do
    begin
      Properties.First;
      DBChart4.Series[0].YValues.ValueSource:=Values.FieldDefs[0].Name;
      DBChart4.Series[0].YValues.Name:=Values.FieldDefs[0].Name;
      DBChart4.Series[0].DataSource:=Values;
      SH_VOL_Track_Number:=-1;
      for i:=0 to NoTracks+1 do
        begin
          Temp_Name:= Properties.Fields[0].AsString;
          if (Temp_Name='SH_VOL') then
            begin
              DBChart4.Series[0].XValues.ValueSource:=Values.FieldDefs[i].Name;
              DBChart4.Series[0].XValues.Name:=Values.FieldDefs[i].Name;
              DBChart8.CustomAxes[0].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
              SH_VOL_Track_Number:=i;
              Break;
            end;
          Properties.Next;
        end;
    end;
end;

procedure TMainForm2.Find_DPHI_SST;
var
i:integer;
Temp_Name: string;
begin
  with OpenedFile do
    begin
      Properties.First;
      DBChart4.Series[0].YValues.ValueSource:=Values.FieldDefs[0].Name;
      DBChart4.Series[0].YValues.Name:=Values.FieldDefs[0].Name;
      DBChart4.Series[0].DataSource:=Values;
      DPHI_SST_Track_Number:=-1;
      for i:=0 to NoTracks+4 do
        begin
          Temp_Name:= Properties.Fields[0].AsString;
          if (Temp_Name='DPHI_SST') then
            begin
              DBChart4.Series[0].XValues.ValueSource:=Values.FieldDefs[i].Name;
              DBChart4.Series[0].XValues.Name:=Values.FieldDefs[i].Name;
              DBChart8.CustomAxes[0].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
              DPHI_SST_Track_Number:=i;
              Break;
            end;
          Properties.Next;
        end;
    end;
end;

procedure TMainForm2.Find_DPHI_LST;
var
i:integer;
Temp_Name: string;
begin
  with OpenedFile do
    begin
      Properties.First;
      DBChart4.Series[1].YValues.ValueSource:=Values.FieldDefs[0].Name;
      DBChart4.Series[1].YValues.Name:=Values.FieldDefs[0].Name;
      DBChart4.Series[1].DataSource:=Values;
      DPHI_LST_Track_Number:=-1;
      for i:=0 to NoTracks+4 do
        begin
          Temp_Name:= Properties.Fields[0].AsString;
          if (Temp_Name='DPHI_LST') then
            begin
              DBChart4.Series[1].XValues.ValueSource:=Values.FieldDefs[i].Name;
              DBChart4.Series[1].XValues.Name:=Values.FieldDefs[i].Name;
              DBChart8.CustomAxes[1].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
              DPHI_LST_Track_Number:=i;
              Break;
            end;
          Properties.Next;
        end;
    end;
end;

procedure TMainForm2.Find_DPHI_DOL;
var
i:integer;
Temp_Name: string;
begin
  with OpenedFile do
    begin
      Properties.First;
      DBChart4.Series[2].YValues.ValueSource:=Values.FieldDefs[0].Name;
      DBChart4.Series[2].YValues.Name:=Values.FieldDefs[0].Name;
      DBChart4.Series[2].DataSource:=Values;
      DPHI_DOL_Track_Number:=-1;
      for i:=0 to NoTracks+4 do
        begin
          Temp_Name:= Properties.Fields[0].AsString;
          if (Temp_Name='DPHI_DOL') then
            begin
              DBChart4.Series[2].XValues.ValueSource:=Values.FieldDefs[i].Name;
              DBChart4.Series[2].XValues.Name:=Values.FieldDefs[i].Name;
              DBChart8.CustomAxes[2].Title.Caption :=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
              DPHI_LST_Track_Number:=i;
              Break;
            end;
          Properties.Next;
        end;
    end;
end;

{procedure TMainForm2.ChangePath;
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

procedure TMainForm2.ChartsDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TDBChart;
end;

procedure TMainForm2.ChartsDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  i: Smallint;
  TempChart: TDBChart;
  Source_Tag:Byte;
  Sender_Tag:Byte;
begin
  if Sender=Source then Exit;
  if (Sender is TDBChart)and(Source is TDBChart) then
    begin

      with Source as TDBChart do
        begin
          for i:=1 to 4 do
            if Source=DBCharts[i] then Source_Tag:=i;
        end;
      with Sender as TDBChart do
        begin
          for i:=1 to 4 do
            if Sender=DBCharts[i] then Sender_Tag:=i;
        end;

      TempChart:=DBCharts[Source_Tag];
      DBCharts[Source_Tag]:=DBCharts[Sender_Tag];
      DBCharts[Sender_Tag]:=TempChart;

      DBCharts[1].Left:=0;
      for i:=2 to 4 do
        begin
          DBCharts[i].Left:= DBCharts[i-1].Left + DBCharts[i-1].Width;
        end;

      DBChart5.Left:=DBChart1.Left;
      DBChart6.Left:=DBChart2.Left;
      DBChart7.Left:=DBChart3.Left;
      DBChart8.Left:=DBChart4.Left;
//      DBChart10.Left:=DBChart9.Left;
    end;

end;

procedure TMainForm2.ASCIIFile1Click(Sender: TObject);
var
i: Smallint;
s1,s2:string;
p1,p2:integer;
File_Name:string;
Temp_Value:Integer;
ConversionUnit:Single;
begin
try
  ConversionUnit:=0;
      for i:=0 to OpenDialog2.Files.Count-1 do
        begin
          StatusBar1.Panels[0].Text:='Reading file(s) data. Please wait ...';
          Repaint;
          s1:=ReverseString(OpenDialog2.Files[i]);
          p1:=Pos('\',s1);
          s1:=ReverseString(s1);
          p2:=Length(s1)-p1+2;
          s2:=Copy(s1,p2,p1-5);
          File_Name:=s2;
//          ChangePath;
          try
            with OpenedFile do
              begin
                Properties:=TTable.Create(Self);
                Properties.TableName:=File_Name+'_Properties'+'.DB';
                Properties.FieldDefs.Add('TRACK_NAME', ftString, 10, False);
                Properties.FieldDefs.Add('TRACK_UNIT', ftString, 7, False);
                Properties.FieldDefs.Add('MAX_VALUE', ftFloat, 0, False);
                Properties.FieldDefs.Add('MIN_VALUE', ftFloat, 0, False);
                Properties.CreateTable;
                Properties.Open;
                Values:=TTable.Create(Self);
                Values.TableName:=File_Name+'_Values'+'.DB';
                Litholog.TableName:=File_Name+'_Litho'+'.DB';
              end;

            ReadASCII(OpenDialog2.Files[i]);

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

                DBChart2.Series[0].XValues.ValueSource:=Values.FieldDefs[0].Name;
                DBChart2.Series[0].XValues.Name:=Values.FieldDefs[0].Name;
                DBChart2.Series[0].YValues.ValueSource:=Values.FieldDefs[0].Name;
                DBChart2.Series[0].YValues.Name:=Values.FieldDefs[0].Name;
                DBChart2.Series[0].DataSource:=Values;
                Properties.First;
                DBChart6.CustomAxes[0].Title.Caption:=Properties.FieldByName('TRACK_NAME').AsString + ' ('+ Properties.FieldByName('TRACK_UNIT').AsString + ')';
                DBChart2.Axes.Left.Increment:=ABS(StepValue);
                DBChart2.Axes.Right.Increment:=ABS(StepValue);
              end;
            Find_GR;
            Find_SP;
            Find_CALIPER;
            Find_BS;
            Find_MSFL;
            Find_LLD;
            Find_LLS;
            Find_NPHI;
            Find_RHO;
            Find_PEF;
            Find_DT;
            Find_S_VOL;
            Find_SH_VOL;
//            EnableMenu;
          except
            MessageDlg('Error occured while reading '+#13+OpenDialog2.FileName[i], mtError, [mbOk], 0);
//            DisableMenu;
            Continue;
          end;
        end;
      StatusBar1.Panels[0].Text:='Ready';
//    end;
finally
  StatusBar1.Panels[0].Text:='Ready.';
end;
end;

procedure TMainForm2.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Separator3.Width:=NewWidth - (Width - Separator3.Width);
end;

procedure TMainForm2.CheckAxes;
begin
{  DBChart5.CustomAxes[0]:=DBChart1.CustomAxes[0];
  DBChart5.CustomAxes[1]:=DBChart1.CustomAxes[1];
  DBChart5.CustomAxes[2]:=DBChart1.CustomAxes[2];

  DBChart7.CustomAxes[0]:=DBChart3.CustomAxes[0];
  DBChart7.CustomAxes[1]:=DBChart3.CustomAxes[1];
  DBChart7.CustomAxes[2]:=DBChart3.CustomAxes[2];

  DBChart8.CustomAxes[0]:=DBChart4.CustomAxes[0];
  DBChart8.CustomAxes[1]:=DBChart4.CustomAxes[1];
  DBChart8.CustomAxes[2]:=DBChart4.CustomAxes[2];
  DBChart8.CustomAxes[3]:=DBChart4.CustomAxes[3];

  DBChart10.CustomAxes[0]:=DBChart9.CustomAxes[0];
  DBChart10.CustomAxes[1]:=DBChart9.CustomAxes[1];
  DBChart10.CustomAxes[2]:=DBChart9.CustomAxes[2];
  DBChart10.CustomAxes[3]:=DBChart9.CustomAxes[3];
  DBChart10.CustomAxes[4]:=DBChart9.CustomAxes[4];
  DBChart10.CustomAxes[5]:=DBChart9.CustomAxes[5];}
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
//      DBChart9.DragMode:=dmManual;
      MoveTracks1.Checked:=False;
      ToolButton3.Down:=False;
    end
  else
    begin
      DBChart1.DragMode:=dmAutomatic;
      DBChart2.DragMode:=dmAutomatic;
      DBChart3.DragMode:=dmAutomatic;
      DBChart4.DragMode:=dmAutomatic;
//      DBChart9.DragMode:=dmAutomatic;
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
//      DBChart9.DragMode:=dmManual;
      MoveTracks1.Checked:=False;
      ToolButton3.Down:=False;
    end
  else
    begin
      DBChart1.DragMode:=dmAutomatic;
      DBChart2.DragMode:=dmAutomatic;
      DBChart3.DragMode:=dmAutomatic;
      DBChart4.DragMode:=dmAutomatic;
//      DBChart9.DragMode:=dmAutomatic;
      MoveTracks1.Checked:=True;
      ToolButton3.Down:=True;
    end;
end;

procedure TMainForm2.ChartClick(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
i:integer;
XValue, YValue1, YValue2: Single;
begin
if (Line_Drawing)and(Button=mbLeft) then
  begin
    if PickSandLine1.Checked then
      begin
        XValue:=DBChart1.Series[0].XScreenToValue(X);
        Sand_Line_Value:=XValue;
        YValue1:=DBChart1.Axes.Left.Minimum;
        YValue2:=DBChart1.Axes.Left.Maximum;
        if SandLine.EnableDraw then
          SandLine.Lines.AddLine(XValue, YValue1 , XValue, YValue2);
        SandLine.Repaint;
        SandLine.EnableDraw:=False;
      end
    else
    if PickShaleLine1.Checked then
      begin
        XValue:=DBChart1.Series[0].XScreenToValue(X);
        Shale_Line_Value:=XValue;
        YValue1:=DBChart1.Axes.Left.Minimum;
        YValue2:=DBChart1.Axes.Left.Maximum;
        if ShaleLine.EnableDraw then
          ShaleLine.Lines.AddLine(XValue, YValue1 , XValue, YValue2);
        ShaleLine.Repaint;
        ShaleLine.EnableDraw:=False;
      end;
  end;
end;


procedure TMainForm2.PickSandLine1Click(Sender: TObject);
begin
  if PickSandLine1.Checked then
    begin
      Line_Drawing:=False;
      PickSandLine1.Checked:=False;
    end
  else
    begin
      Line_Drawing:=True;
      PickSandLine1.Checked:=True;
      PickShaleLine1.Checked:=False;
    end;
end;

procedure TMainForm2.PickShaleLine1Click(Sender: TObject);
begin
  if PickShaleLine1.Checked then
    begin
      Line_Drawing:=False;
      PickShaleLine1.Checked:=False;
    end
  else
    begin
      Line_Drawing:=True;
      PickShaleLine1.Checked:=True;
      PickSandLine1.Checked:=False;
    end;
end;

procedure TMainForm2.ShaleSandVolumes1Click(Sender: TObject);
var
TempValue:Single;
i:integer;
begin
  with OpenedFile do
    begin
      Values.Open;
      Values.First;
      for i:=0 to Values.RecordCount-1 do
        begin
          Values.Edit;
          TempValue:=Values.Fields[GR_Track_Number].asFloat;
//          Values.Fields[4].Value:=(Shale_Line_Value - TempValue) / (Shale_Line_Value - Sand_Line_Value);

          Values.FieldByName('S_VOL').Value:=(Shale_Line_Value - TempValue) / (Shale_Line_Value - Sand_Line_Value);
          Values.FieldByName('SH_VOL').Value:=1 - (Shale_Line_Value - TempValue) / (Shale_Line_Value - Sand_Line_Value);
          Values.Next;
        end;
     Values.Refresh;
{      Properties.Append;
      Properties.Fields[2].AsFloat:=0;
      Properties.Fields[3].AsFloat:=1;}

      Find_S_VOL;
      Find_SH_VOL;

{
          DBChart4.Series[0].YValues.ValueSource:=Values.FieldDefs.Lookup('S_VOL');
          DBChart4.Series[0].YValues.Name:=Values.FieldByName('S_VOL').Name;
          DBChart4.Series[0].XValues.ValueSource:=Values.FieldByName('S_VOL').Name;
          DBChart4.Series[0].XValues.Name:=Values.FieldByName('S_VOL').Name;
          DBChart4.Series[0].DataSource:=Values;
          DBChart4.Series[0].CheckDataSource;

          DBChart4.Series[1].YValues.ValueSource:=Values.FieldByName('SH_VOL').Name;
          DBChart4.Series[1].YValues.Name:=Values.FieldByName('SH_VOL').Name;
          DBChart4.Series[1].XValues.ValueSource:=Values.FieldByName('SH_VOL').Name;
          DBChart4.Series[1].XValues.Name:=Values.FieldByName('SH_VOL').Name;
          DBChart4.Series[1].DataSource:=Values;

          DBChart4.Series[1].CheckDataSource;}

    end;
end;

procedure TMainForm2.DragLine_Sand(Sender: TObject);
var
i:integer;
begin
with Sender as TDrawLineTool do
  begin
    if PickSandLine1.Checked then
      begin
        Sand_Line_Value:=Selected.X0;
      end;
  end;
end;

procedure TMainForm2.DragLine_Shale(Sender: TObject);
var
i:integer;
begin
with Sender as TDrawLineTool do
  begin
    if PickShaleLine1.Checked then
      begin
        Shale_Line_Value:=Selected.X0;
      end
  end;
end;

procedure TMainForm2.DBChart5DblClick(Sender: TObject);
begin
  ChartEditor1.Chart:=DBChart5;
  ChartEditor1.Execute;
  CheckAxes;
end;

procedure TMainForm2.DBChart7DblClick(Sender: TObject);
begin
  ChartEditor1.Chart:=DBChart7;
  ChartEditor1.Execute;
  CheckAxes;
end;

procedure TMainForm2.DBChart8DblClick(Sender: TObject);
begin
  ChartEditor1.Chart:=DBChart8;
  ChartEditor1.Execute;
  CheckAxes;
end;

procedure TMainForm2.Porosity1Click(Sender: TObject);
begin
  PHI_Calculate(1);
end;


procedure TMainForm2.PHI_Calculate(MethodIndex: integer);
var
No_Values: Integer;
PHI_Value: Single;
For_PHI_Value:Single;
Neutron_Value:Single;
Depth_Value: Single;
i: Smallint;
begin
//try
with OpenedFile do
  begin
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
  No_Values:=OpenedFile.NoRecords;
  Values.First;
  for i:=0 to No_Values-1 do
    begin

      Values.Edit;
      Depth_Value:=Values.Fields[0].Value;

      if not Value_Is_Constant[1] then
        For_PHI_Value:=Values.Fields[For_PHI_Track_Number].Value
      else
        For_PHI_Value:=Constant_Value[1];
      if not Value_Is_Constant[2] then
        Neutron_Value:=Values.Fields[Neutron_Track_Number].Value
      else
        Neutron_Value:=Constant_Value[2];

      if (For_PHI_Value<> OpenedFile.NullValue) then
        begin
          if For_PHI_Value<0 then For_PHI_Value:=0;
          Case PHI_Calculation_Method of
            0: PHI_Value:=RoundTo((For_PHI_Value - Matrix_Value)/(Fluid_Value - Matrix_Value), Precision_Value);
            1: PHI_Value:=RoundTo((Matrix_Value - For_PHI_Value)/(Matrix_Value - Fluid_Value), Precision_Value);
            2: begin
                 if (Neutron_Value<> OpenedFile.NullValue) then
                   begin
                     if Neutron_Value<0 then Neutron_Value:=0;
                     PHI_Value:=RoundTo( 0.707 * sqrt(sqr(For_PHI_Value)+sqr(Neutron_Value)), Precision_Value);
                   end;
               end;
          end;
          if PHI_Value<0 then PHI_Value:=0;
          if PHI_Value>1 then PHI_Value:=1;
          case Lith_Type of
            0:Values.FieldByName('DPHI_SST').Value:=PHI_Value;
            1:Values.FieldByName('DPHI_LST').Value:=PHI_Value;
            2:Values.FieldByName('DPHI_DOL').Value:=PHI_Value;
          end;
//          Values.Fields[Values.FieldDefs.Count-1].Value:=PHI_Value;
        end
      else
        begin
          Values.Fields[Values.FieldDefs.Count-1].Value:=OpenedFile.NullValue;
        end;
      Values.Next;
    end;
  Find_DPHI_SST;
  Find_DPHI_LST;
  Find_DPHI_DOL;
end;
end;

end.


