unit Main_Form;

interface

uses
  TeeEdit, Dialogs, XpMan, Menus, Controls, Forms, VrControls,
  CheckLst, VrLabel, Graphics, ExtActns, StrUtils, Math, TeEngine, TeeLighting,
  VrScrollText, jpeg, ExtCtrls, Classes, StdCtrls, SysUtils,TeeStore, TeeThemes,
  TeeProcs, Chart, TeeTools, TeePageNumTool, Series,TeeEditCha, TeeThemeEditor,
  CurvFitt, TeeShape;
type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    OpenDialog1: TOpenDialog;
    ScrollBox1: TScrollBox;
    Open1: TMenuItem;
    Close1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    PrintDialog1: TPrintDialog;
    View1: TMenuItem;
    ChangeScale1: TMenuItem;
    NoScale1: TMenuItem;
    LAS1: TMenuItem;
    DLIS1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    VrScrollText1: TVrScrollText;
    Calculations1: TMenuItem;
    VsEstimation1: TMenuItem;
    MudLine1: TMenuItem;
    Castagna2: TMenuItem;
    Han1: TMenuItem;
    Krief1: TMenuItem;
    Poisson1: TMenuItem;
    Castagna1: TMenuItem;
    ElasticModules1: TMenuItem;
    N2: TMenuItem;
    CorrelationCoefficient1: TMenuItem;
    Velocity1: TMenuItem;
    Make1: TMenuItem;
    CrossPLOT1: TMenuItem;
    CompositeLog1: TMenuItem;
    ChartEditor1: TChartEditor;
    XPManifest1: TXPManifest;
    Litholog1: TMenuItem;
    LithosphericEstimation1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Close1Click(Sender: TObject);
    procedure CheckBoxClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure CreateChart(Chart_Title: String; Chart_Index: Smallint);
    procedure CreateCheckBox(CheckBox_Caption: String; CheckBox_Index: Smallint);
    procedure CreateHeader(Header_Caption: String; Header_Index: Smallint);
    procedure CreateSeries(Sender: TChart; Chart_Index: Smallint);
    procedure CreatePopupMenu(Sender: TChart);
    procedure Charts_Resize(Sender: TObject; var NewWidth, NewHeight: Integer;
                                             var Resize: Boolean);
    procedure PopupClicked(Sender: TObject);
    procedure PopLogarithmic(Sender: TObject);
    procedure PopPrintPages(Sender: TObject);
    procedure ChangeScale1Click(Sender: TObject);
    procedure NoScale1Click(Sender: TObject);
    procedure Zooming(Sender: TObject);
    procedure LAS1Click(Sender: TObject);
    procedure DLIS1Click(Sender: TObject);
    procedure ElasticModules1Click(Sender: TObject);
    procedure Calculate_Elastic_Modules(var VP_Track: Smallint;
                                        var VS_Track: Smallint;
                                        var RHO_Track: Smallint);
    procedure MudLine1Click(Sender: TObject);
    procedure Preparation(Title_Caption: string; DepthUnit_String: string;
                          Step_Value:Real; Null_Value:Real);
    procedure Velocity1Click(Sender: TObject);
    procedure CorrelationCoefficient1Click(Sender: TObject);
    procedure CrossPLOT1Click(Sender: TObject);
    procedure CompositeLog1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Han1Click(Sender: TObject);
    procedure HeadersDblClick(Sender: TObject);
    procedure Poisson1Click(Sender: TObject);
    procedure Krief1Click(Sender: TObject);
{    procedure ChartsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ChartsDragDrop(Sender, Source: TObject; X, Y: Integer);  }
    procedure Litholog1Click(Sender: TObject);
    procedure LithosphericEstimation1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Paging_Shown               :Boolean;
    Number_of_Headers          :Byte;
    CheckBox                   :array of TCheckBox;
    Headers                    :array of TCheckBox;
    Number_of_Tracks           :array of Byte;
    Vp_Track_Number            :Smallint;
    DTS_Track_Number           :Smallint;
    DTP_Track_Number           :Smallint;
    VS_Track_Number            :Smallint;
    RHO_Track_Number           :Smallint;
    Poisson_Track_Number       :Smallint;
    DTP_Mineral_Track_Number   :Smallint;
    DTP_Saturated_Track_Number :Smallint;
    DTP_Fluid_Track_Number     :Smallint;
    DTS_Mineral_Track_Number   :Smallint;
    LithoLog_Track_Number      :Smallint;
    Operation_Canceled         :Boolean;
    Vp_Unit                    :string;
    DTS_Unit                   :string;
    DTP_Unit                   :string;
    VS_Unit                    :string;
    RHO_Unit                   :string;
    DTP_Mineral_Unit           :string;
    DTP_Saturated_Unit         :string;
    DTP_Fluid_Unit             :string;
    DTS_Mineral_Unit           :string;
    Charts                     :array of TChart;
    XAxis_Track_Number,
    YAxis_Track_Number         :Smallint;
    Log_Values                 :array of THorizLineSeries;
    Han_Method                 :Shortint;
    Han_Volume                 :Shortint;
    LithoLog_Open        :Boolean;
    { Public declarations }
  end;
const
  Elastic_Modules :array [0..10] of string = ('Poisson Ratio','Bulk Modulus.GPa','Young Modulus.GPa',
                                              'Mu.GPa','Lambda.GPa','P-Impedance.g/sm2','S-Impedanceg/sm2',
                                              'Lambda/Mu','Vp/Vs','Lambda.Rho.GPaKg/m3','Mu.Rho.GPaKg/m3');

var
  MainForm             :TMainForm;
  Lines                :TStringList;
  Error_Code           :integer;
  CheckBox_Number      :Smallint;
  Number_of_Charts     :Smallint;
  Null_Value_String    :string[12];
  Null_Values          :array of Real;
  Depth_Value          :Real;
  Log_Value            :Real;
  ForFree1             :TLabel;
  TempFile             :TextFile;
  Is_ForFree1_Created  :Boolean;
  Chart_Number         :Smallint;
  Log_Scale            :Real;
  DepthUnit            :array of string[5];
  Step_Values          :array of Real;
  Charts_Scaled        :Boolean;
  Execute_File         :TFileRun;
  Max_Points_Per_Page  :array of Smallint;
  Conversion_Unit      :array of Real;
  TopAxes              :array of TChartAxis;
  Number_of_Composites :Smallint;
  Composite_Tracks_Number :array of Byte;
  ChartTools1          :TMarksTipTool;
  LithoLog_Created     :Boolean;

implementation

uses PagingPage, ZoomedChart, TrackSelection, DTSelection,
     CorrelationCoefficient, DTPSelection, CrossPlotTracks,
     CrossPlot, CompositeLog, HanModel, PoissonPage, KriefPage, LithoLog;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  CheckBox_Number:=0;
  Number_of_Charts:=0;
  Chart_Number:=0;
  Is_ForFree1_Created:=False;
  Charts_Scaled:=False;
  Paging_Shown:=False;
  Execute_File:=TFileRun.Create(Application);
  Number_of_Headers:=0;
  Number_of_Composites:=0;
  LithoLog_Created:=False;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Finalize(Headers);
  Finalize(Null_Values);
  Finalize(DepthUnit);
  Finalize(Step_Values);
  Finalize(Max_Points_Per_Page);
  Finalize(Conversion_Unit);
  Finalize(TopAxes);
  Finalize(CheckBox);
  Finalize(Number_of_Tracks);
  Finalize(Charts);
  Finalize(Log_Values);
  Finalize(Composite_Tracks_Number);
end;

procedure TMainForm.CreateChart(Chart_Title: String; Chart_Index: Smallint);
begin
  SetLength(Charts, Length(Charts)+1);
  Charts[Chart_Index]:=TChart.Create(ForFree1);
  Charts[Chart_Index].Top:=0;
  Charts[Chart_Index].Width:=200;
//  Charts[Chart_Index].Height:=400;
//  Charts[Chart_Index].Left:=200*Chart_Index + ScrollBox1.Width;
  Charts[Chart_Index].Left:=ScrollBox1.Left+ScrollBox1.Width+200*(Chart_Index)+10;
  Charts[Chart_Index].Align:=alLeft;
  Charts[Chart_Index].View3D:=False;
  Charts[Chart_Index].Color:=clWhite;//clBlack;
  Charts[Chart_Index].Legend.Visible:=False;
  Charts[Chart_Index].MarginUnits:=muPixels;
  Charts[Chart_Index].MarginTop:=0;
  Charts[Chart_Index].MarginLeft:=10;
  Charts[Chart_Index].MarginRight:=10;
  Charts[Chart_Index].MarginBottom:=10;
  Charts[Chart_Index].Title.Text.Text:=Chart_Title;
  Charts[Chart_Index].Title.Visible:=True;
  Charts[Chart_Index].Title.Font.Color:=clBlue;//$00F4F400;
  Charts[Chart_Index].Title.Font.Size:=10;
  Charts[Chart_Index].Title.Font.Name:='Tahoma';
  Charts[Chart_Index].Axes.Right.Visible:=False;
  Charts[Chart_Index].Axes.Bottom.Visible:=False;
  Charts[Chart_Index].Axes.Left.Title.Visible:=True;
  Charts[Chart_Index].Axes.Left.Title.Caption:='Depth('+DepthUnit[Chart_Index]+')';
  Charts[Chart_Index].Axes.Left.Title.Font.Color:=$00FF8000;
  Charts[Chart_Index].Axes.Left.Title.Font.Size:=8;
  Charts[Chart_Index].Axes.Left.Title.Font.Style:=[fsBold];
  Charts[Chart_Index].Axes.Left.Title.Font.Name:='Tahoma';
  Charts[Chart_Index].Axes.Left.Title.Font.InterCharSize:=10;
  Charts[Chart_Index].Axes.Left.Inverted:=True;
  Charts[Chart_Index].Axes.Left.Visible:=True;
  Charts[Chart_Index].Axes.Left.LabelsFont.Color:=clGray;
  Charts[Chart_Index].Title.Font.Style:=[fsBold];
  Charts[Chart_Index].Axes.Top.LabelsFont.Color:=clGray;
  Charts[Chart_Index].BevelInner:=bvNone;
  Charts[Chart_Index].BevelOuter:=bvNone;
  Charts[Chart_Index].Zoom.Brush.Color:=clYellow;
  Charts[Chart_Index].Zoom.Brush.Style:=bsSolid;
  Charts[Chart_Index].AllowPanning:=pmNone;
  Charts[Chart_Index].Zoom.Direction:=tzdVertical;
  Charts[Chart_Index].Tag:=CheckBox[Chart_Index].Tag;
  Charts[Chart_Index].Axes.Top.LabelStyle:=talValue;
  Charts[Chart_Index].Axes.Top.TickLength:=6;
  Charts[Chart_Index].Axes.Left.TickLength:=6;
  Charts[Chart_Index].Axes.Top.Ticks.Width:=2;
  Charts[Chart_Index].Axes.Left.Ticks.Width:=2;
  Charts[Chart_Index].Axes.Top.MinorTickLength:=4;
  Charts[Chart_Index].Axes.Left.MinorTickLength:=4;
  Charts[Chart_Index].Axes.Top.MinorTickCount:=4;
  Charts[Chart_Index].Axes.Left.MinorTickCount:=4;
  Charts[Chart_Index].Axes.Top.MinorGrid.Color:=clGray;
  Charts[Chart_Index].Axes.Top.MinorGrid.Style:=psDot;
  Charts[Chart_Index].Axes.Top.LabelsOnAxis:=True;
  Charts[Chart_Index].Axes.Left.LabelsOnAxis:=True;
  Charts[Chart_Index].Axes.Top.RoundFirstLabel:=True;
  Charts[Chart_Index].Axes.Left.RoundFirstLabel:=True;
  Charts[Chart_Index].Axes.Top.MaximumOffset:=10;
  Charts[Chart_Index].Axes.Top.MinimumOffset:=10;
  Charts[Chart_Index].Axes.Top.AxisValuesFormat:='#0.####';
  Charts[Chart_Index].Axes.Left.AxisValuesFormat:='#0.####';
  Charts[Chart_Index].Walls.Back.Pen.Width:=2;
  Charts[Chart_Index].OnZoom:=Zooming;
  Charts[Chart_Index].OnCanResize:=Charts_Resize;
//  Charts[Chart_Index].OnDragDrop:=ChartsDragDrop;
//  Charts[Chart_Index].OnDragOver:=ChartsDragOver;
//  Charts[Chart_Index].Zoom.MouseButton:=mbMiddle;
//  Charts[Chart_Index].DragMode:=dmAutomatic;
  CreatePopupMenu(Charts[Chart_Index]);
  ChartTools1:=TMarksTipTool.Create(ForFree1);
  ChartTools1.ParentChart:=Charts[Chart_Index];
  ChartTools1.Series:=nil;
  ChartTools1.Style:=smsXY;
  ChartTools1.MouseDelay:=0;
  ChartTools1.MouseAction:=mtmClick;
end;

procedure TMainForm.CreateSeries(Sender: TChart; Chart_Index: Smallint);
begin
  SetLength(Log_Values, Length(Log_Values)+1);
  Log_Values[Chart_Index]:=THorizLineSeries.Create(ForFree1);
  Log_Values[Chart_Index].Name:='Track_'+IntToStr(Chart_Index+1);
  Log_Values[Chart_Index].Stairs:=True;
  Log_Values[Chart_Index].Pen.Width:=1;
  Log_Values[Chart_Index].HorizAxis:=aTopAxis;
  Log_Values[Chart_Index].Color:=clGreen;
  Log_Values[Chart_Index].ParentChart:=Sender;
  Number_of_Tracks[Number_of_Headers-1]:=Number_of_Tracks[Number_of_Headers-1]+1;
end;

procedure TMainForm.CreateCheckBox(CheckBox_Caption: String; CheckBox_Index: Smallint);
begin
  SetLength(CheckBox, Length(CheckBox)+1);
  CheckBox[CheckBox_Index]:=TCheckBox.Create(ForFree1);
  CheckBox[CheckBox_Index].Top:=15*(CheckBox_Number);
  CheckBox[CheckBox_Index].Left:=15;
//  CheckBox[CheckBox_Index].Align:=alTop;
  CheckBox[CheckBox_Index].Font.Color:=$00FF8000;
  CheckBox[CheckBox_Index].Font.Name:='Tahoma';
  CheckBox[CheckBox_Index].Font.Size:=8;
  CheckBox[CheckBox_Index].Caption:=CheckBox_Caption;
  CheckBox[CheckBox_Index].Checked:=True;
  CheckBox[CheckBox_Index].Width:=150;
  CheckBox[CheckBox_Index].Tag:=Chart_Number;
  CheckBox[CheckBox_Index].OnClick:=CheckBoxClick;
  CheckBox[CheckBox_Index].Parent:=ScrollBox1;
  CheckBox[CheckBox_Index].Repaint;
  CheckBox_Number:=CheckBox_Number+1;
end;

procedure TMainForm.CreateHeader(Header_Caption: String; Header_Index: Smallint);
begin
  SetLength(Headers, Length(Headers)+1);
  Headers[Header_Index]:=TCheckBox.Create(ForFree1);
  Headers[Header_Index].Caption:=Header_Caption;
//  Headers[Header_Index].AutoSize:=True;
  Headers[Header_Index].Width:=150;
  Headers[Header_Index].Top:=15*CheckBox_Number;
//  Headers[Header_Index].Align:=alTop;
  Headers[Header_Index].Left:=0;
  Headers[Header_Index].Font.Style:=[fsBold];
  Headers[Header_Index].Font.Size:=9;
  Headers[Header_Index].Font.Name:='Tahoma';
  Headers[Header_Index].Font.Color:=clGreen;
  Headers[Header_Index].Checked:=True;
//  Headers[Header_Index].Transparent:=True;
//  Headers[Header_Index].Style:=lsNone;
  Headers[Header_Index].Parent:=ScrollBox1;
  Headers[Header_Index].Repaint;
  Headers[Header_Index].Tag:=Number_of_Headers;
  Headers[Header_Index].OnClick:=HeadersDblClick;
  Number_of_Headers:=Number_of_Headers+1;
  SetLength(Number_of_Tracks, Number_of_Headers);
  CheckBox_Number:=CheckBox_Number+1;
end;

procedure TMainForm.HeadersDblClick(Sender: TObject);
var
i: Smallint;
No_CheckBox: Smallint;
begin
  No_CheckBox:=0;
  with Sender as TCheckBox do
    begin
      if Tag>0 then
        begin
          for i:=0 to Tag-1 do
            begin
              No_CheckBox:=No_CheckBox+Number_of_Tracks[i];
            end;
        end
      else
        No_CheckBox:=0;
      if Checked then
        begin
          Repaint;
          for i:=(No_CheckBox) to (No_CheckBox+Number_of_Tracks[Tag]-1) do
            CheckBox[i].Checked:=True;
        end
      else
        begin
          Repaint;
          for i:=(No_CheckBox) to (No_CheckBox+Number_of_Tracks[Tag]-1) do
            CheckBox[i].Checked:=False;
        end;
    end;
end;

procedure TMainForm.Charts_Resize(Sender: TObject;
                                  var NewWidth, NewHeight: Integer;
                                  var Resize: Boolean);
var
i: Smallint;
begin
  with Sender as TChart do
    begin
      if Charts_Scaled then
        begin
          for i:=0 to Number_of_Charts-1 do
            begin
              if i<>LithoLog_Track_Number then
                begin
                  Max_Points_Per_Page[i]:=Round(Log_Scale/ABS(Step_Values[i])*(NewHeight-47-MarginBottom)/Conversion_Unit[i]);
(**************** 47 is difference between chart.height and the height of its chart.rect ***********************)
                  MaxPointsPerPage:=Max_Points_Per_Page[i];
                end;
            end;
        end;
    end;
end;

procedure TMainForm.CreatePopupMenu(Sender: TChart);
var
NewItem: TMenuItem;
Popup:TPopupMenu;
begin
  with Sender do
    begin
      Popup:=TPopupMenu.Create(ForFree1);
      Popup.AutoPopup:=True;
      Popup.Tag:=Tag;
      NewItem:=TMenuItem.Create(PopupMenu);
      NewItem.Tag:=Tag;
      Popup.Items.Add(NewItem);
      NewItem.Caption:='Print';
      NewItem.OnClick:=PopupClicked;
      NewItem:=TMenuItem.Create(PopupMenu);
      Popup.Items.Add(NewItem);
      NewItem.Enabled:=False;
      NewItem.Caption:='Print Pages';
      NewItem.OnClick:=PopPrintPages;
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
            ChartEditor1.Chart:=Charts[GetParentMenu.Tag];
            ChartEditor1.DefaultTab:=cetPrintPreview;
            ChartEditor1.Execute;
          end;
        1:;
        2:begin
            ChartEditor1.Chart:=Charts[GetParentMenu.Tag];
            ChartEditor1.DefaultTab:=cetExport;
            ChartEditor1.Execute;
          end;
        3:;
        4:begin
            ChartEditor1.Chart:=Charts[GetParentMenu.Tag];
            ChartEditor1.DefaultTab:=cetAxis;
            ChartEditor1.Execute;
          end;
        5:;
        6:begin
            ChartEditor1.Chart:=Charts[GetParentMenu.Tag];
            ChartEditor1.DefaultTab:=cetSeriesData;
            ChartEditor1.Execute;
          end;
        7:;
        8:begin
            ChartEditor1.Chart:=Charts[GetParentMenu.Tag];
            ChartEditor1.DefaultTab:=cetMain;
            ChartEditor1.Execute;
          end;
      end;
    end;
end;

procedure TMainForm.PopLogarithmic(Sender: TObject);
var
Is_Logarithmic:Boolean;
XMIN: Real;
begin
  with Sender as TMenuItem do
    begin
      XMIN:=Charts[GetParentMenu.Tag].Axes.Top.Minimum;
      if XMIN>=0 then
        begin
          Is_Logarithmic:=Charts[GetParentMenu.Tag].Axes.Top.Logarithmic;
          if Is_Logarithmic then
            begin
              Charts[GetParentMenu.Tag].Axes.Top.Logarithmic:=False;
              Caption:='Make Logarithmic';
            end
          else
            begin
              Charts[GetParentMenu.Tag].Axes.Top.Logarithmic:=True;
              Caption:='Make Ordinal';
            end;
        end
      else
        MessageDlg('Minimum has to be greater than or equal to zero (Change range minimum value).', mtWarning, [mbOk],0);
    end;
end;

procedure TMainForm.PopPrintPages(Sender: TObject);
begin
  with Sender as TMenuItem do
    begin
      With PrintDialog1 do
        begin
          FromPage:=1;
          ToPage:=Charts[Tag].NumPages;
          MinPage:=FromPage;
          MaxPage:=ToPage;
          if Execute then
            Charts[Tag].PrintPages(FromPage,ToPage);
        end;
    end;
end;

procedure TMainForm.Close1Click(Sender: TObject);
begin
  if Is_ForFree1_Created then
    begin
//      Color:=clWhite;
      ForFree1.Free;
      Is_ForFree1_Created:=False;
      LithoLog_Created:=False;
      LithoLog_Open:=False;
      Number_of_Headers:=0;
      Charts_Scaled:=False;
      CheckBox_Number:=0;
      Number_of_Charts:=0;
      Chart_Number:=0;
      Log_Scale:=0;
      Number_of_Composites:=0;
      Paging_Shown:=False;
      Label1.Visible:=True;
      Label2.Visible:=True;
      Image1.Visible:=True;
      VrScrollText1.Visible:=True;
      Vp_Track_Number:=-1;
      DTS_Track_Number:=-1;
      VP_Track_Number:=-1;
      VS_Track_Number:=-1;
      Finalize(Headers);
      Finalize(Null_Values);
      Finalize(DepthUnit);
      Finalize(Step_Values);
      Finalize(Max_Points_Per_Page);
      Finalize(Conversion_Unit);
      Finalize(TopAxes);
      Finalize(CheckBox);
      Finalize(Number_of_Tracks);
      Finalize(Charts);
      Finalize(Log_Values);
      Finalize(Composite_Tracks_Number);
    end;
end;

procedure TMainForm.CheckBoxClick(Sender: TObject);
begin
  with Sender as TCheckBox do
    begin
      if Checked then
        begin
          Repaint;
          Charts[Tag].Visible:=True;
        end;
      if not(Checked) then
        begin
          Repaint;
          Charts[Tag].Visible:=False;
        end;
    end;
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  If Is_ForFree1_Created then
    ForFree1.Free;
  Close;
end;

procedure TMainForm.ChangeScale1Click(Sender: TObject);
var
i: Smallint;
Scale_Value:String;
Clicked_Ok:Boolean;
begin
  if CheckBox_Number=0 then Exit;
  if Length(Charts)<>0 then
    begin
      Scale_Value:=FloatToStr(Log_Scale);
      Clicked_Ok:=InputQuery('Scale Value', 'Please enter the scale value:', Scale_Value);
      if Clicked_Ok then
        begin
          Log_Scale:=StrToFloat(Scale_Value);
          for i:=0 to Number_of_Charts-1 do
            begin
              SetLength(Conversion_Unit, Length(Conversion_Unit)+1);
              SetLength(Max_Points_Per_Page, Length(Max_Points_Per_Page)+1);
              if i<>LithoLog_Track_Number then
                begin
                  if DepthUnit[i]='FT' then
                    begin
                      Conversion_Unit[i]:=1152;
                    end;
                  if DepthUnit[i]='F' then
                    begin
                      Conversion_Unit[i]:=1152;
                    end;
                  if DepthUnit[i]='M' then
                    begin
                      Conversion_Unit[i]:=3779.527559055;
                    end;
                  if DepthUnit[i]='SEC' then
                    begin
                      Conversion_Unit[i]:=Log_Scale;
                    end;
                  Max_Points_Per_Page[i]:=Round(Log_Scale/ABS(Step_Values[i])*(Charts[i].ChartRect.Bottom-Charts[i].ChartRect.Top)/Conversion_Unit[i]);
                  Charts[i].MaxPointsPerPage:=Max_Points_Per_Page[i];
                  Charts[i].ScaleLastPage:=False;
                  Charts[i].AllowPanning:=pmVertical;
                  Charts[i].PopupMenu.Items[1].Enabled:=True;
                end;
            end;
          if not Paging_Shown then
            begin
              Paging:=TPaging.Create(ForFree1);
              Paging.Show;
              Paging_Shown:=True;
            end;
          Charts_Scaled:=True;
      end;
    end;
end;

procedure TMainForm.NoScale1Click(Sender: TObject);
var
i:integer;
begin
  if CheckBox_Number=0 then Exit;
  if Charts_Scaled then
    begin
      for i:=0 to Number_of_Charts-1 do
        begin
          Charts[i].MaxPointsPerPage:=0;
          Charts[i].AllowPanning:=pmNone;
          Charts[i].PopupMenu.Items[1].Enabled:=False;
        end;
      Paging.Free;
      Charts_Scaled:=False;
      Paging_Shown:=False;
    end;
end;

procedure TMainForm.Zooming( Sender: TObject);
begin
  with Sender as TChart do
    begin
      SaveChartToFile(TCustomChart(Sender),'rocklog_temp',True);
      ZoomChart:=TZoomChart.Create(Self);
      UndoZoom;
      ZoomChart.Show;
    end;
end;

procedure TMainForm.LAS1Click(Sender: TObject);
var
i,j,k,l,m,n: integer;
p1,p2,p3:Smallint;
s1,s2,s3,s4:string;
DepthUnit_String: string[5];
Step_Value_String: string[6];
begin
  if OpenDialog1.Execute then
    begin
      for i:=0 to OpenDialog1.Files.Count-1 do
        begin
          if not(Is_ForFree1_Created) then
            begin
              ForFree1:=TLabel.Create(Self);
              Is_ForFree1_Created:=True;
            end;
          Label1.Visible:=False;
          Label2.Visible:=False;
          Image1.Visible:=False;
          VrScrollText1.Visible:=False;
(********* Get file name without its complete path *)
          s1:=ReverseString(OpenDialog1.Files[i]);
          p1:=Pos('\',s1);
          s1:=ReverseString(s1);
          p2:=Length(s1)-p1+2;
          s2:=Copy(s1,p2,p1);
(***************************************************)
          CreateHeader(s2,Number_of_Headers);
          Lines:=TStringList.Create;
          Lines.LoadFromFile(OpenDialog1.Files[i]);
(********* To find depth units *********************)
          for j:=0 to Lines.Count-1 do
            begin
              s1:=Lines[j];
              p1:=Pos('STOP',s1);
              if p1<>0 then Break;
            end;
          k:=j;
          s1:=Lines[k];
          s1:=Trim(s1);
          m:=Pos('.',s1);
          n:=PosEx(' ', s1, m);
          s2:=Copy(s1,m+1,n-m);
          s2:=Trim(s2);
          DepthUnit_String:=s2;
(***************************************************)
(********* To find step values *********************)
          k:=k+1;
          s1:=Lines[k];
          s1:=Trim(s1);
          m:=Pos('.',s1);
          n:=PosEx(':',s1,m);
          s2:=Copy(s1,m+4,n-m-1);
          s2:=Trim(s2);
          Step_Value_String:=s2;
(***************************************************)
(********* To find null values *********************)
          k:=k+1;
          s1:=Lines[k];
          m:=Pos('-',s1);
          n:=PosEx(':',s1,m);
          s2:=Copy (s1,m,n-m);
          s2:=Trim(s2);
          Null_Value_String:=s2;
(***************************************************)
(********* To add curves information ***************)
          For j:=k+1 to Lines.Count-1 do
            begin
              s1:=Lines[j];
              p1:=Pos('~C',s1);
              if p1<>0 then Break;
            end;
          k:=j+1;
          repeat
            s1:=Lines[k];
            s1:=TrimLeft(s1);
            s2:='';
            s3 := Copy( s1, 1, 1);
            p1:=Pos('.', s1)+5;
            s2 := Copy( s1, 1, p1);
            s2:=Trim(S2);
            s4:=Copy(s1,1,4);
            p2:=Pos('DEPT', s1);
            p3:=Pos('TIME', s1);
            if ((p1<>0)and(p2=0)and(p3=0)and(not(s2=''))and(not(s3='~'))and(not(s3='#'))and(not(s4='DEPT'))) then
              begin
                Preparation(s2,DepthUnit_String,StrToFloat(Step_Value_String),StrToFloat(Null_Value_String));
              end;
            k:=k+1;
          until s3='~';
(**************** Reading file data ************************)
          AssignFile(TempFile,OpenDialog1.Files[i]);
          Reset(TempFile);
          for l:=k-1 to Lines.Count-1 do
            begin
              s1:=Lines[l];
              p1:=Pos('~A',s1);
              if p1<>0 then Break;
            end;
          for n:=0 to l do
            Readln(TempFile);
          while not(EoF(TempFile)) do
            begin
              try
                Read(TempFile,Depth_Value);
                for k:=Number_of_Charts to Chart_Number-1 do
                  begin
                    Read(TempFile,Log_Value);
                    if  not(Null_Values[k]=Log_Value) then
                      Charts[k].Series[0].AddXY(Log_Value,Depth_Value);
                  end;
                Readln(TempFile);
              except
                Break;
              end;
            end;
(***********************************************************)
          Number_of_Charts:=Chart_Number;
          CloseFile(TempFile);
          Lines.Free;
        end;
      ScrollBox1.Invalidate;
//      Color:=clBlack;
    end;
end;

procedure TMainForm.DLIS1Click(Sender: TObject);
begin
  Execute_File.FileName:='dlisconverter.exe';
  if not Execute_File.Execute then
    begin
      MessageDlg('Specified module not found. Please reinstall the program.', mtError, [mbOk],0);
    end;
end;

procedure TMainForm.ElasticModules1Click(Sender: TObject);
begin
  if CheckBox_Number=0 then Exit;
  Operation_Canceled:=False;
  VP_Track_Number:=-1;
  VS_Track_Number:=-1;
  RHO_Track_Number:=-1;
  Track_Selection:=TTrack_Selection.Create(Self);
  Track_Selection.ShowModal;
  Track_Selection.Free;
  if Operation_Canceled then Exit;
  Calculate_Elastic_Modules(VP_Track_Number,VS_Track_Number,RHO_Track_Number);
end;

procedure TMainForm.Calculate_Elastic_Modules(var VP_Track: Smallint;
                                              var VS_Track: Smallint;
                                              var RHO_Track: Smallint);
var
No_VP_Values: Integer;
No_VS_Values: Integer;
No_RHO_Values: Integer;
VP_Value: Real;
VS_Value: Real;
RHO_Value: Real;
VP_Depth_Value: Real;
VS_Depth_Value: Real;
RHO_Depth_Value: Real;
i,j: Smallint;
DepthUnit_String: string[5];
Step_Value:Real;
Null_Value:Real;
begin
  VP_Value:=-999.25;
  VS_Value:=-999.25;
  RHO_Value:=-999.25;
  No_VP_Values:=Log_Values[VP_Track].Count;
  No_VS_Values:=Log_Values[VS_Track].Count;
  No_RHO_Values:=Log_Values[RHO_Track].Count;
  CreateHeader('Elastic Moduli',Length(Headers));
  DepthUnit_String:=DepthUnit[VP_Track];
  Step_Value:=Step_Values[VP_Track];
  Null_Value:=Null_Values[VP_Track];
  if ( (VP_Track<>-1)and(VS_Track<>-1)and(RHO_Track<>-1) ) then
    begin
      for i:=0 to 10 do
        begin
          Preparation(Elastic_Modules[i],DepthUnit_String,Step_Value,Null_Value);
        end;
      if (No_VP_Values=No_VS_Values)and(No_VS_Values=No_RHO_Values) then
        begin
          for j:=0 to No_VP_Values-1 do
            begin
              if VP_Unit='FT/S' then
                VP_Value:=({0.001*}0.3048)*Charts[VP_Track].Series[0].XValue[j]
              else if Vp_Unit='KM/S' then
                VP_Value:=Charts[Vp_Track].Series[0].XValue[j];
              if Vs_Unit='FT/S' then
                Vs_Value:=({0.001*}0.3048)*Charts[Vs_Track].Series[0].XValue[j]
              else if Vs_Unit='KM/S' then
                Vs_Value:=Charts[Vs_Track].Series[0].XValue[j];
              if RHO_Unit='G/CM3' then
                RHO_Value:=1000*Charts[RHO_Track].Series[0].XValue[j]
              else if RHO_Unit='KG/M3' then
                RHO_Value:=Charts[RHO_Track].Series[0].XValue[j];
              VP_Depth_Value:=Charts[VP_Track].Series[0].YValue[j];
              VS_Depth_Value:=Charts[VS_Track].Series[0].YValue[j];
              RHO_Depth_Value:=Charts[RHO_Track].Series[0].YValue[j];
              if (VP_Depth_Value=VS_Depth_Value)and(VS_Depth_Value=RHO_Depth_Value) then
                begin
                  Depth_Value:=Charts[VP_Track].Series[0].YValue[j];
{                    ('Poisson Ratio','Bulk Modulus.GPa','Young Modulus.GPa',
                     'Mu.GPa','Lambda.GPa','P-Impedance.g/sm2','S-Impedanceg/sm2',
                     'Lambda/Mu','Vp/Vs','Lambda.Rho.GPaKg/m3','Mu.Rho.GPaKg/m3');}
                  Charts[Length(Charts)-11].Series[0].AddXY((sqr(VP_Value)-2*sqr(VS_Value))/(2*(sqr(VP_Value)-sqr(VS_Value))),VP_Depth_Value);
                  Charts[Length(Charts)-10].Series[0].AddXY(0.001*RHO_Value*(sqr(VP_Value)-4/3*sqr(VS_Value)),VP_Depth_Value);
                  Charts[Length(Charts)-9].Series[0].AddXY(0.001*RHO_Value*sqr(VS_Value)*((3*sqr(VP_Value)-4*sqr(VS_Value))/(sqr(VP_Value)-sqr(VS_Value))),VP_Depth_Value);
                  Charts[Length(Charts)-8].Series[0].AddXY(0.001*RHO_Value*(sqr(VS_Value)),VP_Depth_Value);
                  Charts[Length(Charts)-7].Series[0].AddXY(0.001*RHO_Value*(sqr(VP_Value)-2*sqr(VS_Value)),VP_Depth_Value);
                  Charts[Length(Charts)-6].Series[0].AddXY(RHO_Value*VP_Value,VP_Depth_Value);
                  Charts[Length(Charts)-5].Series[0].AddXY(RHO_Value*VS_Value,VP_Depth_Value);
                  Charts[Length(Charts)-4].Series[0].AddXY((sqr(VP_Value)-2*sqr(VS_Value))/(sqr(VS_Value)),VP_Depth_Value);
                  Charts[Length(Charts)-3].Series[0].AddXY(VP_Value/VS_Value,VP_Depth_Value);
                  Charts[Length(Charts)-2].Series[0].AddXY(0.001*sqr(RHO_Value)*(sqr(VP_Value)-2*(sqr(VS_Value))),VP_Depth_Value);
                  Charts[Length(Charts)-1].Series[0].AddXY(0.001*sqr(RHO_Value)*(sqr(VS_Value)),VP_Depth_Value);
                end;
            end;
        end;
    end;

end;

procedure TMainForm.MudLine1Click(Sender: TObject);
var
No_Vp_Values: Integer;
Vp_Value: Real;
Vs_Value: Real;
Vp_Depth_Value: Real;
i: Smallint;
DepthUnit_String: string[5];
Step_Value:Real;
begin
  if CheckBox_Number=0 then Exit;
  Vp_Track_Number:=-1;
  Vp_Value:=-999.25;
  Vs_Value:=-999.25;
  Operation_Canceled:=False;
  Vp_Selection:=TVp_Selection.Create(Self);
  Vp_Selection.ShowModal;
  Vp_Selection.Free;
  if Operation_Canceled then Exit;
  No_Vp_Values:=Log_Values[VP_Track_Number].Count;
  CreateHeader('Vs Estimation',Length(Headers));
  DepthUnit_String:=DepthUnit[VP_Track_Number];
  Step_Value:=Step_Values[VP_Track_Number];
  Preparation('VS_MUDROCK.'+Vs_Unit,DepthUnit_String,Step_Value,Vs_Value);
  for i:=0 to No_Vp_Values-1 do
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
      Vp_Depth_Value:=Charts[Vp_Track_Number].Series[0].YValue[i];
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
    end;
  Number_of_Charts:=Chart_Number;
end;

procedure TMainForm.Preparation(Title_Caption: string; DepthUnit_String: string;
                                Step_Value:Real; Null_Value:Real);

begin
  SetLength(DepthUnit, Length(DepthUnit)+1);
  DepthUnit[Chart_Number]:=DepthUnit_String;
  SetLength(Step_Values, Length(Step_Values)+1);
  Step_Values[Chart_Number]:=Step_Value;
  SetLength(Null_Values, Length(Null_Values)+1);
  Null_Values[Chart_Number]:=Null_Value;
  CreateCheckBox(Title_Caption,Chart_Number);
  CreateChart(Title_Caption, Chart_Number);
  CreateSeries(Charts[Chart_Number], Chart_Number);
  Charts[Chart_Number].Parent:=MainForm;
  Charts[Chart_Number].Show;
  Chart_Number:=Chart_Number+1;
end;

procedure TMainForm.Velocity1Click(Sender: TObject);
var
No_DTP_Values: Integer;
No_DTS_Values: Integer;
DTP_Value: Real;
DTS_Value: Real;
Vs_Value: Real;
Vp_Value: Real;
DTP_Depth_Value: Real;
DTS_Depth_Value: Real;
i: Smallint;
DepthUnit_String: string[5];
Step_Value:Real;
Null_Value:Real;
begin
  if CheckBox_Number=0 then Exit;
  DTP_Value:=-999.25;
  DTS_Value:=-999.25;
  DTP_Track_Number:=-1;
  DTS_Track_Number:=-1;
  Operation_Canceled:=False;
  DT_Selection:=TDT_Selection.Create(Self);
  DT_Selection.ShowModal;
  DT_Selection.Free;
  if Operation_Canceled then Exit;
  No_DTP_Values:=Log_Values[DTP_Track_Number].Count;
  CreateHeader('Velocity Logs',Length(Headers));
  DepthUnit_String:=DepthUnit[DTP_Track_Number];
  Step_Value:=Step_Values[DTP_Track_Number];
  Null_Value:=Null_Values[DTP_Track_Number];
  Preparation('VP.' + Vp_Unit,DepthUnit_String,Step_Value,Null_Value);
  for i:=0 to No_DTP_Values-1 do
    begin
      if DTP_Unit='US/FT' then
        DTP_Value:=0.000001/0.3048*Charts[DTP_Track_Number].Series[0].XValue[i]
      else if DTP_Unit='US/M' then
        DTP_Value:=0.000001*Charts[DTP_Track_Number].Series[0].XValue[i]
      else
        begin
          MessageDlg('No measurment unit selected for DTP.',mtError,[mbOk],0);
          Exit;
        end;
      if DTP_Value<>0 then
        Vp_Value:=0.001/DTP_Value
      else
        Vp_Value:=0;
      DTP_Depth_Value:=Charts[DTP_Track_Number].Series[0].YValue[i];
      if Vp_Unit='KM/S' then
        Charts[Length(Charts)-1].Series[0].AddXY(Vp_Value,DTP_Depth_Value)
      else if Vp_Unit='FT/S' then
        Charts[Length(Charts)-1].Series[0].AddXY(1000/0.3048*Vp_Value,DTP_Depth_Value)
      else
        begin
          MessageDlg('No measurment unit selected for Vp.',mtError,[mbOk],0);
          Exit;
        end;
    end;
  if DTS_Track_Number<>-1 then
    begin
      No_DTS_Values:=Log_Values[DTS_Track_Number].Count;
      DepthUnit_String:=DepthUnit[DTS_Track_Number];
      Step_Value:=Step_Values[DTS_Track_Number];
      Null_Value:=Null_Values[DTS_Track_Number];
      Preparation('VS.' + Vs_Unit,DepthUnit_String,Step_Value,Null_Value);
      for i:=0 to No_DTS_Values-1 do
        begin
          if DTS_Unit='US/FT' then
            DTS_Value:=0.000001/0.3048*Charts[DTS_Track_Number].Series[0].XValue[i]
          else if DTS_Unit='US/M' then
            DTS_Value:=0.000001*Charts[DTS_Track_Number].Series[0].XValue[i]
          else
            begin
              MessageDlg('No measurment unit selected for DTS.',mtError,[mbOk],0);
              Exit;
          end;
          if DTS_Value<>0 then
            Vs_Value:=0.001/DTS_Value
          else
            Vs_Value:=0;
          DTS_Depth_Value:=Charts[DTS_Track_Number].Series[0].YValue[i];
          if Vs_Unit='KM/S' then
            Charts[Length(Charts)-1].Series[0].AddXY(Vs_Value,DTS_Depth_Value)
          else if Vs_Unit='FT/S' then
            Charts[Length(Charts)-1].Series[0].AddXY(1000/0.3048*Vs_Value,DTS_Depth_Value)
          else
            begin
              MessageDlg('No measurment unit selected for Vs.',mtError,[mbOk],0);
              Exit;
            end;
        end;
    end;
  Number_of_Charts:=Chart_Number;
end;

procedure TMainForm.CorrelationCoefficient1Click(Sender: TObject);
begin
  if CheckBox_Number=0 then Exit;
  Correlation_Coefficient:=TCorrelation_Coefficient.Create(Self);
  Correlation_Coefficient.ShowModal;
  Correlation_Coefficient.Free;
end;

procedure TMainForm.CrossPLOT1Click(Sender: TObject);
begin
  if CheckBox_Number=0 then Exit;
  Operation_Canceled:=False;
  Cross_Plot_Tracks:=TCross_Plot_Tracks.Create(Self);
  Cross_Plot_Tracks.ShowModal;
  Cross_Plot_Tracks.Free;
  If Operation_Canceled then Exit;
  Cross_Plot:=TCross_Plot.Create(Self);
  Cross_Plot.Show;
end;

procedure TMainForm.CompositeLog1Click(Sender: TObject);
var
i: Smallint;
DepthUnit_String: string[5];
Step_Value:Real;
Null_Value:Real;
begin
  if CheckBox_Number=0 then Exit;
  Operation_Canceled:=False;
  Composite_Log:=TComposite_Log.Create(Self);
  Composite_Log.ShowModal;
  If Operation_Canceled then Exit;
  for i:=0 to Length(Composite_Log.Tracks_Number)-1 do
    begin
      SetLength(Composite_Tracks_Number, Length(Composite_Tracks_Number)+1);
      Composite_Tracks_Number[i]:=Composite_Log.Tracks_Number[i];
    end;
  CreateHeader('Composite Log',Length(Headers));
  DepthUnit_String:=DepthUnit[Composite_Tracks_Number[0]];
  Step_Value:=Step_Values[Composite_Tracks_Number[0]];
  Null_Value:=Null_Values[Composite_Tracks_Number[0]];
  SetLength(DepthUnit, Length(DepthUnit)+1);
  DepthUnit[Chart_Number]:=DepthUnit_String;
  SetLength(Step_Values, Length(Step_Values)+1);
  Step_Values[Chart_Number]:=Step_Value;
  SetLength(Null_Values, Length(Null_Values)+1);
  Null_Values[Chart_Number]:=Null_Value;
  CreateCheckBox('Composite Log '+IntToStr(Number_of_Composites+1),Chart_Number);
  CreateChart('Composite Log '+IntToStr(Number_of_Composites+1), Chart_Number);
  for i:=0 to Length(Composite_Tracks_Number)-1 do
    begin
      SetLength(Log_Values, Length(Log_Values)+1);
      Log_Values[Chart_Number]:=THorizLineSeries.Create(ForFree1);
      Log_Values[Chart_Number].Stairs:=True;
      Log_Values[Chart_Number].Pen.Width:=1;
      Log_Values[Chart_Number].HorizAxis:=aTopAxis;
      Log_Values[Chart_Number].ParentChart:=Charts[Chart_Number];
      Charts[Chart_Number].CustomAxes.Add;
      SetLength(TopAxes, Length(Topaxes)+1);
      TopAxes[i]:=Charts[Chart_Number].CustomAxes[i];
      TopAxes[i].Axis.Color:=Log_Values[Chart_Number].Color;
      TopAxes[i].Title.Font.Color:=Log_Values[Chart_Number].Color;
      TopAxes[i].Title.Font.Size:=8;
      TopAxes[i].Title.Font.Name:='Tahoma';
      TopAxes[i].Title.Caption:=Charts[Composite_Tracks_Number[i]].Title.Caption;
      TopAxes[i].LabelsFont.Color:=Log_Values[Chart_Number].Color;
      TopAxes[i].Horizontal:=True;
      TopAxes[i].PositionUnits:=muPixels;
      TopAxes[i].PositionPercent:=(i)*(-40);
      Charts[Chart_Number].MarginBottom:=(i+1)*40;
      Charts[Chart_Number].MarginTop:=47;
      Charts[Chart_Number].Title.Top:=0;
      Charts[Chart_Number].Title.Left:=50;
      Log_Values[Chart_Number].CustomHorizAxis:=TopAxes[i];
      Log_Values[Chart_Number].XValues.Count := Charts[Composite_Tracks_Number[i]].Series[0].XValues.Count;
      Log_Values[Chart_Number].XValues.Value := Charts[Composite_Tracks_Number[i]].Series[0].XValues.Value;
      Log_Values[Chart_Number].XValues.Modified:=True;
      Log_Values[Chart_Number].YValues.Count := Charts[Composite_Tracks_Number[i]].Series[0].YValues.Count;
      Log_Values[Chart_Number].YValues.Value := Charts[Composite_Tracks_Number[i]].Series[0].YValues.Value;
      Log_Values[Chart_Number].YValues.Modified:=True;
    end;
  Charts[Chart_Number].Parent:=MainForm;
  Charts[Chart_Number].Show;
  Chart_Number:=Chart_Number+1;
  Number_of_Charts:=Chart_Number;
  Number_of_Tracks[Length(Number_of_Tracks)-1]:=Number_of_Tracks[Length(Number_of_Tracks)-1]+1;
  Number_of_Composites:=Number_of_Composites+1;
  Finalize(Composite_Tracks_Number);
  Finalize(Composite_Log.Tracks_Number);
  Composite_Log.Free;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  Image1.Left:=Trunc((ClientWidth+ScrollBox1.Width-Image1.Width)/2);
  Image1.Top:=Trunc((ClientHeight-Image1.Height)/2);
  VrScrollText1.Left:=Trunc((ClientWidth+ScrollBox1.Width-VrScrollText1.Width)/2);
  VrScrollText1.Top:=Trunc((ClientHeight+Image1.Height)/2);
end;

procedure TMainForm.Han1Click(Sender: TObject);
var
No_Vp_Values: Integer;
Vp_Value: Real;
Vs_Value: Real;
Vp_Depth_Value: Real;
i: Smallint;
DepthUnit_String: string[5];
Step_Value:Real;
//Null_Value:Real;
begin
  if CheckBox_Number=0 then Exit;
  Han_Method:=-1;
  Han_Volume:=-1;
  Vp_Track_Number:=-1;
  Vp_Value:=-999.25;
  Vs_Value:=-999.25;
  Operation_Canceled:=False;
  Han_Model:=THan_Model.Create(Self);
  Han_Model.ShowModal;
  Han_Model.Free;
  if Operation_Canceled then exit;
  Vp_Selection:=TVp_Selection.Create(Self);
  Vp_Selection.ShowModal;
  Vp_Selection.Free;
  if Operation_Canceled then Exit;
  No_Vp_Values:=Log_Values[VP_Track_Number].Count;
  CreateHeader('Vs Estimation',Length(Headers));
  DepthUnit_String:=DepthUnit[VP_Track_Number];
  Step_Value:=Step_Values[VP_Track_Number];
//  Null_Value:=Null_Values[VS_Track_Number];
  Preparation('VS_HAN.' + Vs_Unit,DepthUnit_String,Step_Value,Vs_Value);
  for i:=0 to No_Vp_Values-1 do
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
      Vp_Depth_Value:=Charts[Vp_Track_Number].Series[0].YValue[i];
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
    end;
  Number_of_Charts:=Chart_Number;
end;

procedure TMainForm.Poisson1Click(Sender: TObject);
var
No_Vp_Values: Integer;
Vp_Value: Real;
Vs_Value: Real;
Poisson_Value: Real;
Vp_Depth_Value: Real;
i: Smallint;
DepthUnit_String: string[5];
Step_Value:Real;
begin
  if CheckBox_Number=0 then Exit;
  Vp_Track_Number:=-1;
  Poisson_Track_Number:=-1;
  Vp_Value:=-999.25;
  Vs_Value:=-999.25;
  Operation_Canceled:=False;
  Poisson_Page:=TPoisson_Page.Create(Self);
  Poisson_Page.ShowModal;
  Poisson_Page.Free;
  if Operation_Canceled then Exit;
  No_Vp_Values:=Log_Values[VP_Track_Number].Count;
  CreateHeader('Vs Estimation',Length(Headers));
  DepthUnit_String:=DepthUnit[VP_Track_Number];
  Step_Value:=Step_Values[VP_Track_Number];
  Preparation('VS_POISSON.'+Vs_Unit,DepthUnit_String,Step_Value,Vs_Value);
  for i:=0 to No_Vp_Values-1 do
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
      Poisson_Value:=Charts[Poisson_Track_Number].Series[0].XValue[i];
      Vp_Depth_Value:=Charts[Vp_Track_Number].Series[0].YValue[i];
      Vs_Value:=Vp_Value*sqrt((2*Poisson_Value-1)/(2*Poisson_Value-2));
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
  Number_of_Charts:=Chart_Number;
end;

procedure TMainForm.Krief1Click(Sender: TObject);
var
No_DTP_Values: Integer;
DTP_Mineral_Value: Real;
DTP_Saturated_Value: Real;
DTP_Fluid_Value: Real;
DTS_Mineral_Value: Real;
Vp_Mineral: Real;
Vp_Saturated: Real;
Vp_Fluid: Real;
Vs_Mineral: Real;
Vs_Value: Real;
DTP_Depth_Value: Real;
i: Smallint;
DepthUnit_String: string[5];
Step_Value:Real;
begin
  if CheckBox_Number=0 then Exit;
  DTP_Mineral_Track_Number:=-1;
  DTP_Saturated_Track_Number:=-1;
  DTP_Fluid_Track_Number:=-1;
  DTS_Mineral_Track_Number:=-1;
  DTP_Mineral_Value:=-999.25;
  DTP_Saturated_Value:=-999.25;
  DTP_Fluid_Value:=-999.25;
  DTS_Mineral_Value:=-999.25;
  Operation_Canceled:=False;
  Krief_Page:=TKrief_Page.Create(Self);
  Krief_Page.ShowModal;
  Krief_Page.Free;
  if Operation_Canceled then Exit;
  No_DTP_Values:=Log_Values[DTP_Mineral_Track_Number].Count;
  CreateHeader('Vs Estimation',Length(Headers));
  DepthUnit_String:=DepthUnit[DTP_Mineral_Track_Number];
  Step_Value:=Step_Values[DTP_Mineral_Track_Number];
  Preparation('VS_KRIEF.'+Vs_Unit,DepthUnit_String,Step_Value,DTS_Mineral_Value);
  for i:=0 to No_DTP_Values-1 do
    begin
      if DTP_Mineral_Unit='US/FT' then
        DTP_Mineral_Value:=0.000001/0.3048*Charts[DTP_Mineral_Track_Number].Series[0].XValue[i]
      else if DTP_Mineral_Unit='US/M' then
        DTP_Mineral_Value:=0.000001*Charts[DTP_Mineral_Track_Number].Series[0].XValue[i]
      else
        begin
          MessageDlg('No measurment unit selected for P-wave DT of the rock mineral.',mtError,[mbOk],0);
          Exit;
      end;
      if DTP_Saturated_Unit='US/FT' then
        DTP_Saturated_Value:=0.000001/0.3048*Charts[DTP_Saturated_Track_Number].Series[0].XValue[i]
      else if DTP_Saturated_Unit='US/M' then
        DTP_Saturated_Value:=0.000001*Charts[DTP_Saturated_Track_Number].Series[0].XValue[i]
      else
        begin
          MessageDlg('No measurment unit selected for P-wave DT of the saturated rock.',mtError,[mbOk],0);
          Exit;
      end;
      if DTP_Fluid_Unit='US/FT' then
        DTP_Fluid_Value:=0.000001/0.3048*Charts[DTP_Fluid_Track_Number].Series[0].XValue[i]
      else if DTP_Fluid_Unit='US/M' then
        DTP_Fluid_Value:=0.000001*Charts[DTP_Fluid_Track_Number].Series[0].XValue[i]
      else
        begin
          MessageDlg('No measurment unit selected for P-wave DT of the pore fluid.',mtError,[mbOk],0);
          Exit;
      end;
      if DTS_Mineral_Unit='US/FT' then
        DTS_Mineral_Value:=0.000001/0.3048*Charts[DTS_Mineral_Track_Number].Series[0].XValue[i]
      else if DTS_Mineral_Unit='US/M' then
        DTS_Mineral_Value:=0.000001*Charts[DTS_Mineral_Track_Number].Series[0].XValue[i]
      else
        begin
          MessageDlg('No measurment unit selected for S-wave DT of the rock mineral.',mtError,[mbOk],0);
          Exit;
      end;
      DTP_Depth_Value:=Charts[DTP_Mineral_Track_Number].Series[0].YValue[i];
      Vp_Mineral:=0.001/DTP_Mineral_Value;
      Vp_Saturated:=0.001/DTP_Saturated_Value;
      Vp_Fluid:=0.001/DTP_Fluid_Value;
      Vs_Mineral:=0.001/DTS_Mineral_Value;
{ vs**2 = vs_min**2 * (vp**2 - vp_f**2) / (vp_min**2-vp_f**2)}
      Vs_Value:=sqrt(ABS(sqr(Vs_Mineral)*(sqr(Vp_Saturated)-sqr(Vp_Fluid))/(sqr(Vp_Mineral)-2*sqr(Vp_Fluid))));
      if Vs_Unit='KM/S' then
        Charts[Length(Charts)-1].Series[0].AddXY(Vs_Value,DTP_Depth_Value)
      else if Vs_Unit='FT/S' then
        Charts[Length(Charts)-1].Series[0].AddXY(1000/0.3048*Vs_Value,DTP_Depth_Value)
      else
        begin
          MessageDlg('No measurment unit selected for Vs.',mtError,[mbOk],0);
          Exit;
        end;
    end;
  Number_of_Charts:=Chart_Number;
end;

{procedure TMainForm.ChartsDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TChart;
end;

procedure TMainForm.ChartsDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  Source_Left,
  Sender_Left,
  Middle_Point: Integer;
  i,j: Smallint;
begin
  if Sender=Source then Exit;
  for i:=0 to Length(Charts)-1 do
    Charts[i].Align:=alNone;
 { if (Sender is TChart)and(Source is TChart) then
    begin
      with Source as TChart do
        Source_Left:=Left;
      with Sender as TChart do
        Sender_Left:=Left;
      Middle_Point:=Trunc(Width/2);
      with Source as TChart do
        begin
          if X<=Middle_Point then
            begin
              Left:=Sender_Left;
              with Sender as TChart do
                begin
                  Left:=Left+Width;
                end;
            end
          else
            begin
            end;
        end;
    end;
{  if (Sender is TChart) and (Source is TChart) then
    begin
      with Source as TChart do
        begin
          if (X mod Width)>(Width/2) then
            Left:=X+(Width - X mod Width)+1
          else
            Left:=X-(X mod Width)-1;
        end;
    end;
end;    }

procedure TMainForm.Litholog1Click(Sender: TObject);
var
DepthUnit_String: string;
Step_Value:Real;
Null_Value:Real;
begin
  if CheckBox_Number=0 then Exit;
  if not(LithoLog_Created) then
    begin
      CreateHeader('Lithology Log',Length(Headers));
      DepthUnit_String:=DepthUnit[Length(DepthUnit)-1];
      Step_Value:=Step_Values[Length(Step_Values)-1];
      Null_Value:=-999.25;
      SetLength(DepthUnit, Length(DepthUnit)+1);
      DepthUnit[Chart_Number]:=DepthUnit_String;
      SetLength(Step_Values, Length(Step_Values)+1);
      Step_Values[Chart_Number]:=Step_Value;
      SetLength(Null_Values, Length(Null_Values)+1);
      Null_Values[Chart_Number]:=Null_Value;
      CreateCheckBox('LITHOLOG',Chart_Number);
      CreateChart('LITHOLOG', Chart_Number);
      Charts[Chart_Number].TopAxis.Labels:=False;
      LithoLog_Track_Number:=Chart_Number;
      SetLength(Log_Values, Length(Log_Values)+1);
      Log_Values[Chart_Number]:=THorizLineSeries.Create(ForFree1);
      Log_Values[Chart_Number].Name:='Track_'+IntToStr(Chart_Number+1);
      Log_Values[Chart_Number].Stairs:=True;
      Log_Values[Chart_Number].Pen.Width:=1;
      Log_Values[Chart_Number].HorizAxis:=aTopAxis;
      Log_Values[Chart_Number].ParentChart:=nil;
      Number_of_Tracks[Number_of_Headers-1]:=Number_of_Tracks[Number_of_Headers-1]+1;
      Charts[Chart_Number].Parent:=MainForm;
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
Vp_Value: Real;
Vs_Value: Real;
Vp_Depth_Value: Real;
i: Smallint;
DepthUnit_String: string[5];
Step_Value:Real;
begin
  if CheckBox_Number=0 then Exit;
  Vp_Track_Number:=-1;
  Vp_Value:=-999.25;
  Vs_Value:=-999.25;
  Operation_Canceled:=False;
  Vp_Selection:=TVp_Selection.Create(Self);
  Vp_Selection.ShowModal;
  Vp_Selection.Free;
  if Operation_Canceled then Exit;
  No_Vp_Values:=Log_Values[VP_Track_Number].Count;
  CreateHeader('Vs Estimation',Length(Headers));
  DepthUnit_String:=DepthUnit[VP_Track_Number];
  Step_Value:=Step_Values[VP_Track_Number];
  Preparation('VS_LITHOSPHER.'+Vs_Unit,DepthUnit_String,Step_Value,Vs_Value);
  for i:=0 to No_Vp_Values-1 do
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
      Vp_Depth_Value:=Charts[Vp_Track_Number].Series[0].YValue[i];
      Vs_Value:=Vp_Value/sqrt(2);
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
  Number_of_Charts:=Chart_Number;
end;

end.
