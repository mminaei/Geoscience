unit SplashScreen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls;

type
  Tsplash = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  splash: Tsplash;

implementation

{$R *.dfm}

procedure Tsplash.Timer1Timer(Sender: TObject);
begin
      Splash.Close;
      Splash.Free;
end;

end.
