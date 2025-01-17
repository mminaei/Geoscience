unit PreviewForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GmPropertyGraphic, ExtCtrls, GmTypes, GmClasses,
  GmPropertyComboBox, GmPageNavigator, GmThumbnails, GmCanvas, GmPageList,
  GmPreview, ClipBrd, Printers, Buttons;

type
  TPreview_Form = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    PageSetupDialog1: TPageSetupDialog;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure GetPreview;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure PrintArms;
    procedure PrintHeaders;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Preview_Form: TPreview_Form;

implementation

uses WaitingForm, Main_Form2;

{$R *.dfm}

procedure TPreview_Form.PrintArms;
begin
with MainForm2 do
  begin
    Image1.Transparent:=False;
    Image2.Transparent:=False;
    GmPreview1.Canvas.Font:=Label1.Font;
    GmPreview1.Canvas.TextOut((GmPreview1.PageWidth[gmPixels] - Label1.Width)/2,10, Label1.Caption);
    GmPreview1.Canvas.Font:=Label2.Font;
    GmPreview1.Canvas.TextOut((GmPreview1.PageWidth[gmPixels] - Label2.Width)/2,40, Label2.Caption);
    GmPreview1.Canvas.StretchDraw( 10, 10, 91, 72,Image1.Picture.Graphic);
    GmPreview1.Canvas.StretchDraw( GmPreview1.PageWidth[gmPixels]-Image1.Width-10, 10, GmPreview1.PageWidth[gmPixels]-Image1.Width+76, 72,Image2.Picture.Graphic);
    Image1.Transparent:=True;
    Image2.Transparent:=True;
  end;
end;

procedure TPreview_Form.PrintHeaders;
var
k:integer;
R1,R2:TRect;
PrintWidth:Byte;
Headerheight:Byte;
Bitmap1:TBitmap;
Bitmap2:TBitmap;
Bitmap3:TBitmap;
Bitmap4:TBitmap;
Bitmap5:TBitmap;
Bitmap6:TBitmap;
Bitmap7:TBitmap;
Bitmap8:TBitmap;
Bitmap9:TBitmap;
Bitmap10:TBitmap;
begin
  with MainForm2 do
    begin
      Bitmap1:=TBitMap.Create;
      Bitmap2:=TBitMap.Create;
      Bitmap3:=TBitMap.Create;
      Bitmap4:=TBitMap.Create;
      Bitmap5:=TBitMap.Create;
      Bitmap7:=TBitMap.Create;
      Bitmap8:=TBitMap.Create;
      Bitmap9:=TBitMap.Create;
      Bitmap10:=TBitMap.Create;
      try
        PrintWidth:=170;
        HeaderHeight:=80;
        k:=10;

        DBChart5.CopyToClipboardBitmap;
        Bitmap1.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);

        DBChart6.CopyToClipboardBitmap;
        Bitmap2.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);

        DBChart7.CopyToClipboardBitmap;
        Bitmap3.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);

        DBChart8.CopyToClipboardBitmap;
        Bitmap4.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);

        DBChart10.CopyToClipboardBitmap;
        Bitmap5.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
        try
          R1:=Rect(0, 0, DBChart5.Width, DBChart5.Height);
          R2:=Rect(0, 0, PrintWidth, DBChart10.Height);
          Bitmap6:=TBitMap.Create;
          Bitmap6.Width:=Bitmap1.Width;
          Bitmap6.Height:=DBChart10.Height;
          Bitmap6.Canvas.CopyRect(R2, Bitmap1.Canvas, R1);
          GmPreview1.Canvas.Draw( k ,HeaderHeight, Bitmap6);
          k:=k + PrintWidth;

          R1:=Rect(0, 0, DBChart6.Width, DBChart6.Height);
          R2:=Rect(0, 0, DBChart6.Width, DBChart10.Height);
          Bitmap7:=TBitMap.Create;
          Bitmap7.Width:=Bitmap2.Width;
          Bitmap7.Height:=DBChart10.Height;
          Bitmap7.Canvas.CopyRect(R2, Bitmap2.Canvas, R1);
          GmPreview1.Canvas.Draw( k ,HeaderHeight,Bitmap7);
          k:=k + DBChart6.Width ;

          R1:=Rect(0, 0, DBChart7.Width, DBChart7.Height);
          R2:=Rect(0, 0, PrintWidth, DBChart10.Height);
          Bitmap8:=TBitMap.Create;
          Bitmap8.Width:=Bitmap3.Width;
          Bitmap8.Height:=DBChart10.Height;
          Bitmap8.Canvas.CopyRect(R2, Bitmap3.Canvas, R1);
          GmPreview1.Canvas.Draw( k ,HeaderHeight,Bitmap8);
          k:=k + PrintWidth;

          R1:=Rect(0, 0, DBChart8.Width, DBChart8.Height);
          R2:=Rect(0, 0, PrintWidth, DBChart10.Height);
          Bitmap9:=TBitMap.Create;
          Bitmap9.Width:=Bitmap4.Width;
          Bitmap9.Height:=DBChart10.Height;
          Bitmap9.Canvas.CopyRect(R2, Bitmap4.Canvas, R1);
          GmPreview1.Canvas.Draw( k ,HeaderHeight,Bitmap9);
          k:=k + PrintWidth;

          R1:=Rect(0, 0, DBChart10.Width, DBChart10.Height);
          R2:=Rect(0, 0, DBChart10.Width, DBChart10.Height);
          Bitmap10:=TBitMap.Create;
          Bitmap10.Width:=Bitmap5.Width;
          Bitmap10.Height:=DBChart10.Height;
          Bitmap10.Canvas.CopyRect(R2, Bitmap5.Canvas, R1);
          GmPreview1.Canvas.Draw( k ,HeaderHeight,Bitmap10);

        finally
          Bitmap6.Free;
          Bitmap7.Free;
          Bitmap8.Free;
          Bitmap9.Free;
          Bitmap10.Free;
          GmPreview1.NextPage;
        end;
      finally
        Bitmap1.Free;
        Bitmap2.Free;
        Bitmap3.Free;
        Bitmap4.Free;
        Bitmap5.Free;
      end;
  end;
end;

procedure TPreview_Form.GetPreview;
var
i,j,k:integer;
Bitmap:TBitmap;
Bitmap1:TBitmap;
Bitmap2:TBitmap;
Bitmap3:TBitmap;
Bitmap4:TBitmap;
Bitmap5:TBitmap;
Bitmap6:TBitmap;
Bitmap7:TBitmap;
Bitmap8:TBitmap;
Bitmap9:TBitmap;
Bitmap10:TBitmap;
ChartPages:Integer;
ChartHeightPerPage:integer;
R1,R2:TRect;
AvailableHeight:Integer;
PrintWidth:Byte;
HeaderHeight:Byte;
FooterHeight:Byte;
begin
  Cursor:=crHourGlass;
  Bitmap:=nil;
  Bitmap2:=nil;
  MainForm2.Cursor:=crHourGlass;
  k:=0;
  HeaderHeight:=80;
  FooterHeight:=10;
  GmPreview1.BeginUpdate;
  PrintArms;
  AvailableHeight:=Round(GmPreview1.PageHeight[gmPixels])- FooterHeight - HeaderHeight;
      with MainForm2 do
        begin
          AvailableHeight:=Round(GmPreview1.PageHeight[gmPixels])- HeaderHeight - FooterHeight - DBChart10.Height;
          PrintHeaders;
          if DBChart1.Height > AvailableHeight then
            begin
              for i:=1 to (DBChart1.Height div AvailableHeight) do
                begin
                  GmPreview1.NewPage;
                  PrintArms;
                  PrintHeaders;
                end;
              ChartPages:=DBChart1.Height div AvailableHeight + 1;
              ChartHeightPerPage:=AvailableHeight;

              Bitmap1:=TBitMap.Create;
              Bitmap2:=TBitMap.Create;
              Bitmap3:=TBitMap.Create;
              Bitmap4:=TBitMap.Create;
              Bitmap5:=TBitMap.Create;
              Bitmap7:=TBitMap.Create;
              Bitmap8:=TBitMap.Create;
              Bitmap9:=TBitMap.Create;
              Bitmap10:=TBitMap.Create;
              try
                DBChart1.CopyToClipboardBitmap;
                Bitmap1.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
                DBChart2.CopyToClipboardBitmap;
                Bitmap2.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
                DBChart3.CopyToClipboardBitmap;
                Bitmap3.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
                DBChart4.CopyToClipboardBitmap;
                Bitmap4.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
                DBChart9.CopyToClipboardBitmap;
                Bitmap5.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
                GmPreview1.FirstPage;
                PrintWidth:=170;
                for i:=0 to ChartPages-1 do
                  begin
                    k:=10;
                    try
                      R1:=Rect(0, i*ChartHeightPerPage, DBChart1.Width, (i+1)*ChartHeightPerPage);
                      R2:=Rect(0, 0, PrintWidth, ChartHeightPerPage);
                      Bitmap6:=TBitMap.Create;
                      Bitmap6.Width:=Bitmap1.Width;
                      Bitmap6.Height:=ChartHeightPerPage;
                      Bitmap6.Canvas.CopyRect(R2, Bitmap1.Canvas, R1);
                      GmPreview1.Canvas.Draw( k ,HeaderHeight + DBChart10.Height, {150, ChartHeightPerPage,}Bitmap6);
                      k:=k + PrintWidth;

                      R1:=Rect(0, i*ChartHeightPerPage, DBChart2.Width, (i+1)*ChartHeightPerPage);
                      R2:=Rect(0, 0, DBChart2.Width, ChartHeightPerPage);
                      Bitmap7:=TBitMap.Create;
                      Bitmap7.Width:=Bitmap2.Width;
                      Bitmap7.Height:=ChartHeightPerPage;
                      Bitmap7.Canvas.CopyRect(R2, Bitmap2.Canvas, R1);
                      GmPreview1.Canvas.Draw( k ,HeaderHeight + DBChart10.Height,Bitmap7);
                      k:=k + DBChart2.Width ;

                      R1:=Rect(0, i*ChartHeightPerPage, DBChart3.Width, (i+1)*ChartHeightPerPage);
                      R2:=Rect(0, 0, PrintWidth, ChartHeightPerPage);
                      Bitmap8:=TBitMap.Create;
                      Bitmap8.Width:=Bitmap3.Width;
                      Bitmap8.Height:=ChartHeightPerPage;
                      Bitmap8.Canvas.CopyRect(R2, Bitmap3.Canvas, R1);
                      GmPreview1.Canvas.Draw( k ,HeaderHeight + DBChart10.Height,Bitmap8);
                      k:=k + PrintWidth;

                      R1:=Rect(0, i*ChartHeightPerPage, DBChart4.Width, (i+1)*ChartHeightPerPage);
                      R2:=Rect(0, 0, PrintWidth, ChartHeightPerPage);
                      Bitmap9:=TBitMap.Create;
                      Bitmap9.Width:=Bitmap4.Width;
                      Bitmap9.Height:=ChartHeightPerPage;
                      Bitmap9.Canvas.CopyRect(R2, Bitmap4.Canvas, R1);
                      GmPreview1.Canvas.Draw( k ,HeaderHeight + DBChart10.Height,Bitmap9);
                      k:=k + PrintWidth;

                      R1:=Rect(0, i*ChartHeightPerPage, DBChart9.Width, (i+1)*ChartHeightPerPage);
                      R2:=Rect(0, 0, DBChart9.Width, ChartHeightPerPage);
                      Bitmap10:=TBitMap.Create;
                      Bitmap10.Width:=Bitmap5.Width;
                      Bitmap10.Height:=ChartHeightPerPage;
                      Bitmap10.Canvas.CopyRect(R2, Bitmap5.Canvas, R1);
                      GmPreview1.Canvas.Draw( k ,HeaderHeight + DBChart10.Height,Bitmap10);
                    finally
                      Bitmap6.Free;
                      Bitmap7.Free;
                      Bitmap8.Free;
                      Bitmap9.Free;
                      Bitmap10.Free;
                      GmPreview1.NextPage;
                    end;
                  end;

              finally
                Bitmap1.Free;
                Bitmap2.Free;
                Bitmap3.Free;
                Bitmap4.Free;
                Bitmap5.Free;
              end;

            end
          else
            begin
              PrintHeaders;
              Bitmap1:=TBitMap.Create;
              Bitmap2:=TBitMap.Create;
              Bitmap3:=TBitMap.Create;
              Bitmap4:=TBitMap.Create;
              Bitmap5:=TBitMap.Create;
              HeaderHeight:= 80 + DBChart10.Height;
                try
                  DBChart1.CopyToClipboardBitmap;
                  Bitmap1.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
                  GmPreview1.Canvas.Draw( k ,HeaderHeight,Bitmap1);
                  k:=k+DBChart1.Width;

                  DBChart2.CopyToClipboardBitmap;
                  Bitmap2.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
                  GmPreview1.Canvas.Draw( k ,HeaderHeight,Bitmap2);
                  k:=k+DBChart2.Width;

                  DBChart3.CopyToClipboardBitmap;
                  Bitmap3.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
                  GmPreview1.Canvas.Draw( k ,HeaderHeight,Bitmap3);
                  k:=k+DBChart3.Width;

                  DBChart4.CopyToClipboardBitmap;
                  Bitmap4.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
                  GmPreview1.Canvas.Draw( k ,HeaderHeight,Bitmap4);
                  k:=k+DBChart4.Width;

                  DBChart9.CopyToClipboardBitmap;
                  Bitmap5.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
                  GmPreview1.Canvas.Draw( k ,HeaderHeight,Bitmap5);

                finally
                  Bitmap1.Free;
                  Bitmap2.Free;
                  Bitmap3.Free;
                  Bitmap4.Free;
                  Bitmap5.Free;
                end;
            end;

        end;

  GmPreview1.EndUpdate;
  Cursor:=crDefault;
  MainForm2.Cursor:=crDefault;
end;

procedure TPreview_Form.FormShow(Sender: TObject);
begin
      MainForm2.StatusBar1.Panels[0].Text:='Please wait...';
      MainForm2.StatusBar1.Refresh;
      Waiting_Form.Show;
      Waiting_Form.Refresh;

      GetPreview;

      Waiting_Form.Hide;
      MainForm2.StatusBar1.Panels[0].Text:='Ready';
end;

procedure TPreview_Form.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TPreview_Form.BitBtn2Click(Sender: TObject);
begin
  with PageSetupDialog1 do
    begin
      if Execute then
        begin
          GmPreview1.SetCustomPageSize(PageWidth/100, PageHeight/100, gmMillimeters);
          GetPreview;
        end;
    end;
end;

procedure TPreview_Form.BitBtn3Click(Sender: TObject);
begin
 if PrintDialog1.Execute then
   GmPreview1.Print;
end;

end.
