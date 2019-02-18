unit ZoomedChart;

interface

uses
  Graphics, Controls, Forms, Chart, TeeStore,
  TeeEdit, Series, TeeProcs, TeEngine, ExtCtrls, Menus,
  SysUtils, TeeEditCha, Classes, Dialogs;

type
  TZoomChart = class(TForm)
    PrintDialog1: TPrintDialog;
    ChartEditor1: TChartEditor;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CreatePopup(Sender: TObject);
    procedure PopupClicked(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZoomChart: TZoomChart;
  Chart: TChart;

implementation

{$R *.dfm}

procedure TZoomChart.FormShow(Sender: TObject);
begin
  LoadChartFromFile(TCustomChart(Chart),'rocklog_temp');
  DeleteFile('rocklog_temp.tee');
  Chart.Align:=alClient;
  Chart.Parent:=ZoomChart;
  Chart.AllowPanning:=pmBoth;
  Chart.Zoom.Direction:=tzdBoth;
end;

procedure TZoomChart.FormCreate(Sender: TObject);
begin
  Chart:=TChart.Create(Self);
  ChartEditor1.Chart:=Chart;
  CreatePopup(Chart);
end;

procedure TZoomChart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Chart.Free;
end;

procedure TZoomChart.CreatePopup(Sender: TObject);
var
NewItem: TMenuItem;
Popup:TPopupMenu;
begin
  with Sender do
    begin
      Popup:=TPopupMenu.Create(Chart);
      Popup.AutoPopup:=True;
      Popup.Tag:=Tag;
      NewItem:=TMenuItem.Create(PopupMenu);
      NewItem.Tag:=Tag;
      Popup.Items.Add(NewItem);
      NewItem.Caption:='Print';
      NewItem.OnClick:=PopupClicked;
      NewItem:=TMenuItem.Create(PopupMenu);
      Popup.Items.Add(NewItem);
      NewItem.Caption:='Export';
      NewItem.OnClick:=PopupClicked;
      NewItem:=TMenuItem.Create(PopupMenu);
      Popup.Items.Add(NewItem);
      NewItem.Caption:='-';
      NewItem:=TMenuItem.Create(PopupMenu);
      Popup.Items.Add(NewItem);
      NewItem.Caption:='Axes Ranges';
      NewItem.OnClick:=PopupClicked;
      NewItem:=TMenuItem.Create(PopupMenu);
      Popup.Items.Add(NewItem);
      NewItem.Caption:='Values';
      NewItem.OnClick:=PopupClicked;
      NewItem:=TMenuItem.Create(PopupMenu);
      Popup.Items.Add(NewItem);
      NewItem.Caption:='-';
      NewItem:=TMenuItem.Create(PopupMenu);
      Popup.Items.Add(NewItem);
      NewItem.Caption:='Edit';
      NewItem.OnClick:=PopupClicked;
      PopupMenu:=Popup;
    end;
end;

procedure TZoomChart.PopupClicked(Sender: TObject);
begin
  with Sender as TMenuItem do
    begin
      Case MenuIndex of
        0:begin
            ChartEditor1.DefaultTab:=cetPrintPreview;
            ChartEditor1.Execute;
          end;
        1:begin
            ChartEditor1.DefaultTab:=cetExport;
            ChartEditor1.Execute;
          end;
        3:begin
            ChartEditor1.DefaultTab:=cetAxis;
            ChartEditor1.Execute;
          end;
        4:begin
            ChartEditor1.DefaultTab:=cetSeriesData;
            ChartEditor1.Execute;
          end;
        6:begin
            ChartEditor1.DefaultTab:=cetMain;
            ChartEditor1.Execute;
          end;
      end;
    end;
end;

end.
