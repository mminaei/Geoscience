unit CorrelationCoefficient;

interface

uses
  SysUtils, Graphics, VrLabel, Math, StdCtrls, Controls, Forms, Classes;

type
  TCorrelation_Coefficient = class(TForm)
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    ScrollBox2: TScrollBox;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Correlation_Coefficient: TCorrelation_Coefficient;
  FileNames     :array of TVrLabel;
  RadioButtons1 :array of TRadioButton;
  Labels1       :array of TVrLabel;
  Labels2       :array of TVrLabel;
  ForFree       :TLabel;

implementation

uses Main_Form;

function Calculate_Correlation_Coefficient(SourceLog : Smallint; CalculatedLog : Smallint):Real;
var
  SourceCount,
  CalculatedCount,
  Count : Integer;
  i     : Smallint;
  Xi,
  Yi,
  Xi2,
  Yi2,
  XiYi  : Real;
begin
  Xi:=0;
  Yi:=0;
  Xi2:=0;
  Yi2:=0;
  XiYi:=0;
  Calculate_Correlation_Coefficient:=0;
  with MainForm do
    begin
      try
        SourceCount:=Charts[SourceLog].Series[0].XValues.Count;
        CalculatedCount:=Charts[CalculatedLog].Series[0].XValues.Count;
        Count:=SourceCount;
        if CalculatedCount<Count then
          Count:=CalculatedCount;
        if Count=0 then
          begin
            Calculate_Correlation_Coefficient:=0;
            Exit;
          end;
        for i:=0 to Count-1 do
          begin
            if Charts[CalculatedLog].Series[0].XValues.Count<>0 then
              begin
                Xi:=RoundTo(Xi+Charts[SourceLog].Series[0].XValue[i],-4);
                Xi2:=RoundTo(Xi2+sqr(Charts[SourceLog].Series[0].XValue[i]),-4);
                Yi:=RoundTo(Yi+Charts[CalculatedLog].Series[0].XValue[i],-4);
                Yi2:=RoundTo(Yi2+sqr(Charts[CalculatedLog].Series[0].XValue[i]),-4);
                XiYi:=RoundTo(XiYi+Charts[CalculatedLog].Series[0].XValue[i]*Charts[SourceLog].Series[0].XValue[i],-4);
              end
            else
              Break;
          end;
        if sqrt((Xi2-(sqr(Xi)/Count))*(Yi2-(sqr(Yi)/Count)))<>0 then
          begin
            Calculate_Correlation_Coefficient:=RoundTo((XiYi-(Xi*Yi/Count))/sqrt((Xi2-(sqr(Xi)/Count))*(Yi2-(sqr(Yi)/Count))),-4);
          end;
      except
        Calculate_Correlation_Coefficient:=-999;
      end;
    end;
end;

{$R *.dfm}

procedure TCorrelation_Coefficient.FormCreate(Sender: TObject);
var
i,j,k: Smallint;
begin
  ForFree:=TLabel.Create(Self);
  k:=0;
  for i:=0 to MainForm.Number_of_Headers-1 do
    begin
      SetLength(FileNames, Length(FileNames)+1);
      FileNames[i]:=TVrLabel.Create(ForFree);
      FileNames[i].Caption:=MainForm.Headers[i].Caption;
      FileNames[i].AutoSize:=True;
      FileNames[i].Top:=15*k;
      FileNames[i].Left:=0;
      FileNames[i].Font.Style:=[fsBold];
      FileNames[i].Font.Size:=9;
      FileNames[i].Font.Name:='Tahoma';
      FileNames[i].Font.Color:=clGreen;
      FileNames[i].Transparent:=True;
      FileNames[i].Style:=lsNone;
      FileNames[i].Parent:=ScrollBox1;
      for j:=0 to (MainForm.Number_of_Tracks[i]-1) do
        begin
          SetLength(RadioButtons1, Length(RadioButtons1)+1);
          RadioButtons1[k-i]:=TRadioButton.Create(ForFree);
          RadioButtons1[k-i].Top:=15*(k+1);
          RadioButtons1[k-i].Left:=15;
          RadioButtons1[k-i].Font.Color:=$00FF8000;
          RadioButtons1[k-i].Font.Name:='Tahoma';
          RadioButtons1[k-i].Font.Size:=8;
          RadioButtons1[k-i].Width:=150;
          RadioButtons1[k-i].Caption:=MainForm.CheckBox[k-i].Caption;
          RadioButtons1[k-i].Checked:=False;
          RadioButtons1[k-i].Tag:=k-i;
          RadioButtons1[k-i].Parent:=ScrollBox1;
          k:=k+1;
        end;
      k:=k+1;
    end;
  k:=0;
  for i:=0 to MainForm.Number_of_Headers-1 do
    begin
      SetLength(FileNames, Length(FileNames)+1);
      FileNames[i]:=TVrLabel.Create(ForFree);
      FileNames[i].Caption:=MainForm.Headers[i].Caption;
      FileNames[i].AutoSize:=True;
      FileNames[i].Top:=15*k;
      FileNames[i].Left:=0;
      FileNames[i].Font.Style:=[fsBold];
      FileNames[i].Font.Size:=9;
      FileNames[i].Font.Name:='Tahoma';
      FileNames[i].Font.Color:=clGreen;
      FileNames[i].Transparent:=True;
      FileNames[i].AutoSize:=True;
      FileNames[i].Style:=lsNone;
      FileNames[i].Parent:=ScrollBox2;
      for j:=0 to (MainForm.Number_of_Tracks[i]-1) do
        begin
          SetLength(Labels1, Length(Labels1)+1);
          Labels1[k-i]:=TVrLabel.Create(ForFree);
          Labels1[k-i].Top:=15*(k+1);
          Labels1[k-i].Left:=15;
          Labels1[k-i].Font.Color:=$00FF8000;
          Labels1[k-i].Font.Name:='Tahoma';
          Labels1[k-i].Font.Size:=8;
          Labels1[k-i].AutoSize:=True;
          Labels1[k-i].Transparent:=True;
          Labels1[k-i].Alignment:=taLeftJustify;
          Labels1[k-i].Style:=lsNone;
          Labels1[k-i].Caption:=MainForm.CheckBox[k-i].Caption;
          Labels1[k-i].Parent:=ScrollBox2;
          SetLength(Labels2, Length(Labels2)+1);
          Labels2[k-i]:=TVrLabel.Create(ForFree);
          Labels2[k-i].Top:=15*(k+1);
          Labels2[k-i].Left:=130;
          Labels2[k-i].Font.Color:=clMaroon;
          Labels2[k-i].Font.Name:='Tahoma';
          Labels2[k-i].Font.Size:=8;
          Labels2[k-i].AutoSize:=True;
          Labels2[k-i].Alignment:=taLeftJustify;
          Labels2[k-i].Style:=lsNone;
          Labels2[k-i].Transparent:=True;
          Labels2[k-i].Caption:='';
          Labels2[k-i].Parent:=ScrollBox2;
          k:=k+1;
        end;
      k:=k+1;
    end;
end;

procedure TCorrelation_Coefficient.Button2Click(Sender: TObject);
var
i,j  : Smallint;
begin
  for i:=0 to Length(RadioButtons1)-1 do
    begin
      if RadioButtons1[i].Checked then
        begin
          for j:=0 to Length(MainForm.Charts)-1 do
            begin
              Labels2[j].Caption:=FloatToStr(RoundTo(Calculate_Correlation_Coefficient(i,j),-2));
            end;
        end;
    end;
end;

procedure TCorrelation_Coefficient.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Finalize(FileNames);
  Finalize(RadioButtons1);
  Finalize(Labels1);
  Finalize(Labels2);
  ForFree.Free;
end;

procedure TCorrelation_Coefficient.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
