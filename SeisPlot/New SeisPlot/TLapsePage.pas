unit TLapsePage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Chart, Math, Series, ExtCtrls, TeeProcs, TeEngine,
  TeeFunci;

type
  TTLapse = class(TForm)
    OpenDialog1: TOpenDialog;
    Chart1: TChart;
    OpenDialog2: TOpenDialog;
    Chart2: TChart;
    Chart3: TChart;
    sButton5: TButton;
    sButton10: TButton;
    sButton6: TButton;
    sButton9: TButton;
    sButton7: TButton;
    sButton8: TButton;
    sButton1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TLapse: TTLapse;
  Lines:TStringList;
  ForFree0:TLabel;
  ForFree1:TLabel;
  ForFree2:TLabel;
  ForFree3:TLabel;
  Series1:array[1..999] of THorizLineSeries;
  Series2:array[1..999] of THorizLineSeries;
  Series3:array[1..999] of THorizLineSeries;
  Start_Point1:array[1..999] of Real;
  Start_Point2:array[1..999] of Real;

implementation

uses LapseChartPrint;

{$R *.dfm}

procedure TTLapse.FormCreate(Sender: TObject);
begin
ForFree0:=TLabel.Create(Self);
sButton10.Enabled:=False;
sButton9.Enabled:=False;
sButton8.Enabled:=False;
sButton7.Enabled:=False;
sButton6.Enabled:=False;
end;

procedure TTLapse.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ForFree0.Free;
Free;
end;

procedure TTLapse.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Chart1.Height:=NewHeight-80;
Chart2.Height:=NewHeight-80;
Chart3.Height:=NewHeight-80;
Chart1.Width:=177+Trunc((NewWidth-675)/3);
Chart2.Width:=Chart1.Width;
Chart3.Width:=Chart1.Width;
Chart2.Left:=Chart1.Left+Chart1.Width+7;
Chart3.Left:=Chart2.Left+Chart2.Width+7;
sButton1.Top:=NewHeight-65;
sButton5.Left:=Chart1.Left+5;
sButton10.Left:=sButton5.Left+80;
sButton6.Left:=Chart2.Left+5;
sButton9.Left:=sButton6.Left+80;
sButton7.Left:=Chart3.Left+5;
sButton8.Left:=sButton7.Left+80;
end;

procedure TTLapse.Button1Click(Sender: TObject);
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
      S1:=Copy(S,6,5);
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
      S1:=Copy(S,41,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Depth_Step:=StrToFloat(S1);
      Chart1.TopAxis.Increment:=Horizontal_Step;
      Chart1.LeftAxis.Increment:=0.1;
      Number_of_Lines:=2;
      Row_Number:=1;
      ForFree1:=TLabel.Create(ForFree0);
      Chart1.Legend.CheckBoxes:=True;
      Chart1.LeftAxis.Inverted:=True;
      Chart1.TopAxis.Visible:=True;
      Chart1.TopAxis.Grid.Visible:=False;
      for i:=1 to Number_of_Blocks do
        begin
          Row_Number:=Row_Number+1;
          S:=Lines[Row_Number];
          S1:=Copy(S,1,10);
          S1:=TrimLeft(S1);
          S1:=TrimRight(S1);
          Start_Point1[i]:=StrToFloat(S1);
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
          Series1[i]:=THorizLineSeries.Create(Forfree1);
          Series1[i].ParentChart:=Chart1;
          Series1[i].Name:='First_File_Trace'+IntToStr(i);
          Series1[i].HorizAxis:=aTopAxis;
          Series1[i].Color:=clGreen;
          Series1[i].Stairs:=False;
          Chart1.Series[i-1].AddXY(Start_Point1[i],0);
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
                      Chart1.Series[i-1].AddXY(Start_Point1[i]+Horizontal_Value,Vertical_Value);
{                      if Horizontal_Value>0 then
                        begin
                          Chart1.Series1[i-1].AddXY(Start_Point[i],Vertical_Value);
                        end;
 }                   end;
                  Vertical_Value:=Vertical_Value+Depth_Step;
                end;
            end;
            Chart1.Series[i-1].AddXY(Start_Point1[i],End_Time);
        end;
      Lines.Free;
      Screen.Cursor:=crDefault;
      sButton6.Enabled:=True;
      sButton10.Enabled:=True;
    end;
 except
  MessageDlg('Error reading file.',mterror,[mbok],0);
  ForFree1.Free;
  Lines.Free;
  Screen.Cursor:=crDefault;
 end;
end;

procedure TTLapse.Button2Click(Sender: TObject);
begin
ForFree1.Free;
sButton10.Enabled:=False;
end;

procedure TTLapse.Button3Click(Sender: TObject);
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
Max_Domain,
T_Min                   : Real;
j,i,P                   :integer;
S,S1                    :String;
Begining_of_Block       : Integer;
Start_Time,
End_Time                : Real;
begin
 try
  if OpenDialog2.Execute then
    begin
      Screen.Cursor:=crHourGlass;
      Chart2.Title.Font.Size:=12;
      Chart2.Title.Font.Color:=clNavy;
      Chart2.Title.Font.Style:=[fsBold];
      Lines:=TStringList.Create;
      Lines.LoadFromFile(OpenDialog2.FileName);
      Chart2.Title.Text.Text:=Lines[0];
      Chart2.LeftAxis.Title.Caption:='Time(Sec)';
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
      Chart2.LeftAxis.SetMinMax(Start_Time,End_Time);
      S1:=Copy(S,21,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Horizontal_Step:=StrToFloat(S1);
      if Horizontal_Step>=1 then
        Chart2.TopAxis.Title.Caption:='Offset(m)'
      else
        Chart2.TopAxis.Title.Caption:='Offset(km)';
      S1:=Copy(S,41,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Depth_Step:=StrToFloat(S1);
      Chart2.TopAxis.Increment:=Horizontal_Step;
      Chart2.LeftAxis.Increment:=0.1;
      Number_of_Lines:=2;
      Row_Number:=1;
      ForFree2:=TLabel.Create(ForFree0);
      Chart2.Legend.CheckBoxes:=True;
      Chart2.LeftAxis.Inverted:=True;
      Chart2.TopAxis.Visible:=True;
      Chart2.TopAxis.Grid.Visible:=False;
      for i:=1 to Number_of_Blocks do
        begin
          Row_Number:=Row_Number+1;
          S:=Lines[Row_Number];
          S1:=Copy(S,1,10);
          S1:=TrimLeft(S1);
          S1:=TrimRight(S1);
          Start_Point2[i]:=StrToFloat(S1);
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
          Series2[i]:=THorizLineSeries.Create(Forfree2);
          Series2[i].ParentChart:=Chart2;
          Series2[i].Name:='Second_File_Trace'+IntToStr(i);
          Series2[i].HorizAxis:=aTopAxis;
          Series2[i].Color:=clGreen;
          Series2[i].Stairs:=False;
          Chart2.Series[i-1].AddXY(Start_Point2[i],0);
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
                      Chart2.Series[i-1].AddXY(Start_Point2[i]+Horizontal_Value,Vertical_Value);
                   end;
                  Vertical_Value:=Vertical_Value+Depth_Step;
                end;
            end;
            Chart2.Series[i-1].AddXY(Start_Point2[i],End_Time);
        end;
      Lines.Free;
      Screen.Cursor:=crDefault;
      sButton7.Enabled:=True;
      sButton9.Enabled:=True;
    end;
 except
  MessageDlg('Error reading file.',mterror,[mbok],0);
  ForFree2.Free;
  Lines.Free;
  Screen.Cursor:=crDefault;
 end;
end;

procedure TTLapse.Button4Click(Sender: TObject);
begin
ForFree2.Free;
sButton9.Enabled:=False;
end;

procedure TTLapse.Button5Click(Sender: TObject);
var
Max_Series : Integer;
i,j : integer;
X_Value, Y_Value:Real;
begin
  Max_Series:=Chart1.SeriesCount;
  if Chart2.SeriesCount<>Max_Series then
    begin
      MessageDlg('Two files have different number of traces.',mtError,[mbok],0);
      Exit;
    end;
  if Chart1.Series[0].MinYValue<>Chart2.Series[0].MinYValue then
    begin
      MessageDlg('Two files have different start time/depth.',mterror,[mbok],0);
      Exit;
    end;
  if Chart1.Series[0].MaxYValue<>Chart2.Series[0].MaxYValue then
    begin
      MessageDlg('Two files have different end time/depth.',mterror,[mbok],0);
      Exit;
    end;
  Chart3.LeftAxis.Inverted:=True;
  Chart3.TopAxis.Visible:=True;
  Chart3.TopAxis.Grid.Visible:=False;
  Chart3.LeftAxis.Increment:=Chart2.LeftAxis.Increment;
  ForFree3:=TLabel.Create(ForFree0);
  for i:=1 to Max_Series do
    begin
      Series3[i]:=THorizLineSeries.Create(ForFree3);
      Series3[i].ParentChart:=Chart3;
      Series3[i].HorizAxis:=aTopAxis;
      Series3[i].Name:='T_Lapse_Trace'+IntToStr(i);
      Series3[i].Color:=clGreen;
      Series3[i].Stairs:=False;
      for j:=0 to Series1[i].Count-1 do
        begin
          X_Value:=ABS(Series2[i].XValues[j]-Series1[i].XValues[j]);
          Y_Value:=Series1[i].YValues[j];
          Series3[i].AddXY(X_Value+Start_Point1[i], Y_Value);
        end;
    end;
  if Chart1.Series[Chart1.SeriesCount-1].MaxXValue >= Chart2.Series[Chart2.SeriesCount-1].MaxXValue then
    begin
     Chart3.TopAxis.SetMinMax(Chart3.Series[0].MinXValue,Chart1.Series[Chart1.SeriesCount-1].MaxXValue);
    end
  else
    begin
     Chart3.TopAxis.SetMinMax(Chart3.Series[0].MinXValue,Chart2.Series[Chart2.SeriesCount-1].MaxXValue);
    end;
  if Chart1.Series[0].MinXValue <= Chart2.Series[0].MinXValue then
    begin
     Chart3.TopAxis.SetMinMax(Chart1.Series[0].MinXValue,Chart3.Series[Chart3.SeriesCount-1].MaxXValue);
    end
  else
    begin
     Chart3.TopAxis.SetMinMax(Chart2.Series[0].MinXValue,Chart3.Series[Chart3.SeriesCount-1].MaxXValue);
    end;
    sButton7.Enabled:=False;
    sButton8.Enabled:=True;
end;

procedure TTLapse.Button6Click(Sender: TObject);
begin
  sButton10.Enabled:=False;
  sButton9.Enabled:=False;
  sButton7.Enabled:=False;
  sButton8.Enabled:=False;
  sButton6.Enabled:=False;
  sButton5.Enabled:=True;
  ForFree1.Free;
  ForFree2.Free;
  ForFree3.Free;
end;

procedure TTLapse.Button7Click(Sender: TObject);
begin
LapsePrint:=TLapsePrint.Create(Self);
LapsePrint.ShowModal;
LapsePrint.Free;
end;

end.
