unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button5: TButton;
    Button6: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Button3: TButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit2: TEdit;
    Button4: TButton;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Edit3: TEdit;
    Button1: TButton;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    Edit4: TEdit;
    Button2: TButton;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    GroupBox9: TGroupBox;
    ComboBox1: TComboBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    GroupBox10: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    Edit7: TEdit;
    Button9: TButton;
    GroupBox11: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    Edit9: TEdit;
    Button11: TButton;
    GroupBox12: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    RadioButton19: TRadioButton;
    RadioButton20: TRadioButton;
    Edit10: TEdit;
    Button12: TButton;
    TabSheet6: TTabSheet;
    GroupBox16: TGroupBox;
    ScrollBox7: TScrollBox;
    GroupBox17: TGroupBox;
    ComboBox2: TComboBox;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    GroupBox13: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    RadioButton21: TRadioButton;
    RadioButton22: TRadioButton;
    Edit11: TEdit;
    Button13: TButton;
    GroupBox14: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    RadioButton23: TRadioButton;
    RadioButton24: TRadioButton;
    Edit12: TEdit;
    Button14: TButton;
    GroupBox15: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    RadioButton25: TRadioButton;
    RadioButton26: TRadioButton;
    Edit13: TEdit;
    Button15: TButton;
    GroupBox18: TGroupBox;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    ComboBox3: TComboBox;
    GroupBox8: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    RadioButton15: TRadioButton;
    RadioButton16: TRadioButton;
    Edit8: TEdit;
    Button10: TButton;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    Edit5: TEdit;
    Button7: TButton;
    GroupBox6: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    Edit6: TEdit;
    Button8: TButton;
    GroupBox7: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    RadioButton27: TRadioButton;
    RadioButton28: TRadioButton;
    Edit14: TEdit;
    Button16: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Main_Form;

{$R *.dfm}

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.Sw_Calculation_Method := PageControl1.TabIndex;
  MainForm.Shale_Calculation_Method := PageControl2.TabIndex;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=False;
  Close;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

end.
