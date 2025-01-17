unit MainForm;

interface

uses
  Windows, Classes, XPMan, Dialogs, TeeEdit, Menus, ComCtrls, jpeg, ExtCtrls,
  Controls, ToolWin, TeEngine, Series, Math, {TeeLegendScrollBar,} Graphics,
  Forms, TeeProcs, Chart, StdCtrls, {TeeSurfa,} SysUtils, TeeSeriesRegion,
  TeCanvas;

type
  TFirstForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    NRM1: TMenuItem;
    VSP1: TMenuItem;
    OpenDialog1: TOpenDialog;
    OpenDialog3: TOpenDialog;
    Empty1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    PrintDialog1: TPrintDialog;
    PrintGraph1: TMenuItem;
    N2: TMenuItem;
    ToolBar1: TToolBar;
    Calculation1: TMenuItem;
    Lapse1: TMenuItem;
    Image1: TImage;
    Image2: TImage;
    Chart1: TChart;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ChartPreviewer1: TChartPreviewer;
    SaveDialog1: TSaveDialog;
    SaveGraph1: TMenuItem;
    CoolBar1: TCoolBar;
    ProgressBar1: TProgressBar;
    XPManifest1: TXPManifest;
    sButton7: TButton;
    sButton1: TButton;
    sButton2: TButton;
    sButton5: TButton;
    sButton4: TButton;
    ChartEditor1: TChartEditor;
    Button1: TButton;
    Button2: TButton;
    ColorDialog1: TColorDialog;
    ChartTool1: TSeriesRegionTool;
    Series1: TAreaSeries;
    procedure Exit1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PrintGraph1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure SaveGraph1Click(Sender: TObject);
    procedure sButton7Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure sButton5Click(Sender: TObject);
    procedure sButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FirstForm: TFirstForm;
  Lines: TStringList;
  S,S1,S2,S3,S4: String;
  P,P1,P2,P3,P4: Integer;
  i,j,k,l,n: Integer;
  ForFree:TLabel;
  Series:array of TLineSeries;
//  Series:array[1..999] of THorizLineSeries;
  Kind:String;
  NullVal:String;
  NullV:Real;
  FN:Integer;
  Pat,Path:string;
  Fields:array of string[30];
  Width_Value:Real;
//  Max_Value:array of Real;
//  Min_Value:array of Real;
  Increment_Value:Integer;
//  Series_Position:array of Real;
//  ColorSeries:array [1..10] of TColorGridSeries;
  TempSeries:THorizLineSeries;
  The_Color:TColor;
  Difference:Real;
  The_Value:Real;
  TempFile:TextFile;
  File_Size:Integer;
  Legend_Max,Legend_Min:Real;
  ChartTool: TSeriesRegionTool;
  Positive1, Negative1: array of THorizAreaSeries;
  Positive2, Negative2: array of TAreaSeries;
  Is_First: Boolean;

implementation

uses TLapsePage;

{$R *.dfm}

procedure TFirstForm.Exit1Click(Sender: TObject);
begin
Close;
end;

procedure TFirstForm.FormCreate(Sender: TObject);
begin
sButton7.Enabled:=False;
end;

procedure TFirstForm.PrintGraph1Click(Sender: TObject);
begin
ChartPreviewer1.Execute;
end;

procedure TFirstForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
ToolButton3.Width:=NewWidth-580;
end;

procedure TFirstForm.SaveGraph1Click(Sender: TObject);
begin
if SaveDialog1.Execute then Chart1.SaveToBitmapFile(SaveDialog1.FileName);
end;

procedure TFirstForm.sButton7Click(Sender: TObject);
begin
    Chart1.RemoveAllSeries;
    ForFree.Free;
    Chart1.LeftAxis.Automatic:=True;
    Chart1.TopAxis.Automatic:=True;
    Chart1.Title.Text.Text:='P.U.T SeisPlot';
    Chart1.LeftAxis.Grid.Visible:=True;
    Chart1.TopAxis.Grid.Visible:=True;
    Chart1.LeftAxis.Title.Caption:='';
    Chart1.TopAxis.Title.Caption:='';
    Chart1.TopAxis.Inverted:=False;
    Chart1.LeftAxis.Inverted:=False;
    Chart1.TopAxis.Labels:=True;
    Chart1.LeftAxis.Labels:=True;
    Chart1.Legend.Title.Text.Text:='';
    NRM1.Enabled:=True;
    VSP1.Enabled:=True;
    sButton1.Enabled:=True;
    sButton2.Enabled:=True;
    sButton7.Enabled:=False;
end;

procedure TFirstForm.sButton1Click(Sender: TObject);
var
Row_Number,
Number_of_Rows,
Number_of_Points,
Number_of_Lines,
Number_of_Blocks        : Integer;
Horizontal_Value,
Previous_Vertical_Value,
Vertical_Value,
Depth_Step,
Horizontal_Step,
Start_Point,
Max_Domain,
T_Min                   : Real;
j,i,P                   :integer;
S,S1                    :String;
Begining_of_Block       : Integer;
Start_Time,
End_Time                : Real;
begin
 try
  if OpenDialog1.Execute then
    begin
      NRM1.Enabled:=False;
      VSP1.Enabled:=False;
      sButton1.Enabled:=False;
      sButton2.Enabled:=False;
      sButton7.Enabled:=True;
      Screen.Cursor:=crHourGlass;
      Chart1.Title.Font.Size:=12;
      Chart1.Title.Font.Color:=clNavy;
      Chart1.Title.Font.Style:=[fsBold];
      Lines:=TStringList.Create;
      Lines.LoadFromFile(OpenDialog1.FileName);
      Chart1.Title.Text.Text:=Lines[0];
      Chart1.LeftAxis.Title.Caption:='Time(Sec)';
      S:=Lines[1];
      S1:=Copy(S,1,5);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Number_of_Blocks:=StrToInt(S1);
      S1:=Copy(S,14,8);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Start_Time:=StrToFloat(S1);
      S1:=Copy(S,51,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      End_Time:=StrtoFloat(S1);
      Chart1.LeftAxis.SetMinMax(Start_Time,End_Time);
      S1:=Copy(S,21,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Horizontal_Step:=StrToFloat(S1);
      if Horizontal_Step>=1 then
        Chart1.TopAxis.Title.Caption:='Offset(m)'
      else
        Chart1.TopAxis.Title.Caption:='Offset(km)';
      Chart1.TopAxis.Increment:=Horizontal_Step;
      S1:=Copy(S,41,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Depth_Step:=StrToFloat(S1);
      Chart1.LeftAxis.Increment:=0.1;
      Number_of_Lines:=2;
      Row_Number:=1;
      ForFree:=TLabel.Create(Self);
      Chart1.Legend.CheckBoxes:=True;
      Chart1.LeftAxis.Inverted:=True;
      Chart1.TopAxis.Visible:=True;
      Chart1.TopAxis.Grid.Visible:=False;
      for i:=0 to Number_of_Blocks-1 do
        begin
          Row_Number:=Row_Number+1;
          S:=Lines[Row_Number];
          S1:=Copy(S,1,10);
          S1:=TrimLeft(S1);
          S1:=TrimRight(S1);
          Start_Point:=StrToFloat(S1);
          S1:=Copy(S,11,16);
          S1:=TrimLeft(S1);
          S1:=TrimRight(S1);
          Max_Domain:=StrToFloat(S1);
          S1:=Copy(S,26,10);
          S1:=TrimLeft(S1);
          S1:=TrimRight(S1);
          T_Min:=StrToFloat(S1);
          Vertical_Value:=T_Min;
          S1:=Copy(S,36,5);
          S1:=TrimLeft(S1);
          S1:=TrimRight(S1);
          Number_of_Points:=StrToInt(S1);
          SetRoundMode(rmUp);
          if Number_of_Points=0 then
            Number_of_Rows:=1
          else
            Number_of_Rows:=Round(Number_of_Points/16);
          SetLength(Series, Length(Series)+1);
          Series[i]:=THorizLineSeries.Create(Forfree);
          Series[i].ParentChart:=Chart1;
          Series[i].Name:='Trace'+IntToStr(i);
          Series[i].HorizAxis:=aTopAxis;
          Series[i].Color:=clBlack;
          Series[i].Stairs:=False;
          SetLength(Positive1, Length(Positive1)+1);
          Positive1[i]:=THorizAreaSeries.Create(Forfree);
          Positive1[i].ParentChart:=Chart1;
          Positive1[i].Name:='Area_P'+IntToStr(i);
          Positive1[i].HorizAxis:=aTopAxis;
          Positive1[i].Color:=clBlue;
          Positive1[i].Stairs:=False;
          Positive1[i].UseYOrigin:=True;
          Positive1[i].YOrigin:=Start_Point;
          Positive1[i].AreaLinesPen.Visible:=False;
          Positive1[i].LinePen.Visible:=False;
//          Positive1.Stairs:=True;
//          Positive1.InvertedStairs:=True;
          SetLength(Negative1, Length(Negative1)+1);
          Negative1[i]:=THorizAreaSeries.Create(Forfree);
          Negative1[i].ParentChart:=Chart1;
          Negative1[i].Name:='Area_N'+IntToStr(i);
          Negative1[i].HorizAxis:=aTopAxis;
          Negative1[i].Color:=clLime;
          Negative1[i].Stairs:=False;
          Negative1[i].UseYOrigin:=True;
          Negative1[i].YOrigin:=Start_Point;
          Negative1[i].AreaLinesPen.Visible:=False;
          Negative1[i].LinePen.Visible:=False;
//          Negative1.Stairs:=True;
//          Negative1.InvertedStairs:=True;
          Negative1[i].AddXY(Start_Point,0);
          Positive1[i].AddXY(Start_Point,0);
          Series[i].AddXY(Start_Point,0);
          Begining_of_Block:=Row_Number;
          for j:=1 to Number_of_Rows do
            begin
              Row_Number:=Row_Number+1;
              S:=Lines[Row_Number];
              for p:=1 to 16 do
                begin
                  if S<>'' then
                    begin
                      S1:=Copy(S,0,5);
                      Delete(S,1,5);
                      S1:=TrimLeft(S1);
                      S1:=TrimRight(S1);
                      if ( Max_Domain<Abs(StrToInt(S1)) ) then
                        Max_Domain:=Abs(StrToInt(S1));
                    end;
                end;
            end;
          Row_Number:=Begining_of_Block;
          Is_First:=True;
          for j:=1 to Number_of_Rows do
            begin
              Row_Number:=Row_Number+1;
              S:=Lines[Row_Number];
              Previous_Vertical_Value:=0;
              for p:=1 to 16 do
                begin
                  if S<>'' then
                    begin
                      S1:=Copy(S,0,5);
                      Delete(S,1,5);
                      S1:=TrimLeft(S1);
                      S1:=TrimRight(S1);
                      Horizontal_Value:=StrToFloat(S1);
                      if Max_Domain<>0 then
                        Horizontal_Value:=Horizontal_Value*Horizontal_Step/Max_Domain
                      else
                        Horizontal_Value:=0;
                      if Horizontal_Value>0 then
                        begin
                          if Is_First then
                            begin
                              Negative1[i].AddXY(Start_Point,{Previous_}Vertical_Value);
                              Is_First:=False;
                            end
                          else
                            Negative1[i].AddXY(Start_Point,Vertical_Value);
                          Positive1[i].AddXY(Start_Point+Horizontal_Value,Vertical_Value);
                        end
                      else if Horizontal_Value<0 then
                        begin
                          if Is_First then
                            begin
                              Positive1[i].AddXY(Start_Point,{Previous_}Vertical_Value);
                              Is_First:=False;
                            end
                          else
                            Positive1[i].AddXY(Start_Point,Vertical_Value);
                          Negative1[i].AddXY(Start_Point+Horizontal_Value,Vertical_Value);
                        end
                      else
                        begin
                          Positive1[i].AddXY(Start_Point,Vertical_Value);
                          Negative1[i].AddXY(Start_Point,Vertical_Value);
                        end;
                      Series[i].AddXY(Start_Point+Horizontal_Value,Vertical_Value);
                   end;
                  Vertical_Value:=Vertical_Value+Depth_Step;
                  Previous_Vertical_Value:=Vertical_Value;
                end;
            end;
          Positive1[i].AddXY(Start_Point,End_Time);
          Negative1[i].AddXY(Start_Point,End_Time);
          Series[i].AddXY(Start_Point,End_Time);
        end;
      Lines.Free;
      Screen.Cursor:=crDefault;
    end;
 except
  MessageDlg('Error reading file.',mterror,[mbok],0);
  ForFree.Free;
  Lines.Free;
  Open1.Enabled:=True;
  Screen.Cursor:=crDefault;
 end;
end;

procedure TFirstForm.sButton2Click(Sender: TObject);
var
Row_Number,
Number_of_Rows,
Number_of_Points,
Number_of_Lines,
Number_of_Blocks        : Integer;
Horizontal_Value,
Vertical_Value,
Previous_Vertical_Value,
Depth_Step,
Horizontal_Step,
Start_Point,
Max_Domain,
T_Min                   : Real;
j,i,P                   :integer;
S,S1                    :String;
Begining_of_Block       : Integer;
Start_Time,
End_Time                : Real;
begin
 try
  if OpenDialog3.Execute then
    begin
      NRM1.Enabled:=False;
      VSP1.Enabled:=False;
      sButton1.Enabled:=False;
      sButton2.Enabled:=False;
      sButton7.Enabled:=True;
      Screen.Cursor:=crHourGlass;
      Chart1.Title.Font.Size:=12;
      Chart1.Title.Font.Color:=clNavy;
      Chart1.Title.Font.Style:=[fsBold];
      Lines:=TStringList.Create;
      Lines.LoadFromFile(OpenDialog3.FileName);
      Chart1.Title.Text.Text:=Lines[0];
      Chart1.TopAxis.Title.Caption:='Time(Sec)';
      S:=Lines[1];
      S1:=Copy(S,1,5);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Number_of_Blocks:=StrToInt(S1);
      S1:=Copy(S,14,8);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Start_Time:=StrToFloat(S1);
      S1:=Copy(S,51,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      End_Time:=StrtoFloat(S1);
      Chart1.TopAxis.SetMinMax(Start_Time,End_Time);
      S1:=Copy(S,21,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Horizontal_Step:=StrToFloat(S1);
      if Horizontal_Step>=1 then
        begin
          Chart1.LeftAxis.Title.Caption:='Depth(m)';
        end
      else
        begin
          Chart1.LeftAxis.Title.Caption:='Depth(Km)';
        end;
      Chart1.LeftAxis.Increment:=Horizontal_Step;
      S1:=Copy(S,41,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Depth_Step:=StrToFloat(S1);
      Chart1.TopAxis.Increment:=0.1;
      Number_of_Lines:=2;
      Row_Number:=1;
      ForFree:=TLabel.Create(Self);
      Chart1.Legend.CheckBoxes:=True;
      Chart1.LeftAxis.Inverted:=True;
      Chart1.TopAxis.Visible:=True;
      Chart1.LeftAxis.Grid.Visible:=False;
      for i:=0 to Number_of_Blocks-1 do
        begin
          Row_Number:=Row_Number+1;
          S:=Lines[Row_Number];
          S1:=Copy(S,1,10);
          S1:=TrimLeft(S1);
          S1:=TrimRight(S1);
          Start_Point:=StrToFloat(S1);
          S1:=Copy(S,11,16);
          S1:=TrimLeft(S1);
          S1:=TrimRight(S1);
          Max_Domain:=StrToFloat(S1);
          S1:=Copy(S,26,10);
          S1:=TrimLeft(S1);
          S1:=TrimRight(S1);
          T_Min:=StrToFloat(S1);
          Vertical_Value:=T_Min;
          S1:=Copy(S,36,5);
          S1:=TrimLeft(S1);
          S1:=TrimRight(S1);
          Number_of_Points:=StrToInt(S1);
          SetRoundMode(rmUp);
          if Number_of_Points=0 then
            Number_of_Rows:=1
          else
            Number_of_Rows:=Round(Number_of_Points/16);
          SetLength(Series, Length(Series)+1);
          Series[i]:=TLineSeries.Create(Forfree);
          Series[i].ParentChart:=Chart1;
          Series[i].Name:='Trace'+IntToStr(i);
          Series[i].HorizAxis:=aTopAxis;
          Series[i].Color:=clBlack;
          Series[i].Stairs:=False;
          Series[i].AddXY(0,Start_Point);
          SetLength(Positive2, Length(Positive2)+1);
          Positive2[i]:=TAreaSeries.Create(Forfree);
          Positive2[i].ParentChart:=Chart1;
          Positive2[i].Name:='Area_P'+IntToStr(i);
          Positive2[i].HorizAxis:=aTopAxis;
          Positive2[i].Color:=clBlue;
          Positive2[i].Stairs:=False;
          Positive2[i].UseYOrigin:=True;
          Positive2[i].YOrigin:=Vertical_Value;//Start_Point;
          Positive2[i].AreaLinesPen.Visible:=False;
          Positive2[i].LinePen.Visible:=False;
//          Positive2.Stairs:=True;
//          Positive2.InvertedStairs:=True;
          SetLength(Negative2, Length(Negative2)+1);
          Negative2[i]:=TAreaSeries.Create(Forfree);
          Negative2[i].ParentChart:=Chart1;
          Negative2[i].Name:='Area_N'+IntToStr(i);
          Negative2[i].HorizAxis:=aTopAxis;
          Negative2[i].Color:=clLime;
          Negative2[i].Stairs:=False;
          Negative2[i].UseYOrigin:=True;
          Negative2[i].YOrigin:=Vertical_Value;//Start_Point;
          Negative2[i].AreaLinesPen.Visible:=False;
          Negative2[i].LinePen.Visible:=False;
//          Negative2.Stairs:=True;
//          Negative2.InvertedStairs:=True;
          Negative2[i].AddXY(0,Start_Point);
          Positive2[i].AddXY(0,Start_Point);
          Series[i].AddXY(0,Start_Point);
          Begining_of_Block:=Row_Number;
          for j:=1 to Number_of_Rows do
            begin
              Row_Number:=Row_Number+1;
              S:=Lines[Row_Number];
              for p:=1 to 16 do
                begin
                  if S<>'' then
                    begin
                      S1:=Copy(S,0,5);
                      Delete(S,1,5);
                      S1:=TrimLeft(S1);
                      S1:=TrimRight(S1);
                      if ( Max_Domain<Abs(StrToInt(S1)) ) then
                        Max_Domain:=Abs(StrToInt(S1));
                    end;
                end;
            end;
          Row_Number:=Begining_of_Block;
          Is_First:=True;
          for j:=1 to Number_of_Rows do
            begin
              Row_Number:=Row_Number+1;
              S:=Lines[Row_Number];
              for p:=1 to 16 do
                begin
                  if S<>'' then
                    begin
                      S1:=Copy(S,0,5);
                      Delete(S,1,5);
                      S1:=TrimLeft(S1);
                      S1:=TrimRight(S1);
                      Horizontal_Value:=StrToFloat(S1);
                      if Max_Domain<>0 then
                        Horizontal_Value:=Horizontal_Value*Horizontal_Step/Max_Domain
                      else
                        Horizontal_Value:=0;
                      if Horizontal_Value>0 then
                        begin
                          if Is_First then
                            begin
                              Negative2[i].AddXY(Start_Point,{Previous_}Vertical_Value);
                              Is_First:=False;
                            end
                          else
                            Negative2[i].AddXY(Vertical_Value,Start_Point);
                          Positive2[i].AddXY(Start_Point+Horizontal_Value,Vertical_Value);
                        end
                      else if Horizontal_Value<0 then
                        begin
                          if Is_First then
                            begin
                              Positive2[i].AddXY(Start_Point,{Previous_}Vertical_Value);
                              Is_First:=False;
                            end
                          else
                            Positive2[i].AddXY(Vertical_Value,Start_Point+Horizontal_Value);
                          Negative2[i].AddXY(Vertical_Value,Start_Point+Horizontal_Value);
                        end
                      else
                        begin
                          Positive2[i].AddXY(Start_Point,Horizontal_Value);
                          Negative2[i].AddXY(Start_Point,Horizontal_Value);
                        end;
                      Series[i].AddXY(Vertical_Value,Start_Point+Horizontal_Value);
                   end;
                  Vertical_Value:=Vertical_Value+Depth_Step;
                  Previous_Vertical_Value:=Vertical_Value;
                end;
            end;
          Positive2[i].AddXY(End_Time, Start_Point);
          Negative2[i].AddXY(End_Time, Start_Point);
          Series[i].AddXY(End_Time,Start_Point);
{          ChartTool:=TSeriesRegionTool.Create(ForFree);
          ChartTool.AutoBounds:=True;
          ChartTool.Series:=Series[i];
          ChartTool.ParentChart:=Chart1;
          ChartTool.Origin:=Start_Point;
          ChartTool.Pen.Visible:=False;
          ChartTool.Gradient.StartColor:=clLime;
          ChartTool.Gradient.EndColor:=clRed;
          ChartTool.Gradient.Visible:=True;
          ChartTool.Gradient.Balance:=50;
          ChartTool.Gradient.Direction:=gdTopBottom;}
        end;
      Lines.Free;
      Screen.Cursor:=crDefault;
    end;
 except
  MessageDlg('Error reading file.',mterror,[mbok],0);
  ForFree.Free;
  Lines.Free;
  Open1.Enabled:=True;
  Screen.Cursor:=crDefault;
 end;
end;

procedure TFirstForm.sButton5Click(Sender: TObject);
begin
TLapse:=TTLapse.Create(Self);
TLapse.Show;
end;

procedure TFirstForm.sButton4Click(Sender: TObject);
begin
Close;
end;

procedure TFirstForm.Button1Click(Sender: TObject);
begin
  ChartEditor1.Execute;
end;

procedure TFirstForm.Button2Click(Sender: TObject);
var
i: integer;
begin
  if ColorDialog1.Execute then
    begin
      for i:=1 to Length(Series)-1 do
        begin
          Series[i].Color:=ColorDialog1.Color;
        end;
    end;
end;

end.
