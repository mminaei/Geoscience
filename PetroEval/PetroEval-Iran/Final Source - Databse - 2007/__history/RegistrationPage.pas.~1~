unit RegistrationPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mxProtector, ComCtrls, StdCtrls;

type
  TRegistrationForm = class(TForm)
    Label1: TLabel;
    lbl_Message: TLabel;
    lbl_Remaining: TLabel;
    btn_Go: TButton;
    btn_Cancel: TButton;
    ProgressBar: TProgressBar;
    btn_Register: TButton;
    grp_Reg: TGroupBox;
    Label2: TLabel;
    lbl_Serial: TLabel;
    Label3: TLabel;
    Edit_UserName: TEdit;
    Edit_Serial: TEdit;
    Edit_HWID: TEdit;
    mxProtector: TmxProtector;
    procedure mxProtectorInvalidSystemTime(Sender: TObject);
    procedure mxProtectorExpiration(Sender: TObject);
    procedure mxProtectorGetSerialNumber(Sender: TObject; var UserName,
      SerialNumber: String);
    procedure mxProtectorInvalidSerialNumber(Sender: TObject);
    procedure mxProtectorUnknownHardware(Sender: TObject);
    procedure btn_RegisterClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mxProtectorDayTrial(Sender: TObject; DaysRemained: Integer);
    procedure btn_GoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegistrationForm: TRegistrationForm;

implementation

uses FirstForm, WaitingForm;

{$R *.dfm}

procedure TRegistrationForm.mxProtectorInvalidSystemTime(Sender: TObject);
begin
     MessageDlg( 'Your system time is invalid.' + #13 + #10 + 'Please set the correct date and time to continue.', mtError, [ mbOK ], 0 );
end;

procedure TRegistrationForm.mxProtectorExpiration(Sender: TObject);
begin
     lbl_Remaining.Caption := '0 days remained';
     lbl_Message.Caption := 'This license has expired';
     btn_Go.Enabled := FALSE;
     ProgressBar.Max := 0;
     ProgressBar.Position := 0;
end;

procedure TRegistrationForm.mxProtectorGetSerialNumber(Sender: TObject; var UserName,
  SerialNumber: String);
begin
     UserName := Edit_UserName.Text;
     SerialNumber := Edit_Serial.Text;
end;

procedure TRegistrationForm.mxProtectorInvalidSerialNumber(Sender: TObject);
begin
     MessageDlg( 'This serial number is invalid!', mtError, [ mbOK ], 0 );
end;

procedure TRegistrationForm.mxProtectorUnknownHardware(Sender: TObject);
begin
     MessageDlg( 'Your Hardware is not compatible with this software' + #13 + #10 + 'Please contact the author.', mtError, [ mbOK ], 0 );
end;

procedure TRegistrationForm.btn_RegisterClick(Sender: TObject);
begin
  mxProtector.Registration;
  if mxProtector.IsRegistered then
    begin
      MessageDlg( 'Thank you for registering the product.', mtInformation, [ mbOK ], 0 );
      Close;
    end;
end;

procedure TRegistrationForm.btn_CancelClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TRegistrationForm.FormCreate(Sender: TObject);
begin
     Edit_HWID.Text := mxProtector.GetHardwareID;
end;

procedure TRegistrationForm.mxProtectorDayTrial(Sender: TObject;
  DaysRemained: Integer);
begin
     If DaysRemained = 1 Then
          lbl_Message.Caption := 'Only one licensed day left'  Else
          lbl_Message.Caption := Format( 'This software license will expire after %d days.', [ DaysRemained ] );

     lbl_Remaining.Caption := Format( '%d days remaining', [ DaysRemained ] );
     btn_Go.Enabled := TRUE;
     ProgressBar.Max := mxProtector.MaxDayNumber;
     ProgressBar.Position := DaysRemained;
end;

procedure TRegistrationForm.btn_GoClick(Sender: TObject);
begin
  Close;
end;

procedure TRegistrationForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  First_Form.IsRegistered:=mxProtector.IsRegistered;
end;

end.
