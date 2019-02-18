unit SaveForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Math;

type
  TSave_Form = class(TForm)
    SaveDialog1: TSaveDialog;
    GroupBox1: TGroupBox;
    ScrollBox1: TScrollBox;
    GroupBox2: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    LabeledEdit13: TLabeledEdit;
    LabeledEdit14: TLabeledEdit;
    LabeledEdit15: TLabeledEdit;
    LabeledEdit16: TLabeledEdit;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Save_Form: TSave_Form;
  outFile: TextFile;
  FileNames     :array of TLabel;
  CheckBox1     :array of TCheckBox;
  ForFree       :TLabel;
  SelectedLogs  :array of Smallint;

implementation

uses Main_Form, TeEngine;

{$R *.dfm}

function GetMNEM(InputStr: String):String;
var
s:string;
i,j:integer;
p1:integer;
begin
  p1:=Pos('.',InputStr);
  s:=' '+Copy(InputStr, 1, p1-1);
  j:=Length(s);
  if j<=10 then
    begin
      for i:=0 to (10 - j) do
        s:=s+' ';
    end;
  Result:=s;
end;

function GetUNIT(InputStr: String):String;
var
s:string;
i,j:integer;
p1:integer;
begin
  p1:=Pos('.',InputStr);
  s:=Copy(InputStr, p1, Length(InputStr));
  j:=Length(s);
  if j<=9 then
    begin
      for i:=0 to (9 - j) do
        s:=s+' ';
    end;
  Result:=s;
end;

function GetDATA(InputStr: String):String;
var
s:string;
i,j:integer;
begin
  s:=InputStr;
  j:=Length(s);
  if j<=14 then
    begin
      for i:=0 to (14 - j) do
        s:=s+' ';
    end;
  Result:=s;
end;

function GetVALUE(Input: Double):String;
var
s:string;
s1:string;
i:integer;
digit, precision:string;
p1:integer;
begin
  digit:='';
  precision:='';
  s1:=FloatToStr(RoundTo(Input, -4));
  p1:=Pos('.',s1);
  if p1<>0 then
    begin
      s:=Copy(s1, 1, p1-1);
      for i:=0 to (6-Length(s)) do
        s:=' ' + s;
      digit:=s;

      s:=Copy(s1, p1+1, Length(s1));
      for i:=1 to (4-Length(s)) do
        s:= s + '0';
      precision:=s;

    end
  else
    begin
      s:=s1;
      for i:=0 to (6-Length(s)) do
        s:=' ' + s;
      digit:=s;
      precision:='0000';

    end;
  Result:=digit+'.'+precision;
end;

procedure TSave_Form.BitBtn1Click(Sender: TObject);
var
i,j:integer;
s1:string;
begin
  with MainForm do
    begin
        Try
          StatusBar1.Panels[0].Text:='Saving as LAS file, please wait...';
          StatusBar1.Refresh;
          if SaveDialog1.Execute then
           if not(SaveDialog1.FileName='') then
            begin
              Repaint;
              AssignFile( OutFile, SaveDialog1.FileName );
              Rewrite( OutFile );
              writeln(outFile,'~VERSION INFORMATION');
              writeln(outFile,' VERS.                 2.0:   CWLS LOG ASCII STANDARD - VERSION 2.0');
              writeln(outFile,' WRAP.                  NO:   ONE LINE PER DEPTH STEP');
              writeln(outFile,'#--------------------------------------------------');
              writeln(outFile,'~WELL INFORMATION BLOCK');
              writeln(outFile,'#MNEM      .UNIT     DATA           :  DESCRIPTION');
              writeln(outFile,'#---------- -------- --------------- --------------------');
              writeln(outFile,GetMNEM(' STRT.'+LabeledEdit1.Text)+GetUNIT(' STRT.'+LabeledEdit1.Text)+GetDATA(LabeledEdit2.Text)+':  START DEPTH');
              writeln(outFile,GetMNEM(' STOP.'+LabeledEdit1.Text)+GetUNIT(' STRT.'+LabeledEdit1.Text)+GetDATA(LabeledEdit3.Text)+':  STOP DEPTH');
              writeln(outFile,GetMNEM(' STEP.'+LabeledEdit1.Text)+GetUNIT(' STRT.'+LabeledEdit1.Text)+GetDATA(LabeledEdit4.Text)+':  STEP DEPTH');
              writeln(outFile,GetMNEM(' NULL.  ')+GetUNIT(' NULL.  ')+GetDATA(LabeledEdit5.Text)+':  NULL VALUE');
              writeln(outFile,GetMNEM(' COMP.  ')+GetUNIT(' COMP.  ')+GetDATA(LabeledEdit16.Text)+':  COMPANY');
              writeln(outFile,GetMNEM(' WELL.  ')+GetUNIT(' WELL.  ')+GetDATA(LabeledEdit6.Text)+':  WELL');
              writeln(outFile,GetMNEM(' FLD .  ')+GetUNIT(' FLD .  ')+GetDATA(LabeledEdit7.Text)+':  FIELD');
              writeln(outFile,GetMNEM(' LOC .  ')+GetUNIT(' LOC .  ')+GetDATA(LabeledEdit8.Text)+':  LOCATION');
              writeln(outFile,GetMNEM(' CNTY.  ')+GetUNIT(' CNTY.  ')+GetDATA(LabeledEdit9.Text)+':  COUNTY');
              writeln(outFile,GetMNEM(' STAT.  ')+GetUNIT(' STAT.  ')+GetDATA(LabeledEdit10.Text)+':  STATE');
              writeln(outFile,GetMNEM(' CTRY.  ')+GetUNIT(' CTRY.  ')+GetDATA(LabeledEdit11.Text)+':  COUNTRY');
              writeln(outFile,GetMNEM(' SRVC.  ')+GetUNIT(' SRVC.  ')+GetDATA(LabeledEdit12.Text)+':  SERVICE COMPANY');
              writeln(outFile,GetMNEM(' API .  ')+GetUNIT(' APIL.  ')+GetDATA(LabeledEdit13.Text)+':  API NUMBER');
              writeln(outFile,GetMNEM(' DATE.  ')+GetUNIT(' DATE.  ')+GetDATA(LabeledEdit14.Text)+':  LOG DATE');
              writeln(outFile,GetMNEM(' UWI .  ')+GetUNIT(' UWI .  ')+GetDATA(LabeledEdit15.Text)+':  UNIQUE WELL ID');
              writeln(outFile,'#--------------------------------------------------');
              writeln(outFile,'~CURVE INFORMATION');
              writeln(outFile,'#MNEM      .UNIT     API CODE       :  CURVE DESCRIPTION');
              writeln(outFile,'#---------- -------- --------------- ------------------------------');
//              writeln(outFile,GetMNEM('DEPTH.'+LasFiles[0].DepthUnit[0])+GetUNIT('DEPTH.'+LasFiles[0].DepthUnit[0])+'               '+':');
              j:=0;
              for i:=0 to Length(CheckBox1)-1 do
                begin
                  if CheckBox1[i].Checked then
                    begin
                      SetLength(SelectedLogs, Length(SelectedLogs)+1);
                      SelectedLogs[j]:=i;
                      s1:=CheckBox1[i].Caption;
                      Inc(j);
                      writeln(outFile,GetMNEM(Charts[i].Axes.Top.Title.Caption)+GetUNIT(Charts[i].Axes.Top.Title.Caption)+'               '+':');
                    end;
                end;
              writeln(outFile,'#--------------------------------------------------');
              writeln(outFile,'~OTHER INFIORMATION');
              writeln(outFile,'#--------------------------------------------------');
              writeln(outFile,'  This file has been created in P.U.T PetroEval software.');
              writeln(outFile,'#--------------------------------------------------');
              writeln(outFile,'~ASCII DATA');

              for i:=0 to Charts[0].Series[0].YValues.Count-1 do
                begin
                  s1:='';
                  s1:= s1+ GetValue(Charts[0].Series[0].YValue[i]) + '  ';
                  for j:=0 to Length(SelectedLogs)-2 do
                    begin
//                      if Charts[SelectedLogs[j]].Series[0].XValue[i]<>LasFiles[0].NullValue then
                        s1:= s1+ GetValue(Charts[SelectedLogs[j]].Series[0].XValue[i]) + '  '
  //                    else
//                        s1:= s1+ GetValue(StrToFloat(LabeledEdit5.Text)) + '  ';
                    end;
//                  if Charts[SelectedLogs[j]].Series[0].XValue[i]<>LasFiles[0].NullValue then
//                    s1:= s1+ GetValue(Charts[SelectedLogs[j]].Series[0].XValue[i])
  //                else
//                    s1:= s1+ GetValue(StrToFloat(LabeledEdit5.Text));
                  writeln(outFile, s1);
                end;
            end;
        finally
          CloseFile( OutFile );
          StatusBar1.Panels[0].Text:='Ready';
          StatusBar1.Refresh;
        end;
    end;

end;

procedure TSave_Form.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TSave_Form.FormCreate(Sender: TObject);
var
FormatDate: TFormatSettings;
i,j,k,m: Smallint;
begin
  ForFree:=TLabel.Create(Self);
  k:=0;
  m:=0;
  for i:=0 to MainForm.Tree1.Roots.Count-1 do
    begin
      if UpperCase(MainForm.Tree1.Roots[i].SimpleText)='LITHOLOGY LOG' then Continue;
      if UpperCase(MainForm.Tree1.Roots[i].SimpleText)='COMPOSITE LOG' then Continue;
      SetLength(FileNames, Length(FileNames)+1);
      FileNames[m]:=TLabel.Create(ForFree);
//      FileNames[m].Caption:=LasFiles[0].FileName;
      FileNames[m].Caption:=MainForm.Tree1.Roots[i].SimpleText;
      FileNames[m].AutoSize:=True;
      FileNames[m].Top:=15*k;
      FileNames[m].Left:=0;
      FileNames[m].Font.Style:=[fsBold];
      FileNames[m].Font.Size:=9;
      FileNames[m].Font.Name:='Tahoma';
      FileNames[m].Font.Color:=clGreen;
      FileNames[m].Transparent:=True;
      FileNames[m].Parent:=ScrollBox1;
      for j:=0 to (MainForm.Tree1.Roots[i].Childs.Count-1) do
//      for j:=0 to LasFiles[0].Values.FieldDefs.Count-1 do
        begin
          SetLength(CheckBox1, Length(CheckBox1)+1);
          CheckBox1[k-m]:=TCheckBox.Create(ForFree);
          CheckBox1[k-m].Top:=15*(k+1);
          CheckBox1[k-m].Left:=15;
          CheckBox1[k-m].Font.Color:=$00FF8000;
          CheckBox1[k-m].Font.Name:='Tahoma';
          CheckBox1[k-m].Font.Size:=8;
          CheckBox1[k-m].Width:=150;
          CheckBox1[k-m].Caption:=MainForm.Tree1.Roots[i].Childs[j].SimpleText;
//          CheckBox1[k-m].Caption:=LasFiles[0].Values.FieldDefs[j].Name;
          CheckBox1[k-m].Checked:=True;
          CheckBox1[k-m].Tag:=k-m;
          CheckBox1[k-m].Parent:=ScrollBox1;
          k:=k+1;
        end;
      k:=k+1;
      m:=m+1;
    end;

 GetLocaleFormatSettings(0,FormatDate);
  with MainForm do
    begin
//      LabeledEdit1.Text:=LasFiles[0].DepthUnit;
      LabeledEdit2.Text:=FloatToStr(RoundTo(Charts[0].Series[0].YValues.First, -4));
      LabeledEdit3.Text:=FloatToStr(RoundTo(Charts[0].Series[0].YValues.Last, -4));
//      LabeledEdit4.Text:=FloatToStr(RoundTo(LasFiles[0].StepValue, -4));
//      LabeledEdit5.Text:=FloatToStr(RoundTo(LasFiles[0].NullValue, -4));
      LabeledEdit6.Text:='';
      LabeledEdit7.Text:='';
      LabeledEdit8.Text:='';
      LabeledEdit9.Text:='';
      LabeledEdit10.Text:='';
      LabeledEdit11.Text:='';
      LabeledEdit12.Text:='';
      LabeledEdit13.Text:='';
      LabeledEdit14.Text:=DateToStr(Date, FormatDate);
      LabeledEdit15.Text:='';
      LabeledEdit16.Text:='';
    end;
end;

end.
