unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ESBPCSEdit, ESBPCSNumEdit;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ESBPosEdit2: TESBPosEdit;
    Label6: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ESBPosEdit1: TESBPosFloatEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1;

{$R *.DFM}

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
Form1.Canceled:=True;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
    Form1.lpf.Bandwidth:=ESBPosEdit1.AsFloat;
    Form1.lpf.FrequencyResolution:=ESBPosEdit2.AsInteger;

    if ComboBox1.ItemIndex=0 then
      Form1.Mode:= 'Low-Pass Filter';
    if ComboBox1.ItemIndex=1 then
      Form1.Mode:= 'None Filtering';
    if ComboBox1.ItemIndex=2 then
      Form1.Mode:= 'Subtraction Noise';

    if ComboBox2.ItemIndex=0 then
      Form1.lpf.Overshoot:= True;
    if ComboBox2.ItemIndex=1 then
      Form1.lpf.Overshoot:= False;

    if ComboBox3.ItemIndex=0 then
      Form1.NoiseDegreeMode:= 'edLarge';
    if ComboBox3.ItemIndex=1 then
      Form1.NoiseDegreeMode:= 'edMedium';
    if ComboBox3.ItemIndex=2 then
      Form1.NoiseDegreeMode:= 'edSmall';

    if ComboBox4.ItemIndex=0 then
      Form1.SupressionDegreeMode:= 'edLarge';
    if ComboBox4.ItemIndex=1 then
      Form1.SupressionDegreeMode:= 'edMedium';
    if ComboBox4.ItemIndex=2 then
      Form1.SupressionDegreeMode:= 'edSmall';

end;

end.
