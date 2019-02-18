Unit Form_Main;

Interface

Uses
     Windows,
     Messages,
     SysUtils,
     Classes,
     Graphics,
     Controls,
     Forms,
     Dialogs,
     mxProtector,
     StdCtrls;

Type
     Tfrm_MainWindow = Class( TForm )
          btn_Cancel: TButton;
          Label1: TLabel;
          grp_Reg: TGroupBox;
          Edit_UserName: TEdit;
          Edit_Serial: TEdit;
          Label2: TLabel;
          lbl_Serial: TLabel;
          btn_GetSer: TButton;
          Edit_HWID: TEdit;
          Label3: TLabel;
    Button1: TButton;
    mxProtector: TmxProtector;
          Procedure FormCreate( Sender: TObject );
          Procedure btn_CancelClick( Sender: TObject );
          Procedure btn_GetSerClick( Sender: TObject );
          Procedure mxProtectorGetHardwareID( Sender: TObject; Var HardwareID: String );
    procedure Button1Click(Sender: TObject);

     Private

     Public

     End;

Var
     frm_MainWindow: Tfrm_MainWindow;

Implementation

{$R *.DFM}

// *************************************************************************************
// ** Tfrm_MainWindow.FormCreate, 8/21/01 4:09:20 PM
// *************************************************************************************

Procedure Tfrm_MainWindow.FormCreate( Sender: TObject );
Begin
     Edit_HWID.Text := mxProtector.GetHardwareID;
End;

// *************************************************************************************
// ** Tfrm_MainWindow.btn_CancelClick, 8/21/01 4:12:29 PM
// *************************************************************************************

Procedure Tfrm_MainWindow.btn_CancelClick( Sender: TObject );
Begin
     Close;
End;

// *************************************************************************************
// ** Tfrm_MainWindow.btn_GetSerClick, 8/28/01 3:42:50 PM
// *************************************************************************************

Procedure Tfrm_MainWindow.btn_GetSerClick( Sender: TObject );
Begin
     Edit_Serial.Text := mxProtector.GenerateSerialNumber( Edit_UserName.Text );
End;

// *************************************************************************************
// ** Tfrm_MainWindow.btn_AboutClick, 8/30/01 12:37:25 PM
// *************************************************************************************

Procedure Tfrm_MainWindow.mxProtectorGetHardwareID( Sender: TObject; Var HardwareID: String );
Begin
     HardwareID := Edit_HWID.Text;
End;

procedure Tfrm_MainWindow.Button1Click(Sender: TObject);
begin
mxProtector.Reset;
end;

End.

