unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, StatChar, ExtDlgs, ComCtrls, XPMan, Spin,
  TeEngine, Series, TeeProcs, Chart, TeeCLVFunction, TeeCumu, TeeBoxPlot,
  DB, DBTables, DBChart, TeeSurfa, TeeTools, TeePageNumTool, TeeScroB,
  mxProtector, TeeURL, TeeSeriesTextEd, Math, TeeEdit;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    SavePictureDialog1: TSavePictureDialog;
    XPManifest1: TXPManifest;
    SavePictureDialog2: TSavePictureDialog;
    GroupBox1: TGroupBox;
    Button2: TButton;
    Button7: TButton;
    Button4: TButton;
    Button5: TButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Button6: TButton;
    Button9: TButton;
    DBChart2: TDBChart;
    DBChart3: TDBChart;
    Chart1: TChart;
    Series4: TFastLineSeries;
    mxProtector1: TmxProtector;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    Label13: TLabel;
    Edit13: TEdit;
    Edit14: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Edit15: TEdit;
    Edit16: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Edit17: TEdit;
    Edit18: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Edit19: TEdit;
    Edit20: TEdit;
    Label20: TLabel;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBChart5: TDBChart;
    Edit30: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    DBChart1: TDBChart;
    Series1: THorizBoxSeries;
    Series5: THorizBoxSeries;
    ChartEditor1: TChartEditor;
    Button1: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure mxProtector1StartTrial(Sender: TObject;
      StartsRemained: Integer);
    procedure mxProtector1Expiration(Sender: TObject);
    procedure DBChart2Zoom(Sender: TObject);
    procedure DBChart2UndoZoom(Sender: TObject);
    procedure DBChart3Zoom(Sender: TObject);
    procedure DBChart3UndoZoom(Sender: TObject);
    Procedure AddCustomLabels;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  File_Name1:String;
  File_Name2:String;
  FN1,FN2:Integer;
  Number_of_Records1:Integer;
  Number_of_Records2:Integer;
  Open_File1: TextFile;
  Open_File2: TextFile;
  Depth_Value1,First_Depth_Value1,Last_Depth_Value1: Real;
  Depth_Value2,First_Depth_Value2,Last_Depth_Value2: Real;
  Min_Value1, Max_Value1, Log_Value1: Real;
  Min_Value2, Max_Value2, Log_Value2: Real;
  Color_Interval1: Real;
  Color_Interval2: Real;
  Color_Values1: Array of Array of Integer;
  Color_Values2: Array of Array of Integer;
  Point_Color_Value1 :Integer;
  Point_Color_Value2 :Integer;
  S,S1,S2,S3,S4:String;
  P,P1,P2{, Step}:Integer;
  Read_Text:String;
  Step_Value1,Null_Value1:Real;
  Step_Value2,Null_Value2:Real;
  Freed1,Freed2:Boolean;
  Series2: TColorGridSeries;
  Series3: TColorGridSeries;
  ZRect:TRect;
  Interval:Integer;

implementation

uses Unit2 , Types;



{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
begin
if not Freed1 then
  if SavePictureDialog1.Execute then
    begin
      DBchart2.SaveToBitmapFile(SavePictureDialog1.FileName+'.bmp');
    end;
if not Freed2 then
  if SavePictureDialog2.Execute then
    begin
      DBchart3.SaveToBitmapFile(SavePictureDialog2.FileName+'.bmp');
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Button2.Enabled:=False;
Button4.Enabled:=False;
Button5.Enabled:=False;
Button6.Enabled:=False;
Button7.Enabled:=True;
Button9.Enabled:=False;
Freed1:=True;
Freed2:=True;
ZRect.Top:=0;
ZRect.Bottom:=1000;
//ZRect.Bottom:=DBChart2.ChartRect.Bottom;
//ZRect.Top:=DBChart2.ChartRect.Top;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not Freed1 then
    begin
      Series2.Free;
    end;
  if not Freed2 then
    begin
      Series3.Free;
    end;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  i,j: integer;
begin
try
if OpenDialog1.Execute then
  begin
      Refresh;
      Form2:=TForm2.Create(Self);
      Form2.Show;
      File_Name1:=OpenDialog1.FileName;
      AssignFile(Open_File1,File_Name1);
      Reset(Open_File1);
      repeat
        Read(Open_File1,Read_Text);
        S:=Copy(Read_Text,0,4);
        if Read_Text='' then Readln(Open_File1);
      until  (S='STRT')or(S=' STR');
      Form2.Label1.Caption:='Reading start depth value ...';
      Form2.Refresh;
      for i:=1 to Length(Read_Text) do
        begin
          S:=Copy(Read_Text,0,1);
          if (S='1')or(S='2')or(S='3')or(S='4')or(S='5')or(S='6')or(S='7')or(S='8')or(S='9') then
            begin
              S1:=Copy(Read_Text,0,12);
              S1:=TrimLeft(S1);
              S1:=TrimRight(S1);
              First_Depth_Value1:=StrToFloat(S1);
              Readln(Open_File1,Read_Text);
              Break;
            end;
          Delete(Read_Text,1,1);
        end;
      if Read_Text='' then
        Readln(Open_File1,Read_Text);
      Form2.Label1.Caption:='Reading stop depth value ...';
      Form2.Refresh;
      for i:=1 to Length(Read_Text) do
        begin
          S:=Copy(Read_Text,0,1);
          if (S='1')or(S='2')or(S='3')or(S='4')or(S='5')or(S='6')or(S='7')or(S='8')or(S='9') then
            begin
              S1:=Copy(Read_Text,0,12);
              S1:=TrimLeft(S1);
              S1:=TrimRight(S1);
              Last_Depth_Value1:=StrToFloat(S1);
              Readln(Open_File1,Read_Text);
              Break;
            end;
          Delete(Read_Text,1,1);
        end;
      Edit1.Text:=FloatToStr(First_Depth_Value1);
      Edit2.Text:=FloatToStr(Last_Depth_Value1);
      Refresh;
      Form2.Label1.Caption:='Reading step value ...';
      Form2.Refresh;
      if Read_Text='' then
        Readln(Open_File1,Read_Text);
      for i:=1 to Length(Read_Text) do
        begin
          S:=Copy(Read_Text,0,1);
          S1:=Copy(Read_Text,0,2);
          if (S='0')or(S='1')or(S='2')or(S='3')or(S='4')or(S='5')or(S='6')or(S='7')or(S='8')or(S='9')or(S1='.0')or(S1='.1')or(S1='.2')or(S1='.3')or(S1='.4')or(S1='.5')or(S1='.6')or(S1='.7')or(S1='.8')or(S1='.9') then
            begin
              S2:=Copy(Read_Text,0,12);
              S2:=TrimLeft(S2);
              S2:=TrimRight(S2);
              Step_Value1:=StrToFloat(S2);
              Readln(Open_File1,Read_Text);
              Break;
            end;
          Delete(Read_Text,1,1);
        end;
      Number_of_Records1:=1+Trunc(Abs((Last_Depth_Value1-First_Depth_Value1)/Step_Value1));
      Form2.Label1.Caption:='Reading null value ...';
      Form2.Refresh;
      if Read_Text='' then
        Readln(Open_File1,Read_Text);
      for i:=1 to Length(Read_Text) do
        begin
          S:=Copy(Read_Text,0,1);
          if (S='-')or(S='1')or(S='2')or(S='3')or(S='4')or(S='5')or(S='6')or(S='7')or(S='8')or(S='9') then
            begin
              S1:=Copy(Read_Text,0,12);
              S1:=TrimLeft(S1);
              S1:=TrimRight(S1);
              Null_Value1:=StrToFloat(S1);
              Readln(Open_File1);
              Break;
            end;
          Delete(Read_Text,1,1);
        end;
      FN1:=0;
      repeat
        Read(Open_File1,Read_Text);
        S:=Copy(Read_Text,0,4);
        if Read_Text='' then Readln(Open_File1);
      until  (S='DEPT')or(S=' DEP');
               repeat
                Readln(Open_File1,s);
                s2:='';
                s3 := Copy( s, 1,1);
                P1:=Pos('.',s);
                s2 := Copy( s, 1,P1-1);
                s2:=TrimLeft(s2);
                s2:=TrimRight(s2);
                if ((not(s2=''))and(not(s3='~'))and(not(s3='#'))) then
                 begin
                  FN1:=FN1+1;
                 end;
                s:=TrimLeft(s);
                s:=TrimRight(s);
               until s3='~';
      if not (s='~A') then
        begin
          repeat
            Read(Open_File1,Read_Text);
            S:=Copy(Read_Text,0,2);
            if Read_Text='' then Readln(Open_File1);
          until  (S='~A');
        end;
//      Readln(Open_File1);
      Form2.Label1.Caption:='Creating array of colors ...';
      Form2.Refresh;
      Read(Open_File1,Depth_Value1);
      Series2:=TColorGridSeries.Create(Application);
      Series2.UsePalette:=True;
      Series2.UseColorRange:=False;
      Series2.HorizAxis:=aTopAxis;
      DBChart2.TopAxis.Inverted:=True;
      if (First_Depth_Value1-Last_Depth_Value1)>0 then
        DBChart2.LeftAxis.Inverted:=False
      else
        DBChart2.LeftAxis.Inverted:=True;
      Series2.Pen.Visible:=False;
      Series2.NumXValues:=FN1;
      Series2.NumZValues:=Number_of_Records1;
      Series1.BeginUpdate;
      Series2.BeginUpdate;
      Series4.BeginUpdate;
      for i:=0 to Number_of_Records1 do
        begin
          for j:=FN1-1 downto 0 do
            begin
              Read(Open_File1,Log_Value1);
              if Log_Value1=Null_Value1 then
           //     Series2.AddNull(Log_Value1)
              else
                begin
                  Log_Value1:=Abs(Log_Value1);
                  Series1.AddX(Log_Value1);
                  Series2.Value[j,i]:=Log_Value1;
                end;
//              Series2.AddXYZ(j,Log_Value1,i);//,FloatToStr(Depth_Value1),0);
            end;
          Series4.AddY(Depth_Value1);
          Read(Open_File1,Depth_Value1);
        end;
      Series1.EndUpdate;
      Series2.EndUpdate;
      Series4.EndUpdate;
      Max_Value1:=Series1.MaxXValue;
      Min_Value1:=Series1.MinXValue;
      Interval:=Trunc(Number_of_Records1/20);
      AddCustomLabels;
      Edit4.Text:=FloatToStr(Max_Value1);
      Edit5.Text:=FloatToStr(Min_Value1);
      Color_Interval1:=(Max_Value1-Min_Value1)/256;
      Form2.Label1.Caption:='Creating temporary image ...';
      Form2.Refresh;
      Refresh;
      for i:=0 to 255 do
        begin
          if i<=59 then
            Begin
              Series2.AddPalette(Min_Value1+i*Color_Interval1,RGB(i,0,0));
            end;
          if (i>59) and (i<195) then
            Begin
              Series2.AddPalette(Min_Value1+i*Color_Interval1,RGB(60+Trunc((i-59)*1.33),Trunc(1.67*(i-60)),0));
            end;
          if (i>=195) then
            Begin
              Series2.AddPalette(Min_Value1+i*Color_Interval1,RGB(255,255,Trunc((i-60)*1.31)));
            end;
        end;
    Series2.ParentChart:=DBChart2;
    Edit11.Text:=FloatToStr(RoundTo(Series1.Median,-1));
    Edit12.Text:=FloatToStr(RoundTo(Series1.WhiskerLength,-1));
    Edit13.Text:=FloatToStr(RoundTo(Series1.Quartile1,-1));
    Edit14.Text:=FloatToStr(RoundTo(Series1.Quartile3,-1));
    Edit15.Text:=FloatToStr(RoundTo(Series1.InnerFence1,-1));
    Edit16.Text:=FloatToStr(RoundTo(Series1.InnerFence3,-1));
    Edit17.Text:=FloatToStr(RoundTo(Series1.OuterFence1,-1));
    Edit18.Text:=FloatToStr(RoundTo(Series1.OuterFence3,-1));
    Edit19.Text:=FloatToStr(RoundTo(Series1.AdjacentPoint1,-1));
    Edit20.Text:=FloatToStr(RoundTo(Series1.AdjacentPoint3,-1));
    CloseFile(Open_File1);
    Button2.Enabled:=True;
    Button4.Enabled:=True;
    Button5.Enabled:=True;
    Button9.Enabled:=True;
    Button7.Enabled:=False;
    Button6.Enabled:=False;
    Freed1:=False;
    Form2.Free;
end;
except
  Color_Values1:=nil;
  Freed1:=True;
  Button2.Enabled:=False;
  Button4.Enabled:=False;
  Button5.Enabled:=False;
  Button7.Enabled:=True;
  CloseFile(Open_File1);
  Form2.Free;
end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if not Freed1 then
     begin
      Color_Values1:=nil;
      Edit1.Text:='';
      Edit2.Text:='';
      Edit4.Text:='';
      Edit5.Text:='';
      Series2.Free;
      Series1.Clear;
      Edit11.Text:='';
      Edit12.Text:='';
      Edit13.Text:='';
      Edit14.Text:='';
      Edit15.Text:='';
      Edit16.Text:='';
      Edit17.Text:='';
      Edit18.Text:='';
      Edit19.Text:='';
      Edit20.Text:='';
      Freed1:=True;
    end;
  if not Freed2 then
    begin
      Color_Values2:=nil;
      Edit6.Text:='';
      Edit7.Text:='';
      Edit8.Text:='';
      Edit9.Text:='';
      Series3.Free;
      Series5.Clear;
      Edit21.Text:='';
      Edit22.Text:='';
      Edit23.Text:='';
      Edit24.Text:='';
      Edit25.Text:='';
      Edit26.Text:='';
      Edit27.Text:='';
      Edit28.Text:='';
      Edit29.Text:='';
      Edit30.Text:='';
      Freed2:=True;
    end;
  Button2.Enabled:=False;
  Button4.Enabled:=False;
  Button5.Enabled:=False;
  Button6.Enabled:=False;
  Button9.Enabled:=False;
  Button7.Enabled:=True;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  i,j: integer;
begin
try
if OpenDialog1.Execute then
  begin
      Refresh;
      Form2:=TForm2.Create(Self);
      Form2.Show;
      File_Name2:=OpenDialog1.FileName;
      AssignFile(Open_File2,File_Name2);
      Reset(Open_File2);
      repeat
        Read(Open_File2,Read_Text);
        S:=Copy(Read_Text,0,4);
        if Read_Text='' then Readln(Open_File2);
      until  (S='STRT')or(S=' STR');
      Form2.Label1.Caption:='Reading start depth value ...';
      Form2.Refresh;
      for i:=1 to Length(Read_Text) do
        begin
          S:=Copy(Read_Text,0,1);
          if (S='1')or(S='2')or(S='3')or(S='4')or(S='5')or(S='6')or(S='7')or(S='8')or(S='9') then
            begin
              S1:=Copy(Read_Text,0,12);
              S1:=TrimLeft(S1);
              S1:=TrimRight(S1);
              First_Depth_Value2:=StrToFloat(S1);
              Readln(Open_File2,Read_Text);
              Break;
            end;
          Delete(Read_Text,1,1);
        end;
      if Read_Text='' then
        Readln(Open_File2,Read_Text);
      Form2.Label1.Caption:='Reading stop depth value ...';
      Form2.Refresh;
      for i:=1 to Length(Read_Text) do
        begin
          S:=Copy(Read_Text,0,1);
          if (S='1')or(S='2')or(S='3')or(S='4')or(S='5')or(S='6')or(S='7')or(S='8')or(S='9') then
            begin
              S1:=Copy(Read_Text,0,12);
              S1:=TrimLeft(S1);
              S1:=TrimRight(S1);
              Last_Depth_Value2:=StrToFloat(S1);
              Readln(Open_File2,Read_Text);
              Break;
            end;
          Delete(Read_Text,1,1);
        end;
      Edit8.Text:=FloatToStr(First_Depth_Value2);
      Edit9.Text:=FloatToStr(Last_Depth_Value2);
      Refresh;
      Form2.Label1.Caption:='Reading step value ...';
      Form2.Refresh;
      if Read_Text='' then
        Readln(Open_File2,Read_Text);
      for i:=1 to Length(Read_Text) do
        begin
          S:=Copy(Read_Text,0,1);
          S1:=Copy(Read_Text,0,2);
          if (S='0')or(S='1')or(S='2')or(S='3')or(S='4')or(S='5')or(S='6')or(S='7')or(S='8')or(S='9')or(S1='.0')or(S1='.1')or(S1='.2')or(S1='.3')or(S1='.4')or(S1='.5')or(S1='.6')or(S1='.7')or(S1='.8')or(S1='.9') then
            begin
              S2:=Copy(Read_Text,0,12);
              S2:=TrimLeft(S2);
              S2:=TrimRight(S2);
              Step_Value2:=StrToFloat(S2);
              Readln(Open_File2,Read_Text);
              Break;
            end;
          Delete(Read_Text,1,1);
        end;
      Number_of_Records2:=1+Trunc(Abs((Last_Depth_Value2-First_Depth_Value2)/Step_Value2));
      Form2.Label1.Caption:='Reading null value ...';
      Form2.Refresh;
      if Read_Text='' then
        Readln(Open_File2,Read_Text);
      for i:=1 to Length(Read_Text) do
        begin
          S:=Copy(Read_Text,0,1);
          if (S='-')or(S='1')or(S='2')or(S='3')or(S='4')or(S='5')or(S='6')or(S='7')or(S='8')or(S='9') then
            begin
              S1:=Copy(Read_Text,0,12);
              S1:=TrimLeft(S1);
              S1:=TrimRight(S1);
              Null_Value2:=StrToFloat(S1);
              Readln(Open_File2);
              Break;
            end;
          Delete(Read_Text,1,1);
        end;
      FN2:=0;
      repeat
        Read(Open_File2,Read_Text);
        S:=Copy(Read_Text,0,4);
        if Read_Text='' then Readln(Open_File2);
      until  (S='DEPT')or(S=' DEP');
               repeat
                Readln(Open_File2,s);
                s2:='';
                s3 := Copy( s, 1,1);
                P1:=Pos('.',s);
                s2 := Copy( s, 1,P1-1);
                s2:=TrimLeft(s2);
                s2:=TrimRight(s2);
                if ((not(s2=''))and(not(s3='~'))and(not(s3='#'))) then
                 begin
                  FN2:=FN2+1;
                 end;
                s:=TrimLeft(s);
                s:=TrimRight(s);
               until s3='~';
      if not (s='~A') then
        begin
          repeat
            Read(Open_File2,Read_Text);
            S:=Copy(Read_Text,0,2);
            if Read_Text='' then Readln(Open_File2);
          until  (S='~A');
        end;
      Form2.Label1.Caption:='Finding minimum and maximum values ...';
      Form2.Refresh;
      Readln(Open_File2);
      Form2.Label1.Caption:='Creating array of colors ...';
      Form2.Refresh;
      Read(Open_File2,Depth_Value2);
      Series3:=TColorGridSeries.Create(Application);
      Series3.UsePalette:=True;
      Series3.UseColorRange:=False;
      Series3.HorizAxis:=aTopAxis;
      DBChart3.TopAxis.Inverted:=True;
      if (First_Depth_Value2-Last_Depth_Value2)>0 then
        DBChart3.LeftAxis.Inverted:=False
      else
        DBChart3.LeftAxis.Inverted:=True;
      Series3.Pen.Visible:=False;
      Series3.NumXValues:=FN2;
      Series3.NumZValues:=Number_of_Records2;
      Series5.BeginUpdate;
      Series3.BeginUpdate;
      Series4.BeginUpdate;
      for i:=0 to Number_of_Records2-1 do
        begin
          for j:=FN2-1 downto 0 do
            begin
              Read(Open_File2,Log_Value2);
              if Log_Value2=Null_Value2 then
           //     Series2.AddNull(Log_Value1)
              else
                begin
                  Log_Value2:=Abs(Log_Value2);
                  Series5.AddX(Log_Value2);
                  Series3.Value[j,i]:=Log_Value2;
                end;
            end;
          Series4.AddY(Depth_Value2);
          Read(Open_File2,Depth_Value2);
        end;
      Series5.EndUpdate;
      Series3.EndUpdate;
      Series4.EndUpdate;
      Max_Value2:=Series5.MaxXValue;
      Min_Value2:=Series5.MinXValue;
      Edit6.Text:=FloatToStr(Max_Value2);
      Edit7.Text:=FloatToStr(Min_Value2);
      Color_Interval2:=(Max_Value2-Min_Value2)/256;
      Form2.Label1.Caption:='Creating temporary image ...';
      Form2.Refresh;
      Refresh;
      for i:=0 to 255 do
        begin
          if i<=59 then
            Begin
              Series3.AddPalette(Min_Value2+i*Color_Interval2,RGB(255-Trunc(0.25*i),255-Trunc(0.51*i),255-Trunc(4.3*i)));
            end;
          if (i>59) and (i<195) then
            Begin
              Series3.AddPalette(Min_Value2+i*Color_Interval2,RGB(239-Trunc(1.33*(i-60)),224-Trunc(1.67*(i-60)),0));
            end;
          if (i>=195) then
            Begin
              Series3.AddPalette(Min_Value2+i*Color_Interval2,RGB(59-Trunc(0.98*(i-195)),0,0));
            end;
        end;
    Series3.ParentChart:=DBChart3;
    Edit21.Text:=FloatToStr(RoundTo(Series5.Median,-1));
    Edit22.Text:=FloatToStr(RoundTo(Series5.WhiskerLength,-1));
    Edit23.Text:=FloatToStr(RoundTo(Series5.Quartile1,-1));
    Edit24.Text:=FloatToStr(RoundTo(Series5.Quartile3,-1));
    Edit25.Text:=FloatToStr(RoundTo(Series5.InnerFence1,-1));
    Edit26.Text:=FloatToStr(RoundTo(Series5.InnerFence3,-1));
    Edit27.Text:=FloatToStr(RoundTo(Series5.OuterFence1,-1));
    Edit28.Text:=FloatToStr(RoundTo(Series5.OuterFence3,-1));
    Edit29.Text:=FloatToStr(RoundTo(Series5.AdjacentPoint1,-1));
    Edit30.Text:=FloatToStr(RoundTo(Series5.AdjacentPoint3,-1));
    CloseFile(Open_File2);
    Button2.Enabled:=True;
    Button4.Enabled:=True;
    Button6.Enabled:=True;
    Button5.Enabled:=False;
    Freed2:=False;
    Form2.Free;
  end;
except
  Color_Values2:=nil;
  Freed2:=True;
  Button2.Enabled:=False;
  Button4.Enabled:=False;
  Button6.Enabled:=False;
  Button5.Enabled:=True;
  CloseFile(Open_File2);
  Form2.Free;
end;

end;

procedure TForm1.Button6Click(Sender: TObject);
var
  i: integer;
begin
      Form2:=TForm2.Create(Self);
      Form2.Show;
      Form2.Label1.Caption:='Creating new radius image ...';
      Form2.Refresh;
      Series3.Visible:=False;
      Series3.ClearPalette;
      Max_Value2:=StrToFloat(Edit6.Text);
      Min_Value2:=StrToFloat(Edit7.Text);
      Color_Interval2:=(Max_Value2-Min_Value2)/256;
      Form2.Label1.Caption:='Creating temporary image ...';
      Form2.Refresh;
      Refresh;
      for i:=0 to 255 do
        begin
          if i<=59 then
            Begin
              Series3.AddPalette(Min_Value2+i*Color_Interval2,RGB(255-Trunc(0.25*i),255-Trunc(0.51*i),255-Trunc(4.3*i)));
            end;
          if (i>59) and (i<195) then
            Begin
              Series3.AddPalette(Min_Value2+i*Color_Interval2,RGB(239-Trunc(1.33*(i-60)),224-Trunc(1.67*(i-60)),0));
            end;
          if (i>=195) then
            Begin
              Series3.AddPalette(Min_Value2+i*Color_Interval2,RGB(59-Trunc(0.98*(i-195)),0,0));
            end;
        end;
      Series3.UsePalette:=True;
      Series3.Repaint;
      Series3.Visible:=True;

    Button2.Enabled:=True;
    Button4.Enabled:=True;
    Button5.Enabled:=False;
    Freed2:=False;
    Form2.Free;

end;

procedure TForm1.Button9Click(Sender: TObject);
var
  i: integer;
begin
      Form2:=TForm2.Create(Self);
      Form2.Show;
      Form2.Label1.Caption:='Applying new range ...';
      Form2.Refresh;
      Series2.Visible:=False;
      Series2.ClearPalette;
      Max_Value1:=StrToFloat(Edit4.Text);
      Min_Value1:=StrToFloat(Edit5.Text);
      Color_Interval1:=(Max_Value1-Min_Value1)/256;
      for i:=0 to 255 do
        begin
          if i<=59 then
            Begin
              Series2.AddPalette(Min_Value1+i*Color_Interval1,RGB(i,0,0));
            end;
          if (i>59) and (i<195) then
            Begin
              Series2.AddPalette(Min_Value1+i*Color_Interval1,RGB(60+Trunc((i-59)*1.33),Trunc(1.67*(i-60)),0));
            end;
          if (i>=195) then
            Begin
              Series2.AddPalette(Min_Value1+i*Color_Interval1,RGB(255,255,Trunc((i-60)*1.31)));
            end;
        end;
      Series2.UsePalette:=True;
      Series2.Repaint;
      Series2.Visible:=True;
      Refresh;
    Button5.Enabled:=True;
    Button7.Enabled:=False;
    Freed1:=False;
    Form2.Free;
end;

procedure TForm1.mxProtector1StartTrial(Sender: TObject;
  StartsRemained: Integer);
begin
    MessageDlg(IntToStr(StartsRemained)+' times remaining ...',mtWarning,[mbOk],0);
end;

procedure TForm1.mxProtector1Expiration(Sender: TObject);
begin
    MessageDlg('The product has expired. Please purchase the product.',mtError,[mbOk],0);
 //   Application.Terminate;
end;

procedure TForm1.DBChart2Zoom(Sender: TObject);
begin
ZRect:=Rect(DBchart2.Zoom.X0,DBchart2.Zoom.Y0,DBchart2.Zoom.X1,DBchart2.Zoom.Y1);
DBChart3.ZoomRect(ZRect);
Interval:=Trunc((DBChart2.Series[0].GetVertAxis.CalcPosPoint(ZRect.Bottom)-DBChart2.Series[0].GetVertAxis.CalcPosPoint(ZRect.Top))/20);
AddCustomLabels;
end;

procedure TForm1.DBChart2UndoZoom(Sender: TObject);
begin
DBChart3.UndoZoom;
Interval:=Trunc(Number_of_Records1/20);
AddCustomLabels;
end;

procedure TForm1.DBChart3Zoom(Sender: TObject);
var
ZRect:TRect;
begin
ZRect:=Rect(DBchart3.Zoom.X0,DBchart3.Zoom.Y0,DBchart3.Zoom.X1,DBchart3.Zoom.Y1);
Chart1.ZoomRect(ZRect);
end;

procedure TForm1.DBChart3UndoZoom(Sender: TObject);
begin
Chart1.UndoZoom;
end;

Procedure TForm1.AddCustomLabels;
var
i:Real;
j:integer;
begin
  with DBChart2.Axes.Left do
  begin
    Items.Clear;  // remove all custom labels

    // add custom labels
//    for i:=0 to Number_of_Records1-1 do
//      begin
//      i:=Chart1.Series[0].CalcYPosValue(Chart1.Series[0].YValues[0]);
//      i:=DBChart2.Series[0].CalcYPosValue(Chart1.Series[0].YValues[0]);
      j:=0;
      if Interval<1 then Interval:=1;
//      Interval:=Number_of_Records1/20;
//      (ZRect.Bottom-ZRect.Top)
      repeat
        Items.Add(j,FloatToStr(Chart1.Series[0].YValues[j]));
//        i:=i+Interval;
        j:=j+Interval;
      until j>Number_of_Records1;
  //    end;
    LabelsAlign:=alOpposite;
{    Items.Add(123,'Hello').Font.Size:=16;

    Items.Add(466,'Good'#13'Bye').Transparent:=False;

    Items.Add(300); }

  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
ChartEditor1.Execute;
end;

end.



