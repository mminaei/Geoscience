unit FirstForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, StdCtrls, Buttons, LMDCustomButton, LMDButton,
  XpMan, ExtActns;

type
  TFirst_Form = class(TForm)
    MainMenu1: TMainMenu;
    Project1: TMenuItem;
    About1: TMenuItem;
    Exit1: TMenuItem;
    About2: TMenuItem;
    Applications1: TMenuItem;
    Loading1: TMenuItem;
    Well1: TMenuItem;
    LMDButton2: TLMDButton;
    LMDButton1: TLMDButton;
    LMDButton4: TLMDButton;
    StatusBar1: TStatusBar;
    procedure Exit1Click(Sender: TObject);
    procedure Loading1Click(Sender: TObject);
    procedure Well1Click(Sender: TObject);
    procedure About2Click(Sender: TObject);
    procedure LMDButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LMDButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    MainForm_Created: Boolean;
    MainForm2_Created: Boolean;
    IsRegistered:Boolean;
    { Public declarations }
  end;
const
  About_String='PetroEval'+ #13 +
               'Version 1.1' + #13 +
               'Copyright � 2009, All rights reserved.'+ #13 +
               '-------------------------------------------------------------------------'+ #13 + #13 + #13 +
               'Petrophysical Evaluation Program' + #13 + #13 +
               'By:' + #13 + #13 +
               '       Mohsen Minaei                      mminaei@mines.edu';

var
  First_Form: TFirst_Form;

implementation

uses Main_Form2, LoadForm{, WaitingForm};

{$R *.dfm}

procedure TFirst_Form.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFirst_Form.Loading1Click(Sender: TObject);
begin
  LMDButton1Click(Self);
end;

procedure TFirst_Form.Well1Click(Sender: TObject);
begin
  LMDButton4Click(Self);
end;

procedure TFirst_Form.About2Click(Sender: TObject);
begin
MessageDlg(About_String, mtInformation, [mbOk], 0);
end;

procedure TFirst_Form.LMDButton1Click(Sender: TObject);
begin
//  Load_Form:=TLoad_Form.Create(Self);
{  if not MainForm_Created then
    begin
      MainForm:=TMainForm.Create(Self);
      MainForm_Created:=True;
    end;}
  if not MainForm2_Created then
    begin
      MainForm2:=TMainForm2.Create(Self);
      MainForm2_Created:=True;
    end;
  Load_Form.Show;
//  Load_Form.Free;
end;

procedure TFirst_Form.FormCreate(Sender: TObject);
begin
  MainForm_Created:=False;
  MainForm2_Created:=False;
  Top:=0;//Round(Screen.DesktopHeight * 1 / 7);
  Left:=0;//Round(Screen.DesktopWidth * 1 / 7);
end;

procedure TFirst_Form.LMDButton4Click(Sender: TObject);
begin
  if not MainForm2_Created then
    begin
      MainForm2:=TMainForm2.Create(Self);
      MainForm2_Created:=True;
    end;
  MainForm2.Show;
end;

procedure TFirst_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Load_Form.DeleteFiles;
  Application.Terminate;
end;

end.
