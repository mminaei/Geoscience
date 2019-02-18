unit SelectLOgPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VrControls, VrLabel, StdCtrls, ExtCtrls, sButtonControl,
  sCustomButton;

type
  Tselectlog = class(TForm)
    RadioGroup1: TRadioGroup;
    VrLabel1: TVrLabel;
    sButton2: TsButton;
    sButton1: TsButton;
    procedure FormCreate(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  selectlog: Tselectlog;

implementation

uses CalculationPage;

{$R *.dfm}

procedure Tselectlog.FormCreate(Sender: TObject);
var
i:integer;
begin
with CalculationForm do
  begin
    for i:=1 to Rhow do
      begin
        RadioGroup1.Items.Add(RhoFields[i])
      end;
    for i:=1 to GRw do
      begin
        RadioGroup1.Items.Add(GRFields[i])
      end;
  end;
 RadioGroup1.ItemIndex:=0; 
end;

procedure Tselectlog.sButton1Click(Sender: TObject);
begin
  CalculationForm.SourceLogF:=RadioGroup1.Items[RadioGroup1.ItemIndex];
  Close;
end;

procedure Tselectlog.sButton2Click(Sender: TObject);
begin
  Close;
end;

end.
