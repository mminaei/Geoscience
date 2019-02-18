unit MainForm;

interface

uses
  Windows, Classes, XPMan, Dialogs, TeeEdit, Menus, ComCtrls, jpeg, ExtCtrls,
  Controls, ToolWin, TeEngine, Series, Math, TeeLegendScrollBar, Graphics,
  Forms, TeeProcs, Chart, StdCtrls, TeeSurfa, SysUtils, TeeTools, TeeEdiGene, DB, DBTables, DBChart,
  TeePageNumTool;

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
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
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
    Table1: TTable;
    Table1horizontal_value: TFloatField;
    Table1vertical_value: TFloatField;
    Table1index_field: TIntegerField;
    ScrollBar1: TScrollBar;
    DBChart1: TDBChart;
    Series1: THorizLineSeries;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure ChartSetMinMax(var FirstNo,LastNo:Integer);
    procedure DBChart1Zoom(Sender: TObject);
    procedure DBChart1UndoZoom(Sender: TObject);
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
  Series:THorizLineSeries;
  Kind:String;
  NullVal:String;
  NullV:Real;
  FN:Integer;
  Pat,Path:string;
  Fields:array[1..999] of string[30];
  Width_Value:Real;
  Max_Value:array [1..999] of Real;
  Min_Value:array [1..999] of Real;
  Increment_Value:Integer;
  Series_Position:array [1..999] of Real;
  ColorSeries:array [1..10] of TColorGridSeries;
  TempSeries:THorizLineSeries;
  The_Color:TColor;
  Difference:Real;
  The_Value:Real;
  TempFile:TextFile;
  File_Size:Integer;
  Legend_Max,Legend_Min:Real;
  Open_File:TextFile;
  Total_Number_of_Points :Integer;
  Min_Horizontal_Value,
  Max_Horizontal_Value : array of real;
  Ave_Number_of_Points : Integer;
  Max_No_of_Trace_Per_Page:Integer;

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
Max_No_of_Trace_Per_Page:=20;
end;

procedure TFirstForm.PrintGraph1Click(Sender: TObject);
begin
ChartPreviewer1.Execute;
end;

procedure TFirstForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
ToolButton3.Width:=NewWidth-460;
end;

procedure TFirstForm.SaveGraph1Click(Sender: TObject);
begin
if SaveDialog1.Execute then DBChart1.SaveToBitmapFile(SaveDialog1.FileName);
end;

procedure TFirstForm.sButton7Click(Sender: TObject);
begin
    ForFree.Free;
    DBChart1.Title.Text.Text:='P.U.T SeisPlot';
    NRM1.Enabled:=True;
    VSP1.Enabled:=True;
    sButton1.Enabled:=True;
    sButton2.Enabled:=True;
    sButton7.Enabled:=False;
    Table1.Close;
    Table1.EmptyTable;
    DBChart1.TopAxis.Automatic:=True;
    DBChart1.TopAxis.AdjustMaxMin;
    DBChart1.LeftAxis.Automatic:=True;
    DBChart1.LeftAxis.AdjustMaxMin;
    ScrollBar1.Enabled:=False;
end;

procedure TFirstForm.sButton1Click(Sender: TObject);
var
Row_Number,
Number_of_Rows,
Number_of_Points,
Number_of_Lines,
Number_of_Blocks        : Integer;
Horizontal_Value,
Vertical_Value,
Depth_Step,
Horizontal_Step,
Start_Point,
Max_Domain,
T_Min                   : Real;
j,i,P                   : integer;
S,S1                    : String;
The_Value,
Begining_of_Block       : Integer;
Start_Time,
End_Time                : Real;
Open_File               : TextFile;
Index_Counter,
Max_No_of_Traces        : Integer;
begin
 try
  if OpenDialog1.Execute then
    begin
      Repaint;
      NRM1.Enabled:=False;
      VSP1.Enabled:=False;
      sButton1.Enabled:=False;
      sButton2.Enabled:=False;
      sButton7.Enabled:=True;
      Screen.Cursor:=crHourGlass;
      DBChart1.Title.Font.Size:=12;
      DBChart1.Title.Font.Color:=clNavy;
      DBChart1.Title.Font.Style:=[fsBold];
      Lines:=TStringList.Create;
      Lines.LoadFromFile(OpenDialog1.FileName);
      DBChart1.Title.Text.Text:=Lines[0];
      DBChart1.LeftAxis.Title.Caption:='Time(Sec)';
      S:=Lines[1];
      S1:=Copy(S,1,5);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Number_of_Blocks:=StrToInt(S1);
      S1:=Copy(S,6,5);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Start_Time:=StrToFloat(S1);
      S1:=Copy(S,51,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      End_Time:=StrtoFloat(S1);
      DBChart1.LeftAxis.SetMinMax(Start_Time,End_Time);
      S1:=Copy(S,21,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Horizontal_Step:=StrToFloat(S1);
      if Horizontal_Step>=1 then
        DBChart1.TopAxis.Title.Caption:='Offset(m)'
      else
        DBChart1.TopAxis.Title.Caption:='Offset(km)';
      DBChart1.TopAxis.Increment:=Horizontal_Step;
      S1:=Copy(S,41,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Depth_Step:=StrToFloat(S1);
      DBChart1.LeftAxis.Increment:=0.1;
      Number_of_Lines:=2;
      Row_Number:=1;
      ForFree:=TLabel.Create(Self);
//      Chart1.Legend.CheckBoxes:=True;
      DBChart1.LeftAxis.Inverted:=True;
      DBChart1.TopAxis.Visible:=True;
      DBChart1.TopAxis.Grid.Visible:=False;
      AssignFile(Open_File,OpenDialog1.FileName);
      Reset(Open_File);
      Index_Counter:=0;
      if not Table1.Exists then
        Table1.CreateTable;
      Table1.DisableControls;
      Table1.Open;
      DBChart1.TopAxis.Automatic:=False;
//      DBChart1.Axes.Top.AutomaticMaximum:=True;
//      DBChart1.Axes.Top.AutomaticMinimum:=False;
      Total_Number_of_Points:=0;
      Ave_Number_of_Points:=0;
      for i:=1 to Number_of_Blocks do
        begin
          SetLength(Max_Horizontal_Value,i+1);
          SetLength(Min_Horizontal_Value,i+1);
          Min_Horizontal_Value[i]:=1000;
          Max_Horizontal_Value[i]:=-1000;
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
          Total_Number_of_Points:=Total_Number_of_Points+Number_of_Points;
          SetRoundMode(rmUp);
          if Number_of_Points=0 then
            Number_of_Rows:=1
          else
            Number_of_Rows:=Round(Number_of_Points/16);
          Begining_of_Block:=Row_Number;
          if i=1 then
            begin
              Readln(Open_File);
              Readln(Open_File);
              Readln(Open_File);
            end
          else
            begin
              Readln(Open_File);
              Readln(Open_File);
            end;
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
              for p:=1 to Number_of_Points do
                begin
                  try
                    Read(Open_File,The_Value);
                  except
                    end;
                  Horizontal_Value:=The_Value;
                  if Max_Domain<>0 then
                    Horizontal_Value:=Horizontal_Value*Horizontal_Step/Max_Domain
                  else
                    Horizontal_Value:=0;
                  if Min_Horizontal_Value[i]>Horizontal_Value then
                    Min_Horizontal_Value[i]:=Horizontal_Value;
                  if Max_Horizontal_Value[i]<Horizontal_Value then
                    Max_Horizontal_Value[i]:=Horizontal_Value;
                  Index_Counter:=Index_Counter+1;
                  Table1.AppendRecord([Start_Point+Horizontal_Value,Vertical_Value,Index_Counter]);
                  Vertical_Value:=Vertical_Value+Depth_Step;
                end;
            Max_Horizontal_Value[i]:=Max_Horizontal_Value[i]+Start_Point;
            Min_Horizontal_Value[i]:=Min_Horizontal_Value[i]+Start_Point;
            Index_Counter:=Index_Counter+1;
            Table1.AppendRecord([Start_Point,End_Time,Index_Counter]);
            Index_Counter:=Index_Counter+1;
            Table1.AppendRecord([nil,End_Time,Index_Counter]);
        end;
      Lines.Free;
      Screen.Cursor:=crDefault;
      CloseFile(Open_File);
      Ave_Number_of_Points:=Trunc(Total_Number_of_Points/Number_of_Blocks);
      If Number_of_Blocks>Max_No_of_Trace_Per_Page then
        begin
          Table1.Filter:='index_field>0 and index_field<'+IntToStr(Ave_Number_of_Points*Max_No_of_Trace_Per_Page);
          Table1.Filtered:=True;
//        end;
  //    if Number_of_Blocks>Max_No_of_Trace_Per_Page then
    //    begin
          ScrollBar1.Enabled:=True;
          ScrollBar1.Max:=Number_of_Blocks;
          ScrollBar1.Min:=Max_No_of_Trace_Per_Page;
          Max_No_of_Traces:=1;
          ChartSetMinMax(Max_No_of_Traces,Max_No_of_Trace_Per_Page);
        end
      else
        begin
          ScrollBar1.Enabled:=False;
          Max_No_of_Traces:=1;
          ChartSetMinMax(Max_No_of_Traces,Number_of_Blocks);
        end;
      Table1.EnableControls;
      DBChart1.RefreshData;
      end;
 except
  MessageDlg('Error reading file.',mterror,[mbok],0);
  ForFree.Free;
  Lines.Free;
  Open1.Enabled:=True;
  CloseFile(Open_File);
  Screen.Cursor:=crDefault;
  Table1.Close;
  Table1.EmptyTable;
  DBChart1.TopAxis.Automatic:=True;
  DBChart1.TopAxis.AdjustMaxMin;
  ScrollBar1.Enabled:=False;
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
Depth_Step,
Horizontal_Step,
Start_Point,
Max_Domain,
T_Min                   : Real;
j,i,P                   : integer;
S,S1                    : String;
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
//      Chart1.Title.Font.Size:=12;
  //    Chart1.Title.Font.Color:=clNavy;
    //  Chart1.Title.Font.Style:=[fsBold];
      Lines:=TStringList.Create;
      Lines.LoadFromFile(OpenDialog3.FileName);
//      Chart1.Title.Text.Text:=Lines[0];
  //    Chart1.TopAxis.Title.Caption:='Time(Sec)';
      S:=Lines[1];
      S1:=Copy(S,1,5);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Number_of_Blocks:=StrToInt(S1);
      S1:=Copy(S,6,5);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Start_Time:=StrToFloat(S1);
      S1:=Copy(S,51,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      End_Time:=StrtoFloat(S1);
//      Chart1.TopAxis.SetMinMax(Start_Time,End_Time);
      S1:=Copy(S,21,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Horizontal_Step:=StrToFloat(S1);
      if Horizontal_Step>=1 then
        begin
//          Chart1.LeftAxis.Title.Caption:='Depth(m)';
        end
      else
        begin
  //        Chart1.LeftAxis.Title.Caption:='Depth(Km)';
        end;
    //  Chart1.LeftAxis.Increment:=Horizontal_Step;
      S1:=Copy(S,41,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Depth_Step:=StrToFloat(S1);
  //    Chart1.TopAxis.Increment:=0.1;
      Number_of_Lines:=2;
      Row_Number:=1;
      ForFree:=TLabel.Create(Self);
//      Chart1.Legend.CheckBoxes:=True;
 //     Chart1.LeftAxis.Inverted:=True;
   //   Chart1.TopAxis.Visible:=True;
     // Chart1.LeftAxis.Grid.Visible:=False;
{      Series:=THorizLineSeries.Create(Forfree);
      Series.ParentChart:=Chart1;
      Series.Name:='Trace1';
      Series.HorizAxis:=aTopAxis;
      Series.Color:=clGreen;
      Series.Stairs:=False;     }
      AssignFile(Open_File,OpenDialog3.FileName);
      Reset(Open_File);
      for i:=1 to Number_of_Blocks do
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
//          Chart1.Series[0].AddNullXY(Start_Point,0);
  //        Chart1.Series[0].AddXY(0,Start_Point);
          Begining_of_Block:=Row_Number;
          if i=1 then
            begin
              Readln(Open_File);
              Readln(Open_File);
              Readln(Open_File);
            end
          else
            begin
              Readln(Open_File);
              Readln(Open_File);
            end;
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
{          Row_Number:=Begining_of_Block;
          for j:=1 to Number_of_Rows do
            begin
              Row_Number:=Row_Number+1;
              S:=Lines[Row_Number];}
              for p:=1 to Number_of_Points do
                begin
//                  if S<>'' then
//                    begin
//                      S1:=Copy(S,0,5);
//                      Delete(S,1,5);
//                      S1:=TrimLeft(S1);
//                      S1:=TrimRight(S1);
                      try
                        Read(Open_File,The_Value);
                      except
                      end;
                      Horizontal_Value:=The_Value;//StrToFloat(S1);
                      if Max_Domain<>0 then
                        Horizontal_Value:=Horizontal_Value*Horizontal_Step/Max_Domain
                      else
                        Horizontal_Value:=0;
                     // Chart1.Series[0].AddXY(Vertical_Value,Start_Point+Horizontal_Value);
//                   end;
                  Vertical_Value:=Vertical_Value+Depth_Step;
                end;
//            end;
        //    Chart1.Series[0].AddXY(End_Time,Start_Point);
//            Row_Number:=Row_Number+Number_of_Rows;
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

procedure TFirstForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if Table1.Exists then
  begin
    Table1.Close;
    Table1.EmptyTable;
    Table1.DeleteTable;
  end;
end;

procedure TFirstForm.ScrollBar1Scroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
var
First_Number,Last_Number:Integer;
First_Str,Last_Str:String;
begin
 First_Str:=IntToStr((ScrollPos-Max_No_of_Trace_Per_Page)*Ave_Number_Of_Points);
 Last_Str:=IntToStr(ScrollPos*Ave_Number_Of_Points);
 Table1.DisableControls;
 Table1.Filter:='index_field>'+First_Str+' and index_field<'+Last_Str;
 First_Number:=ScrollPos-Max_No_of_Trace_Per_Page+1;
 Last_Number:=ScrollPos;
 ChartSetMinMax(First_Number,Last_Number);
 DBChart1.RefreshData;
 Table1.EnableControls;
end;

procedure TFirstForm.ChartSetMinMax(var FirstNo,LastNo:Integer);
begin
  DBChart1.Axes.Top.SetMinMax(Min_Horizontal_Value[FirstNo],Max_Horizontal_Value[LastNo]);
end;

procedure TFirstForm.DBChart1Zoom(Sender: TObject);
begin
DBChart1.AllowPanning:=pmBoth;
end;

procedure TFirstForm.DBChart1UndoZoom(Sender: TObject);
begin
DBChart1.AllowPanning:=pmNone;
end;

end.
