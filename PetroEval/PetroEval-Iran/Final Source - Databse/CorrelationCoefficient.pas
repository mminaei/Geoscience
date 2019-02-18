unit CorrelationCoefficient;

interface

uses
  SysUtils, Graphics, Math, StdCtrls, Controls, Forms, Classes,
  ExtCtrls;

type
  TCorrelation_Coefficient = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    ScrollBox1: TScrollBox;
    GroupBox2: TGroupBox;
    ScrollBox2: TScrollBox;
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
  FileNames     :array of TLabel;
  RadioButtons1 :array of TRadioButton;
  Labels1       :array of TLabel;
  Labels2       :array of TLabel;
  ForFree       :TLabel;

implementation

uses Main_Form, TeeTree;

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
        if (Xi2-(sqr(Xi)/Count))*(Yi2-(sqr(Yi)/Count))>0 then
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
i,j,k,m: Smallint;
begin
  ForFree:=TLabel.Create(Self);
  k:=0;
  m:=0;
  for i:=0 to MainForm.Tree1.Roots.Count-1 do
    begin
      if UpperCase(MainForm.Tree1.Roots[i].SimpleText)='LITHOLOGY LOG' then Continue;
      if UpperCase(MainForm.Tree1.Roots[i].SimpleText)='COMPOSITE LOG' then Continue;
      SetLength(FileNames, Length(FileNames)+1);
      FileNames[m]:=TLabel.Create(ForFree);
      FileNames[m].Caption:=MainForm.Tree1.Roots[i].SimpleText;
      FileNames[m].AutoSize:=True;
      FileNames[m].Top:=15*k;
      FileNames[m].Left:=0;
      FileNames[m].Font.Style:=[fsBold];
      FileNames[m].Font.Size:=9;
      FileNames[m].Font.Name:='Tahoma';
      FileNames[m].Font.Color:=clGreen;
      FileNames[m].Transparent:=True;
//      FileNames[m].Style:=lsNone;
      FileNames[m].Parent:=ScrollBox1;
      for j:=0 to (MainForm.Tree1.Roots[i].Childs.Count-1) do
        begin
          SetLength(RadioButtons1, Length(RadioButtons1)+1);
          RadioButtons1[k-m]:=TRadioButton.Create(ForFree);
          RadioButtons1[k-m].Top:=15*(k+1);
          RadioButtons1[k-m].Left:=15;
          RadioButtons1[k-m].Font.Color:=$00FF8000;
          RadioButtons1[k-m].Font.Name:='Tahoma';
          RadioButtons1[k-m].Font.Size:=8;
          RadioButtons1[k-m].Width:=150;
          RadioButtons1[k-m].Caption:=MainForm.Tree1.Roots[i].Childs[j].SimpleText;
          RadioButtons1[k-m].Checked:=False;
          RadioButtons1[k-m].Tag:=k-m;
          RadioButtons1[k-m].Parent:=ScrollBox1;
          k:=k+1;
        end;
      k:=k+1;
      m:=m+1;
    end;
  k:=0;
  m:=0;
  for i:=0 to MainForm.Tree1.Roots.Count-1 do
    begin
      if UpperCase(MainForm.Tree1.Roots[i].SimpleText)='LITHOLOGY LOG' then Continue;
      if UpperCase(MainForm.Tree1.Roots[i].SimpleText)='COMPOSITE LOG' then Continue;
      SetLength(FileNames, Length(FileNames)+1);
      FileNames[m]:=TLabel.Create(ForFree);
      FileNames[m].Caption:=MainForm.Tree1.Roots[i].SimpleText;
      FileNames[m].AutoSize:=True;
      FileNames[m].Top:=15*k;
      FileNames[m].Left:=0;
      FileNames[m].Font.Style:=[fsBold];
      FileNames[m].Font.Size:=9;
      FileNames[m].Font.Name:='Tahoma';
      FileNames[m].Font.Color:=clGreen;
      FileNames[m].Transparent:=True;
//      FileNames[m].Style:=lsNone;
      FileNames[m].Parent:=ScrollBox2;
      for j:=0 to (MainForm.Tree1.Roots[i].Childs.Count-1) do
        begin
          SetLength(Labels1, Length(Labels1)+1);
          Labels1[k-m]:=TLabel.Create(ForFree);
          Labels1[k-m].Top:=15*(k+1);
          Labels1[k-m].Left:=15;
          Labels1[k-m].Font.Color:=$00FF8000;
          Labels1[k-m].Font.Name:='Tahoma';
          Labels1[k-m].Font.Size:=8;
          Labels1[k-m].AutoSize:=True;
          Labels1[k-m].Transparent:=True;
          Labels1[k-m].Alignment:=taLeftJustify;
//          Labels1[k-m].Style:=lsNone;
          Labels1[k-m].Caption:=MainForm.Tree1.Roots[i].Childs[j].SimpleText;
          Labels1[k-m].Parent:=ScrollBox2;
          SetLength(Labels2, Length(Labels2)+1);
          Labels2[k-m]:=TLabel.Create(ForFree);
          Labels2[k-m].Top:=15*(k+1);
          Labels2[k-m].Left:=130;
          Labels2[k-m].Font.Color:=clMaroon;
          Labels2[k-m].Font.Name:='Tahoma';
          Labels2[k-m].Font.Size:=8;
          Labels2[k-m].AutoSize:=True;
          Labels2[k-m].Alignment:=taLeftJustify;
//          Labels2[k-m].Style:=lsNone;
          Labels2[k-m].Transparent:=True;
          Labels2[k-m].Caption:='';
          Labels2[k-m].Parent:=ScrollBox2;
          k:=k+1;
        end;
      k:=k+1;
      m:=m+1;
    end;
end;

procedure TCorrelation_Coefficient.Button2Click(Sender: TObject);
var
i,j  : Smallint;
Number_of_Logs:Smallint;
begin
  Number_of_Logs:=Length(MainForm.Charts);
  for i:=0 to MainForm.Tree1.Roots.Count-1 do
    begin
      if UpperCase(MainForm.Tree1.Roots[i].SimpleText)='LITHOLOGY LOG' then
        Number_of_Logs:=Number_of_Logs-1;
      if UpperCase(MainForm.Tree1.Roots[i].SimpleText)='COMPOSITE LOG' then
        Number_of_Logs:=Number_of_Logs-1;
    end;
  for i:=0 to Length(RadioButtons1)-1 do
    begin
      if RadioButtons1[i].Checked then
        begin
          for j:=0 to Number_of_Logs-1  do
            begin
              Labels2[j].Caption:='';
              Labels2[j].Caption:=FloatToStr(RoundTo(Calculate_Correlation_Coefficient(i,j),-2));
            end;
        end;
    end;
end;

procedure TCorrelation_Coefficient.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Visible:=False;
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
