unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ExtDlgs, ComCtrls, KalmanFiltering, SELowPassFilter,
  OrImage, ESBPCSEdit, ESBPCSNumEdit, Menus, ToolWin, ImgList, Qrctrls,
  QuickRpt, jpeg;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    SavePictureDialog1: TSavePictureDialog;
    KalmanFiltering1: TKalmanFiltering;
    lpf: TLowPassFilter;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    View1: TMenuItem;
    WindowSize1: TMenuItem;
    WholeSize1: TMenuItem;
    Filters1: TMenuItem;
    TrimFilter1: TMenuItem;
    LowPassFilter1: TMenuItem;
    GaussianFilter1: TMenuItem;
    KalmanFilter1: TMenuItem;
    Save1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ImageList1: TImageList;
    AntiAliasing1: TMenuItem;
    ToolButton5: TToolButton;
    Amplitude1: TMenuItem;
    Radius1: TMenuItem;
    ToolButton6: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ToolButton14: TToolButton;
    DataEnhancement1: TMenuItem;
    PictureEnhancement1: TMenuItem;
    About1: TMenuItem;
    About2: TMenuItem;
    Print1: TMenuItem;
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    QRImage5: TQRImage;
    QRImage6: TQRImage;
    QRImage7: TQRImage;
    QRImage8: TQRImage;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    Images1: TImage;
    Images2: TImage;
    Temp_Images1: TImage;
    Temp_Images2: TImage;
    Images3: TOrImage;
    Images4: TOrImage;
    Temp_Images3: TOrImage;
    Temp_Images4: TOrImage;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    ToolButton15: TToolButton;
    UpDown1: TUpDown;
    Up1: TMenuItem;
    Down1: TMenuItem;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure KalmanFiltering1NextItem(Sender: TObject;
      Value: Double);
    procedure KalmanFiltering1NextPosterioriEstimation(Sender: TObject;
      Estimation: Double);
    procedure Radius1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure WindowSize1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure WholeSize1Click(Sender: TObject);
    procedure GaussianFilter1Click(Sender: TObject);
    procedure KalmanFilter1Click(Sender: TObject);
    procedure LowPassFilter1Click(Sender: TObject);
    procedure TrimFilter1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure AntiAliasing1Click(Sender: TObject);
    procedure Amplitude1Click(Sender: TObject);
    procedure About2Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Up1Click(Sender: TObject);
    procedure Down1Click(Sender: TObject);

  private
    { Private declarations }
  public
    Canceled: Boolean;
    Mode:String;
    NoiseDegreeMode,SupressionDegreeMode:String;
    Min_Value3, Max_Value3, Log_Value3: Real;
    Min_Value4, Max_Value4, Log_Value4: Real;
    Scale:Integer;
    { Public declarations }
  end;
var
  Form1: TForm1;
  File_Name1:String;
  File_Name2:String;
  Min_Value1, Max_Value1, Log_Value1: Real;
  Min_Value2, Max_Value2, Log_Value2: Real;
  FN1,FN2:Integer;
  Number_of_Records1:Integer;
  Number_of_Records2:Integer;
  Open_File1: TextFile;
  Open_File2: TextFile;
  Depth_Value1,First_Depth_Value1,Last_Depth_Value1: Real;
  Depth_Value2,First_Depth_Value2,Last_Depth_Value2: Real;
  Color_Interval1: Real;
  Color_Interval2: Real;
  Color_Interval3: Real;
  Color_Interval4: Real;
  Color_Values1: Array of Array of Integer;
  Color_Values2: Array of Array of Integer;
  Color_Values3: Array of Array of Integer;
  Color_Values4: Array of Array of Integer;
  Depth_Interval1:Real;
  Label_Interval1:Real;
  Pixel_Interval1:Integer;
  Depth_Interval2:Real;
  Label_Interval2:Real;
  Pixel_Interval2:Integer;
  Point_Color_Value1 :Integer;
  Point_Color_Value2 :Integer;
  S,S1,S2,S3,S4:String;
  P,P1,P2, Step:Integer;
  Read_Text:String;
  Step_Value1,Null_Value1:Real;
  Step_Value2,Null_Value2:Real;
  Log_Values1:Array of Array of Real;
  Log_Values2:Array of Array of Real;
  Log_Values3:Array of Array of Real;
  Log_Values4:Array of Array of Real;
  kalman1i,kalman1j:integer;
  kalman2i,kalman2j:integer;
  Original_Amp_Image,
  Original_Rad_Image,
  Trim_Amp_Image,
  Trim_Rad_Image,
  LowPass_Amp_Image,
  LowPass_Rad_Image,
  Gaussian_Amp_Image,
  Gaussian_Rad_Image,
  Kalman_Amp_Image,
  Kalman_Rad_Image,
  AntiAlias_Amp_Image,
  AntiAlias_Rad_Image:Boolean;
  Amp_Filter_Applied:Boolean;
  Rad_Filter_Applied:Boolean;
  Depth_Unit1,Depth_Unit2:String;
  First_Depth_Label1,First_Value_Difference1:Real;
  First_Pixel_Point1:Integer;
  First_Depth_Label2,First_Value_Difference2:Real;
  First_Pixel_Point2:Integer;
  Copy_Images1:TImage;
  Copy_Images11:TImage;
  Copy_Images2:TImage;
  Copy_Images3:TOrImage;
  Copy_Images4:TOrImage;
  Pixel_Factor:Real;

implementation

uses Unit2, Unit3, Unit4, Unit5, AboutPage, Unit6 ;



{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
QuickRep1.Visible:=False;
Original_Amp_Image:=False;
Original_Rad_Image:=False;
Images1.Left:=0;
Images2.Left:=Images1.Left+250+2;
Images3.Left:=Images2.Left+250+2;
Images4.Left:=Images3.Left+250+2;
Temp_Images1.Left:=0;
Temp_Images2.Left:=Temp_Images1.Left+250+2;
Temp_Images3.Left:=Temp_Images2.Left+250+2;
Temp_Images4.Left:=Temp_Images3.Left+250+2;
Shape1.Left:=Images1.Left-1;
Shape2.Left:=Images2.Left-1;
Shape3.Left:=Images3.Left-1;
Shape4.Left:=Images4.Left-1;
Label1.Left:=Images1.Left;
Label2.Left:=Images2.Left;
Label3.Left:=Images3.Left;
Label4.Left:=Images4.Left;
Images1.Canvas.FillRect(Rect(0,0,Images1.Width,Images1.Height));
Images2.Canvas.FillRect(Rect(0,0,Images2.Width,Images2.Height));
Images3.Canvas.FillRect(Rect(0,0,Images3.Width,Images3.Height));
Images4.Canvas.FillRect(Rect(0,0,Images4.Width,Images4.Height));
UpDown1.Position:=0;
{Temp_Images1.Canvas.Font.Color:=clBlack;
Temp_Images2.Canvas.Font.Color:=clBlack;
Temp_Images3.Canvas.Font.Color:=clBlack;
Temp_Images4.Canvas.Font.Color:=clBlack; }
FN1:=0;
FN2:=0;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Original_Amp_Image then
    begin
      Color_Values1:=nil;
      Log_Values1:=nil;
      Images1.Free;
      Temp_Images1.Free;
    end;
  if Original_Rad_Image then
    begin
      Color_Values2:=nil;
      Log_Values2:=nil;
      Images2.Free;
      Temp_Images2.Free;
    end;
  if Amp_Filter_Applied then
    begin
      Color_Values3:=nil;
      Log_Values3:=nil;
      Images3.Free;
      Temp_Images3.Free;
    end;
  if Rad_Filter_Applied then
    begin
      Color_Values4:=nil;
      Log_Values4:=nil;
      Images4.Free;
      Temp_Images4.Free;
    end;
end;

procedure TForm1.KalmanFiltering1NextItem(Sender: TObject;
  Value: Double);
begin
if not Kalman_Amp_Image then
 begin
  if ((kalman1j mod (FN1-1))=0)and(kalman1j<>0) then
    begin
      kalman1i:=kalman1i+1;
      kalman1j:=0;
    end
  else
    kalman1j:=kalman1j+1;
 end;
if Kalman_Amp_Image then
 begin
  if ((kalman2j mod (FN2-1))=0)and(kalman2j<>0) then
    begin
      kalman2i:=kalman2i+1;
      kalman2j:=0;
    end
  else
    kalman2j:=kalman2j+1;
 end;
end;

procedure TForm1.KalmanFiltering1NextPosterioriEstimation(Sender: TObject;
  Estimation: Double);
begin
Log_Value2:=Estimation;
if not Kalman_Amp_Image then
  begin
    Color_Values3[kalman1i,kalman1j]:=Trunc((Log_Value2-Min_Value3)/Color_Interval3);
    Log_Values3[kalman1i,kalman1j]:=Log_Value2;
  end;
if Kalman_Amp_Image then
  begin
    Color_Values4[kalman2i,kalman2j]:=Trunc((Log_Value2-Min_Value4)/Color_Interval4);
    Log_Values4[kalman2i,kalman2j]:=Log_Value2;
  end;
end;

procedure TForm1.Radius1Click(Sender: TObject);
var
  i,j,k,N2: integer;
begin
try
if OpenDialog1.Execute then
  begin
      Repaint;
      if not Original_Amp_Image then
        begin
          Form6:=TForm6.Create(Self);
          Form6.ShowModal;
          Form6.Free;
        end;
      Form2:=TForm2.Create(Application);
      Form2.Show;
      File_Name2:=OpenDialog1.FileName;
      AssignFile(Open_File2,File_Name2);
      Reset(Open_File2);
      Max_Value2:=-33000;
      Min_Value2:=33000;
      repeat
        Read(Open_File2,Read_Text);
        S:=Copy(Read_Text,0,4);
        if Read_Text='' then Readln(Open_File2);
      until  (S='STRT')or(S=' STR');
      Form2.Label1.Caption:='Reading start depth value ...';
      Form2.Repaint;
      for i:=1 to Length(Read_Text) do
        begin
          S:=Copy(Read_Text,0,1);
          if (S='.') then
            begin
              S1:=Copy(Read_Text,2,5);
              S1:=TrimLeft(S1);
              S1:=TrimRight(S1);
              Depth_Unit2:=S1;
            end;
          S:=Copy(Read_Text,0,1);
          if (S='-')or(S='1')or(S='2')or(S='3')or(S='4')or(S='5')or(S='6')or(S='7')or(S='8')or(S='9') then
            begin
              S1:=Copy(Read_Text,0,11);
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
      Form2.Repaint;
      for i:=1 to Length(Read_Text) do
        begin
          S:=Copy(Read_Text,0,1);
          if (S='-')or(S='1')or(S='2')or(S='3')or(S='4')or(S='5')or(S='6')or(S='7')or(S='8')or(S='9') then
            begin
              S1:=Copy(Read_Text,0,11);
              S1:=TrimLeft(S1);
              S1:=TrimRight(S1);
              Last_Depth_Value2:=StrToFloat(S1);
              Readln(Open_File2,Read_Text);
              Break;
            end;
          Delete(Read_Text,1,1);
        end;
      Repaint;
      Form2.Label1.Caption:='Reading step value ...';
      Form2.Repaint;
      if Read_Text='' then
        Readln(Open_File2,Read_Text);
      for i:=1 to Length(Read_Text) do
        begin
          S:=Copy(Read_Text,0,1);
          S1:=Copy(Read_Text,0,2);
          if (S='-')or(S='0')or(S='1')or(S='2')or(S='3')or(S='4')or(S='5')or(S='6')or(S='7')or(S='8')or(S='9')or(S1='.0')or(S1='.1')or(S1='.2')or(S1='.3')or(S1='.4')or(S1='.5')or(S1='.6')or(S1='.7')or(S1='.8')or(S1='.9') then
            begin
              S2:=Copy(Read_Text,0,11);
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
      Form2.Repaint;
      if Read_Text='' then
        Readln(Open_File2,Read_Text);
      for i:=1 to Length(Read_Text) do
        begin
          S:=Copy(Read_Text,0,1);
          if (S='-')or(S='1')or(S='2')or(S='3')or(S='4')or(S='5')or(S='6')or(S='7')or(S='8')or(S='9') then
            begin
              S1:=Copy(Read_Text,0,11);
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
      Form2.Label1.Caption:='Calculating number of pads ...';
      Form2.Repaint;
      repeat
        Read(Open_File2,Read_Text);
        S:=Copy(Read_Text,0,1);
        if Read_Text='' then
          begin
            Readln(Open_File2);
            FN2:=FN2+1;
          end;
      until  (S='#')or(S='~')or(S='-');
      FN2:=FN2-1;
      SetLength(Color_Values2,Number_of_Records2+2,FN2+2);
      SetLength(Log_Values2,Number_of_Records2+2,FN2+2);
      SetLength(Log_Values4,Number_of_Records2+2,FN2+2);
      repeat
        Read(Open_File2,Read_Text);
        S:=Copy(Read_Text,0,2);
        if Read_Text='' then Readln(Open_File2);
      until  (S='~A')or(S=' ~');
      Form2.Label1.Caption:='Finding minimum and maximum values ...';
      Form2.Repaint;
      Readln(Open_File2);
      Copy_Images2:=TImage.Create(Application);
      Copy_Images2.Width:=FN2;
      Temp_Images2.Width:=FN2+50;
      Copy_Images2.Left:=Temp_Images2.Left;
      Copy_Images2.Top:=Temp_Images2.Top;
      Copy_Images2.Parent:=Form1;
      Copy_Images2.Visible:=False;
      Temp_Images2.Visible:=False;
      if FN1<>0 then
        Temp_Images2.Left:=Temp_Images1.Left+FN1+50+2
      else
        Temp_Images2.Left:=Temp_Images1.Left+200+50+2;
      While not EOF(Open_File2) do
        begin
          Read(Open_File2,Depth_Value2);
          for i:=1 to FN2 do
            begin
              Read(Open_File2,Log_Value2);
              if Log_Value2>Max_Value2 then
                Max_Value2:=Log_Value2;
              if Log_Value2<Min_Value2 then
                Min_Value2:=Log_Value2;
            end;
        end;
      Repaint;
      Form2.Label1.Caption:='Creating array of colors ...';
      Form2.Repaint;
      Reset(Open_File2);
      repeat
        Readln(Open_File2,Read_Text);
        Read_Text:=TrimLeft(Read_Text);
        Read_Text:=TrimRight(Read_Text);
      until Read_Text='~A';
      Color_Interval2:=(Max_Value2-Min_Value2)/255;
      Color_Interval4:=Color_Interval2;
      N2:=0;
      Read(Open_File2,First_Depth_Value2);
      While not EOF(Open_File2) do
        begin
          for j:=0 to FN2-1 do
            begin
              Read(Open_File2,Log_Value2);
              Color_Values2[N2,j]:=Trunc((Log_Value2-Min_Value2)/Color_Interval2);
              Log_Values2[N2,j]:=Log_Value2;
              Log_Values4[N2,j]:=Log_Value2;
            end;
          Read(Open_File2,Depth_Value2);
          N2:=N2+1;
        end;
      Form2.Label1.Caption:='Creating temporary image ...';
      Form2.Repaint;
      Repaint;

        Copy_Images2.Height:=Number_of_Records2;
//        Scale:=200;
        Depth_Interval2:=Last_Depth_Value2-First_Depth_Value2;
        Pixel_Interval2:=Round(Depth_Interval2*3779.53/Scale);
        Temp_Images2.Height:=Pixel_Interval2+50;
        Temp_Images2.Stretch:=True;
          for k:=0 to Number_of_Records2-1 do
            begin
              j:=FN2;
              while j>0 do
                begin
                  Point_Color_Value2:=Color_Values2[K,j];
                  if Point_Color_Value2<=85 then
                    Begin
                      Copy_Images2.Canvas.Pixels[j,k]:=RGB(255,255,255-3*Point_Color_Value2);
                    end;
                  if (Point_Color_Value2>85) and (Point_Color_Value2<170) then
                    Begin
                      Copy_Images2.Canvas.Pixels[j,k]:=RGB(255,510-3*Point_Color_Value2,0);
                    end;
                  if (Point_Color_Value2>=170) then
                    Begin
                      Copy_Images2.Canvas.Pixels[j,k]:=RGB(765-Point_Color_Value2*3,0,0);
                    end;
                   j:=j-1;
                 end;
            end;


        Pixel_Factor:=Pixel_Interval2/Copy_Images2.Height;
        First_Depth_Label2:=(StrToFloat(FloatToStrF(First_Depth_Value2,ffFixed,8,-1)));
        First_Value_Difference2:=First_Depth_Label2-First_Depth_Value2;
        if First_Value_Difference2<0 then
          begin
            First_Depth_Label2:=First_Depth_Label2+5-(Round(First_Depth_Label2) mod 5);
            First_Value_Difference2:=First_Depth_Label2-First_Depth_Value2;
          end;
        First_Pixel_Point2:=Round(First_Value_Difference2*3779.53{*Pixel_Factor}/Scale);
        Temp_Images2.Canvas.CopyRect(Rect(50,50,FN2+50,Temp_Images2.Height),Copy_Images2.Canvas,Rect(0,0,Copy_Images2.Width,Copy_Images2.Height));
        Temp_Images2.Canvas.Font.Style:=[fsBold];
        Temp_Images2.Canvas.Font.Name:='Arial';
        Temp_Images2.Canvas.Font.Size:=8;
        Temp_Images2.Canvas.Font.Color:=clBlack;
        i:=0;
        k:=0;
        repeat
          Temp_Images2.Canvas.Pen.Width:=2;
          Temp_Images2.Canvas.TextOut(5,First_Pixel_Point2+k+45,FloatToStrF(First_Depth_Label2+5*i,ffFixed,8,0));
          Temp_Images2.Canvas.MoveTo(42,First_Pixel_Point2+k+50);
          Temp_Images2.Canvas.LineTo(49,First_Pixel_Point2+k+50);
          for j:=1 to 4 do
            begin
              Temp_Images2.Canvas.Pen.Width:=1;
              Temp_Images2.Canvas.MoveTo(46,First_Pixel_Point2+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
              Temp_Images2.Canvas.LineTo(50,First_Pixel_Point2+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
            end;
          i:=i+1;
          k:=k+Round(5*3779.53{*Pixel_Factor}/Scale);
        until k>=Number_of_Records2+50 ;
        for i:=0 to 4 do
          begin
            Temp_Images2.Canvas.Pen.Width:=2;
            Temp_Images2.Canvas.TextOut(245-i*50,30,FloatToStr(i*50));
            Temp_Images2.Canvas.MoveTo(250-i*50,42);
            Temp_Images2.Canvas.LineTo(250-i*50,49);
            for j:=2 to 5 do
              begin
                Temp_Images2.Canvas.Pen.Width:=2;
                Temp_Images2.Canvas.MoveTo(240-i*50+((j*50) div 5),46);
                Temp_Images2.Canvas.LineTo(240-i*50+((j*50) div 5),50);
              end;
          end;
        Temp_Images2.Canvas.Font.Size:=10;
        Temp_Images2.Canvas.Font.Color:=clBlue;
        Temp_Images2.Canvas.TextOut(90,10,'Original Radius');
        Temp_Images2.Canvas.Font.Size:=8;
        Temp_Images2.Canvas.TextOut(2,20,'Depth');
        Temp_Images2.Canvas.TextOut(7,35,'('+Depth_Unit2+')');


        Form2.Label1.Caption:='Creating main image ...';
        Form2.Repaint;
//        Images2:=TOrImage.Create(Application);
//        Images2.Parent:=Form1;
        if FN1<>0 then
          Images2.Left:=Images1.Left+FN1+50+2
        else
          Images2.Left:=Images1.Left+200+50+2;
//        Images2.Top:=50;
        if Number_of_Records2<625-50 then
          Images2.Height:=Number_of_Records2+50;
//        else
//          Images2.Height:=625;
        Images2.Width:=FN2+50;
        Shape2.Height:=Images2.Height+2;
//        Images2.Show;
        Images2.Canvas.CopyRect(Rect(0,0,FN2+50,625),Temp_Images2.Canvas,Rect(0,0,FN2+50,625));
    CloseFile(Open_File2);
    Form2.Free;
    Original_Rad_Image:=True;
    Rad_Filter_Applied:=False;
    if Number_of_Records2>Number_of_Records1 then
    UpDown1.Max:=Number_of_Records2-625;
    UpDown1.Position:=0;
//    Copy_Images2.Free;
  end;
except
  Images2.Free;
  Temp_Images2.Free;
  Color_Values2:=nil;
  Log_Values2:=nil;
  CloseFile(Open_File2);
  Form2.Free;
  Original_Rad_Image:=False;
end;
end;

procedure TForm1.New1Click(Sender: TObject);
begin
  if Original_Amp_Image then
    begin
//      Images1.Free;
//      Temp_Images1.Free;
      Temp_Images1.Visible:=False;
      Images1.Height:=625;
      Images1.Visible:=True;
      Shape1.Height:=Images1.Height+2;
      Temp_Images1.Canvas.FillRect(Rect(0,0,Temp_Images1.Width,Temp_Images1.Height));
      Images1.Canvas.FillRect(Rect(0,0,Images1.Width,Images1.Height));
      Original_Amp_Image:=False;
      Copy_Images1.Free;
    end;
  if Original_Rad_Image then
    begin
//      Images2.Free;
//      Temp_Images2.Free;
      Temp_Images2.Visible:=False;
      Images2.Height:=625;
      Images2.Visible:=True;
      Shape2.Height:=Images2.Height+2;
      Temp_Images2.Canvas.FillRect(Rect(0,0,Temp_Images2.Width,Temp_Images2.Height));
      Images2.Canvas.FillRect(Rect(0,0,Images2.Width,Images2.Height));
      Original_Rad_Image:=False;
      Copy_Images2.Free;
    end;
  if Amp_Filter_Applied then
    begin
//      Images3.Free;
//      Temp_Images3.Free;
      Temp_Images3.Visible:=False;
      Images3.Height:=625;
      Images3.Visible:=True;
      Shape3.Height:=Images3.Height+2;
      Temp_Images3.Canvas.FillRect(Rect(0,0,Temp_Images3.Width,Temp_Images3.Height));
      Images3.Canvas.FillRect(Rect(0,0,Images3.Width,Images3.Height));
      Amp_Filter_Applied:=False;
    end;
  if Rad_Filter_Applied then
    begin
//      Images4.Free;
//      Temp_Images4.Free;
      Temp_Images4.Visible:=False;
      Images4.Height:=625;
      Images4.Visible:=True;
      Shape4.Height:=Images4.Height+2;
      Temp_Images4.Canvas.FillRect(Rect(0,0,Temp_Images4.Width,Temp_Images4.Height));
      Images4.Canvas.FillRect(Rect(0,0,Images4.Width,Images4.Height));
      Rad_Filter_Applied:=False;
    end;
  Log_Values1:=nil;
  Log_Values2:=nil;
  Log_Values3:=nil;
  Log_Values4:=nil;
  Color_Values1:=nil;
  Color_Values2:=nil;
  Color_Values3:=nil;
  Color_Values4:=nil;
  UpDown1.Position:=0;
  Trim_Rad_Image:=False;
  Trim_Amp_Image:=False;
  LowPass_Rad_Image:=False;
  LowPass_Amp_Image:=False;
  Kalman_Rad_Image:=False;
  Kalman_Amp_Image:=False;
  Gaussian_Rad_Image:=False;
  Gaussian_Amp_Image:=False;
  AntiAlias_Rad_Image:=False;
  AntiAlias_Amp_Image:=False;
  Temp_Images1.Canvas.Pen.Width:=1;
  Temp_Images1.Canvas.Font.Size:=10;
  Temp_Images1.Canvas.Font.Style:=[];
  Temp_Images1.Canvas.Font.Color:=clBlue;
{  Images2.Height:=625;
  Images3.Height:=625;
  Images4.Height:=625;
  Shape1.Height:=627;
  Shape2.Height:=627;
  Shape3.Height:=627;
  Shape4.Height:=627; }

end;

procedure TForm1.WindowSize1Click(Sender: TObject);
begin
if not(Original_Amp_Image or Original_Rad_Image) then Exit;
  if Original_Amp_Image then
    begin
      Temp_Images1.Visible:=False;
      Images1.Visible:=True;
      Shape1.Height:=Images1.Height+2;
    end;
  if Original_Rad_Image then
    begin
      Temp_Images2.Visible:=False;
      Images2.Visible:=True;
      Shape2.Height:=Images2.Height+2;
    end;
  if Amp_Filter_Applied then
    begin
      Temp_Images3.Visible:=False;
      Images3.Visible:=True;
      Shape3.Height:=Images3.Height+2;
    end;
  if Rad_Filter_Applied then
    begin
      Temp_Images4.Visible:=False;
      Images4.Visible:=True;
      Shape4.Height:=Images4.Height+2;
    end;
end;

procedure TForm1.Save1Click(Sender: TObject);
begin
if not(Original_Amp_Image or Original_Rad_Image)then Exit;
if Original_Amp_Image then
 begin
  SavePictureDialog1.Title:='Save original amplitude image';
  if SavePictureDialog1.Execute then
    begin
      if Images1.Visible then
          Images1.Picture.SaveToFile(SavePictureDialog1.FileName+'.bmp');
      if Temp_Images1.Visible then
          Temp_Images1.Picture.SaveToFile(SavePictureDialog1.FileName+'.bmp');
    end;
 end;
if Original_Rad_Image then
 begin
  SavePictureDialog1.Title:='Save original radius image';
  if SavePictureDialog1.Execute then
    begin
      if Images2.Visible then
          Images2.Picture.SaveToFile(SavePictureDialog1.FileName+'.bmp');
      if Temp_Images2.Visible then
          Temp_Images2.Picture.SaveToFile(SavePictureDialog1.FileName+'.bmp');
    end;
 end;
if Amp_Filter_Applied then
 begin
  SavePictureDialog1.Title:='Save corrected amplitude image';
  if SavePictureDialog1.Execute then
    begin
      if Images3.Visible then
          Images3.Picture.SaveToFile(SavePictureDialog1.FileName+'.bmp');
      if Temp_Images3.Visible then
          Temp_Images3.Picture.SaveToFile(SavePictureDialog1.FileName+'.bmp');
    end;
 end;
if Rad_Filter_Applied then
 begin
  SavePictureDialog1.Title:='Save corrected radius image';
  if SavePictureDialog1.Execute then
    begin
      if Images4.Visible then
          Images4.Picture.SaveToFile(SavePictureDialog1.FileName+'.bmp');
      if Temp_Images4.Visible then
          Temp_Images4.Picture.SaveToFile(SavePictureDialog1.FileName+'.bmp');
    end;
 end;
end;

procedure TForm1.WholeSize1Click(Sender: TObject);
begin
if not(Original_Amp_Image or Original_Rad_Image) then Exit;
  if Original_Amp_Image then
    begin
//      Temp_Images1.Parent:=Form1;
      Temp_Images1.Visible:=True;
      Images1.Visible:=False;
      Shape1.Height:=Temp_Images1.Height+2;
    end;
  if Original_Rad_Image then
    begin
//      Temp_Images2.Parent:=Form1;
      Temp_Images2.Visible:=True;
      Images2.Visible:=False;
      Shape2.Height:=Temp_Images2.Height+2;
    end;
  if Amp_Filter_Applied then
    begin
//      Temp_Images3.Parent:=Form1;
      Temp_Images3.Visible:=True;
      Images3.Visible:=False;
      Shape3.Height:=Temp_Images3.Height+2;
    end;
  if Rad_Filter_Applied then
    begin
//      Temp_Images4.Parent:=Form1;
      Temp_Images4.Visible:=True;
      Images4.Visible:=False;
      Shape4.Height:=Temp_Images4.Height+2;
    end;
end;

procedure TForm1.GaussianFilter1Click(Sender: TObject);
var
i,j,k:integer;
begin
if not(Original_Amp_Image or Original_Rad_Image) then Exit;
Gaussian_Amp_Image:=False;
Gaussian_Rad_Image:=False;
if Original_Amp_Image then
  begin
    Form2:=TForm2.Create(Application);
    Form2.Show;
    Form2.Label1.Caption:='Applying Gaussian filter on amplitude image ...';
    Form2.Repaint;
    if not Amp_Filter_Applied then
      begin
//        Temp_Images3:=TOrImage.Create(Application);
        Temp_Images3.Width:=FN1+50;
        Temp_Images3.Height:=Number_of_Records1+50;
          if FN2<>0 then
            Temp_Images3.Left:=Temp_Images2.Left+FN2+50+2
          else
            Temp_Images3.Left:=Temp_Images2.Left+200+50+2;
//        Temp_Images3.Top:=50;
//        Temp_Images3.Parent:=Form1;
      Copy_Images3:=TOrImage.Create(Application);
      Copy_Images3.Width:=FN1;
      Copy_Images3.Left:=Temp_Images3.Left;
      Copy_Images3.Top:=Temp_Images3.Top;
      Copy_Images3.Height:=Number_of_Records1;
      Copy_Images3.Parent:=Form1;
      Copy_Images3.Visible:=False;
        Temp_Images3.Visible:=False;
        Copy_Images3.PictureOriginal:=Copy_Images1.Picture;
      end
    else
        Copy_Images3.PictureOriginal:=Copy_Images3.Picture;
    Copy_Images3.PicGaussianBlur:=1;
  //  Temp_Images3.Canvas.Brush.Color:=clWhite;
 //   Temp_Images3.Canvas.FillRect(Rect(0,0,50,Temp_images3.Height));
 //   Temp_Images3.Canvas.FillRect(Rect(0,0,Temp_images3.Width,50));


//        Scale:=200;
        Depth_Interval1:=Last_Depth_Value1-First_Depth_Value1;
        Pixel_Interval1:=Round(Depth_Interval1*3779.53/Scale);
        Temp_Images3.Height:=Round(Pixel_Interval1+50);
        Temp_Images3.Stretch:=True;

        Pixel_Factor:=Pixel_Interval1/Copy_Images3.Height;
        First_Depth_Label1:=(StrToFloat(FloatToStrF(First_Depth_Value1,ffFixed,8,-1)));
        First_Value_Difference1:=First_Depth_Label1-First_Depth_Value1;
        if First_Value_Difference1<0 then
          begin
            First_Depth_Label1:=First_Depth_Label1+5-(Round(First_Depth_Label1) mod 5);
            First_Value_Difference1:=First_Depth_Label1-First_Depth_Value1;
          end;
        First_Pixel_Point1:=Round(First_Value_Difference1*3779.53{*Pixel_Factor}/Scale);
        Temp_Images3.Canvas.CopyRect(Rect(50,50,FN1+50,Temp_Images3.Height),Copy_Images3.Canvas,Rect(0,0,Copy_Images3.Width,Copy_Images3.Height));
        Temp_Images3.Canvas.Font.Style:=[fsBold];
        Temp_Images3.Canvas.Font.Name:='Arial';
        Temp_Images3.Canvas.Font.Size:=8;
        Temp_Images3.Canvas.Font.Color:=clBlack;
        i:=0;
        k:=0;
        repeat
          Temp_Images3.Canvas.Pen.Width:=2;
          Temp_Images3.Canvas.TextOut(5,First_Pixel_Point1+k+45,FloatToStrF(First_Depth_Label1+5*i,ffFixed,8,0));
          Temp_Images3.Canvas.MoveTo(42,First_Pixel_Point1+k+50);
          Temp_Images3.Canvas.LineTo(49,First_Pixel_Point1+k+50);
          for j:=1 to 4 do
            begin
              Temp_Images3.Canvas.Pen.Width:=1;
              Temp_Images3.Canvas.MoveTo(46,First_Pixel_Point1+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
              Temp_Images3.Canvas.LineTo(50,First_Pixel_Point1+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
            end;
          i:=i+1;
          k:=k+Round(5*3779.53{*Pixel_Factor}/Scale);
        until k>=Number_of_Records1+50 ;
        for i:=0 to 4 do
          begin
            Temp_Images3.Canvas.Pen.Width:=2;
            Temp_Images3.Canvas.TextOut(245-i*50,30,FloatToStr(i*50));
            Temp_Images3.Canvas.MoveTo(250-i*50,42);
            Temp_Images3.Canvas.LineTo(250-i*50,49);
            for j:=1 to 5 do
              begin
                Temp_Images3.Canvas.Pen.Width:=1;
                Temp_Images3.Canvas.MoveTo(240-i*50+((j*50) div 5),46);
                Temp_Images3.Canvas.LineTo(240-i*50+((j*50) div 5),50);
              end;
          end;
        Temp_Images3.Canvas.Font.Size:=10;
        Temp_Images3.Canvas.Font.Color:=clBlue;
        Temp_Images3.Canvas.TextOut(90,10,'Corrected Amplitude');
        Temp_Images3.Canvas.Font.Size:=8;
        Temp_Images3.Canvas.TextOut(2,20,'Depth');
        Temp_Images3.Canvas.TextOut(7,35,'('+Depth_Unit1+')');


//    if not Amp_Filter_Applied then
//      begin
//        Images3:=TOrImage.Create(Application);
//        Images3.Parent:=Form1;
          if FN2<>0 then
            Images3.Left:=Images2.Left+FN2+50+2
          else
            Images3.Left:=Images2.Left+200+50+2;
//        Images3.Top:=50;
        if Number_of_Records1<625-50 then
          Images3.Height:=Number_of_Records1+50;
//        else
//          Images3.Height:=625;
        Images3.Width:=FN1+50;
//        Images3.Show;
//      end;
    Images3.Canvas.CopyRect(Rect(0,0,FN1+50,625),Temp_Images3.Canvas,Rect(0,0,FN1+50,625));
    Form2.Free;
    Gaussian_Amp_Image:=True;
    Amp_Filter_Applied:=True;
//    Copy_Images3.Free;
  end;

if Original_Rad_Image then
  begin
    Form2:=TForm2.Create(Application);
    Form2.Show;
    Form2.Label1.Caption:='Applying Gaussian filter on radius image ...';
    Form2.Repaint;
    if not Rad_Filter_Applied then
      begin
//        Temp_Images4:=TOrImage.Create(Application);
        Temp_Images4.Height:=Number_of_Records2+50;
        Temp_Images4.Width:=FN2+50;
          if FN1<>0 then
            Temp_Images4.Left:=Temp_Images3.Left+FN1+50+2
          else
            Temp_Images4.Left:=Temp_Images3.Left+200+50+2;
      Copy_Images4:=TOrImage.Create(Application);
      Copy_Images4.Width:=FN1;
      Copy_Images4.Left:=Temp_Images4.Left;
      Copy_Images4.Top:=Temp_Images4.Top;
      Copy_Images4.Height:=Number_of_Records1;
      Copy_Images4.Parent:=Form1;
      Copy_Images4.Visible:=False;
        Temp_Images4.Visible:=False;
        Copy_Images4.PictureOriginal:=Copy_Images2.Picture;
      end
    else
        Copy_Images4.PictureOriginal:=Copy_Images4.Picture;
    Copy_Images4.PicGaussianBlur:=1;
  //  Temp_Images4.Canvas.Brush.Color:=clWhite;
 //   Temp_Images4.Canvas.FillRect(Rect(0,0,50,Temp_Images4.Height));
 //   Temp_Images4.Canvas.FillRect(Rect(0,0,Temp_Images4.Width,50));


//        Scale:=200;
        Depth_Interval1:=Last_Depth_Value1-First_Depth_Value1;
        Pixel_Interval1:=Round(Depth_Interval1*3779.53/Scale);
        Temp_Images4.Height:=Round(Pixel_Interval1+50);
        Temp_Images4.Stretch:=True;

        Pixel_Factor:=Pixel_Interval1/Copy_Images4.Height;
        First_Depth_Label1:=(StrToFloat(FloatToStrF(First_Depth_Value1,ffFixed,8,-1)));
        First_Value_Difference1:=First_Depth_Label1-First_Depth_Value1;
        if First_Value_Difference1<0 then
          begin
            First_Depth_Label1:=First_Depth_Label1+5-(Round(First_Depth_Label1) mod 5);
            First_Value_Difference1:=First_Depth_Label1-First_Depth_Value1;
          end;
        First_Pixel_Point1:=Round(First_Value_Difference1*3779.53{*Pixel_Factor}/Scale);
        Temp_Images4.Canvas.CopyRect(Rect(50,50,FN1+50,Temp_Images4.Height),Copy_Images4.Canvas,Rect(0,0,Copy_Images4.Width,Copy_Images4.Height));
        Temp_Images4.Canvas.Font.Style:=[fsBold];
        Temp_Images4.Canvas.Font.Name:='Arial';
        Temp_Images4.Canvas.Font.Size:=8;
        Temp_Images4.Canvas.Font.Color:=clBlack;
        i:=0;
        k:=0;
        repeat
          Temp_Images4.Canvas.Pen.Width:=2;
          Temp_Images4.Canvas.TextOut(5,First_Pixel_Point1+k+45,FloatToStrF(First_Depth_Label1+5*i,ffFixed,8,0));
          Temp_Images4.Canvas.MoveTo(42,First_Pixel_Point1+k+50);
          Temp_Images4.Canvas.LineTo(49,First_Pixel_Point1+k+50);
          for j:=1 to 4 do
            begin
              Temp_Images4.Canvas.Pen.Width:=1;
              Temp_Images4.Canvas.MoveTo(46,First_Pixel_Point1+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
              Temp_Images4.Canvas.LineTo(50,First_Pixel_Point1+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
            end;
          i:=i+1;
          k:=k+Round(5*3779.53{*Pixel_Factor}/Scale);
        until k>=Number_of_Records1+50 ;
        for i:=0 to 4 do
          begin
            Temp_Images4.Canvas.Pen.Width:=2;
            Temp_Images4.Canvas.TextOut(245-i*50,30,FloatToStr(i*50));
            Temp_Images4.Canvas.MoveTo(250-i*50,42);
            Temp_Images4.Canvas.LineTo(250-i*50,49);
            for j:=1 to 5 do
              begin
                Temp_Images4.Canvas.Pen.Width:=1;
                Temp_Images4.Canvas.MoveTo(240-i*50+((j*50) div 5),46);
                Temp_Images4.Canvas.LineTo(240-i*50+((j*50) div 5),50);
              end;
          end;
        Temp_Images4.Canvas.Font.Size:=10;
        Temp_Images4.Canvas.Font.Color:=clBlue;
        Temp_Images4.Canvas.TextOut(90,10,'Corrected Amplitude');
        Temp_Images4.Canvas.Font.Size:=8;
        Temp_Images4.Canvas.TextOut(2,20,'Depth');
        Temp_Images4.Canvas.TextOut(7,35,'('+Depth_Unit1+')');


//    if not Rad_Filter_Applied then
//      begin
//        Images4:=TOrImage.Create(Application);
//        Images4.Parent:=Form1;
          if FN1<>0 then
            Images4.Left:=Images3.Left+FN1+50+2
          else
            Images4.Left:=Images3.Left+200+50+2;
//        Images4.Top:=50;
        if Number_of_Records2<625-50 then
          Images4.Height:=Number_of_Records2+50;
        Images4.Width:=FN2+50;
//        Images4.Show;
//      end;
    Images4.Canvas.CopyRect(Rect(0,0,FN2+50,625),Temp_Images4.Canvas,Rect(0,0,FN2+50,625));
    Form2.Free;
    Gaussian_Rad_Image:=True;
    Rad_Filter_Applied:=True;
//   Copy_Images4.Free;
  end;
end;
procedure TForm1.KalmanFilter1Click(Sender: TObject);
var
i,j,k:integer;
begin
if not(Original_Amp_Image or Original_Rad_Image) then Exit;
Kalman_Amp_Image:=False;
Kalman_Rad_Image:=False;
  Canceled:=False;
  Form3:=TForm3.Create(Application);
  if KalmanFiltering1.Mode = mdMovingAverage then
    Form3.ComboBox1.ItemIndex:=1;
  if KalmanFiltering1.Mode= mdRecursive then
    Form3.ComboBox1.ItemIndex:=0;
  Form3.ESBPosEdit1.AsInteger:=KalmanFiltering1.FilterExponent;
  Form3.ESBPosEdit2.AsInteger:=KalmanFiltering1.SizeTeachingSequence;
  Form3.ShowModal;
  Form3.Free;
  if Canceled then Exit;
if Original_Amp_Image then
begin
  Form2:=TForm2.Create(Application);
  Form2.Show;
  Form2.Repaint;
  KalmanFiltering1.ClearFilter;
  kalman1i:=0;
  kalman1j:=0;
  if Mode='mdRecursive' then
    KalmanFiltering1.Mode:= mdRecursive;
  if MODE='mdMovingAverage' then
    KalmanFiltering1.Mode:= mdMovingAverage;
  SetLength(Color_Values3,Number_of_Records1+1,FN1+1);
      for i:=0 to Number_of_Records1-1 do
        begin
          for j:=0 to FN1-1 do
            begin
              Log_Value1:=Log_Values3[i,j];
              KalmanFiltering1.AddInputDataItem(Log_Value1);
            end;
        end;
    if not Amp_Filter_Applied then
      begin
//        Temp_Images3:=TOrImage.Create(Application);
        Temp_Images3.Width:=FN1+50;
        Temp_Images3.Height:=Number_of_Records1+50;
          if FN2<>0 then
            Temp_Images3.Left:=Temp_Images2.Left+FN2+50+2
          else
            Temp_Images3.Left:=Temp_Images2.Left+200+50+2;
//        Temp_Images3.Top:=50;
//        Temp_Images3.Parent:=Form1;
        Temp_Images3.Visible:=False;
//        Images3:=TOrImage.Create(Application);
//        Images3.Parent:=Form1;
      Copy_Images3:=TOrImage.Create(Application);
      Copy_Images3.Width:=FN1;
      Temp_Images3.Width:=FN1+50;
      Copy_Images3.Left:=Temp_Images3.Left;
      Copy_Images3.Top:=Temp_Images3.Top;
      Copy_Images3.Parent:=Form1;
      Copy_Images3.Visible:=False;
      SetLength(Color_Values3,Number_of_Records1+1,FN1+1);
      Color_Interval3:=(Max_Value3-Min_Value3)/255;
      end;
       Copy_Images3.Height:=Number_of_Records1;
//        Scale:=200;
        Depth_Interval1:=Last_Depth_Value1-First_Depth_Value1;
        Pixel_Interval1:=Round(Depth_Interval1*3779.53/Scale);
        Temp_Images3.Height:=Round(Pixel_Interval1+50);
        Temp_Images3.Stretch:=True;
          for k:=0 to Number_of_Records1-1 do
            begin
              j:=0;
              while j<FN1+1 do
                begin
                  Point_Color_Value1:=Color_Values3[K,j];
                  if Point_Color_Value1<=85 then
                    Begin
                      Copy_Images3.Canvas.Pixels[j,k]:=RGB(Point_Color_Value1*3,0,0);
                    end;
                  if (Point_Color_Value1>85) and (Point_Color_Value1<170) then
                    Begin
                      Copy_Images3.Canvas.Pixels[j,k]:=RGB(255,Point_Color_Value1*3-255,0);
                    end;
                  if (Point_Color_Value1>=170) then
                    Begin
                      Copy_Images3.Canvas.Pixels[j,k]:=RGB(255,255,Point_Color_Value1*3-510);
                    end;
                   j:=j+1;
                 end;
            end;


        Pixel_Factor:=Pixel_Interval1/Copy_Images3.Height;
        First_Depth_Label1:=(StrToFloat(FloatToStrF(First_Depth_Value1,ffFixed,8,-1)));
        First_Value_Difference1:=First_Depth_Label1-First_Depth_Value1;
        if First_Value_Difference1<0 then
          begin
            First_Depth_Label1:=First_Depth_Label1+5-(Round(First_Depth_Label1) mod 5);
            First_Value_Difference1:=First_Depth_Label1-First_Depth_Value1;
          end;
        First_Pixel_Point1:=Round(First_Value_Difference1*3779.53{*Pixel_Factor}/Scale);
        Temp_Images3.Canvas.CopyRect(Rect(50,50,FN1+50,Temp_Images3.Height),Copy_Images3.Canvas,Rect(0,0,Copy_Images3.Width,Copy_Images3.Height));
        Temp_Images3.Canvas.Font.Style:=[fsBold];
        Temp_Images3.Canvas.Font.Name:='Arial';
        Temp_Images3.Canvas.Font.Size:=8;
        Temp_Images3.Canvas.Font.Color:=clBlack;
        i:=0;
        k:=0;
        repeat
          Temp_Images3.Canvas.Pen.Width:=2;
          Temp_Images3.Canvas.TextOut(5,First_Pixel_Point1+k+45,FloatToStrF(First_Depth_Label1+5*i,ffFixed,8,0));
          Temp_Images3.Canvas.MoveTo(42,First_Pixel_Point1+k+50);
          Temp_Images3.Canvas.LineTo(49,First_Pixel_Point1+k+50);
          for j:=1 to 4 do
            begin
              Temp_Images3.Canvas.Pen.Width:=1;
              Temp_Images3.Canvas.MoveTo(46,First_Pixel_Point1+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
              Temp_Images3.Canvas.LineTo(50,First_Pixel_Point1+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
            end;
          i:=i+1;
          k:=k+Round(5*3779.53{*Pixel_Factor}/Scale);
        until k>=Number_of_Records1+50 ;
        for i:=0 to 4 do
          begin
            Temp_Images3.Canvas.Pen.Width:=2;
            Temp_Images3.Canvas.TextOut(245-i*50,30,FloatToStr(i*50));
            Temp_Images3.Canvas.MoveTo(250-i*50,42);
            Temp_Images3.Canvas.LineTo(250-i*50,49);
            for j:=1 to 5 do
              begin
                Temp_Images3.Canvas.Pen.Width:=1;
                Temp_Images3.Canvas.MoveTo(240-i*50+((j*50) div 5),46);
                Temp_Images3.Canvas.LineTo(240-i*50+((j*50) div 5),50);
              end;
          end;
        Temp_Images3.Canvas.Font.Size:=10;
        Temp_Images3.Canvas.Font.Color:=clBlue;
        Temp_Images3.Canvas.TextOut(90,10,'Corrected Amplitude');
        Temp_Images3.Canvas.Font.Size:=8;
        Temp_Images3.Canvas.TextOut(2,20,'Depth');
        Temp_Images3.Canvas.TextOut(7,35,'('+Depth_Unit1+')');


        if not(Amp_Filter_Applied) then
          begin
//            Images3:=TOrImage.Create(Application);
//            Images3.Parent:=Form1;
            if FN2<>0 then
              Images3.Left:=Images2.Left+FN2+50+2
            else
              Images3.Left:=Images2.Left+200+50+2;
//            Images3.Top:=50;
            if Number_of_Records1<625-50 then
              Images3.Height:=Number_of_Records1+50;
//            else
//              Images3.Height:=625;
            Images3.Width:=FN1+50;
            Images3.Show;
          end;
        Images3.Canvas.CopyRect(Rect(0,0,FN1+50,625),Temp_Images3.Canvas,Rect(0,0,FN1+50,625));
        Kalman_Amp_Image:=True;
        Amp_Filter_Applied:=True;
        Form2.Free;
        KalmanFiltering1.ClearFilter;
//    Copy_Images3.Free;
end;
if Original_Rad_Image then
begin
  Form2:=TForm2.Create(Application);
  Form2.Show;
  Form2.Repaint;
  kalman2i:=0;
  kalman2j:=0;
  SetLength(Color_Values4,Number_of_Records2+1,FN2+1);
      for i:=0 to Number_of_Records2-1 do
        begin
          for j:=0 to FN2-1 do
            begin
              Log_Value1:=Log_Values4[i,j];
              KalmanFiltering1.AddInputDataItem(Log_Value1);
            end;
        end;
    if not Rad_Filter_Applied then
      begin
//        Temp_Images4:=TOrImage.Create(Application);
        Temp_Images4.Width:=FN2+50;
        Temp_Images4.Height:=Number_of_Records2+50;
          if FN1<>0 then
            Temp_Images4.Left:=Temp_Images3.Left+FN1+50+2
          else
            Temp_Images4.Left:=Temp_Images3.Left+200+50+2;
//        Temp_Images4.Top:=50;
//        Temp_Images4.Parent:=Form1;
        Temp_Images4.Visible:=False;
//        Images4:=TOrImage.Create(Application);
//        Images4.Parent:=Form1;
      Copy_Images4:=TOrImage.Create(Application);
      Copy_Images4.Width:=FN2;
      Temp_Images4.Width:=FN2+50;
      Copy_Images4.Left:=Temp_Images4.Left;
      Copy_Images4.Top:=Temp_Images4.Top;
      Copy_Images4.Parent:=Form1;
      Copy_Images4.Visible:=False;
      end;
        Copy_Images4.Height:=Number_of_Records2;
//        Scale:=200;
        Depth_Interval2:=Last_Depth_Value2-First_Depth_Value2;
        Pixel_Interval2:=Round(Depth_Interval2*3779.53/Scale);
        Temp_Images4.Height:=Round(Pixel_Interval2+50);
        Temp_Images4.Stretch:=True;
          for k:=0 to Number_of_Records2-1 do
            begin
              j:=FN2;
              while j>0 do
                begin
                  Point_Color_Value2:=Color_Values4[K,j];
                  if Point_Color_Value2<=85 then
                    Begin
                      Copy_Images4.Canvas.Pixels[j,k]:=RGB(255,255,255-3*Point_Color_Value2);
                    end;
                  if (Point_Color_Value2>85) and (Point_Color_Value2<170) then
                    Begin
                      Copy_Images4.Canvas.Pixels[j,k]:=RGB(255,510-3*Point_Color_Value2,0);
                    end;
                  if (Point_Color_Value2>=170) then
                    Begin
                      Copy_Images4.Canvas.Pixels[j,k]:=RGB(765-Point_Color_Value2*3,0,0);
                    end;
                   j:=j-1;
                 end;
            end;

        Pixel_Factor:=Pixel_Interval2/Copy_Images4.Height;
        First_Depth_Label2:=(StrToFloat(FloatToStrF(First_Depth_Value2,ffFixed,8,-1)));
        First_Value_Difference2:=First_Depth_Label2-First_Depth_Value2;
        if First_Value_Difference2<0 then
          begin
            First_Depth_Label2:=First_Depth_Label2+5-(Round(First_Depth_Label2) mod 5);
            First_Value_Difference2:=First_Depth_Label2-First_Depth_Value2;
          end;
        First_Pixel_Point2:=Round(First_Value_Difference2*3779.53{*Pixel_Factor}/Scale);
        Temp_Images4.Canvas.CopyRect(Rect(50,50,FN2+50,Temp_Images4.Height),Copy_Images4.Canvas,Rect(0,0,Copy_Images4.Width,Copy_Images4.Height));
        Temp_Images4.Canvas.Font.Style:=[fsBold];
        Temp_Images4.Canvas.Font.Name:='Arial';
        Temp_Images4.Canvas.Font.Size:=8;
        Temp_Images4.Canvas.Font.Color:=clBlack;
        i:=0;
        k:=0;
        repeat
          Temp_Images4.Canvas.Pen.Width:=2;
          Temp_Images4.Canvas.TextOut(5,First_Pixel_Point2+k+45,FloatToStrF(First_Depth_Label2+5*i,ffFixed,8,0));
          Temp_Images4.Canvas.MoveTo(42,First_Pixel_Point2+k+50);
          Temp_Images4.Canvas.LineTo(49,First_Pixel_Point2+k+50);
          for j:=1 to 4 do
            begin
              Temp_Images4.Canvas.Pen.Width:=1;
              Temp_Images4.Canvas.MoveTo(46,First_Pixel_Point2+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
              Temp_Images4.Canvas.LineTo(50,First_Pixel_Point2+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
            end;
          i:=i+1;
          k:=k+Round(5*3779.53{*Pixel_Factor}/Scale);
        until k>=Number_of_Records2+50 ;
        for i:=0 to 4 do
          begin
            Temp_Images4.Canvas.Pen.Width:=2;
            Temp_Images4.Canvas.TextOut(245-i*50,30,FloatToStr(i*50));
            Temp_Images4.Canvas.MoveTo(250-i*50,42);
            Temp_Images4.Canvas.LineTo(250-i*50,49);
            for j:=2 to 5 do
              begin
                Temp_Images4.Canvas.Pen.Width:=2;
                Temp_Images4.Canvas.MoveTo(240-i*50+((j*50) div 5),46);
                Temp_Images4.Canvas.LineTo(240-i*50+((j*50) div 5),50);
              end;
          end;
        Temp_Images4.Canvas.Font.Size:=10;
        Temp_Images4.Canvas.Font.Color:=clBlue;
        Temp_Images4.Canvas.TextOut(90,10,'Corrected Radius');
        Temp_Images4.Canvas.Font.Size:=8;
        Temp_Images4.Canvas.TextOut(2,20,'Depth');
        Temp_Images4.Canvas.TextOut(7,35,'('+Depth_Unit2+')');


        if Rad_Filter_Applied=False then
          begin
//            Images4:=TOrImage.Create(Application);
//            Images4.Parent:=Form1;
            if FN1<>0 then
              Images4.Left:=Images3.Left+FN1+50+2
            else
              Images4.Left:=Images3.Left+200+50+2;
//            Images4.Top:=50;
            if Number_of_Records2<625-50 then
              Images4.Height:=Number_of_Records2+50;
//            else
//              Images4.Height:=625;
            Images4.Width:=FN2+50;
            Images4.Show;
          end;
        Images4.Canvas.CopyRect(Rect(0,0,FN2+50,625),Temp_Images4.Canvas,Rect(0,0,FN2+50,625));
        Kalman_Rad_Image:=True;
        Rad_Filter_Applied:=True;
        Form2.Free;
     KalmanFiltering1.ClearFilter;
//    Copy_Images4.Free;
end;
end;
procedure TForm1.LowPassFilter1Click(Sender: TObject);
var
i,j,k:integer;
begin
if not(Original_Amp_Image or Original_Rad_Image) then Exit;
  LowPass_Amp_Image:=False;
  LowPass_Rad_Image:=False;
  Canceled:=False;
  Form4:=TForm4.Create(Application);

  if lpf.Mode = mdLowPassFilter then
    Form4.ComboBox1.ItemIndex:=0;
  if lpf.Mode= mdNoneFiltering then
    Form4.ComboBox1.ItemIndex:=1;
  if lpf.Mode= mdSubtractionNoise then
    Form4.ComboBox1.ItemIndex:=2;

  if lpf.Overshoot = True then
    Form4.ComboBox2.ItemIndex:=0;
  if lpf.Overshoot= False then
    Form4.ComboBox2.ItemIndex:=1;

  if lpf.SubstractionNoiseDegree = edLarge then
    Form4.ComboBox3.ItemIndex:=0;
  if lpf.SubstractionNoiseDegree= edMedium then
    Form4.ComboBox3.ItemIndex:=1;
  if lpf.SubstractionNoiseDegree= edSmall then
    Form4.ComboBox3.ItemIndex:=2;

  if lpf.SuppressionDegree = edLarge then
    Form4.ComboBox4.ItemIndex:=0;
  if lpf.SuppressionDegree= edMedium then
    Form4.ComboBox4.ItemIndex:=1;
  if lpf.SuppressionDegree= edSmall then
    Form4.ComboBox4.ItemIndex:=2;

  Form4.ESBPosEdit1.AsFloat:=lpf.Bandwidth;
  Form4.ESBPosEdit2.AsInteger:=lpf.FrequencyResolution;
  Form4.ShowModal;
  Form4.Free;
  if Canceled then Exit;
  Form2:=Tform2.Create(Application);
  Form2.Show;
  Form2.Repaint;

  if Mode='Low-Pass Filter' then
    lpf.Mode:= mdLowPassFilter;
  if Mode='None Filtering' then
    lpf.Mode:= mdNoneFiltering;
  if Mode='Subtraction Noise' then
    lpf.Mode:= mdSubtractionNoise;

  if NoiseDegreeMode='edLarge' then
    lpf.SubstractionNoiseDegree:=edLarge;
  if NoiseDegreeMode='edMedium' then
    lpf.SubstractionNoiseDegree:=edMedium;
  if NoiseDegreeMode='edSmall' then
    lpf.SubstractionNoiseDegree:=edSmall;

  if SupressionDegreeMode='edLarge' then
    lpf.SuppressionDegree:=edLarge;
  if SupressionDegreeMode='edMedium' then
    lpf.SuppressionDegree:=edMedium;
  if SupressionDegreeMode='edSmall' then
    lpf.SuppressionDegree:=edSmall;
if Original_Amp_Image then
 begin
      for i:=0 to Number_of_Records1-1 do
        begin
          for j:=0 to FN1-1 do
            begin
              Log_Value1:=Log_Values3[i,j];
              lpf.AddInputDataItem(Log_Value1);
            end;
        end;
  Color_Values3:=nil;
  SetLength(Color_Values3,Number_of_Records1+1,FN1+1);
  SetLength(Log_Values3,Number_of_Records1+1,FN1+1);
  lpf.Execute;
      for i:=0 to Number_of_Records1-1 do
        begin
          for j:=0 to FN1-1 do
            begin
              Log_Values3[i,j]:=lpf.OutputDataItem[j+((i-1)*FN1)-1];
              Color_Values3[i,j]:=Trunc((lpf.OutputDataItem[j+((i-1)*FN1)-1]-Min_Value3)/Color_Interval3);
            end;
        end;

    if not Amp_Filter_Applied then
      begin
//        Temp_Images3:=TOrImage.Create(Application);
        Temp_Images3.Width:=FN1+50;
        Temp_Images3.Height:=Number_of_Records1+50;
          if FN2<>0 then
            Temp_Images3.Left:=Temp_Images2.Left+FN2+50+2
          else
            Temp_Images3.Left:=Temp_Images2.Left+200+50+2;
//        Temp_Images3.Top:=50;
//        Temp_Images3.Parent:=Form1;
        Temp_Images3.Visible:=False;
      Copy_Images3:=TOrImage.Create(Application);
      Copy_Images3.Width:=FN1;
      Copy_Images3.Left:=Temp_Images3.Left;
      Copy_Images3.Top:=Temp_Images3.Top;
      Copy_Images3.Parent:=Form1;
      Copy_Images3.Visible:=False;
      end;
        Copy_Images3.Height:=Number_of_Records1;
//        Scale:=200;
        Depth_Interval1:=Last_Depth_Value1-First_Depth_Value1;
        Pixel_Interval1:=Round(Depth_Interval1*3779.53/Scale);
        Temp_Images3.Height:=Round(Pixel_Interval1+50);
        Temp_Images3.Stretch:=True;
          for k:=0 to Number_of_Records1-1 do
            begin
              j:=0;
              while j<FN1+1 do
                begin
                  Point_Color_Value1:=Color_Values3[K,j];
                  if Point_Color_Value1<=85 then
                    Begin
                      Copy_Images3.Canvas.Pixels[j,k]:=RGB(Point_Color_Value1*3,0,0);
                    end;
                  if (Point_Color_Value1>85) and (Point_Color_Value1<170) then
                    Begin
                      Copy_Images3.Canvas.Pixels[j,k]:=RGB(255,Point_Color_Value1*3-255,0);
                    end;
                  if (Point_Color_Value1>=170) then
                    Begin
                      Copy_Images3.Canvas.Pixels[j,k]:=RGB(255,255,Point_Color_Value1*3-510);
                    end;
                   j:=j+1;
                 end;
            end;


        Pixel_Factor:=Pixel_Interval1/Copy_Images3.Height;
        First_Depth_Label1:=(StrToFloat(FloatToStrF(First_Depth_Value1,ffFixed,8,-1)));
        First_Value_Difference1:=First_Depth_Label1-First_Depth_Value1;
        if First_Value_Difference1<0 then
          begin
            First_Depth_Label1:=First_Depth_Label1+5-(Round(First_Depth_Label1) mod 5);
            First_Value_Difference1:=First_Depth_Label1-First_Depth_Value1;
          end;
        First_Pixel_Point1:=Round(First_Value_Difference1*3779.53{*Pixel_Factor}/Scale);
        Temp_Images3.Canvas.CopyRect(Rect(50,50,FN1+50,Temp_Images3.Height),Copy_Images3.Canvas,Rect(0,0,Copy_Images3.Width,Copy_Images3.Height));
        Temp_Images3.Canvas.Font.Style:=[fsBold];
        Temp_Images3.Canvas.Font.Name:='Arial';
        Temp_Images3.Canvas.Font.Size:=8;
        Temp_Images3.Canvas.Font.Color:=clBlack;
        i:=0;
        k:=0;
        repeat
          Temp_Images3.Canvas.Pen.Width:=2;
          Temp_Images3.Canvas.TextOut(5,First_Pixel_Point1+k+45,FloatToStrF(First_Depth_Label1+5*i,ffFixed,8,0));
          Temp_Images3.Canvas.MoveTo(42,First_Pixel_Point1+k+50);
          Temp_Images3.Canvas.LineTo(49,First_Pixel_Point1+k+50);
          for j:=1 to 4 do
            begin
              Temp_Images3.Canvas.Pen.Width:=1;
              Temp_Images3.Canvas.MoveTo(46,First_Pixel_Point1+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
              Temp_Images3.Canvas.LineTo(50,First_Pixel_Point1+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
            end;
          i:=i+1;
          k:=k+Round(5*3779.53{*Pixel_Factor}/Scale);
        until k>=Number_of_Records1+50 ;
        for i:=0 to 4 do
          begin
            Temp_Images3.Canvas.Pen.Width:=2;
            Temp_Images3.Canvas.TextOut(245-i*50,30,FloatToStr(i*50));
            Temp_Images3.Canvas.MoveTo(250-i*50,42);
            Temp_Images3.Canvas.LineTo(250-i*50,49);
            for j:=1 to 5 do
              begin
                Temp_Images3.Canvas.Pen.Width:=1;
                Temp_Images3.Canvas.MoveTo(240-i*50+((j*50) div 5),46);
                Temp_Images3.Canvas.LineTo(240-i*50+((j*50) div 5),50);
              end;
          end;
        Temp_Images3.Canvas.Font.Size:=10;
        Temp_Images3.Canvas.Font.Color:=clBlue;
        Temp_Images3.Canvas.TextOut(90,10,'Corrected Amplitude');
        Temp_Images3.Canvas.Font.Size:=8;
        Temp_Images3.Canvas.TextOut(2,20,'Depth');
        Temp_Images3.Canvas.TextOut(7,35,'('+Depth_Unit1+')');


        if not(Amp_Filter_Applied) then
          begin
//            Images3:=TOrImage.Create(Application);
//            Images3.Parent:=Form1;
            if FN2<>0 then
              Images3.Left:=Images2.Left+FN2+50+2
            else
              Images3.Left:=Images2.Left+200+50+2;
//            Images3.Top:=50;
            if Number_of_Records1<625-50 then
              Images3.Height:=Number_of_Records1+50;
//            else
//              Images3.Height:=625;
            Images3.Width:=FN1+50;
            Images3.Show;
          end;
        Images3.Canvas.CopyRect(Rect(0,0,FN1+50,625),Temp_Images3.Canvas,Rect(0,0,FN1+50,625));
    LowPass_Amp_Image:=True;
    Amp_Filter_Applied:=True;
    lpf.ClearArray;
//    Copy_Images3.Free;
 end;

if Original_Rad_Image then
 begin
      for i:=0 to Number_of_Records2-1 do
        begin
          for j:=0 to FN2-1 do
            begin
              Log_Value2:=Log_Values4[i,j];
              lpf.AddInputDataItem(Log_Value2);
            end;
        end;
  Color_Values4:=nil;
  SetLength(Log_Values4,Number_of_Records2+1,FN2+1);
  SetLength(Color_Values4,Number_of_Records2+1,FN2+1);
  lpf.Execute;
      for i:=0 to Number_of_Records2-1 do
        begin
          for j:=0 to FN1-1 do
            begin
              Log_Values4[i,j]:=lpf.OutputDataItem[j+((i-1)*FN2)-1];
              Color_Values4[i,j]:=Trunc((lpf.OutputDataItem[j+((i-1)*FN2)-1]-Min_Value4)/Color_Interval4);
            end;
        end;
    if not Rad_Filter_Applied then
      begin
//        Temp_Images4:=TOrImage.Create(Application);
        Temp_Images4.Width:=FN2+50;
        Temp_Images4.Height:=Number_of_Records2+50;
          if FN1<>0 then
            Temp_Images4.Left:=Temp_Images3.Left+FN1+50+2
          else
            Temp_Images4.Left:=Temp_Images3.Left+200+50+2;
//        Temp_Images4.Top:=50;
//        Temp_Images4.Parent:=Form1;
        Temp_Images4.Visible:=False;
      Copy_Images4:=TOrImage.Create(Application);
      Copy_Images4.Width:=FN2;
      Temp_Images4.Width:=FN2+50;
      Copy_Images4.Left:=Temp_Images4.Left;
      Copy_Images4.Top:=Temp_Images4.Top;
      Copy_Images4.Parent:=Form1;
      Copy_Images4.Visible:=False;
//        Images4:=TOrImage.Create(Application);
//        Images4.Parent:=Form1;
      end;
        Copy_Images4.Height:=Number_of_Records2;
//        Scale:=200;
        Depth_Interval2:=Last_Depth_Value2-First_Depth_Value2;
        Pixel_Interval2:=Round(Depth_Interval2*3779.53/Scale);
        Temp_Images4.Height:=Round(Pixel_Interval2+50);
        Temp_Images4.Stretch:=True;
          for k:=0 to Number_of_Records2-1 do
            begin
              j:=FN2;
              while j>0 do
                begin
                  Point_Color_Value2:=Color_Values4[K,j];
                  if Point_Color_Value2<=85 then
                    Begin
                      Copy_Images4.Canvas.Pixels[j,k]:=RGB(255,255,255-3*Point_Color_Value2);
                    end;
                  if (Point_Color_Value2>85) and (Point_Color_Value2<170) then
                    Begin
                      Copy_Images4.Canvas.Pixels[j,k]:=RGB(255,510-3*Point_Color_Value2,0);
                    end;
                  if (Point_Color_Value2>=170) then
                    Begin
                      Copy_Images4.Canvas.Pixels[j,k]:=RGB(765-Point_Color_Value2*3,0,0);
                    end;
                   j:=j-1;
                 end;
            end;

        Pixel_Factor:=Pixel_Interval2/Copy_Images4.Height;
        First_Depth_Label2:=(StrToFloat(FloatToStrF(First_Depth_Value2,ffFixed,8,-1)));
        First_Value_Difference2:=First_Depth_Label2-First_Depth_Value2;
        if First_Value_Difference2<0 then
          begin
            First_Depth_Label2:=First_Depth_Label2+5-(Round(First_Depth_Label2) mod 5);
            First_Value_Difference2:=First_Depth_Label2-First_Depth_Value2;
          end;
        First_Pixel_Point2:=Round(First_Value_Difference2*3779.53{*Pixel_Factor}/Scale);
        Temp_Images4.Canvas.CopyRect(Rect(50,50,FN2+50,Temp_Images4.Height),Copy_Images4.Canvas,Rect(0,0,Copy_Images4.Width,Copy_Images4.Height));
        Temp_Images4.Canvas.Font.Style:=[fsBold];
        Temp_Images4.Canvas.Font.Name:='Arial';
        Temp_Images4.Canvas.Font.Size:=8;
        Temp_Images4.Canvas.Font.Color:=clBlack;
        i:=0;
        k:=0;
        repeat
          Temp_Images4.Canvas.Pen.Width:=2;
          Temp_Images4.Canvas.TextOut(5,First_Pixel_Point2+k+45,FloatToStrF(First_Depth_Label2+5*i,ffFixed,8,0));
          Temp_Images4.Canvas.MoveTo(42,First_Pixel_Point2+k+50);
          Temp_Images4.Canvas.LineTo(49,First_Pixel_Point2+k+50);
          for j:=1 to 4 do
            begin
              Temp_Images4.Canvas.Pen.Width:=1;
              Temp_Images4.Canvas.MoveTo(46,First_Pixel_Point2+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
              Temp_Images4.Canvas.LineTo(50,First_Pixel_Point2+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
            end;
          i:=i+1;
          k:=k+Round(5*3779.53{*Pixel_Factor}/Scale);
        until k>=Number_of_Records2+50 ;
        for i:=0 to 4 do
          begin
            Temp_Images4.Canvas.Pen.Width:=2;
            Temp_Images4.Canvas.TextOut(245-i*50,30,FloatToStr(i*50));
            Temp_Images4.Canvas.MoveTo(250-i*50,42);
            Temp_Images4.Canvas.LineTo(250-i*50,49);
            for j:=2 to 5 do
              begin
                Temp_Images4.Canvas.Pen.Width:=2;
                Temp_Images4.Canvas.MoveTo(240-i*50+((j*50) div 5),46);
                Temp_Images4.Canvas.LineTo(240-i*50+((j*50) div 5),50);
              end;
          end;
        Temp_Images4.Canvas.Font.Size:=10;
        Temp_Images4.Canvas.Font.Color:=clBlue;
        Temp_Images4.Canvas.TextOut(90,10,'Corrected Radius');
        Temp_Images4.Canvas.Font.Size:=8;
        Temp_Images4.Canvas.TextOut(2,20,'Depth');
        Temp_Images4.Canvas.TextOut(7,35,'('+Depth_Unit2+')');


        if Rad_Filter_Applied=False then
          begin
//            Images4:=TOrImage.Create(Application);
//            Images4.Parent:=Form1;
            if FN1<>0 then
              Images4.Left:=Images3.Left+FN1+50+2
            else
              Images4.Left:=Images3.Left+200+50+2;
//            Images4.Top:=50;
            if Number_of_Records2<625-50 then
              Images4.Height:=Number_of_Records2+50;
//            else
//              Images4.Height:=625;
            Images4.Width:=FN2+50;
            Images4.Show;
          end;
        Images4.Canvas.CopyRect(Rect(0,0,FN2+50,625),Temp_Images4.Canvas,Rect(0,0,FN2+50,625));
    lpf.ClearArray;
//    Copy_Images4.Free;
 end;
    LowPass_Rad_Image:=True;
    Rad_Filter_Applied:=True;
        Form2.Free;
end;

procedure TForm1.TrimFilter1Click(Sender: TObject);
var
i,j,k:integer;
begin
if not(Original_Amp_Image or Original_Rad_Image) then Exit;
Trim_Amp_Image:=False;
Trim_Rad_Image:=False;
Canceled:=False;
Max_Value3:=-33000;
Min_Value3:=33000;
Form5:=TForm5.Create(Application);
if Original_Amp_Image then
  begin
    Form5.Label2.Caption:=FloatToStr(Max_Value1);
    Form5.Label4.Caption:=FloatToStr(Min_Value1);
    Form5.ESBPosFloatEdit1.AsFloat:=Max_Value1;
    Form5.ESBPosFloatEdit2.AsFloat:=Min_Value1;
  end
else
  begin
    Form5.GroupBox1.Enabled:=False;
    Form5.GroupBox2.Enabled:=False;
    Form5.GroupBox3.Enabled:=False;
  end;
if Original_Rad_Image then
  begin
    Form5.Label10.Caption:=FloatToStr(Max_Value2);
    Form5.Label12.Caption:=FloatToStr(Min_Value2);
    Form5.ESBPosFloatEdit3.AsFloat:=Max_Value2;
    Form5.ESBPosFloatEdit4.AsFloat:=Min_Value2;
  end
else
  begin
    Form5.GroupBox4.Enabled:=False;
    Form5.GroupBox5.Enabled:=False;
    Form5.GroupBox6.Enabled:=False;
  end;
Form5.ShowModal;
Form5.Free;
if Canceled then Exit;
if Original_Amp_Image then
  begin
      Form2:=TForm2.Create(Application);
      Form2.Show;
      Form2.Repaint;
      if not(Amp_Filter_Applied) then
        begin
      Temp_Images3.Visible:=False;
          Temp_Images3.Width:=FN1+50;
          if FN2<>0 then
            Temp_Images3.Left:=Temp_Images2.Left+FN2+50+2
          else
            Temp_Images3.Left:=Temp_Images2.Left+200+50+2;
//          Temp_Images3.Top:=50;
//          Temp_Images3.Parent:=Form1;
          Temp_Images3.Visible:=False;
        end;
      Copy_Images3:=TOrImage.Create(Application);
      Copy_Images3.Width:=FN1;
      Temp_Images3.Width:=FN1+50;
      Copy_Images3.Left:=Temp_Images3.Left;
      Copy_Images3.Top:=Temp_Images3.Top;
      Copy_Images3.Parent:=Form1;
      Copy_Images3.Visible:=False;
      SetLength(Color_Values3,Number_of_Records1+1,FN1+1);
      Color_Interval3:=(Max_Value3-Min_Value3)/255;
      for i:=0 to Number_of_Records1-1 do
        begin
          for j:=0 to FN1-1 do
            begin
              Color_Values3[i,j]:=Trunc((Log_Values3[i,j]-Min_Value3)/Color_Interval3);
            end;
        end;
      Repaint;
        Copy_Images3.Height:=Number_of_Records1;
//        Scale:=200;
        Depth_Interval1:=Last_Depth_Value1-First_Depth_Value1;
        Pixel_Interval1:=Round(Depth_Interval1*3779.53/Scale);
        Temp_Images3.Height:=Round(Pixel_Interval1+50);
        Temp_Images3.Stretch:=True;
          for k:=0 to Number_of_Records1-1 do
            begin
              j:=0;
              while j<FN1+1 do
                begin
                  Point_Color_Value1:=Color_Values3[K,j];
                  if Point_Color_Value1<=85 then
                    Begin
                      Copy_Images3.Canvas.Pixels[j,k]:=RGB(Point_Color_Value1*3,0,0);
                    end;
                  if (Point_Color_Value1>85) and (Point_Color_Value1<170) then
                    Begin
                      Copy_Images3.Canvas.Pixels[j,k]:=RGB(255,Point_Color_Value1*3-255,0);
                    end;
                  if (Point_Color_Value1>=170) then
                    Begin
                      Copy_Images3.Canvas.Pixels[j,k]:=RGB(255,255,Point_Color_Value1*3-510);
                    end;
                   j:=j+1;
                 end;
            end;


        Pixel_Factor:=Pixel_Interval1/Copy_Images3.Height;
        First_Depth_Label1:=(StrToFloat(FloatToStrF(First_Depth_Value1,ffFixed,8,-1)));
        First_Value_Difference1:=First_Depth_Label1-First_Depth_Value1;
        if First_Value_Difference1<0 then
          begin
            First_Depth_Label1:=First_Depth_Label1+5-(Round(First_Depth_Label1) mod 5);
            First_Value_Difference1:=First_Depth_Label1-First_Depth_Value1;
          end;
        First_Pixel_Point1:=Round(First_Value_Difference1*3779.53{*Pixel_Factor}/Scale);
        Temp_Images3.Canvas.CopyRect(Rect(50,50,FN1+50,Temp_Images3.Height),Copy_Images3.Canvas,Rect(0,0,Copy_Images3.Width,Copy_Images3.Height));
        Temp_Images3.Canvas.Font.Style:=[fsBold];
        Temp_Images3.Canvas.Font.Name:='Arial';
        Temp_Images3.Canvas.Font.Size:=8;
        Temp_Images3.Canvas.Font.Color:=clBlack;
        i:=0;
        k:=0;
        repeat
          Temp_Images3.Canvas.Pen.Width:=2;
          Temp_Images3.Canvas.TextOut(5,First_Pixel_Point1+k+45,FloatToStrF(First_Depth_Label1+5*i,ffFixed,8,0));
          Temp_Images3.Canvas.MoveTo(42,First_Pixel_Point1+k+50);
          Temp_Images3.Canvas.LineTo(49,First_Pixel_Point1+k+50);
          for j:=1 to 4 do
            begin
              Temp_Images3.Canvas.Pen.Width:=1;
              Temp_Images3.Canvas.MoveTo(46,First_Pixel_Point1+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
              Temp_Images3.Canvas.LineTo(50,First_Pixel_Point1+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
            end;
          i:=i+1;
          k:=k+Round(5*3779.53{*Pixel_Factor}/Scale);
        until k>=Number_of_Records1+50 ;
        for i:=0 to 4 do
          begin
            Temp_Images3.Canvas.Pen.Width:=2;
            Temp_Images3.Canvas.TextOut(245-i*50,30,FloatToStr(i*50));
            Temp_Images3.Canvas.MoveTo(250-i*50,42);
            Temp_Images3.Canvas.LineTo(250-i*50,49);
            for j:=1 to 5 do
              begin
                Temp_Images3.Canvas.Pen.Width:=1;
                Temp_Images3.Canvas.MoveTo(240-i*50+((j*50) div 5),46);
                Temp_Images3.Canvas.LineTo(240-i*50+((j*50) div 5),50);
              end;
          end;
        Temp_Images3.Canvas.Font.Size:=10;
        Temp_Images3.Canvas.Font.Color:=clBlue;
        Temp_Images3.Canvas.TextOut(90,10,'Corrected Amplitude');
        Temp_Images3.Canvas.Font.Size:=8;
        Temp_Images3.Canvas.TextOut(2,20,'Depth');
        Temp_Images3.Canvas.TextOut(7,35,'('+Depth_Unit1+')');


        if not(Amp_Filter_Applied) then
          begin
//            Images3:=TOrImage.Create(Application);
//            Images3.Parent:=Form1;
            if FN2<>0 then
              Images3.Left:=Images2.Left+FN2+50+2
            else
              Images3.Left:=Images2.Left+200+50+2;
//            Images3.Top:=50;
            if Number_of_Records1<625-50 then
              Images3.Height:=Number_of_Records1+50;
//            else
//              Images3.Height:=625;
            Images3.Width:=FN1+50;
            Images3.Show;
          end;
        Images3.Canvas.CopyRect(Rect(0,0,FN1+50,625),Temp_Images3.Canvas,Rect(0,0,FN1+50,625));
    Form2.Free;
    Trim_Amp_Image:=True;
    Amp_Filter_Applied:=True;
//    Copy_Images3.Free;
  end;
if Original_Rad_Image then
  begin
      Form2:=TForm2.Create(Application);
      Form2.Show;
      Form2.Label1.Caption:='Creating new radius image ...';
      Form2.Repaint;
      if Rad_Filter_Applied=False then
        begin
          if FN1<>0 then
            Temp_Images4.Left:=Temp_Images3.Left+FN1+50+2
          else
            Temp_Images4.Left:=Temp_Images3.Left+200+50+2;
          Temp_Images4.Visible:=False;
        end;
      Copy_Images4:=TOrImage.Create(Application);
      Copy_Images4.Width:=FN2;
      Temp_Images4.Width:=FN2+50;
      Copy_Images4.Left:=Temp_Images4.Left;
      Copy_Images4.Top:=Temp_Images4.Top;
      Copy_Images4.Parent:=Form1;
      Copy_Images4.Visible:=False;
      SetLength(Color_Values4,Number_of_Records2+2,FN2+2);
      Color_Interval4:=(Max_Value4-Min_Value4)/255;
      for i:=0 to Number_of_Records2-1 do
        begin
          for j:=0 to FN2-1 do
            begin
              Color_Values4[i,j]:=Trunc((Log_Values4[i,j]-Min_Value4)/Color_Interval4);
            end;
        end;
      Repaint;
        Copy_Images4.Height:=Number_of_Records2;
//        Scale:=200;
        Depth_Interval2:=Last_Depth_Value2-First_Depth_Value2;
        Pixel_Interval2:=Round(Depth_Interval2*3779.53/Scale);
        Temp_Images4.Height:=Round(Pixel_Interval2+50);
        Temp_Images4.Stretch:=True;
          for k:=0 to Number_of_Records2-1 do
            begin
              j:=FN2;
              while j>0 do
                begin
                  Point_Color_Value2:=Color_Values4[K,j];
                  if Point_Color_Value2<=85 then
                    Begin
                      Copy_Images4.Canvas.Pixels[j,k]:=RGB(255,255,255-3*Point_Color_Value2);
                    end;
                  if (Point_Color_Value2>85) and (Point_Color_Value2<170) then
                    Begin
                      Copy_Images4.Canvas.Pixels[j,k]:=RGB(255,510-3*Point_Color_Value2,0);
                    end;
                  if (Point_Color_Value2>=170) then
                    Begin
                      Copy_Images4.Canvas.Pixels[j,k]:=RGB(765-Point_Color_Value2*3,0,0);
                    end;
                   j:=j-1;
                 end;
            end;

        Pixel_Factor:=Pixel_Interval2/Copy_Images4.Height;
        First_Depth_Label2:=(StrToFloat(FloatToStrF(First_Depth_Value2,ffFixed,8,-1)));
        First_Value_Difference2:=First_Depth_Label2-First_Depth_Value2;
        if First_Value_Difference2<0 then
          begin
            First_Depth_Label2:=First_Depth_Label2+5-(Round(First_Depth_Label2) mod 5);
            First_Value_Difference2:=First_Depth_Label2-First_Depth_Value2;
          end;
        First_Pixel_Point2:=Round(First_Value_Difference2*3779.53{*Pixel_Factor}/Scale);
        Temp_Images4.Canvas.CopyRect(Rect(50,50,FN2+50,Temp_Images4.Height),Copy_Images4.Canvas,Rect(0,0,Copy_Images4.Width,Copy_Images4.Height));
        Temp_Images4.Canvas.Font.Style:=[fsBold];
        Temp_Images4.Canvas.Font.Name:='Arial';
        Temp_Images4.Canvas.Font.Size:=8;
        Temp_Images4.Canvas.Font.Color:=clBlack;
        i:=0;
        k:=0;
        repeat
          Temp_Images4.Canvas.Pen.Width:=2;
          Temp_Images4.Canvas.TextOut(5,First_Pixel_Point2+k+45,FloatToStrF(First_Depth_Label2+5*i,ffFixed,8,0));
          Temp_Images4.Canvas.MoveTo(42,First_Pixel_Point2+k+50);
          Temp_Images4.Canvas.LineTo(49,First_Pixel_Point2+k+50);
          for j:=1 to 4 do
            begin
              Temp_Images4.Canvas.Pen.Width:=1;
              Temp_Images4.Canvas.MoveTo(46,First_Pixel_Point2+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
              Temp_Images4.Canvas.LineTo(50,First_Pixel_Point2+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
            end;
          i:=i+1;
          k:=k+Round(5*3779.53{*Pixel_Factor}/Scale);
        until k>=Number_of_Records2+50 ;
        for i:=0 to 4 do
          begin
            Temp_Images4.Canvas.Pen.Width:=2;
            Temp_Images4.Canvas.TextOut(245-i*50,30,FloatToStr(i*50));
            Temp_Images4.Canvas.MoveTo(250-i*50,42);
            Temp_Images4.Canvas.LineTo(250-i*50,49);
            for j:=2 to 5 do
              begin
                Temp_Images4.Canvas.Pen.Width:=2;
                Temp_Images4.Canvas.MoveTo(240-i*50+((j*50) div 5),46);
                Temp_Images4.Canvas.LineTo(240-i*50+((j*50) div 5),50);
              end;
          end;
        Temp_Images4.Canvas.Font.Size:=10;
        Temp_Images4.Canvas.Font.Color:=clBlue;
        Temp_Images4.Canvas.TextOut(90,10,'Corrected Radius');
        Temp_Images4.Canvas.Font.Size:=8;
        Temp_Images4.Canvas.TextOut(2,20,'Depth');
        Temp_Images4.Canvas.TextOut(7,35,'('+Depth_Unit2+')');


        if Rad_Filter_Applied=False then
          begin
//            Images4:=TOrImage.Create(Application);
//            Images4.Parent:=Form1;
            if FN1<>0 then
              Images4.Left:=Images3.Left+FN1+50+2
            else
              Images4.Left:=Images3.Left+200+50+2;
//            Images4.Top:=50;
            if Number_of_Records2<625-50 then
              Images4.Height:=Number_of_Records2+50;
//            else
//              Images4.Height:=625;
            Images4.Width:=FN2+50;
            Images4.Show;
          end;
        Images4.Canvas.CopyRect(Rect(0,0,FN2+50,625),Temp_Images4.Canvas,Rect(0,0,FN2+50,625));
    Form2.Free;
    Trim_Rad_Image:=True;
    Rad_Filter_Applied:=True;
//    Copy_Images4.Free;
  end;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.AntiAliasing1Click(Sender: TObject);
var
i,j,k:integer;
begin
if not(Original_Amp_Image or Original_Rad_Image) then Exit;
AntiAlias_Amp_Image:=False;
AntiAlias_Rad_Image:=False;
if Original_Amp_Image then
  begin
    Form2:=TForm2.Create(Application);
    Form2.Show;
    Form2.Label1.Caption:='Applying Antialias filter on amplitude image ...';
    Form2.Repaint;
    if not Amp_Filter_Applied then
      begin
//        Temp_Images3:=TOrImage.Create(Application);
        Temp_Images3.Width:=FN1+50;
        Temp_Images3.Height:=Number_of_Records1+50;
          if FN2<>0 then
            Temp_Images3.Left:=Temp_Images2.Left+FN2+50+2
          else
            Temp_Images3.Left:=Temp_Images2.Left+200+50+2;
      Copy_Images3:=TOrImage.Create(Application);
      Copy_Images3.Width:=FN1;
      Copy_Images3.Left:=Temp_Images3.Left;
      Copy_Images3.Top:=Temp_Images3.Top;
      Copy_Images3.Height:=Number_of_Records1;
      Copy_Images3.Parent:=Form1;
      Copy_Images3.Visible:=False;
        Temp_Images3.Visible:=False;
        Copy_Images3.PictureOriginal:=Copy_Images1.Picture;
      end
    else
        Copy_Images3.PictureOriginal:=Copy_Images3.Picture;
    Copy_Images3.PicAntiAlias:=1;
//    Temp_Images3.Canvas.Brush.Color:=clWhite;
//    Temp_Images3.Canvas.FillRect(Rect(0,0,Temp_images3.Width,50));
//    Temp_Images3.Canvas.FillRect(Rect(0,0,50,Temp_images3.Height));


//        Scale:=200;
        Depth_Interval1:=Last_Depth_Value1-First_Depth_Value1;
        Pixel_Interval1:=Round(Depth_Interval1*3779.53/Scale);
        Temp_Images3.Height:=Round(Pixel_Interval1+50);
        Temp_Images3.Stretch:=True;

        Pixel_Factor:=Pixel_Interval1/Copy_Images3.Height;
        First_Depth_Label1:=(StrToFloat(FloatToStrF(First_Depth_Value1,ffFixed,8,-1)));
        First_Value_Difference1:=First_Depth_Label1-First_Depth_Value1;
        if First_Value_Difference1<0 then
          begin
            First_Depth_Label1:=First_Depth_Label1+5-(Round(First_Depth_Label1) mod 5);
            First_Value_Difference1:=First_Depth_Label1-First_Depth_Value1;
          end;
        First_Pixel_Point1:=Round(First_Value_Difference1*3779.53{*Pixel_Factor}/Scale);
        Temp_Images3.Canvas.CopyRect(Rect(50,50,FN1+50,Temp_Images3.Height),Copy_Images3.Canvas,Rect(0,0,Copy_Images3.Width,Copy_Images3.Height));
        Temp_Images3.Canvas.Font.Style:=[fsBold];
        Temp_Images3.Canvas.Font.Name:='Arial';
        Temp_Images3.Canvas.Font.Size:=8;
        Temp_Images3.Canvas.Font.Color:=clBlack;
        i:=0;
        k:=0;
        repeat
          Temp_Images3.Canvas.Pen.Width:=2;
          Temp_Images3.Canvas.TextOut(5,First_Pixel_Point1+k+45,FloatToStrF(First_Depth_Label1+5*i,ffFixed,8,0));
          Temp_Images3.Canvas.MoveTo(42,First_Pixel_Point1+k+50);
          Temp_Images3.Canvas.LineTo(49,First_Pixel_Point1+k+50);
          for j:=1 to 4 do
            begin
              Temp_Images3.Canvas.Pen.Width:=1;
              Temp_Images3.Canvas.MoveTo(46,First_Pixel_Point1+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
              Temp_Images3.Canvas.LineTo(50,First_Pixel_Point1+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
            end;
          i:=i+1;
          k:=k+Round(5*3779.53{*Pixel_Factor}/Scale);
        until k>=Number_of_Records1+50 ;
        for i:=0 to 4 do
          begin
            Temp_Images3.Canvas.Pen.Width:=2;
            Temp_Images3.Canvas.TextOut(245-i*50,30,FloatToStr(i*50));
            Temp_Images3.Canvas.MoveTo(250-i*50,42);
            Temp_Images3.Canvas.LineTo(250-i*50,49);
            for j:=1 to 5 do
              begin
                Temp_Images3.Canvas.Pen.Width:=1;
                Temp_Images3.Canvas.MoveTo(240-i*50+((j*50) div 5),46);
                Temp_Images3.Canvas.LineTo(240-i*50+((j*50) div 5),50);
              end;
          end;
        Temp_Images3.Canvas.Font.Size:=10;
        Temp_Images3.Canvas.Font.Color:=clBlue;
        Temp_Images3.Canvas.TextOut(90,10,'Corrected Amplitude');
        Temp_Images3.Canvas.Font.Size:=8;
        Temp_Images3.Canvas.TextOut(2,20,'Depth');
        Temp_Images3.Canvas.TextOut(7,35,'('+Depth_Unit1+')');


    if not Amp_Filter_Applied then
      begin
//        Images3:=TOrImage.Create(Application);
//        Images3.Parent:=Form1;
          if FN2<>0 then
            Images3.Left:=Images2.Left+FN2+50+2
          else
            Images3.Left:=Images2.Left+200+50+2;
//        Images3.Top:=50;
        if Number_of_Records1<625-50 then
          Images3.Height:=Number_of_Records1+50;
//        else
//          Images3.Height:=625;
        Images3.Width:=FN1+50;
        Images3.Show;
      end;
    Images3.Canvas.CopyRect(Rect(0,0,FN1+50,625),Temp_Images3.Canvas,Rect(0,0,FN1+50,625));
    Form2.Free;
    AntiAlias_Amp_Image:=True;
    Amp_Filter_Applied:=True;
//    Copy_Images3.Free;
  end;

if Original_Rad_Image then
  begin
    Form2:=TForm2.Create(Application);
    Form2.Show;
    Form2.Label1.Caption:='Applying Antialias filter on radius image ...';
    Form2.Repaint;
    if not Rad_Filter_Applied then
      begin
//        Temp_Images4:=TOrImage.Create(Application);
        Temp_Images4.Height:=Number_of_Records2+50;
        Temp_Images4.Width:=FN2+50;
          if FN1<>0 then
            Temp_Images4.Left:=Temp_Images3.Left+FN1+50+2
          else
            Temp_Images4.Left:=Temp_Images3.Left+200+50+2;
//        Temp_Images4.Top:=50;
//        Temp_Images4.Parent:=Form1;
      Copy_Images4:=TOrImage.Create(Application);
      Copy_Images4.Width:=FN1;
      Copy_Images4.Left:=Temp_Images4.Left;
      Copy_Images4.Top:=Temp_Images4.Top;
      Copy_Images4.Height:=Number_of_Records1;
      Copy_Images4.Parent:=Form1;
      Copy_Images4.Visible:=False;
        Temp_Images4.Visible:=False;
        Copy_Images4.PictureOriginal:=Copy_Images2.Picture;
      end
    else
        Copy_Images4.PictureOriginal:=Copy_Images4.Picture;
    Copy_Images4.PicAntiAlias:=1;
//    Temp_Images4.Canvas.Brush.Color:=clWhite;
//    Temp_Images4.Canvas.FillRect(Rect(0,0,50,Temp_images4.Height));
//    Temp_Images4.Canvas.FillRect(Rect(0,0,Temp_images4.Width,50));


//        Scale:=200;
        Depth_Interval1:=Last_Depth_Value1-First_Depth_Value1;
        Pixel_Interval1:=Round(Depth_Interval1*3779.53/Scale);
        Temp_Images4.Height:=Round(Pixel_Interval1+50);
        Temp_Images4.Stretch:=True;

        Pixel_Factor:=Pixel_Interval1/Copy_Images4.Height;
        First_Depth_Label1:=(StrToFloat(FloatToStrF(First_Depth_Value1,ffFixed,8,-1)));
        First_Value_Difference1:=First_Depth_Label1-First_Depth_Value1;
        if First_Value_Difference1<0 then
          begin
            First_Depth_Label1:=First_Depth_Label1+5-(Round(First_Depth_Label1) mod 5);
            First_Value_Difference1:=First_Depth_Label1-First_Depth_Value1;
          end;
        First_Pixel_Point1:=Round(First_Value_Difference1*3779.53{*Pixel_Factor}/Scale);
        Temp_Images4.Canvas.CopyRect(Rect(50,50,FN1+50,Temp_Images4.Height),Copy_Images4.Canvas,Rect(0,0,Copy_Images4.Width,Copy_Images4.Height));
        Temp_Images4.Canvas.Font.Style:=[fsBold];
        Temp_Images4.Canvas.Font.Name:='Arial';
        Temp_Images4.Canvas.Font.Size:=8;
        Temp_Images4.Canvas.Font.Color:=clBlack;
        i:=0;
        k:=0;
        repeat
          Temp_Images4.Canvas.Pen.Width:=2;
          Temp_Images4.Canvas.TextOut(5,First_Pixel_Point1+k+45,FloatToStrF(First_Depth_Label1+5*i,ffFixed,8,0));
          Temp_Images4.Canvas.MoveTo(42,First_Pixel_Point1+k+50);
          Temp_Images4.Canvas.LineTo(49,First_Pixel_Point1+k+50);
          for j:=1 to 4 do
            begin
              Temp_Images4.Canvas.Pen.Width:=1;
              Temp_Images4.Canvas.MoveTo(46,First_Pixel_Point1+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
              Temp_Images4.Canvas.LineTo(50,First_Pixel_Point1+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
            end;
          i:=i+1;
          k:=k+Round(5*3779.53{*Pixel_Factor}/Scale);
        until k>=Number_of_Records1+50 ;
        for i:=0 to 4 do
          begin
            Temp_Images4.Canvas.Pen.Width:=2;
            Temp_Images4.Canvas.TextOut(245-i*50,30,FloatToStr(i*50));
            Temp_Images4.Canvas.MoveTo(250-i*50,42);
            Temp_Images4.Canvas.LineTo(250-i*50,49);
            for j:=1 to 5 do
              begin
                Temp_Images4.Canvas.Pen.Width:=1;
                Temp_Images4.Canvas.MoveTo(240-i*50+((j*50) div 5),46);
                Temp_Images4.Canvas.LineTo(240-i*50+((j*50) div 5),50);
              end;
          end;
        Temp_Images4.Canvas.Font.Size:=10;
        Temp_Images4.Canvas.Font.Color:=clBlue;
        Temp_Images4.Canvas.TextOut(90,10,'Corrected Amplitude');
        Temp_Images4.Canvas.Font.Size:=8;
        Temp_Images4.Canvas.TextOut(2,20,'Depth');
        Temp_Images4.Canvas.TextOut(7,35,'('+Depth_Unit1+')');


    if not Rad_Filter_Applied then
      begin
//        Images4:=TOrImage.Create(Application);
//        Images4.Parent:=Form1;
          if FN1<>0 then
            Images4.Left:=Images3.Left+FN1+50+2
          else
            Images4.Left:=Images3.Left+200+50+2;
//        Images4.Top:=50;
        if Number_of_Records2<625-50 then
          Images4.Height:=Number_of_Records2+50;
//        else
//          Images4.Height:=625;
        Images4.Width:=FN2+50;
        Images4.Show;
      end;
    Images4.Canvas.CopyRect(Rect(0,0,FN2+50,625),Temp_Images4.Canvas,Rect(0,0,FN2+50,625));
    Form2.Free;
    AntiAlias_Rad_Image:=True;
    Rad_Filter_Applied:=True;
//    Copy_Images4.Free;
  end;
end;

procedure TForm1.Amplitude1Click(Sender: TObject);
var
  i,j,k,N1: integer;
begin
try
if OpenDialog1.Execute then
  begin
      Form6:=TForm6.Create(Self);
      Form6.ShowModal;
      Form6.Free;
      if Canceled then Exit;
      Repaint;
      Form2:=TForm2.Create(Application);
      Form2.Show;
      File_Name1:=OpenDialog1.FileName;
      AssignFile(Open_File1,File_Name1);
      Reset(Open_File1);
      Max_Value1:=-33000;
      Min_Value1:=33000;
      repeat
        Read(Open_File1,Read_Text);
        S:=Copy(Read_Text,0,4);
        if Read_Text='' then Readln(Open_File1);
      until  (S='STRT')or(S=' STR');
      Form2.Label1.Caption:='Reading start depth value ...';
      Form2.Repaint;
      for i:=1 to Length(Read_Text) do
        begin
          S:=Copy(Read_Text,0,1);
          if (S='.') then
            begin
              S1:=Copy(Read_Text,2,5);
              S1:=TrimLeft(S1);
              S1:=TrimRight(S1);
              Depth_Unit1:=S1;
            end;
          S:=Copy(Read_Text,0,1);
          if (S='-')or(S='1')or(S='2')or(S='3')or(S='4')or(S='5')or(S='6')or(S='7')or(S='8')or(S='9') then
            begin
              S1:=Copy(Read_Text,0,11);
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
      Form2.Repaint;
      for i:=1 to Length(Read_Text) do
        begin
          S:=Copy(Read_Text,0,1);
          if (S='-')or(S='1')or(S='2')or(S='3')or(S='4')or(S='5')or(S='6')or(S='7')or(S='8')or(S='9') then
            begin
              S1:=Copy(Read_Text,0,11);
              S1:=TrimLeft(S1);
              S1:=TrimRight(S1);
              Last_Depth_Value1:=StrToFloat(S1);
              Readln(Open_File1,Read_Text);
              Break;
            end;
          Delete(Read_Text,1,1);
        end;
      Repaint;
      Form2.Label1.Caption:='Reading step value ...';
      Form2.Repaint;
      if Read_Text='' then
        Readln(Open_File1,Read_Text);
      for i:=1 to Length(Read_Text) do
        begin
          S:=Copy(Read_Text,0,1);
          S1:=Copy(Read_Text,0,2);
          if (S='-')or(S='0')or(S='1')or(S='2')or(S='3')or(S='4')or(S='5')or(S='6')or(S='7')or(S='8')or(S='9')or(S1='.0')or(S1='.1')or(S1='.2')or(S1='.3')or(S1='.4')or(S1='.5')or(S1='.6')or(S1='.7')or(S1='.8')or(S1='.9') then
            begin
              S2:=Copy(Read_Text,0,11);
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
      Form2.Repaint;
      if Read_Text='' then
        Readln(Open_File1,Read_Text);
      for i:=1 to Length(Read_Text) do
        begin
          S:=Copy(Read_Text,0,1);
          if (S='-')or(S='1')or(S='2')or(S='3')or(S='4')or(S='5')or(S='6')or(S='7')or(S='8')or(S='9') then
            begin
              S1:=Copy(Read_Text,0,11);
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
      Form2.Label1.Caption:='Calculating number of pads ...';
      Form2.Repaint;
      repeat
        Read(Open_File1,Read_Text);
        S:=Copy(Read_Text,0,1);
        if Read_Text='' then
          begin
            Readln(Open_File1);
            FN1:=FN1+1;
          end;
      until  (S='#')or(S='~')or(S='-');
      FN1:=FN1-1;
      SetLength(Color_Values1,Number_of_Records1+1,FN1+1);
      SetLength(Log_Values1,Number_of_Records1+1,FN1+1);
      SetLength(Log_Values3,Number_of_Records1+1,FN1+1);
      repeat
        Read(Open_File1,Read_Text);
        S:=Copy(Read_Text,0,2);
        if Read_Text='' then Readln(Open_File1);
      until  (S='~A')or(S=' ~');
      Form2.Label1.Caption:='Finding minimum and maximum values ...';
      Form2.Repaint;
      Readln(Open_File1);
      Temp_Images1.Width:=FN1+50;
      Temp_Images1.Visible:=False;

      Copy_Images1:=TImage.Create(Application);
      Copy_Images1.Width:=FN1;
      Copy_Images1.Left:=Temp_Images1.Left;
      Copy_Images1.Top:=Temp_Images1.Top;
      Copy_Images1.Parent:=Form1;
      Copy_Images1.Visible:=False;

      Copy_Images11:=TImage.Create(Application);
      Copy_Images11.Width:=FN1;
      Copy_Images11.Left:=Temp_Images1.Left;
      Copy_Images11.Top:=Temp_Images1.Top;
      Copy_Images11.Parent:=Form1;
      Copy_Images11.Visible:=False;


      While not EOF(Open_File1) do
        begin
          Read(Open_File1,Depth_Value1);
          for i:=1 to FN1 do
            begin
              Read(Open_File1,Log_Value1);
              if Log_Value1<>Null_Value1 then
                begin
                  if Log_Value1>Max_Value1 then
                    Max_Value1:=Log_Value1;
                  if Log_Value1<Min_Value1 then
                    Min_Value1:=Log_Value1;
                end;
            end;
        end;
      Repaint;
      Form2.Label1.Caption:='Creating array of colors ...';
      Form2.Repaint;
      Reset(Open_File1);
      repeat
        Readln(Open_File1,Read_Text);
        Read_Text:=TrimLeft(Read_Text);
        Read_Text:=TrimRight(Read_Text);
      until Read_Text='~A';
      Color_Interval1:=(Max_Value1-Min_Value1)/255;
      Color_Interval3:=Color_Interval1;
      N1:=0;
      Read(Open_File1,First_Depth_Value1);
      Depth_Value1:=First_Depth_Value1;
      While not EOF(Open_File1) do
        begin
          for j:=0 to FN1-1 do
            begin
              Read(Open_File1,Log_Value1);
              if Log_Value1<>Null_Value1 then
                begin
                  Color_Values1[N1,j]:=Trunc((Log_Value1-Min_Value1)/Color_Interval1);
                  Log_Values1[N1,j]:=Log_Value1;
                  Log_Values3[N1,j]:=Log_Value1;
                end;
            end;
          Read(Open_File1,Depth_Value1);
          N1:=N1+1;
        end;
      Form2.Label1.Caption:='Creating temporary image ...';
      Form2.Repaint;
      Repaint;


        Copy_Images1.Height:=Number_of_Records1;
//        Scale:=200;
        Depth_Interval1:=Last_Depth_Value1-First_Depth_Value1;
        Pixel_Interval1:=Round(Depth_Interval1*3779.53/Scale);
        Copy_Images11.Height:=Pixel_Interval1;
        Copy_Images11.Stretch:=True;
        Temp_Images1.Height:=Pixel_Interval1+50;
          for k:=0 to Number_of_Records1-1 do
            begin
              j:=0;
              while j<FN1+1 do
                begin
                  Point_Color_Value1:=Color_Values1[K,j];
                  if Point_Color_Value1<=85 then
                    Begin
                      Copy_Images1.Canvas.Pixels[j,k]:=RGB(Point_Color_Value1*3,0,0);
                    end;
                  if (Point_Color_Value1>85) and (Point_Color_Value1<170) then
                    Begin
                      Copy_Images1.Canvas.Pixels[j,k]:=RGB(255,Point_Color_Value1*3-255,0);
                    end;
                  if (Point_Color_Value1>=170) then
                    Begin
                      Copy_Images1.Canvas.Pixels[j,k]:=RGB(255,255,Point_Color_Value1*3-510);
                    end;
                   j:=j+1;
                 end;
            end;
        Pixel_Factor:=Pixel_Interval1/Copy_Images1.Height;
        First_Depth_Label1:=(StrToFloat(FloatToStrF(First_Depth_Value1,ffFixed,8,-1)));
        First_Value_Difference1:=First_Depth_Label1-First_Depth_Value1;
        if First_Value_Difference1<0 then
          begin
            First_Depth_Label1:=First_Depth_Label1+5-(Round(First_Depth_Label1) mod 5);
            First_Value_Difference1:=First_Depth_Label1-First_Depth_Value1;
          end;
        First_Pixel_Point1:=Round(First_Value_Difference1*3779.53{*Pixel_Factor}/Scale);

        Copy_Images11.Canvas.CopyRect(Rect(0,0,Copy_Images11.Width,Copy_Images11.Height),Copy_Images1.Canvas,Rect(0,0,Copy_Images1.Width,Copy_Images1.Height));

        Temp_Images1.Canvas.CopyRect(Rect(50,50,FN1+50,Temp_Images1.Height+50),Copy_Images11.Canvas,Rect(0,0,Copy_Images11.Width,Copy_Images11.Height));
        Temp_Images1.Canvas.Font.Style:=[fsBold];
        Temp_Images1.Canvas.Font.Name:='Arial';
        Temp_Images1.Canvas.Font.Size:=8;
        Temp_Images1.Canvas.Font.Color:=clBlack;
        i:=0;
        k:=0;
        repeat
          Temp_Images1.Canvas.Pen.Width:=2;
          Temp_Images1.Canvas.TextOut(5,First_Pixel_Point1+k+45,FloatToStrF(First_Depth_Label1+5*i,ffFixed,8,0));
          Temp_Images1.Canvas.MoveTo(42,First_Pixel_Point1+k+50);
          Temp_Images1.Canvas.LineTo(49,First_Pixel_Point1+k+50);
          for j:=1 to 4 do
            begin
              Temp_Images1.Canvas.Pen.Width:=1;
              Temp_Images1.Canvas.MoveTo(46,First_Pixel_Point1+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
              Temp_Images1.Canvas.LineTo(50,First_Pixel_Point1+k+50-Round(j*3779.53{*Pixel_Factor}/Scale));
            end;
          i:=i+1;
          k:=k+Round(5*3779.53{*Pixel_Factor}/Scale);
        until k>Number_of_Records1+50;
        for i:=0 to 4 do
          begin
            Temp_Images1.Canvas.Pen.Width:=2;
            Temp_Images1.Canvas.TextOut(245-i*50,30,FloatToStr(i*50));
            Temp_Images1.Canvas.MoveTo(250-i*50,42);
            Temp_Images1.Canvas.LineTo(250-i*50,49);
            for j:=1 to 5 do
              begin
                Temp_Images1.Canvas.Pen.Width:=1;
                Temp_Images1.Canvas.MoveTo(240-i*50+((j*50) div 5),46);
                Temp_Images1.Canvas.LineTo(240-i*50+((j*50) div 5),50);
              end;
          end;
        Temp_Images1.Canvas.Font.Size:=10;
        Temp_Images1.Canvas.Font.Color:=clBlue;
        Temp_Images1.Canvas.TextOut(90,10,'Original Amplitude');
        Temp_Images1.Canvas.Font.Size:=8;
        Temp_Images1.Canvas.TextOut(2,20,'Depth');
        Temp_Images1.Canvas.TextOut(7,35,'('+Depth_Unit1+')');



        Form2.Label1.Caption:='Creating main image ...';
        Form2.Repaint;
//        Images1:=TOrImage.Create(Application);
//        Images1.Parent:=Form1;
//        Images1.Left:=0;
//        Images1.Top:=50;
//        if {Number_of_Records1*3779.53/Scale}Pixel_Interval1<625-50 then
//          Images1.Height:=Pixel_Interval1+50;//Number_of_Records1+50;
//        else
          Images1.Height:=625;
        Shape1.Height:=Images1.Height+2;
        Images1.Width:=FN1+50;
//        Images1.Show;
        Images1.Canvas.CopyRect(Rect(0,0,FN1+50,625),Temp_Images1.Canvas,Rect(0,0,FN1+50,625));
    CloseFile(Open_File1);
    Form2.Free;
    Original_Amp_Image:=True;
    Amp_Filter_Applied:=False;
    if Pixel_Interval1>=625 then
      UpDown1.Max:=Pixel_Interval1-625
    else
      UpDown1.Max:=0;
    UpDown1.Position:=0;
//    Copy_Images1.Free;
    Copy_Images11.Free;
  end;
except
  Copy_Images1.Free;
  Copy_Images11.Free;
  Color_Values1:=nil;
  Log_Values1:=nil;
  CloseFile(Open_File1);
  Form2.Free;
  Original_Amp_Image:=False;
end;
end;

procedure TForm1.About2Click(Sender: TObject);
begin
AboutForm:=TAboutForm.Create(Self);
AboutForm.ShowModal;
AboutForm.Free;
end;

procedure TForm1.Print1Click(Sender: TObject);
const
  Digit=0;
begin
{   QuickRep1.Prepare;
   try
      QuickRep1.QRPrinter.PaperSize:=Custom;
   finally
      QuickRep1.QRPrinter.Free;
   end;
   QuickRep1.QRPrinter := nil;}

{    if Original_Amp_Image then
      begin  }
        if Images1.Visible then
          begin
          {  if Images2.Height>=Images1.Height then
               QuickRep1.Page.Length:=Images2.Height+250
            else
               QuickRep1.Page.Length:=Images1.Height+250;  }
            QRImage1.Height:=Images1.Height+Digit;
            QRImage1.Picture.Assign(Images1.Picture);
          end;
        if Temp_Images1.Visible then
          begin
{            if Temp_Images2.Height>=Temp_Images1.Height then
               QuickRep1.Page.Length:=Temp_Images2.Height+250
            else
               QuickRep1.Page.Length:=Temp_Images1.Height+250;}
            QRImage1.Height:=900;//Temp_Images1.Height;
            QRImage1.Picture.Assign(Temp_Images1.Picture);
          end;
//      end;
//    if Original_Rad_Image then
//      begin
        if Images2.Visible then
          begin
{            if Images2.Height>=Images1.Height then
               QuickRep1.Page.Length:=Images2.Height+250
            else
               QuickRep1.Page.Length:=Images1.Height+250; }
            QRImage2.Height:=Images2.Height+Digit;
            QRImage2.Picture.Assign(Images2.Picture);
          end;
        if Temp_Images2.Visible then
          begin
{            if Temp_Images2.Height>=Temp_Images1.Height then
               QuickRep1.Page.Length:=Temp_Images2.Height+250
            else
               QuickRep1.Page.Length:=Temp_Images1.Height+250;}
            QRImage2.Height:=900;//Temp_Images2.Height;
            QRImage2.Picture.Assign(Temp_Images2.Picture);
          end;
//      end;
//    if Amp_Filter_Applied then
//      begin
        if Images3.Visible then
          begin
            QRImage7.Height:=Images3.Height+Digit;
            QRImage7.Picture.Assign(Images3.Picture);
          end;
        if Temp_Images3.Visible then
          begin
            QRImage7.Height:=900;//Temp_Images3.Height;
            QRImage7.Picture.Assign(Temp_Images3.Picture);
          end;
//      end;
//    if Rad_Filter_Applied then
//      begin
        if Images4.Visible then
          begin
            QRImage8.Height:=Images4.Height+Digit;
            QRImage8.Picture.Assign(Images4.Picture);
          end;
        if Temp_Images4.Visible then
          begin
            QRImage8.Height:=900;//Temp_Images4.Height;
            QRImage8.Picture.Assign(Temp_Images4.Picture);
          end;
//      end;
QuickRep1.Repaint;
QuickRep1.Preview;
end;

procedure TForm1.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
      Images1.Canvas.CopyRect(Rect(0,0,FN1+50,625),Temp_Images1.Canvas,Rect(0,UpDown1.Position,FN1+50,UpDown1.Position+625));
      Images2.Canvas.CopyRect(Rect(0,0,FN2+50,625),Temp_Images2.Canvas,Rect(0,UpDown1.Position,FN2+50,UpDown1.Position+625));
      Images3.Canvas.CopyRect(Rect(0,0,FN1+50,625),Temp_Images3.Canvas,Rect(0,UpDown1.Position,FN1+50,UpDown1.Position+625));
      Images4.Canvas.CopyRect(Rect(0,0,FN2+50,625),Temp_Images4.Canvas,Rect(0,UpDown1.Position,FN2+50,UpDown1.Position+625));
end;

procedure TForm1.Up1Click(Sender: TObject);
begin
UpDown1.Position:=UpDown1.Position+UpDown1.Increment;
UpDown1.OnClick(Self,btNext);
end;

procedure TForm1.Down1Click(Sender: TObject);
begin
UpDown1.Position:=UpDown1.Position-UpDown1.Increment;
UpDown1.OnClick(Self,btPrev);
end;

end.


