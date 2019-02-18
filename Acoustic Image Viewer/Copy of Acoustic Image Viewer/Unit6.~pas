unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TForm6 = class(TForm)
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit1;

{$R *.DFM}

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Case RadioGroup1.ItemIndex of
  0: Form1.Scale:=50;
  1: Form1.Scale:=200;
  2: Form1.Scale:=400;
end;
end;

procedure TForm6.BitBtn2Click(Sender: TObject);
begin
Form1.Canceled:=True;
end;

procedure TForm6.BitBtn1Click(Sender: TObject);
begin
Form1.Canceled:=False;
end;

end.
