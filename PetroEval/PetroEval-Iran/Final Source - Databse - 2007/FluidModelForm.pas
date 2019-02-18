unit FluidModelForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Math;

type
  TFluid_Model_Form = class(TForm)
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fluid_Model_Form: TFluid_Model_Form;

implementation

uses Main_Form2;

{$R *.dfm}

procedure TFluid_Model_Form.Button2Click(Sender: TObject);
begin
  with MainForm2 do
    begin
      DT_WTR:=189;
      RHO_WTR:=1;
      GR_WTR:=0;
      RES_WTR:=0;
      NPHI_WTR:=0;
      PEF_WTR:=0;
      LabeledEdit1.Text:=FloatToStr(RoundTo(DT_WTR, -2));
      LabeledEdit2.Text:=FloatToStr(RoundTo(RHO_WTR, -2));
      LabeledEdit3.Text:=FloatToStr(RoundTo(GR_WTR, -2));
      LabeledEdit4.Text:=FloatToStr(RoundTo(RES_WTR, -2));
      LabeledEdit5.Text:=FloatToStr(RoundTo(NPHI_WTR, -2));
      LabeledEdit6.Text:=FloatToStr(RoundTo(PEF_WTR, -2));
    end;
end;

procedure TFluid_Model_Form.Button1Click(Sender: TObject);
begin
  with MainForm2 do
    begin
      DT_WTR:=StrToFloat(LabeledEdit1.Text);
      RHO_WTR:=StrToFloat(LabeledEdit2.Text);
      GR_WTR:=StrToFloat(LabeledEdit3.Text);
      RES_WTR:=StrToFloat(LabeledEdit4.Text);
      NPHI_WTR:=StrToFloat(LabeledEdit5.Text);
      PEF_WTR:=StrToFloat(LabeledEdit6.Text);
    end;
  Close;
end;

procedure TFluid_Model_Form.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TFluid_Model_Form.FormCreate(Sender: TObject);
begin
  Button2Click(Self);
end;

end.
