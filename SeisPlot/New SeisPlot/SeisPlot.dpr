program SeisPlot;

uses
  Forms,
  MainForm in 'MainForm.pas' {FirstForm},
  TLapsePage in 'TLapsePage.pas' {TLapse},
  LapseChartPrint in 'LapseChartPrint.pas' {LapsePrint};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SeisPlot';
  Application.CreateForm(TFirstForm, FirstForm);
  Application.Run;
end.
