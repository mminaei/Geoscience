program PetroEval;

uses
  Forms,
  CorrelationCoefficient in 'CorrelationCoefficient.pas' {Correlation_Coefficient},
  CompositeLog in 'CompositeLog.pas' {Composite_Log},
  CrossPlot in 'CrossPlot.pas' {Cross_Plot},
  CrossPlotTracks in 'CrossPlotTracks.pas' {Cross_Plot_Tracks},
  DTPSelection in 'DTPSelection.pas' {Vp_Selection},
  DTSelection in 'DTSelection.pas' {DT_Selection},
  ZoomedChart in 'ZoomedChart.pas' {ZoomChart},
  HanModel in 'HanModel.pas' {Han_Model},
  PoissonPage in 'PoissonPage.pas' {Poisson_Page},
  KriefPage in 'KriefPage.pas' {Krief_Page},
  LithoLog in 'LithoLog.pas' {Litho_Log},
  ArpWorthington in 'ArpWorthington.pas' {Arp_Worthington},
  RQIForm in 'RQIForm.pas' {RQI_Form},
  FZIForm in 'FZIForm.pas' {FZI_Form},
  HTForm in 'HTForm.pas' {HT_Form},
  FFIForm in 'FFIForm.pas' {FFI_Form},
  SvgrForm in 'SvgrForm.pas' {Svgr_Form},
  FRForm in 'FRForm.pas' {FR_Form},
  TauForm in 'TauForm.pas' {Tau_Form},
  PorosityForm in 'PorosityForm.pas' {Porosity_Form},
  KhForm in 'KhForm.pas' {Kh_Form},
  KvForm in 'KvForm.pas' {Kv_Form},
  AnisotropyForm in 'AnisotropyForm.pas' {Anisotropy_Form},
  HeterogeneityForm in 'HeterogeneityForm.pas' {Heterogeneity_Form},
  AveragingForm in 'AveragingForm.pas' {Averaging_Form},
  RwConcentration in 'RwConcentration.pas' {Rw_Concentration},
  ResistivityIndexForm in 'ResistivityIndexForm.pas' {ResistivityIndex_Form},
  GRIndexForm in 'GRIndexForm.pas' {GRIndex_Form},
  ShaleVolumeForm in 'ShaleVolumeForm.pas' {ShaleVolume_Form},
  SelectLog in 'SelectLog.pas' {Select_Log},
  RwSPForm in 'RwSPForm.pas' {Rw_SP_Form},
  SwForm in 'SwForm.pas' {Sw_Form},
  CECMethodForm in 'CECMethodForm.pas' {CECMethod_Form},
  GreenbergCastagnaForm in 'GreenbergCastagnaForm.pas' {Greenberg_Castagna_Form},
  CECForm in 'CECForm.pas' {CEC_Form},
  PreviewForm in 'PreviewForm.pas' {Preview_Form},
  WaitingForm in 'WaitingForm.pas' {Waiting_Form},
  SaveForm in 'SaveForm.pas' {Save_Form},
  LithoMultiminForm in 'LithoMultiminForm.pas' {Lithology_Multimin_Form},
  FluidModelForm in 'FluidModelForm.pas' {Fluid_Model_Form},
  PHISelectForm in 'PHISelectForm.pas' {PHI_Select_Form},
  LithoDualForm in 'LithoDualForm.pas' {Litho_Dual_Form},
  PropertiesForm in 'PropertiesForm.pas' {Properties_Form},
  FirstForm in 'FirstForm.pas' {First_Form},
  LoadForm in 'LoadForm.pas' {Load_Form},
  Main_Form2 in 'Main_Form2.pas' {MainForm2},
  Main_Form in 'Main_Form.pas' {MainForm},
  RegistrationPage in 'RegistrationPage.pas' {RegistrationForm},
  SoForm in 'SoForm.pas' {So_Form};

{$R *.res}

begin

  Application.Initialize;
try
  RegistrationForm:=TRegistrationForm.Create(Application);
 if true then//RegistrationForm.mxProtector.IsRegistered then
    begin
        RegistrationForm.Free;
        Application.Title := 'P.U.T PetroEval';
        Application.CreateForm(TFirst_Form, First_Form);
  Application.CreateForm(TWaiting_Form, Waiting_Form);
  Application.CreateForm(TLoad_Form, Load_Form);
  First_Form.IsRegistered:=True;
        Application.CreateForm(TWaiting_Form, Waiting_Form);
    end
  else
    begin
      RegistrationForm.ShowModal;
      RegistrationForm.Free;
    end;
finally
  Application.Title := 'P.U.T PetroEval';
  Application.CreateForm(TFirst_Form, First_Form);
  Application.CreateForm(TWaiting_Form, Waiting_Form);
  Application.CreateForm(TLoad_Form, Load_Form);
  Application.Run;
end;

end.
