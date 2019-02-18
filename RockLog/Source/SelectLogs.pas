unit SelectLogs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sButtonControl, sCustomButton, VrControls, VrLabel, StdCtrls;

type
  TSelectPL = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    VrLabel1: TVrLabel;
    VrLabel2: TVrLabel;
    VrLabel3: TVrLabel;
    VrLabel4: TVrLabel;
    VrLabel5: TVrLabel;
    sButton1: TsButton;
    sButton2: TsButton;
    procedure FormCreate(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectPL: TSelectPL;

implementation
uses CalculationPage;
{$R *.dfm}

procedure TSelectPL.FormCreate(Sender: TObject);
var
i:integer;
begin
with CalculationForm do
  begin
    for i:=1 to Rhow do
      begin
        ComboBox1.Items.Add(RhoFields[i])
      end;
    for i:=1 to GRw do
      begin
        ComboBox2.Items.Add(GRFields[i])
      end;
    for i:=1 to Vpw do
      begin
        ComboBox3.Items.Add(VpFields[i])
      end;
    for i:=1 to Vsw do
      begin
        ComboBox4.Items.Add(VsFields[i])
      end;
  end;
  ComboBox1.Text:=ComboBox1.Items.Strings[0];
  ComboBox2.Text:=ComboBox2.Items.Strings[0];
  ComboBox3.Text:=ComboBox3.Items.Strings[0];
  ComboBox4.Text:=ComboBox4.Items.Strings[0];
end;

procedure TSelectPL.sButton1Click(Sender: TObject);
begin
  with CalculationForm do
    begin
      RhoField:=ComboBox1.Text;
      GRField:=ComboBox2.Text;
      VpField:=ComboBox3.Text;
      VsField:=ComboBox4.Text;
      CCanceled:=False;
    end;
  Close;
end;

procedure TSelectPL.sButton2Click(Sender: TObject);
begin
  Close;
end;

end.
