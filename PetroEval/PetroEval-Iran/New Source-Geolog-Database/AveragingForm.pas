unit AveragingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Math;

type
  TAveraging_Form = class(TForm)
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Button4: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function Arithmetic_Average(Track_Number: Smallint):Real;
    function Geometric_Average(Track_Number: Smallint):Real;
    function Harmonic_Average(Track_Number: Smallint):Real;
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Averaging_Form: TAveraging_Form;
  Start_Depth, Stop_Depth: Single;
  Track_Number: Smallint;

implementation

uses Main_Form, TeEngine, SelectLog;

{$R *.dfm}

procedure TAveraging_Form.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TAveraging_Form.Button1Click(Sender: TObject);
var
Error_Code:Integer;
Temp_Value:Single;
begin
  if Track_Number=-1 then
    begin
      MessageDlg('Please select a track for averaging!', mtError, [mbOk], 0);
      Exit;
    end;
  Val(LabeledEdit2.Text, Temp_Value, Error_Code);
  if Error_Code<>0 then
    begin
      MessageDlg('Please enter a valid number for start depth!', mtError, [mbOk], 0);
      Exit;
    end
  else
    Start_Depth:=Temp_Value;
  Val(LabeledEdit3.Text, Temp_Value, Error_Code);
  if Error_Code<>0 then
    begin
      MessageDlg('Please enter a valid number for stop depth!', mtError, [mbOk], 0);
      Exit;
    end
  else
    Stop_Depth:=Temp_Value;

  Case RadioGroup1.ItemIndex of
    0:begin
        Edit1.Text:=FloatToStr(RoundTo(Arithmetic_Average(Track_Number),-8));
      end;
    1:begin
        Edit1.Text:=FloatToStr(RoundTo(Geometric_Average(Track_Number),-8));
      end;
    2:begin
        Edit1.Text:=FloatToStr(RoundTo(Harmonic_Average(Track_Number),-8));
      end;
  end;
end;

function TAveraging_Form.Arithmetic_Average(Track_Number: Smallint): Real;
var
i: Smallint;
Temp_Value: Real;
Sum_Value:Real;
Depth_Value:Real;
No_Values:Integer;
begin
try
  Sum_Value:=0;
  No_Values:=0;
  with MainForm do
    begin
      for i:=0 to Charts[Track_Number].Series[0].XValues.Count-1 do
        begin
          Temp_Value:=Charts[Track_Number].Series[0].XValue[i];
          Depth_Value:=Charts[Track_Number].Series[0].YValue[i];
          if (Depth_Value>=Start_Depth)and(Depth_Value<=Stop_Depth) then
            begin
              if Temp_Value<>LasFiles[0].NullValue then
                begin
                  Sum_Value:=Sum_Value+Temp_Value;
                  Inc(No_Values);
                end;
            end;
        end;
      if No_Values>0 then
        Arithmetic_Average:=Sum_Value/No_Values
      else
        Arithmetic_Average:=-999;
    end;
except
  Arithmetic_Average:=-999;
end;
end;

function TAveraging_Form.Geometric_Average(Track_Number: Smallint): Real;
var
i: Smallint;
Temp_Value: Real;
Depth_Value:Real;
Multiplication_Value:Extended;
No_Values:Integer;
Log_Power: Smallint;
begin
try
  Multiplication_Value:=1;
  No_Values:=0;
  Log_Power:=0;
  with MainForm do
    begin
      Temp_Value:=Charts[Track_Number].Series[0].MaxXValue;
      if Temp_value>0 then
        Log_Power:=Trunc(Log10(Temp_Value));
      for i:=0 to Charts[Track_Number].Series[0].XValues.Count-1 do
        begin
          Temp_Value:=Charts[Track_Number].Series[0].XValue[i];
          Depth_Value:=Charts[Track_Number].Series[0].YValue[i];
          if (Depth_Value>=Start_Depth)and(Depth_Value<=Stop_Depth) then
            begin
              if (Temp_Value<>LasFiles[0].NullValue)and(Temp_Value>0) then
                begin
                  Multiplication_Value:=Multiplication_Value*Temp_Value/Power(10, Log_Power);
                  Inc(No_Values);
                end;
            end;
        end;
      if No_Values>0 then
        Geometric_Average:=Power(Multiplication_Value,1/No_Values)*Power(10, Log_Power)
      else
        Geometric_Average:=-999;
    end;
except
  Geometric_Average:=-999;
end;
end;

function TAveraging_Form.Harmonic_Average(Track_Number: Smallint): Real;
var
i: Smallint;
Temp_Value: Real;
Depth_Value:Real;
Sum_Value:Real;
No_Values:Integer;
begin
try
  Sum_Value:=0;
  No_Values:=0;
  with MainForm do
    begin
      for i:=0 to Charts[Track_Number].Series[0].XValues.Count-1 do
        begin
          Temp_Value:=Charts[Track_Number].Series[0].XValue[i];
          Depth_Value:=Charts[Track_Number].Series[0].YValue[i];
          if (Depth_Value>=Start_Depth)and(Depth_Value<=Stop_Depth) then
            begin
              if (Temp_Value<>LasFiles[0].NullValue)and(Temp_Value<>0) then
                begin
                  Sum_Value:=Sum_Value+1/Temp_Value;
                  Inc(No_Values);
                end;
            end;
        end;
      if No_Values>0 then
        Harmonic_Average:=No_Values/Sum_Value
      else
        Harmonic_Average:=-999;
    end;
except
  Harmonic_Average:=-999;
end;
end;

procedure TAveraging_Form.Button4Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      Track_Number:=Select_Log.Selected_Track_Number;
      Label4.Caption:=MainForm.Charts[Track_Number].Axes.Top.Title.Caption;
    end;
  Select_Log.Free;
end;

end.
