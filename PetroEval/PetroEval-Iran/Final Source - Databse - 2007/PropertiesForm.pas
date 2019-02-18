unit PropertiesForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Math;

type
  TProperties_Form = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    GroupBox3: TGroupBox;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    GroupBox4: TGroupBox;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    Panel4: TPanel;
    GroupBox5: TGroupBox;
    LabeledEdit13: TLabeledEdit;
    LabeledEdit14: TLabeledEdit;
    LabeledEdit15: TLabeledEdit;
    GroupBox6: TGroupBox;
    LabeledEdit16: TLabeledEdit;
    LabeledEdit17: TLabeledEdit;
    LabeledEdit18: TLabeledEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    LithoType: Byte;
    { Public declarations }
  end;

var
  Properties_Form: TProperties_Form;

implementation

uses Main_Form2;

{$R *.dfm}

procedure TProperties_Form.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TProperties_Form.Button1Click(Sender: TObject);
begin
with MainForm2 do
  Case LithoType of
    1:begin

        DT_SST_MIN:=StrToFloat(LabeledEdit1.Text);
        DT_SST:=StrToFloat(LabeledEdit2.Text);
        DT_SST_MAX:=StrToFloat(LabeledEdit3.Text);

        RHO_SST_MIN:=StrToFloat(LabeledEdit4.Text);
        RHO_SST:=StrToFloat(LabeledEdit5.Text);
        RHO_SST_MAX:=StrToFloat(LabeledEdit6.Text);

        GR_SST_MIN:=StrToFloat(LabeledEdit7.Text);
        GR_SST:=StrToFloat(LabeledEdit8.Text);
        GR_SST_MAX:=StrToFloat(LabeledEdit9.Text);

        PEF_SST_MIN:=StrToFloat(LabeledEdit10.Text);
        PEF_SST:=StrToFloat(LabeledEdit11.Text);
        PEF_SST_MAX:=StrToFloat(LabeledEdit12.Text);

      end;
    2:begin

        DT_SHL_MIN:=StrToFloat(LabeledEdit1.Text);
        DT_SHL:=StrToFloat(LabeledEdit2.Text);
        DT_SHL_MAX:=StrToFloat(LabeledEdit3.Text);

        RHO_SHL_MIN:=StrToFloat(LabeledEdit4.Text);
        RHO_SHL:=StrToFloat(LabeledEdit5.Text);
        RHO_SHL_MAX:=StrToFloat(LabeledEdit6.Text);

        GR_SHL_MIN:=StrToFloat(LabeledEdit7.Text);
        GR_SHL:=StrToFloat(LabeledEdit8.Text);
        GR_SHL_MAX:=StrToFloat(LabeledEdit9.Text);

        PEF_SHL_MIN:=StrToFloat(LabeledEdit10.Text);
        PEF_SHL:=StrToFloat(LabeledEdit11.Text);
        PEF_SHL_MAX:=StrToFloat(LabeledEdit12.Text);

      end;
    3:begin

        DT_LST_MIN:=StrToFloat(LabeledEdit1.Text);
        DT_LST:=StrToFloat(LabeledEdit2.Text);
        DT_LST_MAX:=StrToFloat(LabeledEdit3.Text);

        RHO_LST_MIN:=StrToFloat(LabeledEdit4.Text);
        RHO_LST:=StrToFloat(LabeledEdit5.Text);
        RHO_LST_MAX:=StrToFloat(LabeledEdit6.Text);

        GR_LST_MIN:=StrToFloat(LabeledEdit7.Text);
        GR_LST:=StrToFloat(LabeledEdit8.Text);
        GR_LST_MAX:=StrToFloat(LabeledEdit9.Text);

        PEF_LST_MIN:=StrToFloat(LabeledEdit10.Text);
        PEF_LST:=StrToFloat(LabeledEdit11.Text);
        PEF_LST_MAX:=StrToFloat(LabeledEdit12.Text);

      end;
    4:begin

        DT_DOL_MIN:=StrToFloat(LabeledEdit1.Text);
        DT_DOL:=StrToFloat(LabeledEdit2.Text);
        DT_DOL_MAX:=StrToFloat(LabeledEdit3.Text);

        RHO_DOL_MIN:=StrToFloat(LabeledEdit4.Text);
        RHO_DOL:=StrToFloat(LabeledEdit5.Text);
        RHO_DOL_MAX:=StrToFloat(LabeledEdit6.Text);

        GR_DOL_MIN:=StrToFloat(LabeledEdit7.Text);
        GR_DOL:=StrToFloat(LabeledEdit8.Text);
        GR_DOL_MAX:=StrToFloat(LabeledEdit9.Text);

        PEF_DOL_MIN:=StrToFloat(LabeledEdit10.Text);
        PEF_DOL:=StrToFloat(LabeledEdit11.Text);
        PEF_DOL_MAX:=StrToFloat(LabeledEdit12.Text);

      end;
    5:begin

        DT_GPS_MIN:=StrToFloat(LabeledEdit1.Text);
        DT_GPS:=StrToFloat(LabeledEdit2.Text);
        DT_GPS_MAX:=StrToFloat(LabeledEdit3.Text);

        RHO_GPS_MIN:=StrToFloat(LabeledEdit4.Text);
        RHO_GPS:=StrToFloat(LabeledEdit5.Text);
        RHO_GPS_MAX:=StrToFloat(LabeledEdit6.Text);

        GR_GPS_MIN:=StrToFloat(LabeledEdit7.Text);
        GR_GPS:=StrToFloat(LabeledEdit8.Text);
        GR_GPS_MAX:=StrToFloat(LabeledEdit9.Text);

        PEF_GPS_MIN:=StrToFloat(LabeledEdit10.Text);
        PEF_GPS:=StrToFloat(LabeledEdit11.Text);
        PEF_GPS_MAX:=StrToFloat(LabeledEdit12.Text);

      end;
    6:begin

        DT_ANH_MIN:=StrToFloat(LabeledEdit1.Text);
        DT_SST:=StrToFloat(LabeledEdit2.Text);
        DT_SST_MAX:=StrToFloat(LabeledEdit3.Text);

        RHO_SST_MIN:=StrToFloat(LabeledEdit4.Text);
        RHO_SST:=StrToFloat(LabeledEdit5.Text);
        RHO_SST_MAX:=StrToFloat(LabeledEdit6.Text);

        GR_SST_MIN:=StrToFloat(LabeledEdit7.Text);
        GR_SST:=StrToFloat(LabeledEdit8.Text);
        GR_SST_MAX:=StrToFloat(LabeledEdit9.Text);

        PEF_SST_MIN:=StrToFloat(LabeledEdit10.Text);
        PEF_SST:=StrToFloat(LabeledEdit11.Text);
        PEF_SST_MAX:=StrToFloat(LabeledEdit12.Text);

      end;
  end;
Close;
end;

procedure TProperties_Form.FormShow(Sender: TObject);
begin
with MainForm2 do
  Case LithoType of
    1:begin
        Caption:='Lithology Properties of Sandstone';

        LabeledEdit1.Text:=FloatToStr(RoundTo(DT_SST_MIN, -2));
        LabeledEdit2.Text:=FloatToStr(RoundTo(DT_SST, -2));
        LabeledEdit3.Text:=FloatToStr(RoundTo(DT_SST_MAX, -2));

        LabeledEdit4.Text:=FloatToStr(RoundTo(RHO_SST_MIN, -2));
        LabeledEdit5.Text:=FloatToStr(RoundTo(RHO_SST, -2));
        LabeledEdit6.Text:=FloatToStr(RoundTo(RHO_SST_MAX, -2));

        LabeledEdit7.Text:=FloatToStr(RoundTo(GR_SST_MIN, -2));
        LabeledEdit8.Text:=FloatToStr(RoundTo(GR_SST, -2));
        LabeledEdit9.Text:=FloatToStr(RoundTo(GR_SST_MAX, -2));

        LabeledEdit10.Text:=FloatToStr(RoundTo(PEF_SST_MIN, -2));
        LabeledEdit11.Text:=FloatToStr(RoundTo(PEF_SST, -2));
        LabeledEdit12.Text:=FloatToStr(RoundTo(PEF_SST_MAX, -2));

        LabeledEdit13.Text:=FloatToStr(RoundTo(RES_SST_MIN, -2));
        LabeledEdit14.Text:=FloatToStr(RoundTo(RES_SST, -2));
        LabeledEdit15.Text:=FloatToStr(RoundTo(RES_SST_MAX, -2));

        LabeledEdit16.Text:=FloatToStr(RoundTo(NPHI_SST_MIN, -2));
        LabeledEdit17.Text:=FloatToStr(RoundTo(NPHI_SST, -2));
        LabeledEdit18.Text:=FloatToStr(RoundTo(NPHI_SST_MAX, -2));
      end;
    2:begin
        Caption:='Lithology Properties of Shale';

        LabeledEdit1.Text:=FloatToStr(RoundTo(DT_SHL_MIN, -2));
        LabeledEdit2.Text:=FloatToStr(RoundTo(DT_SHL, -2));
        LabeledEdit3.Text:=FloatToStr(RoundTo(DT_SHL_MAX, -2));

        LabeledEdit4.Text:=FloatToStr(RoundTo(RHO_SHL_MIN, -2));
        LabeledEdit5.Text:=FloatToStr(RoundTo(RHO_SHL, -2));
        LabeledEdit6.Text:=FloatToStr(RoundTo(RHO_SHL_MAX, -2));

        LabeledEdit7.Text:=FloatToStr(RoundTo(GR_SHL_MIN, -2));
        LabeledEdit8.Text:=FloatToStr(RoundTo(GR_SHL, -2));
        LabeledEdit9.Text:=FloatToStr(RoundTo(GR_SHL_MAX, -2));

        LabeledEdit10.Text:=FloatToStr(RoundTo(PEF_SHL_MIN, -2));
        LabeledEdit11.Text:=FloatToStr(RoundTo(PEF_SHL, -2));
        LabeledEdit12.Text:=FloatToStr(RoundTo(PEF_SHL_MAX, -2));

        LabeledEdit13.Text:=FloatToStr(RoundTo(RES_SHL_MIN, -2));
        LabeledEdit14.Text:=FloatToStr(RoundTo(RES_SHL, -2));
        LabeledEdit15.Text:=FloatToStr(RoundTo(RES_SHL_MAX, -2));

        LabeledEdit16.Text:=FloatToStr(RoundTo(NPHI_SHL_MIN, -2));
        LabeledEdit17.Text:=FloatToStr(RoundTo(NPHI_SHL, -2));
        LabeledEdit18.Text:=FloatToStr(RoundTo(NPHI_SHL_MAX, -2));
      end;
    3:begin
        Caption:='Lithology Properties of Limestone';

        LabeledEdit1.Text:=FloatToStr(RoundTo(DT_LST_MIN, -2));
        LabeledEdit2.Text:=FloatToStr(RoundTo(DT_LST, -2));
        LabeledEdit3.Text:=FloatToStr(RoundTo(DT_LST_MAX, -2));

        LabeledEdit4.Text:=FloatToStr(RoundTo(RHO_LST_MIN, -2));
        LabeledEdit5.Text:=FloatToStr(RoundTo(RHO_LST, -2));
        LabeledEdit6.Text:=FloatToStr(RoundTo(RHO_LST_MAX, -2));

        LabeledEdit7.Text:=FloatToStr(RoundTo(GR_LST_MIN, -2));
        LabeledEdit8.Text:=FloatToStr(RoundTo(GR_LST, -2));
        LabeledEdit9.Text:=FloatToStr(RoundTo(GR_LST_MAX, -2));

        LabeledEdit10.Text:=FloatToStr(RoundTo(PEF_LST_MIN, -2));
        LabeledEdit11.Text:=FloatToStr(RoundTo(PEF_LST, -2));
        LabeledEdit12.Text:=FloatToStr(RoundTo(PEF_LST_MAX, -2));

        LabeledEdit13.Text:=FloatToStr(RoundTo(RES_LST_MIN, -2));
        LabeledEdit14.Text:=FloatToStr(RoundTo(RES_LST, -2));
        LabeledEdit15.Text:=FloatToStr(RoundTo(RES_LST_MAX, -2));

        LabeledEdit16.Text:=FloatToStr(RoundTo(NPHI_LST_MIN, -2));
        LabeledEdit17.Text:=FloatToStr(RoundTo(NPHI_LST, -2));
        LabeledEdit18.Text:=FloatToStr(RoundTo(NPHI_LST_MAX, -2));
      end;
    4:begin
        Caption:='Lithology Properties of Dolomite';

        LabeledEdit1.Text:=FloatToStr(RoundTo(DT_DOL_MIN, -2));
        LabeledEdit2.Text:=FloatToStr(RoundTo(DT_DOL, -2));
        LabeledEdit3.Text:=FloatToStr(RoundTo(DT_DOL_MAX, -2));

        LabeledEdit4.Text:=FloatToStr(RoundTo(RHO_DOL_MIN, -2));
        LabeledEdit5.Text:=FloatToStr(RoundTo(RHO_DOL, -2));
        LabeledEdit6.Text:=FloatToStr(RoundTo(RHO_DOL_MAX, -2));

        LabeledEdit7.Text:=FloatToStr(RoundTo(GR_DOL_MIN, -2));
        LabeledEdit8.Text:=FloatToStr(RoundTo(GR_DOL, -2));
        LabeledEdit9.Text:=FloatToStr(RoundTo(GR_DOL_MAX, -2));

        LabeledEdit10.Text:=FloatToStr(RoundTo(PEF_DOL_MIN, -2));
        LabeledEdit11.Text:=FloatToStr(RoundTo(PEF_DOL, -2));
        LabeledEdit12.Text:=FloatToStr(RoundTo(PEF_DOL_MAX, -2));

        LabeledEdit13.Text:=FloatToStr(RoundTo(RES_DOL_MIN, -2));
        LabeledEdit14.Text:=FloatToStr(RoundTo(RES_DOL, -2));
        LabeledEdit15.Text:=FloatToStr(RoundTo(RES_DOL_MAX, -2));

        LabeledEdit16.Text:=FloatToStr(RoundTo(NPHI_DOL_MIN, -2));
        LabeledEdit17.Text:=FloatToStr(RoundTo(NPHI_DOL, -2));
        LabeledEdit18.Text:=FloatToStr(RoundTo(NPHI_DOL_MAX, -2));
      end;
    5:begin
        Caption:='Lithology Properties of Gypsum';

        LabeledEdit1.Text:=FloatToStr(RoundTo(DT_GPS_MIN, -2));
        LabeledEdit2.Text:=FloatToStr(RoundTo(DT_GPS, -2));
        LabeledEdit3.Text:=FloatToStr(RoundTo(DT_GPS_MAX, -2));

        LabeledEdit4.Text:=FloatToStr(RoundTo(RHO_GPS_MIN, -2));
        LabeledEdit5.Text:=FloatToStr(RoundTo(RHO_GPS, -2));
        LabeledEdit6.Text:=FloatToStr(RoundTo(RHO_GPS_MAX, -2));

        LabeledEdit7.Text:=FloatToStr(RoundTo(GR_GPS_MIN, -2));
        LabeledEdit8.Text:=FloatToStr(RoundTo(GR_GPS, -2));
        LabeledEdit9.Text:=FloatToStr(RoundTo(GR_GPS_MAX, -2));

        LabeledEdit10.Text:=FloatToStr(RoundTo(PEF_GPS_MIN, -2));
        LabeledEdit11.Text:=FloatToStr(RoundTo(PEF_GPS, -2));
        LabeledEdit12.Text:=FloatToStr(RoundTo(PEF_GPS_MAX, -2));

        LabeledEdit13.Text:=FloatToStr(RoundTo(RES_GPS_MIN, -2));
        LabeledEdit14.Text:=FloatToStr(RoundTo(RES_GPS, -2));
        LabeledEdit15.Text:=FloatToStr(RoundTo(RES_GPS_MAX, -2));

        LabeledEdit16.Text:=FloatToStr(RoundTo(NPHI_GPS_MIN, -2));
        LabeledEdit17.Text:=FloatToStr(RoundTo(NPHI_GPS, -2));
        LabeledEdit18.Text:=FloatToStr(RoundTo(NPHI_GPS_MAX, -2));
      end;
    6:begin
        Caption:='Lithology Properties of Anhydrite';

        LabeledEdit1.Text:=FloatToStr(RoundTo(DT_ANH_MIN, -2));
        LabeledEdit2.Text:=FloatToStr(RoundTo(DT_ANH, -2));
        LabeledEdit3.Text:=FloatToStr(RoundTo(DT_ANH_MAX, -2));

        LabeledEdit4.Text:=FloatToStr(RoundTo(RHO_ANH_MIN, -2));
        LabeledEdit5.Text:=FloatToStr(RoundTo(RHO_ANH, -2));
        LabeledEdit6.Text:=FloatToStr(RoundTo(RHO_ANH_MAX, -2));

        LabeledEdit7.Text:=FloatToStr(RoundTo(GR_ANH_MIN, -2));
        LabeledEdit8.Text:=FloatToStr(RoundTo(GR_ANH, -2));
        LabeledEdit9.Text:=FloatToStr(RoundTo(GR_ANH_MAX, -2));

        LabeledEdit10.Text:=FloatToStr(RoundTo(PEF_ANH_MIN, -2));
        LabeledEdit11.Text:=FloatToStr(RoundTo(PEF_ANH, -2));
        LabeledEdit12.Text:=FloatToStr(RoundTo(PEF_ANH_MAX, -2));

        LabeledEdit13.Text:=FloatToStr(RoundTo(RES_ANH_MIN, -2));
        LabeledEdit14.Text:=FloatToStr(RoundTo(RES_ANH, -2));
        LabeledEdit15.Text:=FloatToStr(RoundTo(RES_ANH_MAX, -2));

        LabeledEdit16.Text:=FloatToStr(RoundTo(NPHI_ANH_MIN, -2));
        LabeledEdit17.Text:=FloatToStr(RoundTo(NPHI_ANH, -2));
        LabeledEdit18.Text:=FloatToStr(RoundTo(NPHI_ANH_MAX, -2));
      end;
  end;
end;

procedure TProperties_Form.Button3Click(Sender: TObject);
begin
with MainForm2 do
  Case LithoType of
    1:begin
        LabeledEdit1.Text:='40';
        LabeledEdit2.Text:='55.5';
        LabeledEdit3.Text:='70';

        LabeledEdit4.Text:='2.5';
        LabeledEdit5.Text:='2.65';
        LabeledEdit6.Text:='2.8';

        LabeledEdit7.Text:='0';
        LabeledEdit8.Text:='15';
        LabeledEdit9.Text:='30';

        LabeledEdit10.Text:='1.3';
        LabeledEdit11.Text:='1.8';
        LabeledEdit12.Text:='2.3';

        LabeledEdit13.Text:='950';
        LabeledEdit14.Text:='1000';
        LabeledEdit15.Text:='1050';

        LabeledEdit16.Text:='-2.5';
        LabeledEdit17.Text:='-2';
        LabeledEdit18.Text:='-1.5';
      end;
    2:begin
        LabeledEdit1.Text:='70';
        LabeledEdit2.Text:='110';
        LabeledEdit3.Text:='150';

        LabeledEdit4.Text:='2.2';
        LabeledEdit5.Text:='2.5';
        LabeledEdit6.Text:='2.8';

        LabeledEdit7.Text:='80';
        LabeledEdit8.Text:='140';
        LabeledEdit9.Text:='250';

        LabeledEdit10.Text:='2.5';
        LabeledEdit11.Text:='3.5';
        LabeledEdit12.Text:='6.5';

        LabeledEdit13.Text:='0';
        LabeledEdit14.Text:='10';
        LabeledEdit15.Text:='60';

        LabeledEdit16.Text:='29.5';
        LabeledEdit17.Text:='30';
        LabeledEdit18.Text:='30.5';
      end;
    3:begin
        LabeledEdit1.Text:='34';
        LabeledEdit2.Text:='49';
        LabeledEdit3.Text:='64';

        LabeledEdit4.Text:='2.6';
        LabeledEdit5.Text:='2.71';
        LabeledEdit6.Text:='2.8';

        LabeledEdit7.Text:='0';
        LabeledEdit8.Text:='20';
        LabeledEdit9.Text:='35';

        LabeledEdit10.Text:='4.6';
        LabeledEdit11.Text:='5.1';
        LabeledEdit12.Text:='5.6';

        LabeledEdit13.Text:='950';
        LabeledEdit14.Text:='1000';
        LabeledEdit15.Text:='1050';

        LabeledEdit16.Text:='0.5';
        LabeledEdit17.Text:='1';
        LabeledEdit18.Text:='1.5';
      end;
    4:begin
        LabeledEdit1.Text:='29';
        LabeledEdit2.Text:='44';
        LabeledEdit3.Text:='59';

        LabeledEdit4.Text:='2.8';
        LabeledEdit5.Text:='2.87';
        LabeledEdit6.Text:='3';

        LabeledEdit7.Text:='0';
        LabeledEdit8.Text:='20';
        LabeledEdit9.Text:='35';

        LabeledEdit10.Text:='2.6';
        LabeledEdit11.Text:='3.1';
        LabeledEdit12.Text:='3.6';

        LabeledEdit13.Text:='950';
        LabeledEdit14.Text:='1000';
        LabeledEdit15.Text:='1050';

        LabeledEdit16.Text:='0.5';
        LabeledEdit17.Text:='1';
        LabeledEdit18.Text:='1.5';
      end;
    5:begin
        LabeledEdit1.Text:='37';
        LabeledEdit2.Text:='52';
        LabeledEdit3.Text:='67';

        LabeledEdit4.Text:='2.3';
        LabeledEdit5.Text:='2.32';
        LabeledEdit6.Text:='2.4';

        LabeledEdit7.Text:='0';
        LabeledEdit8.Text:='20';
        LabeledEdit9.Text:='35';

        LabeledEdit10.Text:='3.5';
        LabeledEdit11.Text:='4';
        LabeledEdit12.Text:='4.5';

        LabeledEdit13.Text:='950';
        LabeledEdit14.Text:='1000';
        LabeledEdit15.Text:='1050';

        LabeledEdit16.Text:='69.5';
        LabeledEdit17.Text:='70';
        LabeledEdit18.Text:='70.5';
      end;
    6:begin
        LabeledEdit1.Text:='35';
        LabeledEdit2.Text:='50';
        LabeledEdit3.Text:='65';

        LabeledEdit4.Text:='2.8';
        LabeledEdit5.Text:='2.9';
        LabeledEdit6.Text:='3';

        LabeledEdit7.Text:='0';
        LabeledEdit8.Text:='15';
        LabeledEdit9.Text:='30';

        LabeledEdit10.Text:='4.6';
        LabeledEdit11.Text:='5.1';
        LabeledEdit12.Text:='5.6';

        LabeledEdit13.Text:='950';
        LabeledEdit14.Text:='1000';
        LabeledEdit15.Text:='1050';

        LabeledEdit16.Text:='-2.5';
        LabeledEdit17.Text:='-2';
        LabeledEdit18.Text:='-1.5';
      end;
  end;
end;

end.
