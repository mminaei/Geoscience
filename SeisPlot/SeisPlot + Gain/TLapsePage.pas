unit TLapsePage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Chart, Math, Series, ExtCtrls, TeeProcs, TeEngine,
  TeeFunci, TeeEdit, TeeStore, Menus;

type
  TTLapse = class(TForm)
    OpenDialog1: TOpenDialog;
    Chart1: TChart;
    OpenDialog2: TOpenDialog;
    Chart2: TChart;
    Chart3: TChart;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button2: TButton;
    Button1: TButton;
    Button3: TButton;
    Button5: TButton;
    Button4: TButton;
    Button6: TButton;
    GroupBox3: TGroupBox;
    Button9: TButton;
    Button7: TButton;
    Button8: TButton;
    Button10: TButton;
    ChartEditor1: TChartEditor;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    SaveDialog2: TSaveDialog;
    OpenDialog3: TOpenDialog;
    PopupMenu1: TPopupMenu;
    Filling1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Filling2: TMenuItem;
    PopupMenu3: TPopupMenu;
    Filling3: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Filling1Click(Sender: TObject);
    procedure Filling2Click(Sender: TObject);
    procedure Filling3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TLapse: TTLapse;
  Series1: array of TLineSeries;
  Series2: array of TLineSeries;
  Series3: array of TLineSeries;
{  Filling_Area1: array of THorizAreaSeries;
  Filling_Area2: array of TAreaSeries;
  Filling_Area6: array of THorizAreaSeries;
  Filling_Area3: array of TAreaSeries;
  Filling_Area4: array of THorizAreaSeries;
  Filling_Area5: array of TAreaSeries; }
  Lines: TStringList;
  S,S1,S2,S3,S4: String;
  P,P1,P2,P3,P4: Integer;
  ForFree0, ForFree1, ForFree2, ForFree3:TLabel;
  Residual: Real;
  Start_Point1: array of Real;
  Start_Point2: array of Real;
  Horizontal_Step,
  Depth_Step: Real;
  Offset_Step,
  Vertical_Step: Real;
  Is_NRM : Boolean;
  Start_Time,
  End_Time : Real;

implementation

uses LapseChartPrint;

{$R *.dfm}

procedure TTLapse.Button1Click(Sender: TObject);
var
Row_Number,
Number_of_Rows,
Number_of_Points,
//Number_of_Lines,
Number_of_Blocks        : Integer;
Horizontal_Value,
Previous_Vertical_Value,
Previous_Horizontal_Value,
Vertical_Value,
Max_Domain,
T_Min                   : Real;
j,i,P                   :integer;
S,S1                    :String;
Begining_of_Block       : Integer;
begin
 try
  if OpenDialog1.Execute then
    begin
      Screen.Cursor:=crHourGlass;
      Button3.Enabled:=True;
      Is_NRM:=True;
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
      Chart1.LeftAxis.Increment:=Depth_Step;
//      Number_of_Lines:=2;
      Row_Number:=1;
      ForFree1:=TLabel.Create(ForFree0);
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
          SetLength(Start_Point1, i+1);
          Start_Point1[i]:=StrToFloat(S1);
          Horizontal_Value:=Start_Point1[i];
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
{          SetLength(Filling_Area1, Length(Filling_Area1)+1);
          Filling_Area1[i]:=THorizAreaSeries.Create(ForFree1);
          Filling_Area1[i].ParentChart:=Chart1;
          Filling_Area1[i].Name:='Filling_'+IntToStr(i);
          Filling_Area1[i].HorizAxis:=aTopAxis;
          Filling_Area1[i].Stairs:=False;
          Filling_Area1[i].UseYOrigin:=True;
          Filling_Area1[i].YOrigin:=Start_Point1[i];
          Filling_Area1[i].AreaLinesPen.Visible:=False;
          Filling_Area1[i].LinePen.Visible:=False;
          Filling_Area1[i].ColorEachLine:=True;
          Filling_Area1[i].Clear;
          Filling_Area1[i].AddXY(Start_Point1[i],0);}
          SetLength(Series1, Length(Series1)+1);
          Series1[i]:=THorizLineSeries.Create(ForFree1);
          Series1[i].ParentChart:=Chart1;
          Series1[i].Name:='Trace'+IntToStr(i);
          Series1[i].HorizAxis:=aTopAxis;
          Series1[i].Color:=clBlack;
          Series1[i].Stairs:=False;
          Series1[i].AddXY(Start_Point1[i],0);
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
                        Horizontal_Value:=Horizontal_Value*Horizontal_Step/Max_Domain
                      else
                        Horizontal_Value:=0;
                      if Horizontal_Value>0 then
                        begin
                              if Previous_Horizontal_Value<=0 then
                                begin
                                  Residual:= Vertical_Value - ((Vertical_Value-Previous_Vertical_Value)/(Horizontal_Value-Previous_Horizontal_Value) * Horizontal_Value);
//                                  Filling_Area1[i].AddXY(Start_Point1[i], Residual,'',clLime);
                                end;
//                              Filling_Area1[i].AddXY(Start_Point1[i] + Horizontal_Value, Vertical_Value,'',clLime);
                        end
                      else if Horizontal_Value<0 then
                        begin
                              if Previous_Horizontal_Value>=0 then
                                begin
                                  Residual:= Vertical_Value - ((Vertical_Value-Previous_Vertical_Value)/(Horizontal_Value-Previous_Horizontal_Value) * Horizontal_Value);
//                                  Filling_Area1[i].AddXY(Start_Point1[i], Residual,'',clBlue);
                                end;
//                              Filling_Area1[i].AddXY(Start_Point1[i] + Horizontal_Value, Vertical_Value ,'',clBlue);
                        end
                      else
                        begin
{                          if Previous_Horizontal_Value>0 then
                            Filling_Area1[i].AddXY(Start_Point1[i], Vertical_Value,'',clBlue)
                          else if Previous_Horizontal_Value<0 then
                            Filling_Area1[i].AddXY(Start_Point1[i], Vertical_Value,'',clLime)
                          else
                            Filling_Area1[i].AddXY(Start_Point1[i], Vertical_Value,'',clBlue)}
                        end;
                      Series1[i].AddXY(Start_Point1[i] + Horizontal_Value,Vertical_Value);
                   end;
                  Previous_Vertical_Value:=Vertical_Value;
                  Previous_Horizontal_Value:=Horizontal_Value;
                  Vertical_Value:=Vertical_Value+Depth_Step;
                end;
            end;
//          Filling_Area1[i].AddXY(Start_Point1[i], End_Time);
          Series1[i].AddXY(Start_Point1[i], End_Time);
        end;
      Lines.Free;
      Screen.Cursor:=crDefault;
    end;
 except
  MessageDlg('Error reading file.',mterror,[mbok],0);
  ForFree1.Free;
  Lines.Free;
  Button3.Enabled:=False;
  Screen.Cursor:=crDefault;
 end;
end;

procedure TTLapse.Button2Click(Sender: TObject);
var
Row_Number,
Number_of_Rows,
Number_of_Points,
//Number_of_Lines,
Number_of_Blocks        : Integer;
Horizontal_Value,
Vertical_Value,
Previous_Vertical_Value,
Previous_Horizontal_Value,
Max_Domain,
T_Min                   : Real;
j,i,P                   : integer;
S,S1                    : String;
Begining_of_Block       : Integer;
begin
 try
  if OpenDialog2.Execute then
    begin
      Screen.Cursor:=crHourGlass;
      Button3.Enabled:=True;
      Is_NRM:=False;
      Chart1.Title.Font.Size:=12;
      Chart1.Title.Font.Color:=clNavy;
      Chart1.Title.Font.Style:=[fsBold];
      Lines:=TStringList.Create;
      Lines.LoadFromFile(OpenDialog2.FileName);
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
      Chart1.TopAxis.Increment:=Offset_Step;
//      Number_of_Lines:=2;
      Row_Number:=1;
      ForFree1:=TLabel.Create(ForFree0);
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
          SetLength(Start_Point1, i+1);
          Start_Point1[i]:=StrToFloat(S1);
          Vertical_Value:=Start_Point1[i];
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
{          SetLength(Filling_Area2, Length(Filling_Area2)+1);
          Filling_Area2[i]:=TAreaSeries.Create(ForFree1);
          Filling_Area2[i].ParentChart:=Chart1;
          Filling_Area2[i].Name:='Filling_'+IntToStr(i);
          Filling_Area2[i].HorizAxis:=aTopAxis;
          Filling_Area2[i].Stairs:=False;
          Filling_Area2[i].UseYOrigin:=True;
          Filling_Area2[i].YOrigin:=Start_Point1[i];
          Filling_Area2[i].AreaLinesPen.Visible:=False;
          Filling_Area2[i].LinePen.Visible:=False;
          Filling_Area2[i].ColorEachLine:=True;
          Filling_Area2[i].Clear;
          Filling_Area2[i].AddXY(0,Start_Point1[i]);   }
          SetLength(Series1, Length(Series1)+1);
          Series1[i]:=TLineSeries.Create(ForFree1);
          Series1[i].ParentChart:=Chart1;
          Series1[i].Name:='Trace'+IntToStr(i);
          Series1[i].HorizAxis:=aTopAxis;
          Series1[i].Color:=clBlack;
          Series1[i].Stairs:=False;
          Series1[i].AddXY(0,Start_Point1[i]);
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
                        Vertical_Value:=Vertical_Value*Vertical_Step/Max_Domain
                      else
                        Vertical_Value:=0;
                      if Vertical_Value>0 then
                        begin
                              if Previous_Vertical_Value<=0 then
                                begin
                                  Residual:= Horizontal_Value - ((Horizontal_Value-Previous_Horizontal_Value)/(Vertical_Value-Previous_Vertical_Value) * Vertical_Value);
//                                  Filling_Area2[i].AddXY(Residual, Start_Point1[i],'',clBlue);
                                end;
//                              Filling_Area2[i].AddXY(Horizontal_Value, Start_Point1[i] + Vertical_Value,'',clLime);
                        end
                      else if Vertical_Value<0 then
                        begin
                              if Previous_Vertical_Value>=0 then
                                begin
                                  Residual:= Horizontal_Value - ((Horizontal_Value-Previous_Horizontal_Value)/(Vertical_Value-Previous_Vertical_Value) * Vertical_Value);
//                                  Filling_Area2[i].AddXY(Residual, Start_Point1[i],'',clLime);
                                end;
//                              Filling_Area2[i].AddXY(Horizontal_Value, Start_Point1[i] + Vertical_Value,'',clBlue);
                        end
                      else
                        begin
{                          if Previous_Vertical_Value<0 then
                            Filling_Area2[i].AddXY(Horizontal_Value, Start_Point1[i],'',clBlue)
                          else if Previous_Vertical_Value>0 then
                            Filling_Area2[i].AddXY(Horizontal_Value, Start_Point1[i],'',clLime)
                          else
                            Filling_Area2[i].AddXY(Horizontal_Value, Start_Point1[i],'',clLime)}
                        end;
                      Series1[i].AddXY(Horizontal_Value, Start_Point1[i]+Vertical_Value);
                   end;
                  Previous_Vertical_Value:=Vertical_Value;
                  Previous_Horizontal_Value:=Horizontal_Value;
                  Horizontal_Value:=Horizontal_Value + Offset_Step;
                end;
            end;
//          Filling_Area2[i].AddXY(End_Time, Start_Point1[i]);
          Series1[i].AddXY(End_Time,Start_Point1[i]);
        end;
      Lines.Free;
      Screen.Cursor:=crDefault;
    end;
 except
  MessageDlg('Error reading file.',mterror,[mbok],0);
  ForFree1.Free;
  Lines.Free;
  Button3.Enabled:=False;
  Screen.Cursor:=crDefault;
 end;
end;

procedure TTLapse.Button4Click(Sender: TObject);
var
Row_Number,
Number_of_Rows,
Number_of_Points,
//Number_of_Lines,
Number_of_Blocks        : Integer;
Horizontal_Value,
Previous_Vertical_Value,
Previous_Horizontal_Value,
Vertical_Value,
Max_Domain,
T_Min                   : Real;
j,i,P                   :integer;
S,S1                    :String;
Begining_of_Block       : Integer;
begin
 try
  if OpenDialog1.Execute then
    begin
      Screen.Cursor:=crHourGlass;
      Button6.Enabled:=True;
      Is_NRM:=True;
      Chart2.Title.Font.Size:=12;
      Chart2.Title.Font.Color:=clNavy;
      Chart2.Title.Font.Style:=[fsBold];
      Lines:=TStringList.Create;
      Lines.LoadFromFile(OpenDialog1.FileName);
      Chart2.Title.Text.Text:=Lines[0];
      Chart2.LeftAxis.Title.Caption:='Time(Sec)';
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
      Chart2.LeftAxis.SetMinMax(Start_Time,End_Time);
      S1:=Copy(S,21,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Horizontal_Step:=StrToFloat(S1);
      if Horizontal_Step>=1 then
        Chart2.TopAxis.Title.Caption:='Offset(m)'
      else
        Chart2.TopAxis.Title.Caption:='Offset(km)';
      Chart2.TopAxis.Increment:=Horizontal_Step;
      S1:=Copy(S,41,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Depth_Step:=StrToFloat(S1);
      Chart2.LeftAxis.Increment:=Depth_Step;
//      Number_of_Lines:=2;
      Row_Number:=1;
      ForFree2:=TLabel.Create(ForFree0);
      Chart2.Legend.CheckBoxes:=True;
      Chart2.LeftAxis.Inverted:=True;
      Chart2.TopAxis.Visible:=True;
      Chart2.TopAxis.Grid.Visible:=False;
      for i:=0 to Number_of_Blocks-1 do
        begin
          Row_Number:=Row_Number+1;
          S:=Lines[Row_Number];
          S1:=Copy(S,1,10);
          S1:=TrimLeft(S1);
          S1:=TrimRight(S1);
          SetLength(Start_Point2, i+1);
          Start_Point2[i]:=StrToFloat(S1);
          Horizontal_Value:=Start_Point2[i];
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
{          SetLength(Filling_Area4, Length(Filling_Area4)+1);
          Filling_Area4[i]:=THorizAreaSeries.Create(ForFree2);
          Filling_Area4[i].ParentChart:=Chart2;
          Filling_Area4[i].Name:='Filling_'+IntToStr(i);
          Filling_Area4[i].HorizAxis:=aTopAxis;
          Filling_Area4[i].Stairs:=False;
          Filling_Area4[i].UseYOrigin:=True;
          Filling_Area4[i].YOrigin:=Start_Point2[i];
          Filling_Area4[i].AreaLinesPen.Visible:=False;
          Filling_Area4[i].LinePen.Visible:=False;
          Filling_Area4[i].ColorEachLine:=True;
          Filling_Area4[i].Clear;
          Filling_Area4[i].AddXY(Start_Point2[i],0);}
          SetLength(Series2, Length(Series2)+1);
          Series2[i]:=THorizLineSeries.Create(ForFree2);
          Series2[i].ParentChart:=Chart2;
          Series2[i].Name:='Trace'+IntToStr(i);
          Series2[i].HorizAxis:=aTopAxis;
          Series2[i].Color:=clBlack;
          Series2[i].Stairs:=False;
          Series2[i].AddXY(Start_Point2[i],0);
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
                        Horizontal_Value:=Horizontal_Value*Horizontal_Step/Max_Domain
                      else
                        Horizontal_Value:=0;
                      if Horizontal_Value>0 then
                        begin
                              if Previous_Horizontal_Value<=0 then
                                begin
                                  Residual:= Vertical_Value - ((Vertical_Value-Previous_Vertical_Value)/(Horizontal_Value-Previous_Horizontal_Value) * Horizontal_Value);
//                                  Filling_Area4[i].AddXY(Start_Point2[i], Residual,'',clLime);
                                end;
//                              Filling_Area4[i].AddXY(Start_Point2[i] + Horizontal_Value, Vertical_Value,'',clLime);
                        end
                      else if Horizontal_Value<0 then
                        begin
                              if Previous_Horizontal_Value>=0 then
                                begin
                                  Residual:= Vertical_Value - ((Vertical_Value-Previous_Vertical_Value)/(Horizontal_Value-Previous_Horizontal_Value) * Horizontal_Value);
//                                  Filling_Area4[i].AddXY(Start_Point2[i], Residual,'',clBlue);
                                end;
//                              Filling_Area4[i].AddXY(Start_Point2[i] + Horizontal_Value, Vertical_Value ,'',clBlue);
                        end
                      else
                        begin
{                          if Previous_Horizontal_Value>0 then
                            Filling_Area4[i].AddXY(Start_Point2[i], Vertical_Value,'',clBlue)
                          else if Previous_Horizontal_Value<0 then
                            Filling_Area4[i].AddXY(Start_Point2[i], Vertical_Value,'',clLime)
                          else
                            Filling_Area4[i].AddXY(Start_Point2[i], Vertical_Value,'',clBlue)}
                        end;
                      Series2[i].AddXY(Start_Point2[i] + Horizontal_Value,Vertical_Value);
                   end;
                  Previous_Vertical_Value:=Vertical_Value;
                  Previous_Horizontal_Value:=Horizontal_Value;
                  Vertical_Value:=Vertical_Value+Depth_Step;
                end;
            end;
//          Filling_Area4[i].AddXY(Start_Point2[i], End_Time);
          Series2[i].AddXY(Start_Point2[i], End_Time);
        end;
      Lines.Free;
      Screen.Cursor:=crDefault;
    end;
 except
  MessageDlg('Error reading file.',mterror,[mbok],0);
  ForFree2.Free;
  Lines.Free;
  Button6.Enabled:=False;
  Screen.Cursor:=crDefault;
 end;
end;

procedure TTLapse.Button5Click(Sender: TObject);
var
Row_Number,
Number_of_Rows,
Number_of_Points,
//Number_of_Lines,
Number_of_Blocks        : Integer;
Horizontal_Value,
Vertical_Value,
Previous_Vertical_Value,
Previous_Horizontal_Value,
Max_Domain,
T_Min                   : Real;
j,i,P                   : integer;
S,S1                    : String;
Begining_of_Block       : Integer;
begin
 try
  if OpenDialog2.Execute then
    begin
      Screen.Cursor:=crHourGlass;
      Button6.Enabled:=True;
      Is_NRM:=False;
      Chart2.Title.Font.Size:=12;
      Chart2.Title.Font.Color:=clNavy;
      Chart2.Title.Font.Style:=[fsBold];
      Lines:=TStringList.Create;
      Lines.LoadFromFile(OpenDialog2.FileName);
      Chart2.Title.Text.Text:=Lines[0];
      Chart2.TopAxis.Title.Caption:='Time(Sec)';
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
      Chart2.TopAxis.SetMinMax(Start_Time,End_Time);
      S1:=Copy(S,21,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Vertical_Step:=StrToFloat(S1);
      if Vertical_Step>=1 then
        begin
          Chart2.LeftAxis.Title.Caption:='Depth(m)';
        end
      else
        begin
          Chart2.LeftAxis.Title.Caption:='Depth(Km)';
        end;
      Chart2.LeftAxis.Increment:=Vertical_Step;
      S1:=Copy(S,41,10);
      S1:=TrimLeft(S1);
      S1:=TrimRight(S1);
      Offset_Step:=StrToFloat(S1);
      Chart2.TopAxis.Increment:=Offset_Step;
//      Number_of_Lines:=2;
      Row_Number:=1;
      ForFree2:=TLabel.Create(ForFree0);
      Chart2.Legend.CheckBoxes:=True;
      Chart2.LeftAxis.Inverted:=True;
      Chart2.TopAxis.Visible:=True;
      Chart2.LeftAxis.Grid.Visible:=False;
      for i:=0 to Number_of_Blocks-1 do
        begin
          Row_Number:=Row_Number+1;
          S:=Lines[Row_Number];
          S1:=Copy(S,1,10);
          S1:=TrimLeft(S1);
          S1:=TrimRight(S1);
          SetLength(Start_Point2, i+1);
          Start_Point2[i]:=StrToFloat(S1);
          Vertical_Value:=Start_Point2[i];
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
{          SetLength(Filling_Area5, Length(Filling_Area5)+1);
          Filling_Area5[i]:=TAreaSeries.Create(ForFree2);
          Filling_Area5[i].ParentChart:=Chart2;
          Filling_Area5[i].Name:='Filling_'+IntToStr(i);
          Filling_Area5[i].HorizAxis:=aTopAxis;
          Filling_Area5[i].Stairs:=False;
          Filling_Area5[i].UseYOrigin:=True;
          Filling_Area5[i].YOrigin:=Start_Point2[i];
          Filling_Area5[i].AreaLinesPen.Visible:=False;
          Filling_Area5[i].LinePen.Visible:=False;
          Filling_Area5[i].ColorEachLine:=True;
          Filling_Area5[i].Clear;
          Filling_Area5[i].AddXY(0,Start_Point2[i]); }
          SetLength(Series2, Length(Series2)+1);
          Series2[i]:=TLineSeries.Create(ForFree2);
          Series2[i].ParentChart:=Chart2;
          Series2[i].Name:='Trace'+IntToStr(i);
          Series2[i].HorizAxis:=aTopAxis;
          Series2[i].Color:=clBlack;
          Series2[i].Stairs:=False;
          Series2[i].AddXY(0,Start_Point2[i]);
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
                        Vertical_Value:=Vertical_Value*Vertical_Step/Max_Domain
                      else
                        Vertical_Value:=0;
                      if Vertical_Value>0 then
                        begin
                              if Previous_Vertical_Value<=0 then
                                begin
                                  Residual:= Horizontal_Value - ((Horizontal_Value-Previous_Horizontal_Value)/(Vertical_Value-Previous_Vertical_Value) * Vertical_Value);
//                                  Filling_Area5[i].AddXY(Residual, Start_Point2[i],'',clBlue);
                                end;
//                              Filling_Area5[i].AddXY(Horizontal_Value, Start_Point2[i] + Vertical_Value,'',clLime);
                        end
                      else if Vertical_Value<0 then
                        begin
                              if Previous_Vertical_Value>=0 then
                                begin
                                  Residual:= Horizontal_Value - ((Horizontal_Value-Previous_Horizontal_Value)/(Vertical_Value-Previous_Vertical_Value) * Vertical_Value);
//                                  Filling_Area5[i].AddXY(Residual, Start_Point2[i],'',clLime);
                                end;
//                              Filling_Area5[i].AddXY(Horizontal_Value, Start_Point2[i] + Vertical_Value,'',clBlue);
                        end
                      else
                        begin
{                          if Previous_Vertical_Value<0 then
                            Filling_Area5[i].AddXY(Horizontal_Value, Start_Point2[i],'',clBlue)
                          else if Previous_Vertical_Value>0 then
                            Filling_Area5[i].AddXY(Horizontal_Value, Start_Point2[i],'',clLime)
                          else
                            Filling_Area5[i].AddXY(Horizontal_Value, Start_Point2[i],'',clLime)}
                        end;
                      Series2[i].AddXY(Horizontal_Value, Start_Point2[i]+Vertical_Value);
                   end;
                  Previous_Vertical_Value:=Vertical_Value;
                  Previous_Horizontal_Value:=Horizontal_Value;
                  Horizontal_Value:=Horizontal_Value + Offset_Step;
                end;
            end;
//          Filling_Area5[i].AddXY(End_Time, Start_Point2[i]);
          Series2[i].AddXY(End_Time,Start_Point2[i]);
        end;
      Lines.Free;
      Screen.Cursor:=crDefault;
    end;
 except
  MessageDlg('Error reading file.',mterror,[mbok],0);
  ForFree2.Free;
  Lines.Free;
  Button6.Enabled:=False;
  Screen.Cursor:=crDefault;
 end;
end;

procedure TTLapse.Button6Click(Sender: TObject);
begin
  Chart2.RemoveAllSeries;
  Chart2.Axes.Top.Automatic:=True;
  Chart2.Axes.Left.Automatic:=True;
  Finalize(Series2);
//  Finalize(Filling_Area2);
  ForFree2.Free;
  Button6.Enabled:=False;
end;

procedure TTLapse.Button7Click(Sender: TObject);
var
Max_Series : Integer;
i,j : integer;
X_Value, Y_Value:Real;
Previous_X_Value, Previous_Y_Value:Real;
begin
try
  if Is_NRM then
    begin
      Max_Series:=Chart1.SeriesCount div 2;
      if (Chart2.SeriesCount div 2)<>Max_Series then
        begin
          MessageDlg('Two files have different number of traces.',mtError,[mbok],0);
          Exit;
        end;
{      if Chart1.Series[1].MinYValue<>Chart2.Series[1].MinYValue then
        begin
          MessageDlg('Two files have different start time/depth.',mterror,[mbok],0);
          Exit;
        end;
      if Chart1.Series[1].MaxYValue<>Chart2.Series[1].MaxYValue then
        begin
          MessageDlg('Two files have different end time/depth.',mterror,[mbok],0);
          Exit;
        end;}
      Chart3.LeftAxis.Inverted:=True;
      Chart3.TopAxis.Visible:=True;
      ForFree3:=TLabel.Create(ForFree0);
      for i:=0 to Max_Series-1 do
        begin
{          SetLength(Filling_Area6, i+1);
          Filling_Area6[i]:=THorizAreaSeries.Create(ForFree3);
          Filling_Area6[i].ParentChart:=Chart3;
          Filling_Area6[i].Name:='Filling_'+IntToStr(i);
          Filling_Area6[i].HorizAxis:=aTopAxis;
          Filling_Area6[i].Stairs:=False;
          Filling_Area6[i].UseYOrigin:=True;
          Filling_Area6[i].YOrigin:=Start_Point1[i];
          Filling_Area6[i].AreaLinesPen.Visible:=False;
          Filling_Area6[i].LinePen.Visible:=False;
          Filling_Area6[i].ColorEachLine:=True;
          Filling_Area6[i].Clear;
          Filling_Area6[i].AddXY(Start_Point1[i],0); }
          SetLength(Series3, i+1);
          Series3[i]:=THorizLineSeries.Create(ForFree3);
          Series3[i].ParentChart:=Chart3;
          Series3[i].HorizAxis:=aTopAxis;
          Series3[i].Name:='T_Lapse_Trace_'+IntToStr(i);
          Series3[i].Color:=clBlack;
          Series3[i].Stairs:=False;
          Previous_X_Value:=Series2[i].XValues[0]-Series1[i].XValues[0];
          Previous_Y_Value:=Series1[i].YValues[0];
          for j:=0 to Series1[i].Count-1 do
            begin
              X_Value:=Series2[i].XValues[j]-Series1[i].XValues[j];
              Y_Value:=Series1[i].YValues[j];
              if X_Value>0 then
                begin
                  if Previous_X_Value<=0 then
                    begin
                      Residual:= Y_Value - ((Y_Value-Previous_Y_Value)/(X_Value-Previous_X_Value) * X_Value);
//                      Filling_Area6[i].AddXY(Start_Point1[i], Residual,'',clLime);
                    end;
//                  Filling_Area6[i].AddXY(Start_Point1[i] + X_Value, Y_Value,'',clLime);
                end
              else if X_Value<0 then
                begin
                  if Previous_X_Value>=0 then
                    begin
                      Residual:= Y_Value - ((Y_Value-Previous_Y_Value)/(X_Value-Previous_X_Value) * X_Value);
//                      Filling_Area6[i].AddXY(Start_Point1[i], Residual,'',clBlue);
                    end;
//                  Filling_Area6[i].AddXY(Start_Point1[i] + X_Value, Y_Value ,'',clBlue);
                end
              else
                begin
{                  if Previous_X_Value>0 then
                    Filling_Area6[i].AddXY(Start_Point1[i], Y_Value,'',clBlue)
                  else if Previous_X_Value<0 then
                    Filling_Area6[i].AddXY(Start_Point1[i], Y_Value,'',clLime)
                  else
                    Filling_Area6[i].AddXY(Start_Point1[i], Y_Value,'',clBlue)}
                end;
              Series3[i].AddXY(Start_Point1[i] + X_Value, Y_Value);
              Previous_Y_Value:=Y_Value;
              Previous_X_Value:=X_Value;
            end;
        end;
      Button9.Enabled:=True;
      if Chart1.Series[Chart1.SeriesCount-1].MaxXValue >= Chart2.Series[Chart2.SeriesCount-1].MaxXValue then
        begin
         Chart3.TopAxis.SetMinMax(Chart3.Series[0].MinXValue,Chart1.Series[Chart1.SeriesCount-1].MaxXValue);
        end
      else
        begin
         Chart3.TopAxis.SetMinMax(Chart3.Series[0].MinXValue,Chart2.Series[Chart2.SeriesCount-1].MaxXValue);
        end;
      if Chart1.Series[0].MinXValue <= Chart2.Series[1].MinXValue then
        begin
         Chart3.TopAxis.SetMinMax(Chart1.Series[0].MinXValue,Chart3.Series[Chart3.SeriesCount-1].MaxXValue);
        end
      else
        begin
         Chart3.TopAxis.SetMinMax(Chart2.Series[0].MinXValue,Chart3.Series[Chart3.SeriesCount-1].MaxXValue);
        end;
    end
  else
    begin
      Max_Series:=Chart1.SeriesCount div 2;
      if (Chart2.SeriesCount div 2)<>Max_Series then
        begin
          MessageDlg('Two files have different number of traces.',mtError,[mbok],0);
          Exit;
        end;
{      if Chart1.Series[1].MinXValue<>Chart2.Series[1].MinXValue then
        begin
          MessageDlg('Two files have different start time/depth.',mterror,[mbok],0);
          Exit;
        end;
      if Chart1.Series[1].MaxXValue<>Chart2.Series[1].MaxXValue then
        begin
          MessageDlg('Two files have different end time/depth.',mterror,[mbok],0);
          Exit;
        end;  }
      Chart3.LeftAxis.Inverted:=True;
      Chart3.LeftAxis.Visible:=True;
      ForFree3:=TLabel.Create(ForFree0);
      for i:=0 to Max_Series-1 do
        begin
{          SetLength(Filling_Area3, i+1);
          Filling_Area3[i]:=TAreaSeries.Create(ForFree3);
          Filling_Area3[i].ParentChart:=Chart3;
          Filling_Area3[i].Name:='Filling_'+IntToStr(i);
          Filling_Area3[i].HorizAxis:=aTopAxis;
          Filling_Area3[i].Stairs:=False;
          Filling_Area3[i].UseYOrigin:=True;
          Filling_Area3[i].YOrigin:=Start_Point1[i];
          Filling_Area3[i].AreaLinesPen.Visible:=False;
          Filling_Area3[i].LinePen.Visible:=False;
          Filling_Area3[i].ColorEachLine:=True;
          Filling_Area3[i].Clear;
          Filling_Area3[i].AddXY(0, Start_Point1[i]);}
          SetLength(Series3, i+1);
          Series3[i]:=TLineSeries.Create(ForFree3);
          Series3[i].ParentChart:=Chart3;
          Series3[i].HorizAxis:=aTopAxis;
          Series3[i].Name:='T_Lapse_Trace_'+IntToStr(i);
          Series3[i].Color:=clBlack;
          Series3[i].Stairs:=False;
          Previous_Y_Value:=Series2[i].YValues[0]-Series1[i].YValues[0];
          Previous_X_Value:=Series1[i].XValues[0];
          for j:=0 to Series1[i].Count-1 do
            begin
              Y_Value:=Series2[i].YValues[j]-Series1[i].YValues[j];
              X_Value:=Series1[i].XValues[j];
              if Y_Value>0 then
                begin
                  if Previous_Y_Value<=0 then
                    begin
                      Residual:= X_Value - ((X_Value-Previous_X_Value)/(Y_Value-Previous_Y_Value) * Y_Value);
//                      Filling_Area3[i].AddXY(Start_Point1[i], Residual,'',clLime);
                    end;
//                  Filling_Area3[i].AddXY( X_Value, Start_Point1[i] + Y_Value, '',clLime);
                end
              else if Y_Value<0 then
                begin
                  if Previous_Y_Value>=0 then
                    begin
                      Residual:= X_Value - ((X_Value-Previous_X_Value)/(Y_Value-Previous_Y_Value) * Y_Value);
//                      Filling_Area3[i].AddXY(Start_Point1[i], Residual,'',clBlue);
                    end;
//                  Filling_Area3[i].AddXY( X_Value, Start_Point1[i] + Y_Value,'',clBlue);
                end
              else
                begin
{                  if Previous_Y_Value>0 then
                    Filling_Area3[i].AddXY(X_Value, Start_Point1[i], '',clBlue)
                  else if Previous_Y_Value<0 then
                    Filling_Area3[i].AddXY(X_Value,Start_Point1[i], '',clLime)
                  else
                    Filling_Area3[i].AddXY( X_Value,Start_Point1[i],'',clBlue)}
                end;
              Series3[i].AddXY( X_Value, Start_Point1[i] + Y_Value);
              Previous_Y_Value:=Y_Value;
              Previous_X_Value:=X_Value;
            end;

        end;
      Button9.Enabled:=True;
      if Chart1.Series[Chart1.SeriesCount-1].MaxYValue >= Chart2.Series[Chart2.SeriesCount-1].MaxYValue then
        begin
         Chart3.LeftAxis.SetMinMax(Chart3.Series[0].MinYValue,Chart1.Series[Chart1.SeriesCount-1].MaxYValue);
        end
      else
        begin
         Chart3.LeftAxis.SetMinMax(Chart3.Series[0].MinYValue,Chart2.Series[Chart2.SeriesCount-1].MaxYValue);
        end;
      if Chart1.Series[0].MinYValue <= Chart2.Series[1].MinYValue then
        begin
         Chart3.LeftAxis.SetMinMax(Chart1.Series[0].MinYValue,Chart3.Series[Chart3.SeriesCount-1].MaxYValue);
        end
      else
        begin
         Chart3.LeftAxis.SetMinMax(Chart2.Series[0].MinYValue,Chart3.Series[Chart3.SeriesCount-1].MaxYValue);
        end;
    end;
except
  ForFree3.Free;
  Button9.Enabled:=False;
end;
end;

procedure TTLapse.Button3Click(Sender: TObject);
begin
  Chart1.RemoveAllSeries;
  Chart1.Axes.Top.Automatic:=True;
  Chart1.Axes.Left.Automatic:=True;
  Finalize(Series1);
//  Finalize(Filling_Area1);
  ForFree1.Free;
  Button3.Enabled:=False;
end;

procedure TTLapse.Button8Click(Sender: TObject);
begin
LapsePrint:=TLapsePrint.Create(Self);
LapsePrint.ShowModal;
LapsePrint.Free;
end;

procedure TTLapse.Button9Click(Sender: TObject);
begin
  Chart3.RemoveAllSeries;
  Chart3.Axes.Top.Automatic:=True;
  Chart3.Axes.Left.Automatic:=True;
  Finalize(Series3);
  ForFree3.Free;
  Button9.Enabled:=False;
end;

procedure TTLapse.Button10Click(Sender: TObject);
begin
  ForFree0.Free;
  Close;
end;

procedure TTLapse.FormCreate(Sender: TObject);
begin
  Button3.Enabled:=False;
  Button6.Enabled:=False;
  Button9.Enabled:=False;
  ForFree0:=TLabel.Create(Self);
end;

procedure TTLapse.Button11Click(Sender: TObject);
begin
  ChartEditor1.Chart:=Chart1;
  ChartEditor1.Execute;
end;

procedure TTLapse.Button12Click(Sender: TObject);
begin
  ChartEditor1.Chart:=Chart2;
  ChartEditor1.Execute;
end;

procedure TTLapse.Button13Click(Sender: TObject);
begin
  ChartEditor1.Chart:=Chart3;
  ChartEditor1.Execute;
end;

procedure TTLapse.Button14Click(Sender: TObject);
begin
  if SaveDialog2.Execute then
    SaveChartToFile(TCustomChart(Chart1), SaveDialog2.FileName, False, False);
end;

procedure TTLapse.Button16Click(Sender: TObject);
begin
  if SaveDialog2.Execute then
    SaveChartToFile(TCustomChart(Chart2), SaveDialog2.FileName, False, False);
end;

procedure TTLapse.Button18Click(Sender: TObject);
begin
  if SaveDialog2.Execute then
    SaveChartToFile(TCustomChart(Chart3), SaveDialog2.FileName, False, False);
end;

procedure TTLapse.Button15Click(Sender: TObject);
begin
  if OpenDialog3.Execute then
    LoadChartFromFile(TCustomChart(Chart1), OpenDialog3.FileName);
end;

procedure TTLapse.Button17Click(Sender: TObject);
begin
  if OpenDialog3.Execute then
    LoadChartFromFile(TCustomChart(Chart2), OpenDialog3.FileName);
end;

procedure TTLapse.Button19Click(Sender: TObject);
begin
  if OpenDialog3.Execute then
    LoadChartFromFile(TCustomChart(Chart3), OpenDialog3.FileName);
end;

procedure TTLapse.Filling1Click(Sender: TObject);
var
i : integer;
begin
{ if Filling1.Checked then
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
      Filling1.Checked:=False;
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
      Filling1.Checked:=True;
    end;}
end;

procedure TTLapse.Filling2Click(Sender: TObject);
var
i : integer;
begin
{ if Filling2.Checked then
    begin
      if Length(Filling_Area4)>0 then
        for i:=0 to Length(Filling_Area4)-1 do
          begin
            Filling_Area4[i].Visible:=False;
          end;
      if Length(Filling_Area5)>0 then
        for i:=0 to Length(Filling_Area5)-1 do
          begin
            Filling_Area5[i].Visible:=False;
          end;
      Filling2.Checked:=False;
    end
  else
    begin
      if Length(Filling_Area4)>0 then
        for i:=0 to Length(Filling_Area4)-1 do
          begin
            Filling_Area4[i].Visible:=True;
          end;
      if Length(Filling_Area5)>0 then
        for i:=0 to Length(Filling_Area5)-1 do
          begin
            Filling_Area5[i].Visible:=True;
          end;
      Filling2.Checked:=True;
    end;}
end;

procedure TTLapse.Filling3Click(Sender: TObject);
var
i : integer;
begin
{ if Filling3.Checked then
    begin
      if Length(Filling_Area3)>0 then
        for i:=0 to Length(Filling_Area3)-1 do
          begin
            Filling_Area3[i].Visible:=False;
          end;
      if Length(Filling_Area6)>0 then
        for i:=0 to Length(Filling_Area6)-1 do
          begin
            Filling_Area6[i].Visible:=False;
          end;
      Filling3.Checked:=False;
    end
  else
    begin
      if Length(Filling_Area3)>0 then
        for i:=0 to Length(Filling_Area3)-1 do
          begin
            Filling_Area3[i].Visible:=True;
          end;
      if Length(Filling_Area6)>0 then
        for i:=0 to Length(Filling_Area6)-1 do
          begin
            Filling_Area6[i].Visible:=True;
          end;
      Filling3.Checked:=True;
    end;}
end;

end.
