unit ModuleForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtActns, sButtonControl, sCustomButton, VrControls,
  VrButtons, VrDesign, VrFormShape, Buttons, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    BitBtn6: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  OpenIt: TFileRun;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
OpenIt.FileName:='rocklog.exe';
if not OpenIt.Execute then
 begin
   MessageDlg('Specified module not found !', mtError, [mbOk],0);
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
OpenIt:=TFileRun.Create(Application);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
OpenIt.FileName:='aiv.exe';
if not OpenIt.Execute then
 begin
   MessageDlg('Specified module not found !', mtError, [mbOk],0);
 end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
OpenIt.FileName:='EMI.exe';
if not OpenIt.Execute then
 begin
   MessageDlg('Specified module not found !', mtError, [mbOk],0);
 end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
OpenIt.FileName:='DLISConvertor.exe';
if not OpenIt.Execute then
 begin
   MessageDlg('Specified module not found !', mtError, [mbOk],0);
 end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
OpenIt.FileName:='SEG-SSAConvertor.exe';
if not OpenIt.Execute then
 begin
   MessageDlg('Specified module not found !', mtError, [mbOk],0);
 end;
end;

end.
