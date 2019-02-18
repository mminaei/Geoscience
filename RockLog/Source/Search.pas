unit Search;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, sButtonControl,
  sCustomButton, VrControls, VrLabel;

type
  TSearchPage = class(TForm)
    Edit1: TEdit;
    Shape1: TShape;
    Button1: TsButton;
    Button2: TsButton;
    VrLabel1: TVrLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SearchPage: TSearchPage;
  SearchTable:String;

implementation
uses calculationpage;
{$R *.dfm}

procedure TSearchPage.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
Button1.Click;
end;

procedure TSearchPage.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TSearchPage.Button1Click(Sender: TObject);
begin
   try
     if  CalculationForm.Table.Locate(CalculationForm.Table.FieldDefs[1].Name,strtofloat(Edit1.Text),[])=false then
      begin
       Messagedlg('Requested depth/time not found.',mtinformation,[mbok],0);
      end
     else
       if CalculationForm.ElasticTable.IsEmpty=False then
         CalculationForm.ElasticTable.Locate(CalculationForm.ElasticTable.FieldDefs[1].Name,strtofloat(Edit1.Text),[])
   except
     Messagedlg('Please enter a valid NUMBER !',mterror,[mbok],0);
   end;
end;

end.
