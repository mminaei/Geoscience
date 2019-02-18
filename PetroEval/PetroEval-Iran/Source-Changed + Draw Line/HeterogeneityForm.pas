unit HeterogeneityForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Math;

type
  THeterogeneity_Form = class(TForm)
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    Panel1: TPanel;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Calculate_Vk;
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
  Case1='The reservoir is ideal homogeneous.';
  Case2='The reservoir is slightly heterogeneous. It can be approximated by a '+
        'homogeneous model in reservoir simulation with minimal error.';
  Case3='The reservoir is heterogeneous and geometric averaging technique is '+
        'applicable. If the index is closer to 0.5, run the numerical simulator '+
        'with the heterogeneous model.';
  Case4='The reservoir is very heterogeneous. A combination of geometric and '+
        'harmonic averaging technique is necessary';
  Case5='The reservoir is extremely heterogeneous, none of the conventional '+
        'averaging techniques (arithmetic, geometric and harmonic) are '+
        'applicable in this range.';
  Case6='The reservoir is perfectly heterogeneous. It is unlikely that such '+
        'reservoir exist, as geologic processes of deposition and accumulation '+
        'of sediments are not extreme.';

var
  Heterogeneity_Form: THeterogeneity_Form;
  K_Track_Number:Smallint;

implementation

uses Main_Form, SelectLog;

{$R *.dfm}

procedure THeterogeneity_Form.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure THeterogeneity_Form.Calculate_Vk;
var
i: Smallint;
K_Value: Real;
Sum_K_Values: Real;
K_Average: Real;
No_K_Values: Real;
Standard_Deviation: Real;
Vk_Value: Real;
begin
  Sum_K_Values:=0;
  No_K_Values:=0;
  Vk_Value:=-1;
  with MainForm  do
    begin
      for i:=1 to Charts[K_Track_Number].Series[0].Count-1 do
        begin
          K_Value:= Charts[K_Track_Number].Series[0].XValue[i];
          if K_Value<>NUll_Values[K_Track_Number] then
            begin
              Sum_K_Values:= Sum_K_Values + K_Value;
              No_K_Values:= No_K_Values + 1;
            end;
        end;
      if (Sum_K_Values>0)and(No_K_Values>0) then
        begin
          K_Average:= Sum_K_Values / No_K_Values;
// Sum_K_Values is set zero to be used again in calculation of standard deviation.
          Sum_K_Values:=0;
          for i:=0 to Charts[K_Track_Number].Series[0].Count-1 do
            begin
              K_Value:= Charts[K_Track_Number].Series[0].XValue[i];
              if K_Value<>NUll_Values[K_Track_Number] then
                begin
                  Sum_K_Values:= Sum_K_Values + sqr(K_Value - K_Average);
                end;
            end;
          Standard_Deviation:= sqrt(Sum_K_Values / No_K_Values);
          if K_Average<>0 then
            Vk_Value:= RoundTo(Standard_Deviation / K_Average, -4);
          Edit1.Text:= FloatToStr(Vk_Value);
          if Vk_Value=0 then
            begin
              Memo1.Lines.Clear;
              Memo1.Lines.Add(Case1);
            end
          else if (Vk_Value>0)and(Vk_Value<=0.25) then
            begin
              Memo1.Lines.Clear;
              Memo1.Lines.Add(Case2);
            end
          else if (Vk_Value>0.25)and(Vk_Value<=0.5) then
            begin
              Memo1.Lines.Clear;
              Memo1.Lines.Add(Case3);
            end
          else if (Vk_Value>0.5)and(Vk_Value<=0.75) then
            begin
              Memo1.Lines.Clear;
              Memo1.Lines.Add(Case4);
            end
          else if (Vk_Value>0.75)and(Vk_Value<1) then
            begin
              Memo1.Lines.Clear;
              Memo1.Lines.Add(Case5);
            end
          else if (Vk_Value=1) then
            begin
              Memo1.Lines.Clear;
              Memo1.Lines.Add(Case6);
            end
        end
      else
        MessageDlg('Number of K values is zero!', mtWarning, [mbOk], 0);
    end;
end;

procedure THeterogeneity_Form.Button3Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  K_Track_Number:=Select_Log.Selected_Track_Number;
  if K_Track_Number<>-1 then
    begin
      Label2.Caption:=MainForm.Charts[K_Track_Number].Title.Text.Text;
      Calculate_Vk;
    end;
  Select_Log.Free;
end;

end.
