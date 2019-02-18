unit TextFileForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TTextFile_Form = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TextFile_Form: TTextFile_Form;

implementation

uses Main_Form;

{$R *.dfm}

procedure TTextFile_Form.Button2Click(Sender: TObject);
begin
  MainForm.Operation_Canceled:=True;
  Close;
end;

procedure TTextFile_Form.Button1Click(Sender: TObject);
var
s:string;
begin
  with MainForm do
    begin
      Operation_Canceled:=False;
      s:=UpperCase(ComboBox1.Text);
      if s='COMMA' then DLMChar:=','
      else if s='SPACE' then DLMChar:=' '
      else if s='TAB' then DLMChar:=#9
      else DLMChar:=' ';
      No_Lines_Skip:=Edit1.Text;
      StepValueString:='0.15';
      Depth_Column:=Edit3.Text;
      DepthUnitString:=Edit4.Text;
      NullValueString:=Edit5.Text;
      ;
    end;
  Close;
end;

end.
