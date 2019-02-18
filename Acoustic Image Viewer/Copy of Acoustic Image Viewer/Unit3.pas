unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ESBPCSEdit, ESBPCSNumEdit;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ESBPosEdit1: TESBPosEdit;
    ESBPosEdit2: TESBPosEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.DFM}

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
    Form1.KalmanFiltering1.SizeTeachingSequence:=ESBPosEdit2.AsInteger;
    Form1.KalmanFiltering1.FilterExponent:=ESBPosEdit1.AsInteger;
    if ComboBox1.ItemIndex=0 then
      Form1.Mode:= 'mdRecursive';
    if ComboBox1.ItemIndex=1 then
      Form1.Mode:= 'mdMovingAverage';
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
Form1.Canceled:=True;
end;

end.
