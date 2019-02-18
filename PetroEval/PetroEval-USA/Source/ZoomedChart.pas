unit ZoomedChart;

interface

uses
  Graphics, Controls, Forms, Chart, TeeStore, StdCtrls, TeeEdit, Classes,
  Dialogs, Series, TeeProcs, TeEngine, ExtCtrls, Menus,
  SysUtils, TeeEditCha, TeeTools;

type
  TZoomChart = class(TForm)
    PrintDialog1: TPrintDialog;
    ChartPreviewer1: TChartPreviewer;
    ChartEditor1: TChartEditor;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CreatePopup(Sender: TObject);
    procedure PopupClicked(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PopLogarithmic(Sender: TObject);
    procedure ChartScroll(Sender: TObject);
  private
    Chart: TChart;
    ForFree: TLabel;
    { Private declarations }
  public
    Zoom_From:Byte;
    { Public declarations }
  end;

var
  ZoomChart: TZoomChart;

implementation

uses Main_Form, Main_Form2;

{$R *.dfm}

procedure TZoomChart.FormShow(Sender: TObject);
var
  AxisScroller: TAxisScrollTool;
  AxisArrow: TAxisArrowTool;
  i:integer;
begin
  if Zoom_From=0 then
    LoadChartFromFile(TCustomChart(Chart),MainForm.Temp_Zoom_File)
  else if Zoom_From=1 then
    LoadChartFromFile(TCustomChart(Chart),MainForm2.Temp_Zoom_File);

  if Zoom_From=0 then
    DeleteFile(MainForm.Temp_Zoom_File+'.tee')
  else if Zoom_From=1 then
    DeleteFile(MainForm2.Temp_Zoom_File+'.tee');

  if Chart.Series[0].VertAxis=aRightAxis then
    begin
      Chart.Axes.Left.SetMinMax(Chart.Axes.Right.Minimum, Chart.Axes.Right.Maximum);
      Chart.Axes.Left.Title.Visible:=True;
      Chart.Axes.Right.Visible:=False;
      for i:=0 to Chart.SeriesCount-1 do
        begin
          Chart.Series[i].VertAxis:=aLeftAxis;
        end;
    end;
  for i:=0 to Chart.CustomAxes.Count-1 do
    begin
      Chart.CustomAxes[i].Visible:=True;
      Chart.CustomAxes[i].Axis.Visible:=True;
      Chart.CustomAxes[i].Labels:=True;
      Chart.CustomAxes[i].MinorTicks.Visible:=True;
      Chart.CustomAxes[i].Ticks.Visible:=True;
      Chart.MarginTop:=Chart.MarginTop + 40;
    end;
  Chart.Align:=alClient;
  Chart.Parent:=ZoomChart;
  Chart.AllowPanning:=pmBoth;
  Chart.Zoom.Direction:=tzdBoth;
  Chart.Axes.Left.TickOnLabelsOnly:=True;
  Chart.Axes.Left.Axis.Visible:=True;
  Chart.Axes.Left.Ticks.Visible:=True;
  Chart.Axes.Left.Labels:=True;
  Chart.Axes.Left.MinorTicks.Visible:=True;
  Chart.Axes.Left.Visible:=True;
  Chart.Axes.Left.LabelsFont.Name:='Tahoma';
  Chart.Axes.Left.LabelsFont.Style:=[fsBold];
  Chart.MarginRight:=30;
  Chart.OnScroll:=ChartScroll;
  CreatePopup(Chart);
  AxisScroller:=TAxisScrollTool.Create(Chart);
  AxisScroller.ParentChart:=Chart;
  AxisScroller.Axis:=Chart.Axes.Left;
  AxisArrow:=TAxisArrowTool.Create(Chart);
  AxisArrow.ParentChart:=Chart;
  AxisArrow.Axis:=Chart.Axes.Left;
  AxisArrow.ScrollInverted:=True;
{  MarkTool:=TMarksTipTool.Create(Charts[Chart_Index]);
  MarkTool.ParentChart:=Charts[Chart_Index];
  MarkTool.Style:=smsXY;
  MarkTool.MouseAction:=mtmClick;
  MarkTool.Series:=Log_Values;  }
end;

procedure TZoomChart.ChartScroll(Sender: TObject);
begin
  Chart.Cursor:=crSizeAll;
end;

procedure TZoomChart.FormCreate(Sender: TObject);
begin
  ForFree:=TLabel.Create(Self);
  Chart:=TChart.Create(ForFree);
  ChartEditor1.Chart:=Chart;
end;

procedure TZoomChart.CreatePopup(Sender: TObject);
var
NewItem: TMenuItem;
Popup:TPopupMenu;
i, j :integer;
Is_Logarithmic:Boolean;
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
      if Chart.Axes.Top.Logarithmic=True then
        begin
          NewItem.Caption:='Make Ordinal';
          Chart.Axes.Top.MinorTickCount:=4;
        end
      else
        begin
          NewItem.Caption:='Make Logarithmic';
          Chart.Axes.Top.MinorTickCount:=8;
        end;

      j:=Chart.CustomAxes.Count;
      for i:=j downto 1 do
        begin
          Is_Logarithmic:=Chart.Axes[Chart.Axes.Count-i].Logarithmic;
          if not Is_Logarithmic then
              NewItem.Caption:='Make Logarithmic'
          else
              NewItem.Caption:='Make Ordinal';
        end;

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
            ChartPreviewer1.Chart:=Chart;
            ChartPreviewer1.Execute;
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
            PopLogarithmic(Sender);
          end;
        5:begin
            ChartEditor1.DefaultTab:=cetSeriesData;
            ChartEditor1.Execute;
          end;
        7:begin
            ChartEditor1.DefaultTab:=cetPanel;
            ChartEditor1.Execute;
          end;
      end;
    end;
end;

procedure TZoomChart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ForFree.Free;
  Action:=caFree;
end;

procedure TZoomChart.PopLogarithmic(Sender: TObject);
var
Is_Logarithmic:Boolean;
XMIN: Single;
i,j: Integer;
begin
  with Sender as TMenuItem do
    begin
      j:=Chart.CustomAxes.Count;
      if j=0 then
        begin
          XMIN:=Chart.Axes.Top.Minimum;
          if XMIN>=0 then
            begin
              Is_Logarithmic:=Chart.Axes.Top.Logarithmic;
              if Is_Logarithmic then
                begin
                  Chart.Axes.Top.Logarithmic:=False;
                  Chart.Axes.Top.MinorTickCount:=4;
                  Caption:='Make Logarithmic';
                end
              else
                begin
                  Chart.Axes.Top.Logarithmic:=True;
                  Chart.Axes.Top.MinorTickCount:=8;
                  Caption:='Make Ordinal';
                end;
            end
          else
            MessageDlg('Minimum has to be greater than or equal to zero (Change range minimum value).', mtWarning, [mbOk],0);
        end
      else
        begin
          for i:=j downto 1 do
            begin
              XMIN:=Chart.Axes[Chart.Axes.Count-i].Minimum;
              if XMIN>=0 then
                begin
                  Is_Logarithmic:=Chart.Axes[Chart.Axes.Count-i].Logarithmic;
                  if Is_Logarithmic then
                    begin
                      Chart.Axes[Chart.Axes.Count-i].Logarithmic:=False;
                      Chart.Axes[Chart.Axes.Count-i].MinorTickCount:=4;
                      Caption:='Make Logarithmic';
                    end
                  else
                    begin
                      Chart.Axes[Chart.Axes.Count-i].Logarithmic:=True;
                      Chart.Axes[Chart.Axes.Count-i].MinorTickCount:=8;
                      Caption:='Make Ordinal';
                    end;
                end;
            end
        end;
    end;
end;

end.
