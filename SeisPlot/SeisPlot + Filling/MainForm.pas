unit MainForm;

interface

uses
  Windows, Classes, XPMan, Dialogs, TeeEdit, Menus, ComCtrls, jpeg, ExtCtrls,
  Controls, ToolWin, TeEngine, Series, Math, Graphics,
  Forms, TeeProcs, Chart, StdCtrls, SysUtils;

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
    ColorDialog1: TColorDialog;
    ools1: TMenuItem;
    N3: TMenuItem;
    Options1: TMenuItem;
    Color1: TMenuItem;
    Edit1: TMenuItem;
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
    procedure Button2Click(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure Color1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Filling_Area1: array of THorizAreaSeries;
    Filling_Area2: array of TAreaSeries;
    Series:array of TLineSeries;
    { Public declarations }
  end;

var
  FirstForm: TFirstForm;
  Lines: TStringList;
  S,S1,S2,S3,S4: String;
  P,P1,P2,P3,P4: Integer;
  i,j,k,l,n: Integer;
  ForFree:TLabel;
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
//  TempSeries:THorizLineSeries;
  The_Color:TColor;
  Difference:Real;
  The_Value:Real;
  TempFile:TextFile;
  File_Size:Integer;
  Legend_Max,Legend_Min:Real;
//  ChartTool: TSeriesRegionTool;
  Residual: Real;

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
ToolButton3.Width:=NewWidth-450;
end;

procedure TFirstForm.SaveGraph1Click(Sender: TObject);
begin
if SaveDialog1.Execute then Chart1.SaveToBitmapFile(SaveDialog1.FileName);
end;

procedure TFirstForm.sButton7Click(Sender: TObject);
begin
    Chart1.RemoveAllSeries;
    ForFree.Free;
    Finalize(Filling_Area1);
    Finalize(Filling_Area2);
    Finalize(Series);
    Chart1.LeftAxis.Automatic:=True;
    Chart1.TopAxis.Automatic:=True;
    Chart1.Title.Text.Text:='P.U.T SeisPlot';
    Chart1.LeftAxis.Grid.Visible:=False;
    Chart1.TopAxis.Grid.Visible:=False;
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
    Options1.Checked:=False;
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
Previous_Horizontal_Value,
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
          SetLength(Filling_Area1, Length(Filling_Area1)+1);
          Filling_Area1[i]:=THorizAreaSeries.Create(Forfree);
          Filling_Area1[i].ParentChart:=Chart1;
          Filling_Area1[i].Name:='Filling_'+IntToStr(i);
          Filling_Area1[i].HorizAxis:=aTopAxis;
          Filling_Area1[i].Stairs:=False;
          Filling_Area1[i].UseYOrigin:=True;
          Filling_Area1[i].YOrigin:=Start_Point;
          Filling_Area1[i].AreaLinesPen.Visible:=False;
          Filling_Area1[i].LinePen.Visible:=False;
          Filling_Area1[i].ColorEachLine:=True;
          Filling_Area1[i].Clear;
          Filling_Area1[i].AddXY(Start_Point,0);
          SetLength(Series, Length(Series)+1);
          Series[i]:=THorizLineSeries.Create(Forfree);
          Series[i].ParentChart:=Chart1;
          Series[i].Name:='Trace'+IntToStr(i);
          Series[i].HorizAxis:=aTopAxis;
          Series[i].Color:=clBlack;
          Series[i].Stairs:=False;
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
          for j:=1 to Number_of_Rows do
            begin
              Row_Number:=Row_Number+1;
              S:=Lines[Row_Number];
              Previous_Vertical_Value:=Vertical_Value;
              Previous_Horizontal_Value:=Horizontal_Value;
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
                        Horizontal_Value:=Horizontal_Value*Horizontal_Step/Max_Domain/2
                      else
                        Horizontal_Value:=0;
                      if Horizontal_Value>0 then
                        begin
                              if Previous_Horizontal_Value<=0 then
                                begin
                                  Residual:= Vertical_Value - ((Vertical_Value-Previous_Vertical_Value)/(Horizontal_Value-Previous_Horizontal_Value) * Horizontal_Value);
                                  Filling_Area1[i].AddXY(Start_Point, Residual,'',clLime);
                                end;
                              Filling_Area1[i].AddXY(Start_Point + Horizontal_Value, Vertical_Value,'',clLime);
                        end
                      else if Horizontal_Value<0 then
                        begin
                              if Previous_Horizontal_Value>=0 then
                                begin
                                  Residual:= Vertical_Value - ((Vertical_Value-Previous_Vertical_Value)/(Horizontal_Value-Previous_Horizontal_Value) * Horizontal_Value);
                                  Filling_Area1[i].AddXY(Start_Point, Residual,'',clBlue);
                                end;
                              Filling_Area1[i].AddXY(Start_Point + Horizontal_Value, Vertical_Value ,'',clBlue);
                        end
                      else
                        begin
                          if Previous_Horizontal_Value>0 then
                            Filling_Area1[i].AddXY(Start_Point, Vertical_Value,'',clBlue)
                          else if Previous_Horizontal_Value<0 then
                            Filling_Area1[i].AddXY(Start_Point, Vertical_Value,'',clLime)
                          else
                            Filling_Area1[i].AddXY(Start_Point, Vertical_Value,'',clBlue)
                        end;
                      Series[i].AddXY(Start_Point+Horizontal_Value,Vertical_Value);
                   end;
                  Previous_Vertical_Value:=Vertical_Value;
                  Previous_Horizontal_Value:=Horizontal_Value;
                  Vertical_Value:=Vertical_Value+Depth_Step;
                end;
            end;
          Filling_Area1[i].AddXY(Start_Point,End_Time);
          Series[i].AddXY(Start_Point,End_Time);
        end;
      Lines.Free;
      Options1.Checked:=True;
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
Previous_Horizontal_Value,
Offset_Step,
Vertical_Step,
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
      Vertical_Step:=StrToFloat(S1);
      if Vertical_Step>=1 then
        begin
          Chart1.LeftAxis.Title.Caption:='Depth(m)';
        end
      else
        begin
          Chart1.LeftAxis.Title.Caption:='Depth(Km)';
        end;
      Chart1.LeftAxis.Increment:=Vertical_Step;
      S1:=Copy(S,41,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Offset_Step:=StrToFloat(S1);
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
          Horizontal_Value:=T_Min;
          S1:=Copy(S,36,5);
          S1:=TrimLeft(S1);
          S1:=TrimRight(S1);
          Number_of_Points:=StrToInt(S1);
          SetRoundMode(rmUp);
          if Number_of_Points=0 then
            Number_of_Rows:=1
          else
            Number_of_Rows:=Round(Number_of_Points/16);
          SetLength(Filling_Area2, Length(Filling_Area2)+1);
          Filling_Area2[i]:=TAreaSeries.Create(Forfree);
          Filling_Area2[i].ParentChart:=Chart1;
          Filling_Area2[i].Name:='Filling_'+IntToStr(i);
          Filling_Area2[i].HorizAxis:=aTopAxis;
          Filling_Area2[i].Stairs:=False;
          Filling_Area2[i].UseYOrigin:=True;
          Filling_Area2[i].YOrigin:=Start_Point;
          Filling_Area2[i].AreaLinesPen.Visible:=False;
          Filling_Area2[i].LinePen.Visible:=False;
          Filling_Area2[i].ColorEachLine:=True;
          Filling_Area2[i].Clear;
          Filling_Area2[i].AddXY(0,Start_Point);
          SetLength(Series, Length(Series)+1);
          Series[i]:=TLineSeries.Create(Forfree);
          Series[i].ParentChart:=Chart1;
          Series[i].Name:='Trace'+IntToStr(i);
          Series[i].HorizAxis:=aTopAxis;
          Series[i].Color:=clBlack;
          Series[i].Stairs:=False;
          Series[i].AddXY(0,Start_Point);
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
          for j:=1 to Number_of_Rows do
            begin
              Row_Number:=Row_Number+1;
              S:=Lines[Row_Number];
              Previous_Vertical_Value:=Vertical_Value;
              Previous_Horizontal_Value:=Horizontal_Value;
              for p:=1 to 16 do
                begin
                  if S<>'' then
                    begin
                      S1:=Copy(S,0,5);
                      Delete(S,1,5);
                      S1:=TrimLeft(S1);
                      S1:=TrimRight(S1);
                      Vertical_Value:=StrToFloat(S1);
                      if Max_Domain<>0 then
                        Vertical_Value:=Vertical_Value*Vertical_Step/Max_Domain/2
                      else
                        Vertical_Value:=0;
                      if Vertical_Value>0 then
                        begin
                              if Previous_Vertical_Value<=0 then
                                begin
                                  Residual:= Horizontal_Value - ((Horizontal_Value-Previous_Horizontal_Value)/(Vertical_Value-Previous_Vertical_Value) * Vertical_Value);
                                  Filling_Area2[i].AddXY(Residual, Start_Point,'',clBlue);
                                end;
                              Filling_Area2[i].AddXY(Horizontal_Value, Start_Point + Vertical_Value,'',clLime);
                        end
                      else if Vertical_Value<0 then
                        begin
                              if Previous_Vertical_Value>=0 then
                                begin
                                  Residual:= Horizontal_Value - ((Horizontal_Value-Previous_Horizontal_Value)/(Vertical_Value-Previous_Vertical_Value) * Vertical_Value);
                                  Filling_Area2[i].AddXY(Residual, Start_Point,'',clLime);
                                end;
                              Filling_Area2[i].AddXY(Horizontal_Value, Start_Point + Vertical_Value,'',clBlue);
                        end
                      else
                        begin
                          if Previous_Vertical_Value<0 then
                            Filling_Area2[i].AddXY(Horizontal_Value, Start_Point,'',clBlue)
                          else if Previous_Vertical_Value>0 then
                            Filling_Area2[i].AddXY(Horizontal_Value, Start_Point,'',clLime)
                          else
                            Filling_Area2[i].AddXY(Horizontal_Value, Start_Point,'',clLime)
                        end;
                      Series[i].AddXY(Horizontal_Value, Start_Point+Vertical_Value);
                   end;
                  Previous_Vertical_Value:=Vertical_Value;
                  Previous_Horizontal_Value:=Horizontal_Value;
                  Horizontal_Value:=Horizontal_Value + Offset_Step;
                end;
            end;
          Filling_Area2[i].AddXY(End_Time, Start_Point);
          Series[i].AddXY(End_Time,Start_Point);
{          ChartTool:=TSeriesRegionTool.Create(ForFree);
          ChartTool.AutoBounds:=True;
          ChartTool.Series:=Series[i];
          ChartTool.ParentChart:=Chart1;
          ChartTool.Origin:=Start_Point;
          ChartTool.Pen.Visible:=False;
          ChartTool.Gradient.StartColor:=clBlue;
          ChartTool.Gradient.EndColor:=clLime;
          ChartTool.Gradient.Visible:=True;
          ChartTool.Gradient.Balance:=50;
          ChartTool.Gradient.Direction:=gdTopBottom;}
        end;
      Lines.Free;
      Options1.Checked:=True;
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

procedure TFirstForm.Button2Click(Sender: TObject);
var
i: integer;
begin
end;

procedure TFirstForm.Options1Click(Sender: TObject);
var
i : integer;
begin
  if Options1.Checked then
    begin
      if Length(Filling_Area1)>0 then
        for i:=0 to Length(Filling_Area1)-1 do
          begin
            Filling_Area1[i].Visible:=False;
          end;
      if Length(Filling_Area2)>0 then
        for i:=0 to Length(Filling_Area2)-1 do
          begin
            Filling_Area2[i].Visible:=False;
          end;
      Options1.Checked:=False;
    end
  else
    begin
      if Length(Filling_Area1)>0 then
        for i:=0 to Length(Filling_Area1)-1 do
          begin
            Filling_Area1[i].Visible:=True;
          end;
      if Length(Filling_Area2)>0 then
        for i:=0 to Length(Filling_Area2)-1 do
          begin
            Filling_Area2[i].Visible:=True;
          end;
      Options1.Checked:=True;
    end;
end;

procedure TFirstForm.Color1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    begin
      for i:=0 to Length(Series)-1 do
        begin
          Series[i].Color:=ColorDialog1.Color;
        end;
    end;
end;

procedure TFirstForm.Edit1Click(Sender: TObject);
begin
  ChartEditor1.Execute;
end;

end.
