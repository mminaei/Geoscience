unit CrossPlot;

interface

uses
  Graphics, Controls, Forms,Menus, Chart, TeeEditCha, CurvFitt,
  TeeEdit, TeEngine, Series,  TeeProcs, Classes, Dialogs, ExtCtrls,
  StdCtrls, TeeTools, SysUtils, Math, TeeComma, TeeFunci;

type
  TCross_Plot = class(TForm)
    ChartEditor1: TChartEditor;
    Panel1: TPanel;
    Panel2: TPanel;
    Chart2: TChart;
    TeeCommander2: TTeeCommander;
    Splitter1: TSplitter;
    TeeCommander1: TTeeCommander;
    Chart1: TChart;
    Series: TPointSeries;
    ChartTool1: TMarksTipTool;
    Memo1: TMemo;
    Panel3: TPanel;
    Label1: TLabel;
    Button1: TButton;
    Button5: TButton;
    Button6: TButton;
    Button2: TButton;
    Splitter2: TSplitter;
    ChartEditor2: TChartEditor;
    procedure FormShow(Sender: TObject);
//    procedure CreatePopup(Sender: TObject);
//    procedure PopupClicked(Sender: TObject);
    procedure Regression_Linear;
    procedure Regression_SemiLog;
    procedure Regression_LogLog;
    procedure Regression_Exponential;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Linear_Trend_Added,
    Exponential_Trend_Added,
    SemiLog_Trend_Added,
    LogLog_Trend_Added:Boolean;
    Linear_Series_Number,
    SemiLog_Series_Number,
    LogLog_Series_Number,
    Exponential_Series_Number :Smallint;
//    Chart            :TChart;
    tmpLineSeries    :TLineSeries;
    Residuals_Linear : TPointSeries;
    Residuals_SemiLog: TPointSeries;
    Residuals_Exponential: TPointSeries;
    Residuals_LogLog: TPointSeries;
    Trend_Box        :TRectangleTool;
    { Private declarations }
  public
    Depth_Start, Depth_Stop: Real;
    m,b,Coefficient  :Double;
    { Public declarations }
  end;

var
  Cross_Plot       :TCross_Plot;

implementation

uses Main_Form;

{$R *.dfm}

procedure TCross_Plot.FormShow(Sender: TObject);
var
i : Smallint;
X_Count, Y_Count, Z_Count,
Min_Count : Integer;
begin
  Min_Count:=100000000;
  Z_Count:=0;
  with MainForm do
    begin
      Chart1.Series[0].Clear;
      Chart1.Axes.Left.Title.Caption:=Charts[YAxis_Track_Number].Title.Caption;
      Chart1.Axes.Bottom.Title.Caption:=Charts[XAxis_Track_Number].Title.Caption;
      if Is_CrossPlot_3D then
        begin
          Chart1.Axes.DepthTop.Title.Caption:=Charts[ZAxis_Track_Number].Title.Caption;
          Chart1.Axes.Top.Title.Caption:=Chart1.Axes.Left.Title.Caption+' vs. '+Chart1.Axes.Bottom.Title.Caption+' vs. '+Chart1.Axes.DepthTop.Title.Caption;
        end
      else
        Chart1.Axes.Top.Title.Caption:=Chart1.Axes.Left.Title.Caption+' vs. '+Chart1.Axes.Bottom.Title.Caption;
      X_Count:=Charts[XAxis_Track_Number].Series[0].XValues.Count-1;
      Y_Count:=Charts[YAxis_Track_Number].Series[0].XValues.Count-1;
      if Is_CrossPlot_3D then
        Z_Count:=Charts[ZAxis_Track_Number].Series[0].XValues.Count-1;
      if Min_Count>X_Count then
        begin
          Min_Count:=X_Count;
          if Min_Count>Y_Count then
            begin
              Min_Count:=Y_Count;
              if Is_CrossPlot_3D then
                if Min_Count>Z_Count then
                  Min_COunt:=Z_Count;
            end;
        end;
      for i:=0 to Min_Count do
        begin
{          if Is_CrossPlot_3D then
            begin
              if (Charts[XAxis_Track_Number].Series[0].XValue[i]<>Null_Values[XAxis_Track_Number])and(Charts[YAxis_Track_Number].Series[0].XValue[i]<>Null_Values[YAxis_Track_Number])and(Charts[ZAxis_Track_Number].Series[0].XValue[i]<>Null_Values[ZAxis_Track_Number]) then
                begin
                  if (Charts[XAxis_Track_Number].Series[0].YValue[i] >= Depth_Start)and(Charts[XAxis_Track_Number].Series[0].YValue[i] <= Depth_Stop) then
                    Series.AddXYZ(Charts[XAxis_Track_Number].Series[0].XValue[i], Charts[YAxis_Track_Number].Series[0].XValue[i], Charts[ZAxis_Track_Number].Series[0].XValue[i])
                  else
                    Continue;
                end
              else
                begin
                  Chart1.Series[0].AddNullXY(Charts[XAxis_Track_Number].Series[0].XValue[i], Charts[YAxis_Track_Number].Series[0].XValue[i]);
                end;
            end
          else}
          if (Charts[XAxis_Track_Number].Series[0].XValue[i]<>LasFiles[0].NullValue)and(Charts[YAxis_Track_Number].Series[0].XValue[i]<>LasFiles[0].NullValue) then
            begin
              if ((Charts[XAxis_Track_Number].Series[0].YValue[i] >= Depth_Start)and(Charts[XAxis_Track_Number].Series[0].YValue[i] <= Depth_Stop))and((Charts[YAxis_Track_Number].Series[0].YValue[i] >= Depth_Start)and(Charts[YAxis_Track_Number].Series[0].YValue[i] <= Depth_Stop)) then
                begin
                  Chart1.Series[0].AddXY(Charts[XAxis_Track_Number].Series[0].XValue[i], Charts[YAxis_Track_Number].Series[0].XValue[i], 'X Axis: ' + FloatToStr(RoundTo(Charts[XAxis_Track_Number].Series[0].XValue[i], -4)) + #13 + 'Y Axis: ' + FloatToStr(RoundTo(Charts[YAxis_Track_Number].Series[0].XValue[i], -4)) + #13 + 'Depth: '+FloatToStr(Charts[XAxis_Track_Number].Series[0].YValue[i]));
                end;
            end;
        end;
      if not MainForm.Is_CrossPlot_3D then
        begin
          TeeCommander1.Button3D.Visible:=False;
          TeeCommander1.ButtonDepth.Visible:=False;
          TeeCommander1.ButtonMove.Visible:=False;
          TeeCommander1.ButtonNormal.Visible:=False;
          TeeCommander1.ButtonRotate.Visible:=False;
          TeeCommander1.ButtonSave.Visible:=False;
          TeeCommander1.ButtonZoom.Visible:=False;
          TeeCommander1.RepositionControls;
          TeeCommander2.Button3D.Visible:=False;
          TeeCommander2.ButtonDepth.Visible:=False;
          TeeCommander2.ButtonMove.Visible:=False;
          TeeCommander2.ButtonNormal.Visible:=False;
          TeeCommander2.ButtonRotate.Visible:=False;
          TeeCommander2.ButtonSave.Visible:=False;
          TeeCommander2.ButtonZoom.Visible:=False;
          TeeCommander2.RepositionControls;
        end
      else
        begin
          TeeCommander1.ButtonSave.Visible:=False;
          TeeCommander1.FullRotation:=True;
          TeeCommander1.RepositionControls;
          TeeCommander2.ButtonSave.Visible:=False;
          TeeCommander2.FullRotation:=True;
          TeeCommander2.RepositionControls;
        end;
    end;
 /// ChartTool2.Statistics(Memo1.Lines);
end;
procedure TCross_Plot.Regression_Linear;
var
i : Smallint;
Values_Count : Integer;
X_Ave, Y_Ave,
Sum_X, Sum_Y,
Sum_X2, Sum_XY : Real;
ssResid, ssTotal,
ssReg, R2 : Real;
Min_XValue, Max_XValue: Real;
Temp_Value : Real;
begin
  with MainForm do
    begin
      if not MainForm.Is_CrossPlot_3D then
        begin
          R2:=0;
          m:=0;
          b:=0;
          Sum_X:=0;
          Sum_Y:=0;
          Sum_XY:=0;
          Sum_X2:=0;
          Min_XValue:=10000000000;
          Max_XValue:=-10000000000;
          for i:=0 to Chart1.Series[0].Count-1 do
            begin
              Temp_Value:=Chart1.Series[0].XValue[i];
              Sum_X:=Sum_X+Temp_Value;
              if Min_XValue>Temp_Value then
                Min_XValue:=Temp_Value;
              if Max_XValue<Temp_Value then
                Max_XValue:=Temp_Value;
            end;
          for i:=0 to Chart1.Series[0].Count-1 do
            begin
              Sum_Y:=Sum_Y+Chart1.Series[0].YValue[i];
            end;
          Values_Count:=Chart1.Series[0].Count;
          if Values_Count=0 then Exit;
          X_Ave:=Sum_X/Values_Count;
          Y_Ave:=Sum_Y/Values_Count;
          for i:=0 to Values_Count do
            begin
              Temp_Value:=Chart1.Series[0].XValue[i];
              Sum_XY:=Sum_XY+(Temp_Value-X_Ave)*(Chart1.Series[0].YValue[i]-Y_Ave);
              Sum_X2:=Sum_X2+sqr(Temp_Value-X_Ave);
            end;
          m:=RoundTo( Sum_XY/Sum_X2, -4);
          b:=RoundTo( Y_Ave-m*X_Ave, -4);
          ssResid:=0;
          ssTotal:=0;
          for i:=0 to Values_Count do
            begin
              Temp_Value:=Chart1.Series[0].YValue[i];
              ssResid:=ssResid + sqr( Temp_Value - (m * Chart1.Series[0].XValue[i] + b));
              ssTotal:=ssTotal + sqr( Temp_Value - Y_Ave );
            end;
          ssReg:=ssTotal - ssResid;
          if ssTotal<>0 then
            R2:=RoundTo(ssReg/ssTotal, -4);
          Coefficient:=R2;
          Trend_Box:=TRectangleTool.Create(Chart1);
//          Trend_Box.AllowDrag:=True;
  //        Trend_Box.AllowResize:=False;
          Trend_Box.AutoSize:=True;
          Trend_Box.Position:=ppRightTop;
          Trend_Box.Shape.Transparent:=False;
          Trend_Box.Shape.Color:=clYellow;
          Trend_Box.Shape.Font.Name:='Tahoma';
          Trend_Box.Shape.Gradient.Visible:=False;
          Trend_Box.Shape.Transparency:=0;
          Trend_Box.Shape.Font.Color:=clRed;
          if (b>=0)and(m>=0) then
            if m<>1 then
              Trend_Box.Text:='Linear Trend' + #13 + 'Y = ' + FloatToStr(m)+ ' X + ' + FloatToStr(b) +#13+'r² = '+ FloatToStr(Coefficient)
            else
              Trend_Box.Text:='Linear Trend' + #13 + 'Y = ' + ' X + ' + FloatToStr(b) +#13+'r² = '+ FloatToStr(Coefficient)
          else  if (b<0)and(m>=0) then
            if m<>1  then
              Trend_Box.Text:='Linear Trend' + #13 + 'Y = ' + FloatToStr(m)+ ' X - ' + FloatToStr(ABS(b)) +#13+'r² = '+ FloatToStr(Coefficient)
            else
              Trend_Box.Text:='Linear Trend' + #13 + 'Y = ' + ' X - ' + FloatToStr(ABS(b)) +#13+'r² = '+ FloatToStr(Coefficient)
          else  if (b>=0)and(m<0) then
            if m<>1 then
              Trend_Box.Text:='Linear Trend' + #13 + 'Y = ' + FloatToStr(m)+ ' X + ' + FloatToStr(b) +#13+'r² = '+ FloatToStr(Coefficient)
            else
              Trend_Box.Text:='Linear Trend' + #13 + 'Y = ' + ' X + ' + FloatToStr(b) +#13+'r² = '+ FloatToStr(Coefficient)
          else  if (b<0)and(m<0) then
            if m<>1 then
              Trend_Box.Text:='Linear Trend' + #13 + 'Y = ' + FloatToStr(m)+ ' X - ' + FloatToStr(ABS(b)) +#13+'r² = '+ FloatToStr(Coefficient)
            else
              Trend_Box.Text:='Linear Trend' + #13 + 'Y = ' + ' X - ' + FloatToStr(ABS(b)) +#13+'r² = '+ FloatToStr(Coefficient);
          Trend_Box.ParentChart:=Chart1;
          tmpLineSeries:=TLineSeries.Create(Chart1);
          tmpLineSeries.HorizAxis:=aBottomAxis;
          tmpLineSeries.VertAxis:=aLeftAxis;
          tmpLineSeries.Color:=clRed;
          tmpLineSeries.Name:='Trend_Linear';
          tmpLineSeries.Pen.Width:=2;
          tmpLineSeries.Clear;
          Temp_Value:= (Max_XValue-Min_XValue)/(Chart1.Series[0].Count-1);
          for i:=0 to Values_Count do
            begin
              tmpLineSeries.AddXY(Min_XValue + i * Temp_Value, m * (Min_XValue + i * Temp_Value) + b);
            end;
//          tmpLineSeries.TreatNulls:=tnDontPaint;
          Chart1.AddSeries(tmpLineSeries);
          Linear_Trend_Added:=True;
        end
      else
        begin
//        3D Linear Regression Procedure -- To be done
        end;
    end;
end;

procedure TCross_Plot.Regression_LogLog;
var
i,j : Smallint;
X_Count, Y_Count,
Max_Count, Min_Count : Integer;
X_Ave, Y_Ave,
Sum_X, Sum_Y,
Sum_X2, Sum_XY : Real;
ssResid, ssTotal,
ssReg, R2 : Real;
Min_XValue, Max_XValue: Real;
Temp_Value : Real;
begin
  with MainForm do
    begin
      if not MainForm.Is_CrossPlot_3D then
        begin
          R2:=0;
          m:=0;
          b:=0;
          Sum_X:=0;
          Sum_Y:=0;
          Sum_XY:=0;
          Sum_X2:=0;
          X_Count:=0;
          Y_Count:=0;
          Min_XValue:=10000000000;
          Max_XValue:=-10000000000;
          for i:=0 to Chart1.Series[0].Count-1 do
            begin
              Temp_Value:=Chart1.Series[0].XValue[i];
              if Temp_Value>0 then
                begin
                  Sum_X:=Sum_X + Log10(Temp_Value);
                  if Min_XValue>Temp_Value then
                    Min_XValue:=Temp_Value;
                  if Max_XValue<Temp_Value then
                    Max_XValue:=Temp_Value;
                  X_Count:=X_Count+1;
                end
              else
                Continue;
            end;
          for i:=0 to Chart1.Series[0].Count-1 do
            begin
              Temp_Value:= Chart1.Series[0].YValue[i];
              if Temp_Value>0 then
                begin
                  Sum_Y:=Sum_Y + Log10(Temp_Value);
                  Y_Count:=Y_Count+1;
                end;
            end;
          if X_Count=0 then Exit;
          if Y_Count=0 then Exit;
          X_Ave:=Sum_X/X_Count;
          Y_Ave:=Sum_Y/Y_Count;
          if X_Count<Y_Count then
            Max_Count:=Y_Count
          else
            Max_Count:=X_Count;
          if X_Count>Y_Count then
            Min_Count:=Y_Count
          else
            Min_Count:=X_Count;
          for i:=0 to Max_Count do
            begin
              Temp_Value:=Chart1.Series[0].XValue[i];
              if (Temp_Value>0)and(Chart1.Series[0].YValue[i]>0) then
                begin
                  Sum_XY:=Sum_XY+(Log10(Temp_Value)-X_Ave)*(Log10(Chart1.Series[0].YValue[i])-Y_Ave);
                  Sum_X2:=Sum_X2+sqr(Log10(Temp_Value)-X_Ave);
                end
              else
                Continue;
            end;
          m:=RoundTo( Sum_XY/Sum_X2, -4);
          b:=RoundTo( Y_Ave-m*X_Ave, -4);
          ssResid:=0;
          ssTotal:=0;
          i:=0;
          j:=0;
          repeat
            Temp_Value:=Chart1.Series[0].YValue[i];
            if (Chart1.Series[0].XValue[i]>0)and(Temp_Value>0) then
              begin
                ssResid:=ssResid + sqr( Log10(Temp_Value) - (m * Log10(Chart1.Series[0].XValue[i]) + b));
                ssTotal:=ssTotal + sqr( Log10(Temp_Value) - Y_Ave );
                Inc(j);
              end;
            Inc(i);
          until j=Min_Count;
          ssReg:=ssTotal - ssResid;
          if ssTotal<>0 then
            R2:=RoundTo(ssReg/ssTotal, -4);
          Coefficient:=R2;
          Trend_Box:=TRectangleTool.Create(Chart1);
//          Trend_Box.AllowDrag:=True;
//          Trend_Box.AllowResize:=False;
          Trend_Box.AutoSize:=True;
          Trend_Box.Position:=ppRightTop;
          Trend_Box.Shape.Transparent:=False;
          Trend_Box.Shape.Color:=clYellow;
          Trend_Box.Shape.Font.Name:='Tahoma';
          Trend_Box.Shape.Gradient.Visible:=False;
          Trend_Box.Shape.Transparency:=0;
          Trend_Box.Shape.Font.Color:=clMaroon;
          if (b>=0)and(m>=0) then
            if m<>1 then
              Trend_Box.Text:='Log-Log Trend' + #13 + 'Log(Y) = ' + FloatToStr(m)+ ' Log(X) + ' + FloatToStr(b) +#13+'r² = '+ FloatToStr(Coefficient)
            else
              Trend_Box.Text:='Log-Log Trend' + #13 + 'Log(Y) = ' + ' Log(X) + ' + FloatToStr(b) +#13+'r² = '+ FloatToStr(Coefficient)
          else  if (b<0)and(m>=0) then
            if m<>1  then
              Trend_Box.Text:='Log-Log Trend' + #13 + 'Log(Y) = ' + FloatToStr(m)+ ' Log(X) - ' + FloatToStr(ABS(b)) +#13+'r² = '+ FloatToStr(Coefficient)
            else
              Trend_Box.Text:='Log-Log Trend' + #13 + 'Log(Y) = ' + ' Log(X) - ' + FloatToStr(ABS(b)) +#13+'r² = '+ FloatToStr(Coefficient)
          else  if (b>=0)and(m<0) then
            if m<>1 then
              Trend_Box.Text:='Log-Log Trend' + #13 + 'Log(Y) = ' + FloatToStr(m)+ ' Log(X) + ' + FloatToStr(b) +#13+'r² = '+ FloatToStr(Coefficient)
            else
              Trend_Box.Text:='Log-Log Trend' + #13 + 'Log(Y) = ' + ' Log(X) + ' + FloatToStr(b) +#13+'r² = '+ FloatToStr(Coefficient)
          else  if (b<0)and(m<0) then
            if m<>1 then
              Trend_Box.Text:='Log-Log Trend' + #13 + 'Log(Y) = ' + FloatToStr(m)+ ' Log(X) - ' + FloatToStr(ABS(b)) +#13+'r² = '+ FloatToStr(Coefficient)
            else
              Trend_Box.Text:='Log-Log Trend' + #13 + 'Log(Y) = ' + ' Log(X) - ' + FloatToStr(ABS(b)) +#13+'r² = '+ FloatToStr(Coefficient);
          Trend_Box.ParentChart:=Chart1;
          tmpLineSeries:=TLineSeries.Create(Chart1);
          tmpLineSeries.HorizAxis:=aBottomAxis;
          tmpLineSeries.VertAxis:=aLeftAxis;
          tmpLineSeries.Name:='Trend_LogLog';
          tmpLineSeries.Color:=clMaroon;
          tmpLineSeries.Pen.Width:=2;
          tmpLineSeries.Clear;
          Temp_Value:= (Max_XValue-Min_XValue)/(Chart1.Series[0].Count-1);
          for i:=0 to Max_Count do
            begin
              if (Min_XValue + i * Temp_Value>0) then
                tmpLineSeries.AddXY(Min_XValue + i * Temp_Value, Power((Min_XValue + i * Temp_Value), m) * Power(10, b) )
              else
                Continue;
            end;
          Chart1.AddSeries(tmpLineSeries);
          LogLog_Trend_Added:=True;
        end
      else
        begin
//        3D Log-Log Regression Procedure -- To be done
        end;
    end;
end;


procedure TCross_Plot.Regression_SemiLog;
var
i,j : Smallint;
X_Count, Y_Count,
Max_Count, Min_Count : Integer;
X_Ave, Y_Ave,
Sum_X, Sum_Y,
Sum_X2, Sum_XY : Real;
ssResid, ssTotal,
ssReg, R2 : Real;
Min_XValue, Max_XValue: Real;
Temp_Value : Real;
begin
  with MainForm do
    begin
      if not MainForm.Is_CrossPlot_3D then
        begin
          R2:=0;
          m:=0;
          b:=0;
          Sum_X:=0;
          Sum_Y:=0;
          Sum_XY:=0;
          Sum_X2:=0;
          X_Count:=0;
          Y_Count:=0;
          Min_XValue:=10000000000;
          Max_XValue:=-10000000000;
          for i:=0 to Chart1.Series[0].Count-1 do
            begin
              Temp_Value:=Chart1.Series[0].XValue[i];
              if Temp_Value>0 then
                begin
                  Sum_X:=Sum_X + Ln(Temp_Value);
                  if Min_XValue>Temp_Value then
                    Min_XValue:=Temp_Value;
                  if Max_XValue<Temp_Value then
                    Max_XValue:=Temp_Value;
                  X_Count:=X_Count+1;
                end
              else
                Continue;
            end;
          for i:=0 to Chart1.Series[0].Count-1 do
            begin
              Temp_Value:= Chart1.Series[0].YValue[i];
              Sum_Y:=Sum_Y + Temp_Value;
              Y_Count:=Y_Count+1;
            end;
          if X_Count=0 then Exit;
          if Y_Count=0 then Exit;
          X_Ave:=Sum_X/X_Count;
          Y_Ave:=Sum_Y/Y_Count;
          if X_Count<Y_Count then
            Max_Count:=Y_Count
          else
            Max_Count:=X_Count;
          if X_Count>Y_Count then
            Min_Count:=Y_Count
          else
            Min_Count:=X_Count;
          for i:=0 to Max_Count do
            begin
              Temp_Value:=Chart1.Series[0].XValue[i];
              if (Temp_Value>0) then
                begin
                  Sum_XY:=Sum_XY+(Ln(Temp_Value)-X_Ave)*(Chart1.Series[0].YValue[i]-Y_Ave);
                  Sum_X2:=Sum_X2+sqr(Ln(Temp_Value)-X_Ave);
                end
              else
                Continue;
            end;
          m:=RoundTo( Sum_XY/Sum_X2, -4);
          b:=RoundTo( Y_Ave-m*X_Ave, -4);
          ssResid:=0;
          ssTotal:=0;
          i:=0;
          j:=0;
          repeat
            Temp_Value:=Chart1.Series[0].YValue[i];
            if (Chart1.Series[0].XValue[i]>0) then
              begin
                ssResid:=ssResid + sqr( Temp_Value - (m * Ln(Chart1.Series[0].XValue[i]) + b));
                ssTotal:=ssTotal + sqr( Temp_Value - Y_Ave );
                Inc(j);
              end;
            Inc(i);
          until j=Min_Count;
          ssReg:=ssTotal - ssResid;
          if ssTotal<>0 then
            R2:=RoundTo(ssReg/ssTotal, -4);
          Coefficient:=R2;
          Trend_Box:=TRectangleTool.Create(Chart1);
//          Trend_Box.AllowDrag:=True;
  //        Trend_Box.AllowResize:=False;
          Trend_Box.AutoSize:=True;
          Trend_Box.Position:=ppRightTop;
          Trend_Box.Shape.Transparent:=False;
          Trend_Box.Shape.Color:=clYellow;
          Trend_Box.Shape.Font.Name:='Tahoma';
          Trend_Box.Shape.Gradient.Visible:=False;
          Trend_Box.Shape.Transparency:=0;
          Trend_Box.Shape.Font.Color:=clBlue;
          if (b>=0)and(m>=0) then
            if m<>1 then
              Trend_Box.Text:='SemiLog Trend' + #13 + 'Y = ' + FloatToStr(m)+ ' Ln(X) + ' + FloatToStr(b) +#13+'r² = '+ FloatToStr(Coefficient)
            else
              Trend_Box.Text:='SemiLog Trend' + #13 + 'Y = ' + ' Ln(X) + ' + FloatToStr(b) +#13+'r² = '+ FloatToStr(Coefficient)
          else  if (b<0)and(m>=0) then
            if m<>1  then
              Trend_Box.Text:='SemiLog Trend' + #13 + 'Y = ' + FloatToStr(m)+ ' Ln(X) - ' + FloatToStr(ABS(b)) +#13+'r² = '+ FloatToStr(Coefficient)
            else
              Trend_Box.Text:='SemiLog Trend' + #13 + 'Y = ' + ' Ln(X) - ' + FloatToStr(ABS(b)) +#13+'r² = '+ FloatToStr(Coefficient)
          else  if (b>=0)and(m<0) then
            if m<>1 then
              Trend_Box.Text:='SemiLog Trend' + #13 + 'Y = ' + FloatToStr(m)+ ' Ln(X) + ' + FloatToStr(b) +#13+'r² = '+ FloatToStr(Coefficient)
            else
              Trend_Box.Text:='SemiLog Trend' + #13 + 'Y = ' + ' Ln(X) + ' + FloatToStr(b) +#13+'r² = '+ FloatToStr(Coefficient)
          else  if (b<0)and(m<0) then
            if m<>1 then
              Trend_Box.Text:='SemiLog Trend' + #13 + 'Y = ' + FloatToStr(m)+ ' Ln(X) - ' + FloatToStr(ABS(b)) +#13+'r² = '+ FloatToStr(Coefficient)
            else
              Trend_Box.Text:='SemiLog Trend' + #13 + 'Y = ' + ' Ln(X) - ' + FloatToStr(ABS(b)) +#13+'r² = '+ FloatToStr(Coefficient);
          Trend_Box.ParentChart:=Chart1;
          tmpLineSeries:=TLineSeries.Create(Chart1);
          tmpLineSeries.HorizAxis:=aBottomAxis;
          tmpLineSeries.VertAxis:=aLeftAxis;
          tmpLineSeries.Name:='Trend_SemiLog';
          tmpLineSeries.Color:=clBlue;
          tmpLineSeries.Pen.Width:=2;
          tmpLineSeries.Clear;
          Temp_Value:= (Max_XValue-Min_XValue)/(Chart1.Series[0].Count-1);
          for i:=0 to Max_Count do
            begin
              if Min_XValue + i * Temp_Value>0 then
                tmpLineSeries.AddXY(Min_XValue + i * Temp_Value, m * Ln(Min_XValue + i * Temp_Value) + b)
              else
                Continue;
            end;
          Chart1.AddSeries(tmpLineSeries);
          SemiLog_Trend_Added:=True;
        end
      else
        begin
//        3D SemiLog Regression Procedure -- To be done
        end;
    end;
end;


procedure TCross_Plot.Regression_Exponential;
var
i,j : Smallint;
X_Count, Y_Count,
Max_Count, Min_Count : Integer;
X_Ave, Y_Ave,
Sum_X, Sum_Y,
Sum_X2, Sum_XY : Real;
ssResid, ssTotal,
ssReg, R2 : Real;
Min_XValue, Max_XValue: Real;
Temp_Value : Real;
begin
  with MainForm do
    begin
      if not MainForm.Is_CrossPlot_3D then
        begin
          R2:=0;
          m:=0;
          b:=0;
          Sum_X:=0;
          Sum_Y:=0;
          Sum_XY:=0;
          Sum_X2:=0;
          X_Count:=0;
          Y_Count:=0;
          Min_XValue:=10000000000;
          Max_XValue:=-10000000000;
          for i:=0 to Chart1.Series[0].Count-1 do
            begin
              Temp_Value:=Chart1.Series[0].XValue[i];
              Sum_X:=Sum_X + Temp_Value;
              if Min_XValue>Temp_Value then
                Min_XValue:=Temp_Value;
              if Max_XValue<Temp_Value then
                Max_XValue:=Temp_Value;
              X_Count:=X_Count+1;
            end;
          for i:=0 to Chart1.Series[0].Count-1 do
            begin
              Temp_Value:= Chart1.Series[0].YValue[i];
              if Temp_Value>0 then
                begin
                  Sum_Y:=Sum_Y + Ln(Temp_Value);
                  Y_Count:=Y_Count+1;
                end
              else
                Continue;
            end;
          if X_Count=0 then Exit;
          if Y_Count=0 then Exit;
          X_Ave:=Sum_X/X_Count;
          Y_Ave:=Sum_Y/Y_Count;
          if X_Count<Y_Count then
            Max_Count:=Y_Count
          else
            Max_Count:=X_Count;
          if X_Count>Y_Count then
            Min_Count:=Y_Count
          else
            Min_Count:=X_Count;
          for i:=0 to Max_Count do
            begin
              Temp_Value:=Chart1.Series[0].XValue[i];
              if (Chart1.Series[0].YValue[i]>0) then
                begin
                  Sum_XY:=Sum_XY+(Temp_Value-X_Ave)*(Ln(Chart1.Series[0].YValue[i])-Y_Ave);
                  Sum_X2:=Sum_X2+sqr(Temp_Value-X_Ave);
                end
              else
                Continue;
            end;
          m:=RoundTo( Sum_XY/Sum_X2, -4);
          b:=RoundTo( Y_Ave-m*X_Ave, -4);
          ssResid:=0;
          ssTotal:=0;
          i:=0;
          j:=0;
          repeat
            Temp_Value:=Chart1.Series[0].YValue[i];
            if (Temp_Value>0) then
              begin
                ssResid:=ssResid + sqr( Ln(Temp_Value) - (m * Chart1.Series[0].XValue[i] + b));
                ssTotal:=ssTotal + sqr( Ln(Temp_Value) - Y_Ave );
                Inc(j);
              end;
            Inc(i);
          until j=Min_Count;
          ssReg:=ssTotal - ssResid;
          if ssTotal<>0 then
            R2:=RoundTo(ssReg/ssTotal, -4);
          Coefficient:=R2;
          Trend_Box:=TRectangleTool.Create(Chart1);
//          Trend_Box.AllowDrag:=True;
  //        Trend_Box.AllowResize:=False;
          Trend_Box.AutoSize:=True;
          Trend_Box.Position:=ppRightTop;
          Trend_Box.Shape.Transparent:=False;
          Trend_Box.Shape.Color:=clYellow;
          Trend_Box.Shape.Font.Name:='Tahoma';
          Trend_Box.Shape.Gradient.Visible:=False;
          Trend_Box.Shape.Transparency:=0;
          Trend_Box.Shape.Font.Color:=clBlack;
          if b<>1 then
            Trend_Box.Text:='Exponential Trend' + #13 + 'Y = ' + FloatToStr(RoundTo(Exp(b), -4))+ ' EXP( ' + FloatToStr(m) +' X )' +#13+'r² = '+ FloatToStr(Coefficient)
          else
            Trend_Box.Text:='Exponential Trend' + #13 + 'Y = ' + ' EXP( ' + FloatToStr(m) + ' X )' +#13+'r² = '+ FloatToStr(Coefficient);
          Trend_Box.ParentChart:=Chart1;
          tmpLineSeries:=TLineSeries.Create(Chart1);
          tmpLineSeries.HorizAxis:=aBottomAxis;
          tmpLineSeries.VertAxis:=aLeftAxis;
          tmpLineSeries.Name:='Trend_Exponential';
          tmpLineSeries.Color:=clBlack;
          tmpLineSeries.Pen.Width:=2;
          tmpLineSeries.Clear;
          Temp_Value:= (Max_XValue-Min_XValue)/(Chart1.Series[0].Count-1);
          for i:=0 to Max_Count do
            begin
              tmpLineSeries.AddXY(Min_XValue + i * Temp_Value, Exp(m * (Min_XValue + i * Temp_Value)) * Exp(b));
            end;
          Chart1.AddSeries(tmpLineSeries);
          Exponential_Trend_Added:=True;
        end
      else
        begin
//        3D Exponential Regression Procedure -- To be done
        end;
    end;
end;


{procedure TCross_Plot.CreatePopup( Sender: TObject);
var
NewItem: TMenuItem;
Popup:TPopupMenu;
begin
  with Sender do
    begin
      Popup:=TPopupMenu.Create(Chart);
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

procedure TCross_Plot.PopupClicked(Sender: TObject);
begin
  with Sender as TMenuItem do
    begin
      Case MenuIndex of
        0:begin
            ChartEditor1.DefaultTab:=cetPrintPreview;
            ChartEditor1.Execute;
          end;
        1:begin
            ChartEditor1.DefaultTab:=cetExport;
            ChartEditor1.Execute;
          end;
        3:begin
            ChartEditor1.DefaultTab:=cetAxis;
            ChartEditor1.Execute;
          end;
        4:begin
            ChartEditor1.DefaultTab:=cetSeriesData;
            ChartEditor1.Execute;
          end;
        6:begin
            ChartEditor1.DefaultTab:=cetMain;
            ChartEditor1.Execute;
          end;
      end;
    end;
end;
}
procedure TCross_Plot.Button1Click(Sender: TObject);
var
i: integer;
Temp_Value:Real;
begin
  if not Linear_Trend_Added then
    begin
      Regression_Linear;
      Linear_Series_Number:=Chart2.SeriesCount;
      Residuals_Linear:=TPointSeries.Create(Chart2);
      Residuals_Linear.Name:='Residuals_Linear';
      Residuals_Linear.ColorEachPoint:=False;
      Residuals_Linear.Depth:=45;
      Residuals_Linear.LinePen.Visible:=False;
      Residuals_Linear.Color:=clRed;
      Residuals_Linear.Pointer.Style:=psCircle;
      Residuals_Linear.Pointer.Pen.Color:=clRed;
      Residuals_Linear.Pointer.HorizSize:=2;
      Residuals_Linear.Pointer.VertSize:=2;
//      Residuals_Linear.TreatNulls:= tnDontPaint;
      for i:=0 to Chart1.Series[0].Count-1 do
        begin
          Temp_Value:=Chart1.Series[0].XValue[i];
          Residuals_Linear.AddXY(Temp_Value, Chart1.Series[0].YValue[i] - (Temp_Value * m + b));
        end;
      Residuals_Linear.ParentChart:=Chart2;
    end;
  Chart2.Axes.Top.Title.Caption:='Residuals of Linear Trend';
  Chart2.Series[Linear_Series_Number].Visible:=True;
  if SemiLog_Trend_Added then
    begin
      Chart2.Series[SemiLog_Series_Number].Visible:=False;
    end;
  if LogLog_Trend_Added then
    begin
      Chart2.Series[LogLog_Series_Number].Visible:=False;
    end;
  if Exponential_Trend_Added then
    begin
      Chart2.Series[Exponential_Series_Number].Visible:=False;
    end;
end;

procedure TCross_Plot.Button2Click(Sender: TObject);
var
i: integer;
Temp_Value: Real;
begin
  if not SemiLog_Trend_Added then
    begin
      Regression_SemiLog;
      SemiLog_Series_Number:=Chart2.SeriesCount;
      Residuals_SemiLog:=TPointSeries.Create(Chart2);
      Residuals_SemiLog.Name:='Residuals_SemiLog';
      Residuals_SemiLog.ColorEachPoint:=False;
      Residuals_SemiLog.Depth:=45;
      Residuals_SemiLog.LinePen.Visible:=False;
      Residuals_SemiLog.SeriesColor:=clBlue;
      Residuals_SemiLog.Pointer.Style:=psCircle;
      Residuals_SemiLog.Pointer.Pen.Color:=clBlue;
      Residuals_SemiLog.Pointer.HorizSize:=2;
      Residuals_SemiLog.Pointer.VertSize:=2;
//      Residuals_SemiLog.TreatNulls:= tnDontPaint;
      for i:=0 to Chart1.Series[0].Count-1 do
        begin
          Temp_Value:=Chart1.Series[0].XValue[i];
          if Temp_Value>0 then
            Residuals_SemiLog.AddXY(Temp_Value, Chart1.Series[0].YValue[i] - (m * Ln(Temp_Value) + b));
        end;
      Residuals_SemiLog.ParentChart:=Chart2;
    end;
  Chart2.Axes.Top.Title.Caption:='Residuals of Semilog Trend';
  Chart2.Series[SemiLog_Series_Number].Visible:=True;
  if Linear_Trend_Added then
    begin
      Chart2.Series[Linear_Series_Number].Visible:=False;
    end;
  if Exponential_Trend_Added then
    begin
      Chart2.Series[Exponential_Series_Number].Visible:=False;
    end;
  if LogLog_Trend_Added then
    begin
      Chart2.Series[LogLog_Series_Number].Visible:=False;
    end;
end;

procedure TCross_Plot.Button5Click(Sender: TObject);
var
i: integer;
Temp_Value: Real;
begin
  if not Exponential_Trend_Added then
    begin
      Regression_Exponential;
      Exponential_Series_Number:=Chart2.SeriesCount;
      Residuals_Exponential:=TPointSeries.Create(Chart2);
      Residuals_Exponential.Name:='Residuals_Exponential';
      Residuals_Exponential.ColorEachPoint:=False;
      Residuals_Exponential.Depth:=45;
      Residuals_Exponential.LinePen.Visible:=False;
      Residuals_Exponential.SeriesColor:=clBlack;
      Residuals_Exponential.Pointer.Style:=psCircle;
      Residuals_Exponential.Pointer.Pen.Color:=clBlack;
      Residuals_Exponential.Pointer.HorizSize:=2;
      Residuals_Exponential.Pointer.VertSize:=2;
//      Residuals_Exponential.TreatNulls:= tnDontPaint;
      for i:=0 to Chart1.Series[0].Count-1 do
        begin
          Temp_Value:=Chart1.Series[0].XValue[i];
          Residuals_Exponential.AddXY(Temp_Value, Chart1.Series[0].YValue[i] - (Exp(m * Temp_Value) * Exp(b)));
        end;
      Residuals_Exponential.ParentChart:=Chart2;
    end;
  Chart2.Axes.Top.Title.Caption:='Residuals of Exponential Trend';
  Chart2.Series[Exponential_Series_Number].Visible:=True;
  if SemiLog_Trend_Added then
    begin
      Chart2.Series[SemiLog_Series_Number].Visible:=False;
    end;
  if Linear_Trend_Added then
    begin
      Chart2.Series[Linear_Series_Number].Visible:=False;
    end;
  if LogLog_Trend_Added then
    begin
      Chart2.Series[LogLog_Series_Number].Visible:=False;
    end;
end;

procedure TCross_Plot.Button6Click(Sender: TObject);
var
i: integer;
Temp_Value: Real;
begin
  if not LogLog_Trend_Added then
    begin
      Regression_LogLog;
      LogLog_Series_Number:=Chart2.SeriesCount;
      Residuals_LogLog:=TPointSeries.Create(Chart2);
      Residuals_LogLog.Name:='Residuals_LogLog';
      Residuals_LogLog.ColorEachPoint:=False;
      Residuals_LogLog.Depth:=45;
      Residuals_LogLog.LinePen.Visible:=False;
      Residuals_LogLog.SeriesColor:=clMaroon;
      Residuals_LogLog.Pointer.Style:=psCircle;
      Residuals_LogLog.Pointer.Pen.Color:=clMaroon;
      Residuals_LogLog.Pointer.HorizSize:=2;
      Residuals_LogLog.Pointer.VertSize:=2;
//      Residuals_LogLog.TreatNulls:= tnDontPaint;
      for i:=0 to Chart1.Series[0].Count-1 do
        begin
          Temp_Value:=Chart1.Series[0].XValue[i];
          if (Temp_Value>0) then
            Residuals_LogLog.AddXY(Temp_Value, Chart1.Series[0].YValue[i] - (Power(Temp_Value, m) * Power(10, b)));
        end;
      Residuals_LogLog.ParentChart:=Chart2;
    end;
  Chart2.Axes.Top.Title.Caption:='Residuals of Log-Log Trend';
  Chart2.Series[LogLog_Series_Number].Visible:=True;
  if Linear_Trend_Added then
    begin
      Chart2.Series[Linear_Series_Number].Visible:=False;
    end;
  if SemiLog_Trend_Added then
    begin
      Chart2.Series[SemiLog_Series_Number].Visible:=False;
    end;
  if Exponential_Trend_Added then
    begin
      Chart2.Series[Exponential_Series_Number].Visible:=False;
    end;
end;

procedure TCross_Plot.FormCreate(Sender: TObject);
begin
  Linear_Trend_Added:=False;
  SemiLog_Trend_Added:=False;
  LogLog_Trend_Added:=False;
  Exponential_Trend_Added:=False;
end;

procedure TCross_Plot.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
