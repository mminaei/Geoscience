program PetroEval;

uses
  Forms,
  ZoomedChart in 'ZoomedChart.pas' {ZoomChart},
  LithoMultiminForm in 'LithoMultiminForm.pas' {Lithology_Multimin_Form},
  FluidModelForm in 'FluidModelForm.pas' {Fluid_Model_Form},
  LithoDualForm in 'LithoDualForm.pas' {Litho_Dual_Form},
  PropertiesForm in 'PropertiesForm.pas' {Properties_Form},
  FirstForm in 'FirstForm.pas' {First_Form},
  LoadForm in 'LoadForm.pas' {Load_Form},
  Main_Form2 in 'Main_Form2.pas' {MainForm2};

{$R *.res}

begin

  Application.Initialize;
  Application.CreateForm(TFirst_Form, First_Form);
  Application.CreateForm(TLoad_Form, Load_Form);
  Application.Run;
{try
  RegistrationForm:=TRegistrationForm.Create(Application);
  if RegistrationForm.mxProtector.IsRegistered then
    begin
      RegistrationForm.Free;
      Application.Title := 'P.U.T PetroEval';
      Application.CreateForm(TFirst_Form, First_Form);
  First_Form.IsRegistered:=True;
      Application.CreateForm(TWaiting_Form, Waiting_Form);
      Application.CreateForm(TLoad_Form, Load_Form);
      Application.CreateForm(TWaiting_Form, Waiting_Form);
    end
  else
    begin
      Application.Title := 'P.U.T PetroEval';
      Application.CreateForm(TFirst_Form, First_Form);
      Application.CreateForm(TWaiting_Form, Waiting_Form);
      Application.CreateForm(TLoad_Form, Load_Form);
      RegistrationForm.ShowModal;
      RegistrationForm.Free;
    end;
finally
  Application.Run;
end;}

end.
