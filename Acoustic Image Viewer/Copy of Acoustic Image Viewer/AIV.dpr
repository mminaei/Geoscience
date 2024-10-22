program AIV;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5},
  SplashScreen in 'SplashScreen.pas' {splash},
  AboutPage in 'AboutPage.pas' {AboutForm},
  RegistrationPage in 'RegistrationPage.pas' {RegistrationForm},
  Unit6 in 'Unit6.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
try
  RegistrationForm:=TRegistrationForm.Create(Application);
  if RegistrationForm.mxProtector.IsRegistered then
    begin
      try
        RegistrationForm.Free;
        Splash:=TSplash.Create(Application);
        Splash.Show;
        Splash.Update;
        Application.Title := 'P.U.T Acoustic Image Viewer';
        Application.CreateForm(TForm1, Form1);
  Splash.Close;
      finally
        Splash.Free;
      end;
    end
  else
    begin
      RegistrationForm.ShowModal;
      RegistrationForm.Free;
    end;
finally
  Application.Run;
end;
end.
