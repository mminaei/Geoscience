unit TLapsePage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ESBPCSEdit, ESBPCSNumEdit, sButtonControl,
  sCustomButton, ExtCtrls, TeeProcs, TeEngine, Chart, Math, Series,
  TeeFunci, TeeURL, TeeSeriesTextEd, TeeTools;

type
  TTLapse = class(TForm)
    sButton5: TsButton;
    sButton6: TsButton;
    OpenDialog1: TOpenDialog;
    Chart1: TChart;
    Chart2: TChart;
    sButton7: TsButton;
    sButton8: TsButton;
    sButton9: TsButton;
    sButton10: TsButton;
    OpenDialog2: TOpenDialog;
    sButton1: TsButton;
    ChartTool1: TMarksTipTool;
    ChartTool2: TMarksTipTool;
    Chart3: TChart;
    MarksTipTool1: TMarksTipTool;
    procedure sButton5Click(Sender: TObject);
    procedure sButton6Click(Sender: TObject);
    procedure sButton7Click(Sender: TObject);
    procedure sButton8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sButton9Click(Sender: TObject);
    procedure sButton10Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sButton1Click(Sender: TObject);
    procedure TopAxisDrawLabel(Sender:TChartAxis; var X,Y,Z:Integer;
                                               var Text:String;
                                               var DrawLabel:Boolean);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Fields:array[1..999] of string[30];
    FN:Integer;
    Selected_Track:Integer;
  end;

var
  TLapse: TTLapse;
  Lines:TStringList;
  ForFree0:TLabel;
  ForFree1:TLabel;
  ForFree2:TLabel;
  ForFree3:TLabel;
  Series1: THorizLineSeries;
  Series2: THorizLineSeries;
  Series3: THorizLineSeries;
  Emptiness1,Emptiness2,Digit,First_Space:Boolean;
  Sp_Number : integer;
  XMIN,XMAX:Real;

implementation

uses LASSelection, LapseChartPrint;

{$R *.dfm}

procedure TTLapse.TopAxisDrawLabel(Sender:TChartAxis; var X,Y,Z:Integer;
                                               var Text:String;
                                               var DrawLabel:Boolean);
begin
    with Sender do
    if X=CalcPosValue(Minimum{+((Maximum-Minimum)/40)}) then  // first label
    begin
      with ParentChart.Canvas do
      begin
        TextAlign:=TextAlign - TA_CENTER + TA_LEFT;  // align to left
        Font.Style:=[fsBold];
      end;
    end
    else
    if X=CalcPosValue(Maximum{-((Maximum-Minimum)/40)}) then  // last label
    begin
      with ParentChart.Canvas do
      begin
        TextAlign:=TextAlign - TA_CENTER + TA_RIGHT; // align to right
        Font.Style:=[fsBold];
      end;
    end;
end;


procedure TTLapse.sButton5Click(Sender: TObject);
var
s,s2,s3,s4:string;
p,p1,p2,i,j,m:integer;
System:String;
begin
   try
      if OpenDialog1.Execute then
        begin
          if not(OpenDialog1.FileName='') then
            begin
               ForFree1:=TLabel.Create(ForFree0);
               Lines:=TStringList.Create;
               Lines.LoadFromFile(OpenDialog1.FileName);
               For i:=0 to Lines.Count-1 do
                 begin
                  s:=Lines[i];
                  P:=Pos('~C',s);
                  if P=1 then Break;
                 end;
               i:=i+1;
               FN:=0;
               repeat
                s:=Lines[i];
                s2:='';
                s3 := Copy( s, 1,1);
                P1:=Pos('.',s);
                s2 := Copy( s, 1,P1-1);
                s2:=TrimLeft(s2);
                s2:=TrimRight(s2);
                P2:=Pos('     ',s);
                s4 := Copy( s, P1+1,P2-P1);
                s4:=TrimLeft(s4);
                s4:=TrimRight(s4);
                if ((s2='DEPTH')or(s2='DEPT')) then
                  begin
                    if s4='M' then
                      System:='m';
                    if ((s4='F')or(s4='FT')) then
                      System:='ft';
                end;
                if ((not(s2=''))and(not(s3='~'))and(not(s3='#'))) then
                 begin
                  Fields[FN+1]:=s2;
                  FN:=FN+1;
                 end;
                i:=i+1;
               until s3='~';
               TrackSelection:=TTrackSelection.Create(Self);
               TrackSelection.ShowModal;
               TrackSelection.Free;
               if Selected_Track=-1 then
                 exit;
               Series1:=THorizLineSeries.Create(ForFree1);
               Series1.ParentChart:=Chart1;
               Series1.HorizAxis:=aTopAxis;
               Series1.Color:=clGreen;
               Series1.Stairs:=True;
               Chart1.TopAxis.Title.Caption:=Fields[Selected_Track+1];
               For j:=i-1 to Lines.Count-1 do
                 begin
                  s:=Lines[j];
                  P:=Pos('~A',s);
                  if P=1 then Break;
                 end;
               Chart1.LeftAxis.Inverted:=True;
               Chart1.LeftAxis.Title.Caption:='Depth('+System+')';
               for m:=j+1 to Lines.Count-1 do
                 begin
                   Sp_Number:=0;
                   S:=Lines[m];
                   S4:=Copy(S,1,12);
                   S4:=TrimLeft(S4);
                   S4:=TrimRight(S4);
                   Delete(S,1,5);
                   repeat
                     S2:='';
                     S3:='';
                     Emptiness1:=False;
                     Emptiness2:=False;
                     Digit:=False;
                     repeat
                       S2 := Copy( S, 1,1);
                       Delete( S, 1, 1 );
                       if (S2=' ')and(Digit=False) then
                         begin
                           Emptiness1:=True;
                         end;
                       if (S2=' ')and(Digit=True) then
                         begin
                           Emptiness2:=True;
                           if First_Space then
                             Sp_Number:=Sp_Number+1;
                           First_Space:=False;
                         end;
                       if S2='' then
                         begin
                           Break;
                         end;
                       if S2<>' ' then
                         begin
                           S3:=S3+S2;
                           Digit:=True;
                           First_Space:=True;
                         end;
                     until Emptiness2=True;
                   until ((Sp_Number=Selected_Track+1)or(S2=''));
                   Chart1.Series[0].AddXY(StrToFloat(S3),StrToFloat(S4));
                 end;
               SetRoundMode(rmDown);
               XMIN:=Round(Chart1.Series[0].MinXValue);
               SetRoundMode(rmUp);
               XMAX:=Round(Chart1.Series[0].MaxXValue);
               Chart1.TopAxis.SetMinMax(XMIN{-((XMAX-XMIN)/40)},XMAX{+((XMAX-XMIN)/40)});
               Chart1.Axes.Top.Items.Add(XMIN);
               Chart1.Axes.Top.Items.Add(XMAX);
               Chart1.Axes.Top.Items[0].Value:=XMIN;
               Chart1.Axes.Top.Items[Chart1.Axes.Top.Items.Count-1].Value:=XMAX;
               Screen.Cursor := crDefault;
               Lines.Free;
               sButton6.Enabled:=True;
               sButton10.Enabled:=True;
            end;
        end;
  except
    MessageDlg('Error reading file.',mterror,[mbok],0);
    ForFree1.Free;
    Lines.Free;
    Screen.Cursor:=crDefault;
  end;
end;

procedure TTLapse.sButton6Click(Sender: TObject);
var
s,s2,s3,s4:string;
p,p1,p2,i,j,m:integer;
System:String;
begin
   try
      if OpenDialog2.Execute then
        begin
          if not(OpenDialog2.FileName='') then
            begin
               ForFree2:=TLabel.Create(ForFree0);
               Lines:=TStringList.Create;
               Lines.LoadFromFile(OpenDialog2.FileName);
               For i:=0 to Lines.Count-1 do
                 begin
                  s:=Lines[i];
                  P:=Pos('~C',s);
                  if P=1 then Break;
                 end;
               i:=i+1;
               FN:=0;
               repeat
                s:=Lines[i];
                s2:='';
                s3 := Copy( s, 1,1);
                P1:=Pos('.',s);
                s2 := Copy( s, 1,P1-1);
                s2:=TrimLeft(s2);
                s2:=TrimRight(s2);
                P2:=Pos('     ',s);
                s4 := Copy( s, P1+1,P2-P1);
                s4:=TrimLeft(s4);
                s4:=TrimRight(s4);
                if ((s2='DEPTH')or(s2='DEPT')) then
                  begin
                    if s4='M' then
                      System:='m';
                    if ((s4='F')or(s4='FT')) then
                      System:='ft';
                end;
                if ((not(s2=''))and(not(s3='~'))and(not(s3='#'))) then
                 begin
                  Fields[FN+1]:=s2;
                  FN:=FN+1;
                 end;
                i:=i+1;
               until s3='~';
               TrackSelection:=TTrackSelection.Create(Self);
               TrackSelection.ShowModal;
               TrackSelection.Free;
               if Selected_Track=-1 then
                 exit;
               Series2:=THorizLineSeries.Create(ForFree2);
               Series2.ParentChart:=Chart2;
               Series2.HorizAxis:=aTopAxis;
               Series2.Color:=$00C08000;
               Series2.Stairs:=True;
               Chart2.TopAxis.Title.Caption:=Fields[Selected_Track+1];
               For j:=i-1 to Lines.Count-1 do
                 begin
                  s:=Lines[j];
                  P:=Pos('~A',s);
                  if P=1 then Break;
                 end;
               Chart2.LeftAxis.Inverted:=True;
               Chart2.LeftAxis.Title.Caption:='Depth('+System+')';
               for m:=j+1 to Lines.Count-1 do
                 begin
                   Sp_Number:=0;
                   S:=Lines[m];
                   S4:=Copy(S,1,12);
                   S4:=TrimLeft(S4);
                   S4:=TrimRight(S4);
                   Delete(S,1,5);
                   repeat
                     S2:='';
                     S3:='';
                     Emptiness1:=False;
                     Emptiness2:=False;
                     Digit:=False;
                     repeat
                       S2 := Copy( S, 1,1);
                       Delete( S, 1, 1 );
                       if (S2=' ')and(Digit=False) then
                         begin
                           Emptiness1:=True;
                         end;
                       if (S2=' ')and(Digit=True) then
                         begin
                           Emptiness2:=True;
                           if First_Space then
                             Sp_Number:=Sp_Number+1;
                           First_Space:=False;
                         end;
                       if S2='' then
                         begin
                           Break;
                         end;
                       if S2<>' ' then
                         begin
                           S3:=S3+S2;
                           Digit:=True;
                           First_Space:=True;
                         end;
                     until Emptiness2=True;
                   until ((Sp_Number=Selected_Track+1)or(S2=''));
                   Chart2.Series[0].AddXY(StrToFloat(S3),StrToFloat(S4));
                 end;
               SetRoundMode(rmDown);
               XMIN:=Round(Chart2.Series[0].MinXValue);
               SetRoundMode(rmUp);
               XMAX:=Round(Chart2.Series[0].MaxXValue);
               Chart2.TopAxis.SetMinMax(XMIN{-((XMAX-XMIN)/40)},XMAX{+((XMAX-XMIN)/40)});
               Chart2.Axes.Top.Items.Add(XMIN);
               Chart2.Axes.Top.Items.Add(XMAX);
               Chart2.Axes.Top.Items[0].Value:=XMIN;
               Chart2.Axes.Top.Items[Chart2.Axes.Top.Items.Count-1].Value:=XMAX;
               Screen.Cursor := crDefault;
               Lines.Free;
               sButton7.Enabled:=True;
               sButton9.Enabled:=True;
            end;
        end;
  except
    MessageDlg('Error reading file.',mterror,[mbok],0);
    ForFree2.Free;
    Lines.Free;
    Screen.Cursor:=crDefault;
  end;
end;
procedure TTLapse.sButton7Click(Sender: TObject);
var
i,j : integer;
X_Value, Y_Value:Real;
Left_Min1,Left_Min2,Left_Max1,Left_Max2
{Top_Min1,Top_Min2,Top_Max1,Top_Max2} : Real;
begin
  Left_Min1:=Chart1.Series[0].MinYValue;//LeftAxis.Minimum;
  Left_Min2:=Chart2.Series[0].MinYValue;//LeftAxis.Minimum;
//  Top_Min1:=Chart1.TopAxis.Minimum;
//  Top_Min2:=Chart2.TopAxis.Minimum;
  Left_Max1:=Chart1.Series[0].MaxYValue;//;LeftAxis.Maximum;
  Left_Max2:=Chart2.Series[0].MaxYValue;//LeftAxis.Maximum;
//  Top_Max1:=Chart1.TopAxis.Maximum;
//  Top_Max2:=Chart2.TopAxis.Maximum;
  if Left_Min1<>Left_Min2 then
    begin
      MessageDlg('Two logs have different start depths.', mtError,[mbok],0);
      Exit;
    end;
  if Left_Max1<>Left_Max2 then
    begin
      MessageDlg('Two logs have different end depths.', mtError,[mbok],0);
      Exit;
    end;
{  if Top_Min1<>Top_Min2 then
    begin
      MessageDlg('Two logs have different minimum values.', mtError,[mbok],0);
      Exit;
    end;
  if Top_Max1<>Top_Max2 then
    begin
      MessageDlg('Two logs have different maximum values.', mtError,[mbok],0);
      Exit;
    end;                         }
  Chart3.LeftAxis.Title.Caption:=Chart2.LeftAxis.Title.Caption;
  Chart3.LeftAxis.Inverted:=True;
  Chart3.TopAxis.Title.Visible:=True;
  Chart3.TopAxis.Visible:=True;
  ForFree3:=TLabel.Create(ForFree0);
  Series3:=THorizLineSeries.Create(ForFree3);
  Series3.ParentChart:=Chart3;
  Series3.HorizAxis:=aTopAxis;
  Series3.Name:='T_Lapse_Trace'+IntToStr(i);
  Series3.Color:=clRed;
  Series3.Stairs:=True;
  for j:=0 to Series2.Count-1 do
    begin
      X_Value:=Series2.XValues[j]-Series1.XValues[j];
      Y_Value:=Series2.YValues[j];
      Series3.AddXY(X_Value, Y_Value);
    end;
  SetRoundMode(rmDown);
  XMIN:=Round(Chart3.Series[0].MinXValue);
  SetRoundMode(rmUp);
  XMAX:=Round(Chart3.Series[0].MaxXValue);
  Chart3.TopAxis.SetMinMax(XMIN{-((XMAX-XMIN)/40)},XMAX{+((XMAX-XMIN)/40)});
  Chart3.Axes.Top.Items.Add(XMIN);
  Chart3.Axes.Top.Items.Add(XMAX);
  Chart3.Axes.Top.Items[0].Value:=XMIN;
  Chart3.Axes.Top.Items[Chart3.Axes.Top.Items.Count-1].Value:=XMAX;
  sButton7.Enabled:=False;
  sButton8.Enabled:=True;
  sButton1.Enabled:=True;
end;

procedure TTLapse.sButton8Click(Sender: TObject);
begin
  sButton1.Enabled:=False;
  sButton10.Enabled:=False;
  sButton9.Enabled:=False;
  sButton7.Enabled:=False;
  sButton8.Enabled:=False;
  sButton6.Enabled:=False;
  sButton5.Enabled:=True;
  Chart1.TopAxis.Items.Clear;
  Chart2.TopAxis.Items.Clear;
  Chart3.TopAxis.Items.Clear;
  ForFree1.Free;
  ForFree2.Free;
  ForFree3.Free;
end;

procedure TTLapse.FormCreate(Sender: TObject);
begin
ForFree0:=TLabel.Create(TLapse);
sButton10.Enabled:=False;
sButton9.Enabled:=False;
sButton8.Enabled:=False;
sButton7.Enabled:=False;
sButton6.Enabled:=False;
Chart1.Axes.Top.OnDrawLabel:= TopAxisDrawLabel;
Chart2.Axes.Top.OnDrawLabel:= TopAxisDrawLabel;
Chart3.Axes.Top.OnDrawLabel:= TopAxisDrawLabel;
end;

procedure TTLapse.sButton9Click(Sender: TObject);
begin
ForFree2.Free;
sButton9.Enabled:=False;
end;

procedure TTLapse.sButton10Click(Sender: TObject);
begin
ForFree1.Free;
sButton10.Enabled:=False;
end;

procedure TTLapse.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ForFree0.Free;
end;

procedure TTLapse.sButton1Click(Sender: TObject);
begin
LapsePrint:=TLapsePrint.Create(self);
LapsePrint.Showmodal;
LapsePrint.Free;
end;

procedure TTLapse.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
sButton1.Top:=NewHeight-65;
Chart1.Width:=Chart1.Width+Trunc((NewWidth-TLapse.Width)/3);
Chart2.Width:=Chart2.Width+Trunc((NewWidth-TLapse.Width)/3);
Chart3.Width:=Chart3.Width+Trunc((NewWidth-TLapse.Width)/3);
Chart2.Left:=Chart1.Left+Chart1.Width+7+(NewWidth-TLapse.Width);
Chart3.Left:=Chart2.Left+Chart2.Width+7+(NewWidth-TLapse.Width);
Chart1.Height:=Chart1.Height+(NewHeight-TLapse.Height);
Chart2.Height:=Chart2.Height+(NewHeight-TLapse.Height);
Chart3.Height:=Chart3.Height+(NewHeight-TLapse.Height);
sButton5.Left:=Chart1.Left+8;
sButton10.Left:=Chart1.Left+88;
sButton6.Left:=Chart2.Left+8;
sButton9.Left:=Chart2.Left+88;
sButton7.Left:=Chart3.Left+8;
sButton8.Left:=Chart3.Left+88;
end;

end.
