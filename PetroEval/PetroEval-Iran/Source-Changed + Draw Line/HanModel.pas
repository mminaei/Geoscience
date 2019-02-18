unit HanModel;

interface

uses
  Forms, StdCtrls, Classes, Controls, ExtCtrls;

type
  THan_Model = class(TForm)
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Han_Model: THan_Model;

implementation

uses Main_Form;

{$R *.dfm}

procedure THan_Model.Button2Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure THan_Model.Button1Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=False;
  MainForm.Han_Method:=RadioGroup1.ItemIndex;
  MainForm.Han_Volume:=RadioGroup2.ItemIndex;
  Close;
end;

procedure THan_Model.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex=0 then
    begin
      RadioGroup2.Items[0]:='> 25 %';
      RadioGroup2.Items[1]:='< 25 %';
      RadioGroup2.Caption:='Clay Volume';
    end;
  if RadioGroup1.ItemIndex=1 then
    begin
      RadioGroup2.Items[0]:='> 15 %';
      RadioGroup2.Items[1]:='< 15 %';
      RadioGroup2.Caption:='Porosity Volume';
    end;
end;

end.
