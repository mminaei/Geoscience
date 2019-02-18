unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, StdCtrls, QRPrntr, ToolWin, ComCtrls;

type
  TForm6 = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    QRImage1: TQRImage;
    ToolBar1: TToolBar;
    Button1: TButton;
    Button2: TButton;
    QRImage2: TQRImage;
    QRLabel1: TQRLabel;
    QRPreview1: TQRPreview;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TForm6.Button1Click(Sender: TObject);
var
Pat,Path:String;
P:Integer;
buffer: array [0..255] of char;
begin
   QuickRep1.Prepare;
   try
{      Pat:=Application.ExeName;
      P:=Pos('AIV.exe',Pat);
      if P=0 then
        P:=Pos('AIV.EXE',Pat);
      Path:='';
      Path := Copy(Pat, 1, P - 1);     }
      GetTempPath(SizeOf(buffer),buffer);
      ChDir(buffer);
      QuickRep1.QRPrinter.PaperSize:=Custom;
      QuickRep1.QRPrinter.PrintSetup;
      if FileExists('report.qrp.tmp') then
        begin
//          if DeleteFile('report.qrp') then ShowMessage('DELETED') else ShowMessage('NOT DELETED')
          DeleteFile('report.qrp');
        end;
      QuickRep1.QRPrinter.Save('report.qrp.tmp');
      QuickRep1.Preview;
   finally
      QuickRep1.QRPrinter.Free;
   end;
   QuickRep1.QRPrinter := nil;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
QuickRep1.Height:=Form1.Temp_Images1.Height+150;
QuickRep1.Visible:=False;
QRPreview1.Height:=Form1.Temp_Images1.Height+500;
with Form1 do
  begin
    if Original_Amp_Image then
      begin
        QRImage1.Height:=Temp_Images1.Height;
        QRImage1.Width:=Temp_Images1.Width;
        QRImage1.Picture.Assign(Temp_Images1.Picture);
      end;
    if Original_Rad_Image then
      begin
        QRImage2.Height:=Temp_Images2.Height;
        QRImage2.Width:=Temp_Images2.Width;
        QRImage2.Picture.Assign(Temp_Images2.Picture);
      end;
  end;
end;

procedure TForm6.QuickRep1Preview(Sender: TObject);
begin
QRPreview1.QRPrinter := TQRPrinter(Sender);
   Button1.Enabled:=False;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
QRPreview1.QRPrinter.Load('report.qrp.tmp');
if QRPreview1.QRPrinter.ReportLoaded then
  begin
    QRPreview1.QRPrinter.Print;
  end;
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
var
buffer: array [0..255] of char;
begin
  GetTempPath(SizeOf(buffer),buffer);
  ChDir(buffer);
  if FileExists('report.qpr.tmp') then
    DeleteFile('report.qpr.tmp');
end;

end.
