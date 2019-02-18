program AIV;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5},
  SplashScreen in 'SplashScreen.pas' {splash};

{$R *.res}

begin
  try
      Splash:=TSplash.Create(Application);
      Splash.Show;
      Splash.Update;
      Application.Title := 'AIV';
      Application.CreateForm(TForm1, Form1);
  finally
      Application.Run;
  end;
end.
