unit ElasticChangeColorRange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sButtonControl, sCustomButton, StdCtrls;

type
  TElasticChangeColor = class(TForm)
    ColorDialog1: TColorDialog;
    Label1: TLabel;
    Label2: TLabel;
    sButton1: TsButton;
    sButton2: TsButton;
    Image1: TImage;
    Image2: TImage;
    procedure sButton2Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
     FirstColor, SecondColor: TColor;
    { Public declarations }
  end;

var
  ElasticChangeColor: TElasticChangeColor;

implementation

uses ElasticCorrelationP;

{$R *.dfm}

procedure TElasticChangeColor.sButton2Click(Sender: TObject);
begin
Case Tag of
  1: begin
       ElasticCorrelationPage.DBChart1.Series[0].SeriesColor:=FirstColor;
       ElasticCorrelationPage.DBChart1.Series[1].SeriesColor:=SecondColor;
       ElasticCorrelationPage.DBChart1.Axes.Top.Title.Font.Color:=FirstColor;
       ElasticCorrelationPage.DBChart1.Axes.Top.Axis.Color:=ColorDialog1.Color;
       ElasticCorrelationPage.DBChart1.Axes.Bottom.Axis.Color:=ColorDialog1.Color;
       ElasticCorrelationPage.DBChart1.Axes.Bottom.Title.Font.Color:=SecondColor;
     end;
  2: begin
       ElasticCorrelationPage.DBChart2.Series[0].SeriesColor:=FirstColor;
       ElasticCorrelationPage.DBChart2.Series[1].SeriesColor:=SecondColor;
       ElasticCorrelationPage.DBChart2.Axes.Top.Title.Font.Color:=FirstColor;
       ElasticCorrelationPage.DBChart2.Axes.Top.Axis.Color:=ColorDialog1.Color;
       ElasticCorrelationPage.DBChart2.Axes.Bottom.Axis.Color:=ColorDialog1.Color;
       ElasticCorrelationPage.DBChart2.Axes.Bottom.Title.Font.Color:=SecondColor;
     end;
  3: begin
       ElasticCorrelationPage.DBChart3.Series[0].SeriesColor:=FirstColor;
       ElasticCorrelationPage.DBChart3.Series[1].SeriesColor:=SecondColor;
       ElasticCorrelationPage.DBChart3.Axes.Top.Title.Font.Color:=FirstColor;
       ElasticCorrelationPage.DBChart3.Axes.Top.Axis.Color:=ColorDialog1.Color;
       ElasticCorrelationPage.DBChart3.Axes.Bottom.Axis.Color:=ColorDialog1.Color;
       ElasticCorrelationPage.DBChart3.Axes.Bottom.Title.Font.Color:=SecondColor;
     end;
  4: begin
       ElasticCorrelationPage.DBChart4.Series[0].SeriesColor:=FirstColor;
       ElasticCorrelationPage.DBChart4.Series[1].SeriesColor:=SecondColor;
       ElasticCorrelationPage.DBChart4.Axes.Top.Title.Font.Color:=FirstColor;
       ElasticCorrelationPage.DBChart4.Axes.Top.Axis.Color:=ColorDialog1.Color;
       ElasticCorrelationPage.DBChart4.Axes.Bottom.Axis.Color:=ColorDialog1.Color;
       ElasticCorrelationPage.DBChart4.Axes.Bottom.Title.Font.Color:=SecondColor;
     end;
  5: begin
       ElasticCorrelationPage.DBChart5.Series[0].SeriesColor:=FirstColor;
       ElasticCorrelationPage.DBChart5.Series[1].SeriesColor:=SecondColor;
       ElasticCorrelationPage.DBChart5.Axes.Top.Title.Font.Color:=FirstColor;
       ElasticCorrelationPage.DBChart5.Axes.Top.Axis.Color:=ColorDialog1.Color;
       ElasticCorrelationPage.DBChart5.Axes.Bottom.Axis.Color:=ColorDialog1.Color;
       ElasticCorrelationPage.DBChart5.Axes.Bottom.Title.Font.Color:=SecondColor;
     end;
end;
Close;
end;

procedure TElasticChangeColor.sButton1Click(Sender: TObject);
begin
Close;
end;

procedure TElasticChangeColor.Image1Click(Sender: TObject);
begin
if ColorDialog1.Execute then
  begin
    Case Tag of
      1:begin
          ElasticCorrelationPage.DBChart1.Series[0].SeriesColor:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart1.Axes.Top.Title.Font.Color:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart1.Axes.Top.Axis.Color:=ColorDialog1.Color;
          Image1.Canvas.Brush.Color:=ColorDialog1.Color;
          Image1.Canvas.FillRect(Rect(0,0,25,25));
        end;
      2:begin
          ElasticCorrelationPage.DBChart2.Series[0].SeriesColor:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart2.Axes.Top.Title.Font.Color:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart2.Axes.Top.Axis.Color:=ColorDialog1.Color;
          Image1.Canvas.Brush.Color:=ColorDialog1.Color;
          Image1.Canvas.FillRect(Rect(0,0,25,25));
        end;
      3:begin
          ElasticCorrelationPage.DBChart3.Series[0].SeriesColor:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart3.Axes.Top.Title.Font.Color:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart3.Axes.Top.Axis.Color:=ColorDialog1.Color;
          Image1.Canvas.Brush.Color:=ColorDialog1.Color;
          Image1.Canvas.FillRect(Rect(0,0,25,25));
        end;
      4:begin
          ElasticCorrelationPage.DBChart4.Series[0].SeriesColor:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart4.Axes.Top.Title.Font.Color:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart4.Axes.Top.Axis.Color:=ColorDialog1.Color;
          Image1.Canvas.Brush.Color:=ColorDialog1.Color;
          Image1.Canvas.FillRect(Rect(0,0,25,25));
        end;
      5:begin
          ElasticCorrelationPage.DBChart5.Series[0].SeriesColor:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart5.Axes.Top.Title.Font.Color:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart5.Axes.Top.Axis.Color:=ColorDialog1.Color;
          Image1.Canvas.Brush.Color:=ColorDialog1.Color;
          Image1.Canvas.FillRect(Rect(0,0,25,25));
        end;
    end;
  end;
end;

procedure TElasticChangeColor.Image2Click(Sender: TObject);
begin
if ColorDialog1.Execute then
  begin
    Case Tag of
      1:begin
          ElasticCorrelationPage.DBChart1.Series[1].SeriesColor:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart1.Axes.Bottom.Title.Font.Color:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart1.Axes.Bottom.Axis.Color:=ColorDialog1.Color;
          Image2.Canvas.Brush.Color:=ColorDialog1.Color;
          Image2.Canvas.FillRect(Rect(0,0,25,25));
        end;
      2:begin
          ElasticCorrelationPage.DBChart2.Series[1].SeriesColor:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart2.Axes.Bottom.Title.Font.Color:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart2.Axes.Bottom.Axis.Color:=ColorDialog1.Color;
          Image2.Canvas.Brush.Color:=ColorDialog1.Color;
          Image2.Canvas.FillRect(Rect(0,0,25,25));
        end;
      3:begin
          ElasticCorrelationPage.DBChart3.Series[1].SeriesColor:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart3.Axes.Bottom.Title.Font.Color:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart3.Axes.Bottom.Axis.Color:=ColorDialog1.Color;
          Image2.Canvas.Brush.Color:=ColorDialog1.Color;
          Image2.Canvas.FillRect(Rect(0,0,25,25));
        end;
      4:begin
          ElasticCorrelationPage.DBChart4.Series[1].SeriesColor:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart4.Axes.Bottom.Title.Font.Color:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart4.Axes.Bottom.Axis.Color:=ColorDialog1.Color;
          Image2.Canvas.Brush.Color:=ColorDialog1.Color;
          Image2.Canvas.FillRect(Rect(0,0,25,25));
        end;
      5:begin
          ElasticCorrelationPage.DBChart5.Series[1].SeriesColor:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart5.Axes.Bottom.Title.Font.Color:=ColorDialog1.Color;
          ElasticCorrelationPage.DBChart5.Axes.Bottom.Axis.Color:=ColorDialog1.Color;
          Image2.Canvas.Brush.Color:=ColorDialog1.Color;
          Image2.Canvas.FillRect(Rect(0,0,25,25));
        end;
    end;
  end;
end;

end.
