unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ExtDlgs, ESBPCSEdit, ESBPCSNumEdit;

type
  TForm1 = class(TForm)
    Image1: TImage;
    SavePictureDialog1: TSavePictureDialog;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ESBFloatEdit1: TESBFloatEdit;
    ESBFloatEdit2: TESBFloatEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
i:integer;
begin
  Image1.Canvas.Font.Name:='Tahoma';
  Image1.Canvas.Font.Size:=8;
  Image1.Canvas.Font.Style:=[fsBold];
  Image1.Canvas.Pen.Width:=1;
  Image1.Canvas.MoveTo(45, Trunc(Image1.Height/2));
  Image1.Canvas.LineTo(55, Trunc(Image1.Height/2));
  for i:=1 to 10 do
    begin
      Image1.Canvas.MoveTo(45, Trunc(Image1.Height/2)+i*50);
      Image1.Canvas.LineTo(55, Trunc(Image1.Height/2)+i*50);
      Image1.Canvas.MoveTo(45, Trunc(Image1.Height/2)-i*50);
      Image1.Canvas.LineTo(55, Trunc(Image1.Height/2)-i*50);
    end;
  for i:=1 to 10 do
    begin
      Image1.Canvas.MoveTo(50+i*50, Trunc(Image1.Height/2)-5);
      Image1.Canvas.LineTo(50+i*50, Trunc(Image1.Height/2)+5);
    end;
  for i:=1 to 10 do
    begin
      Image1.Canvas.TextOut(45+i*50, Trunc(Image1.Height/2)-15, IntToStr(i*10));
    end;
  for i:=1 to 10 do
    begin
      Image1.Canvas.TextOut(35, Trunc(Image1.Height/2)-i*50-5, IntToStr(i*10));
      Image1.Canvas.TextOut(30, Trunc(Image1.Height/2)+i*50-5, IntToStr(-i*10));
    end;
  Image1.Canvas.MoveTo(50, 10);
  Image1.Canvas.LineTo(50, Image1.Height-10);
  Image1.Canvas.MoveTo(50, Trunc(Image1.Height/2));
  Image1.Canvas.LineTo(Image1.Width-10, Trunc(Image1.Height/2));

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
If SavePictureDialog1.Execute then
  Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
R:TRect;
begin
  R:=Rect(Trunc(ESBFloatEdit1.AsFloat*5)+50, Trunc(Image1.Height/2)-Trunc((ESBFloatEdit1.AsFloat-ESBFloatEdit2.AsFloat)/2*5), Trunc(ESBFloatEdit2.AsFloat*5)+50, Trunc(Image1.Height/2+Trunc((ESBFloatEdit1.AsFloat-ESBFloatEdit2.AsFloat)/2*5)));
  Image1.Canvas.Arc(R.Left, R.Top, R.Right, R.Bottom, R.Left, Trunc(Image1.Height/2), R.Right, Trunc(Image1.Height/2));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
i:integer;
begin
  Image1.Canvas.FillRect(Rect(0,0,Image1.Width,Image1.Height));
  Image1.Canvas.Font.Name:='Tahoma';
  Image1.Canvas.Font.Size:=8;
  Image1.Canvas.Font.Style:=[fsBold];
  Image1.Canvas.Pen.Width:=1;
  Image1.Canvas.MoveTo(45, Trunc(Image1.Height/2));
  Image1.Canvas.LineTo(55, Trunc(Image1.Height/2));
  for i:=1 to 10 do
    begin
      Image1.Canvas.MoveTo(45, Trunc(Image1.Height/2)+i*50);
      Image1.Canvas.LineTo(55, Trunc(Image1.Height/2)+i*50);
      Image1.Canvas.MoveTo(45, Trunc(Image1.Height/2)-i*50);
      Image1.Canvas.LineTo(55, Trunc(Image1.Height/2)-i*50);
    end;
  for i:=1 to 10 do
    begin
      Image1.Canvas.MoveTo(50+i*50, Trunc(Image1.Height/2)-5);
      Image1.Canvas.LineTo(50+i*50, Trunc(Image1.Height/2)+5);
    end;
  for i:=1 to 10 do
    begin
      Image1.Canvas.TextOut(45+i*50, Trunc(Image1.Height/2)-15, IntToStr(i*10));
    end;
  for i:=1 to 10 do
    begin
      Image1.Canvas.TextOut(35, Trunc(Image1.Height/2)-i*50-5, IntToStr(i*10));
      Image1.Canvas.TextOut(30, Trunc(Image1.Height/2)+i*50-5, IntToStr(-i*10));
    end;
  Image1.Canvas.MoveTo(50, 10);
  Image1.Canvas.LineTo(50, Image1.Height-10);
  Image1.Canvas.MoveTo(50, Trunc(Image1.Height/2));
  Image1.Canvas.LineTo(Image1.Width-10, Trunc(Image1.Height/2));

end;

end.
