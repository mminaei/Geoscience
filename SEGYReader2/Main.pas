unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,StrUtils, ComCtrls, XPMan;

type
  TForm1 = class(TForm)
    ProgressBar1: TProgressBar;
    Panel1: TPanel;
    Button1: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    Button2: TButton;
    LabeledEdit4: TLabeledEdit;
    Button3: TButton;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    OpenDialog1: TOpenDialog;
    XPManifest1: TXPManifest;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Label1: TLabel;
    Button4: TButton;
    OpenDialog2: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ReadTrace(var Trace_Number:Integer);
//    procedure Swapper(valin: pointer; size: integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Read_File: TFileStream;
  Read_Buffer: word;
  Read_Value: Single;
  Sampling_Interval:integer;
  No_Samples_Trace:integer;
  No_Traces:Int64;
  ReadFile1, Write_File: File of Byte;
  Value_String: string;
  Value_Single: Single;
  Value_Double: Double;
  Value_Integer: Cardinal;
  ForFree:TLabel;
  Input_Matrix, SSD_Matrix, Trace1, Trace2: array of Single;

implementation


////////////////////////////////
// Functions From Chris

function Rev2(var ii):smallint;
type
byte2 = array[1..2] of byte;
var
i : ^byte2;
begin;
{$R-}
  i := @ii;
  Rev2 := (i^[1] shl 8) or i^[2];
{$R+}
end;

procedure IBMtoIEEE(var IBMNum; var IEEENum);
type
  byte4 = array[1..4] of byte;
var
  IEEE,IBM  : ^cardinal;
  iexp,ishift  : byte;
  iexpNew : longint;
Begin;
  IEEE  :=  @IEEENum;
  IBM   :=  @IBMNum;
{ normalise IBM mantissa }
  IEEE^ := (IBM^ and $00FFFFFF);
  ishift := 0;
  if IEEE^ <> 0 then begin;
    while ((IEEE^ and $00800000) = 0) and (ishift < 23) do begin;
      IEEE^  := IEEE^ shl 1;
      ishift := succ(ishift);
    end;
{ extract 7-bit exponent }
    iexp := (IBM^ shr 24) and $7F;
    iexpNew := (iexp-64) * 4 + 126 - ishift;
  end
  else iexpNew := 0;
{ adjust according to size of exponent }
  if iexpNew > 254 then begin;       { +/- infinity }
    iexpNew := 254;
    IEEE^ := 0;
  end
  else if iexpNew > 0 then begin;    { normal number }
    IEEE^ := IEEE^ and $007FFFFF;    { throw away msb }
  end
  else if iexpNew > -22  then begin; { de-normalised number }
    while iexpNew < 0 do begin;
      IEEE^ := IEEE^ shr 1;
      iexpNew :=succ(iexpNew);       { changed from pred CH 6/4/93 }
    end;
  end
  else begin;                        { zero }
    iexpNew := 0;
    IEEE^   := 0;
  end;
{          mantissa     exponent                sign           }
  IEEE^ := IEEE^ or (cardinal(iexpNew) shl 23)  or (IBM^ and $80000000);
end;

////////////////////////////////////////

function FileSize(const FileName: string): Int64; overload;
var
  AttributeData: TWin32FileAttributeData;
begin
  if not GetFileAttributesEx(PChar(FileName), GetFileExInfoStandard, @AttributeData) then
    RaiseLastOSError;
  Int64Rec(Result).Lo := AttributeData.nFileSizeLow;
  Int64Rec(Result).Hi := AttributeData.nFileSizeHigh;
end;


{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
i,j,k:smallint;
max_value, min_value: real;
Value: Single;
ValueIBM: Cardinal;
block: array[0..3] of byte absolute Value;
temp:  byte;
File_Size: Int64;
t,t1:integer;
begin
  if OpenDialog1.Execute then
    begin
      Cursor:=crHourGlass;
      t1:=GetTickCount;
      ForFree:=TLabel.Create(Self);
      AssignFile(ReadFile1, OpenDialog1.FileName);
      Reset(ReadFile1);
      File_Size:=FileSize(OpenDialog1.FileName);
      CloseFile(ReadFile1);
      Read_File:=TFileStream.Create(OpenDialog1.FileName, fmOpenRead);
      LabeledEdit5.Text:=IntToStr(File_Size);

      Read_File.Seek(3216, soFromBeginning);
      Read_file.Read(Read_Buffer, 2);

//      Read_Buffer:= Read_Buffer shr 8 + Read_Buffer shl 8;
      Read_Buffer:=Rev2(Read_Buffer);

      Sampling_Interval:=Read_Buffer;
      LabeledEdit1.Text:=IntToStr(Sampling_Interval);

      Read_File.Seek(3220, soFromBeginning);
      Read_file.Read(Read_Buffer, 2);

//      Read_Buffer:= Read_Buffer shr 8 + Read_Buffer shl 8;
      Read_Buffer:=Rev2(Read_Buffer);

      No_Samples_Trace:=Read_Buffer;
      LabeledEdit2.Text:=IntToStr(No_Samples_Trace);

      Read_File.Seek(3224, soFromBeginning);
      Read_file.Read(Read_Buffer, 2);

//      Read_Buffer:= Read_Buffer shr 8 + Read_Buffer shl 8;
      Read_Buffer:=Rev2(Read_Buffer);
      LabeledEdit3.Text:=IntToStr(Read_Buffer);

      Read_File.Seek(3840, soFromBeginning);
      Value_String:='';
      No_Traces:=(File_Size - 3600) div (No_Samples_Trace*4 + 240);
      LabeledEdit4.Text:=IntToStr(No_Traces);
      ProgressBar1.Min:=0;
      ProgressBar1.Max:=No_Traces;
      ProgressBar1.Position:=0;
      ProgressBar1.Visible:=True;
      max_value:=-9999999999;
      min_value:=9999999999;
      Repaint;
      for j:=0 to {No_Traces-}1 do
        begin
          Memo2.Lines.Add('Trace '+ FloattoStr(j+1));
          for i:=0 to No_Samples_Trace-1 do
            begin
//              Read_file.Read(ValueIBM, 4);
//             IBMtoIEEE(ValueIBM, Value);
              Read_file.Read(Value, 4);
              for k := 0 to 1 do
                begin
                  temp := block[k];
                  block[k] := block[3-k];
                  block[3-k] := temp;
                end;

              Memo2.Lines.Add(FloattoStr(Value));

              if Value>Max_Value then
                max_Value:=Value;
              if Value<Min_Value then
                min_Value:=Value;
            end;
          Read_File.Seek(3840+(No_Samples_Trace*4+240)*(j+1), soFromBeginning);
          ProgressBar1.Position:=j+1;
        end;
      Read_File.Free;
      Memo1.Lines.Clear;
      Memo1.Lines.Append('Maximum: ' + FloatToStr(Max_Value));
      Memo1.Lines.Append('Minimum: ' + FloatToStr(Min_Value));
      ProgressBar1.Visible:=False;
      T:=GetTickCount - T1;
      LabeledEdit6.Text:= IntToStr(T);
      Cursor:=crDefault;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i,j,k,m,n: integer;
  Value: Single;
  block: array[0..3] of byte absolute Value;
  temp_array: array[0..3839] of  byte;
  temp: byte;
//  F1, F2: File of Single;
  F1: TextFile;
  Val1, Val2, Val3: Single;
begin
//  Read_File.Read(temp_array,3839);
//  TFileStream.Create(OpenDialog1.FileName+'SSD', fmCreate);
//  WriteFile(Write_File, temp_array, nil);
//  AssignFile(Write_File, OpenDialog1.FileName+'SSD');
{  AssignFile(F1, OpenDialog1.FileName);
  Reset(F1);
  AssignFile(F2, OpenDialog1.FileName+'SSD');
  Rewrite(F2);
  for i := 1 to 240 do
    begin
      Read(F1, Value);
      Write(F2, Value);
    end;
  CloseFile(F1);      }
//  CloseFile(F2);
//  Write(Write_File, temp_array);
  Form1.Cursor:=crHourGlass;
  Repaint;
  Read_File:=TFileStream.Create(OpenDialog1.FileName, fmOpenRead);
  Read_File.Seek(3840, soFromBeginning);
  Memo2.Clear;
  Memo3.Clear;
  AssignFile(F1, OpenDialog1.FileName+'_SSD.txt');
  Rewrite(F1);

  ProgressBar1.Visible:=True;
  ProgressBar1.Min:=0;
  ProgressBar1.Max:=No_Traces;
  SSD_Matrix:=nil;
  Setlength(Input_Matrix, No_Samples_Trace+1);
  Setlength(SSD_Matrix, No_Samples_Trace+1);
  SSD_Matrix[0]:=0;
  Writeln(F1, '0');
//  Memo3.Visible:=False;
  for j:=0 to No_Traces-1 do
    begin
      for i:=0 to No_Samples_Trace-1 do
        begin
          Read_file.Read(Value, 4);
          for k := 0 to 1 do
            begin
              temp := block[k];
              block[k] := block[3-k];
              block[3-k] := temp;
            end;
          Input_Matrix[i]:=Value;
//      Memo2.Lines.Add(FloattoStr(Value));
        end;
// Perform SSD
      for m:=0 to No_Samples_Trace-1 do
        begin
          Val1:=Input_Matrix[m];
          Val2:=Input_Matrix[m+1];

          if m+2>No_Samples_Trace then
            begin
              SSD_Matrix[m+1]:=0;
              if j<>(No_Traces-1) then
                Writeln(F1, '0');
              break;
            end;
          Val3:=Input_Matrix[m+2];


          if Val2>=0 then
            begin
              if (Val2>=Val1)and(Val2>Val3) then
                SSD_Matrix[m+1]:=Val2
              else if (Val2<Val1)and(Val2<Val3) then
                SSD_Matrix[m+1]:=Val2
              else if (Val2=Val3) then
                SSD_Matrix[m+1]:=0
              else
                SSD_Matrix[m+1]:=0;
            end
          else
          if Val2<0 then
            begin
              if (Val2<=Val1)and(Val2<Val3) then
                SSD_Matrix[m+1]:=Val2
              else if (Val2>Val1)and(Val2>Val3) then
                SSD_Matrix[m+1]:=Val2
              else if (Val2=Val3) then
                SSD_Matrix[m+1]:=0
              else
                SSD_Matrix[m+1]:=0;
            end;
          Writeln(F1, FloattoStr(SSD_Matrix[m+1]));
        end;
//      ProgressBar1.Position:=j+1;
      Label1.Caption:='Trace '+IntToStr(j);
      Label1.Repaint;
//Read Next Trace
      Read_File.Seek(3840+(No_Samples_Trace*4+240)*(j+1), soFromBeginning);
    end;

//  Memo3.Visible:=True;
//  Memo3.Lines.Add('Finished');
//  Memo3.ScrollBars:=ssBoth;
  Label1.Caption:='Finished';
  CloseFile(F1);
  Read_File.Free;
  ProgressBar1.Visible:=False;
  Form1.Cursor:=crDefault;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ForFree.Free;
  Memo1.Clear;
  Memo2.Clear;
end;

procedure TForm1.ReadTrace(var Trace_Number: Integer);
var
  i,j,k: Integer;
  Value: Single;
  Text_File: TextFile;
begin
  SetLength(Trace1, No_Samples_Trace);
  SetLength(Trace2, No_Samples_Trace);
  for i := 0 to No_Samples_Trace do


end;

procedure TForm1.Button4Click(Sender: TObject);
var
  i,j,k,m,n: integer;
  Value: Single;
  Value_String: String;
  block: array[0..3] of byte absolute Value;
  temp_array: array[0..3839] of  byte;
  temp: byte;
  F1: TextFile;
  Val1, Val2, Val3: Single;
  Text_File: TextFile;
  Incoherency: array of Single;
begin

  Form1.Cursor:=crHourGlass;
  Repaint;
  Read_File:=TFileStream.Create(OpenDialog1.FileName, fmOpenRead);
  Read_File.Seek(3840, soFromBeginning);
  Memo2.Clear;
  Memo3.Clear;
  AssignFile(F1, OpenDialog1.FileName+'_SSD2.txt');
  Rewrite(F1);

  ProgressBar1.Visible:=True;
  ProgressBar1.Min:=0;
  ProgressBar1.Max:=No_Traces;
  SSD_Matrix:=nil;
  Setlength(Input_Matrix, No_Samples_Trace+1);
  Setlength(Incoherency, No_Samples_Trace+1);
  Setlength(SSD_Matrix, No_Samples_Trace+1);
  Setlength(Trace1, No_Samples_Trace+1);
  Setlength(Trace2, No_Samples_Trace+1);
  SSD_Matrix[0]:=0.01;
  Writeln(F1, '0.01');
//  Memo3.Visible:=False;
  for j:=0 to No_Traces-1 do
    begin
      for i:=0 to No_Samples_Trace-1 do
        begin
          Read_file.Read(Value, 4);
          for k := 0 to 1 do
            begin
              temp := block[k];
              block[k] := block[3-k];
              block[3-k] := temp;
            end;
          Input_Matrix[i]:=Value;
//      Memo2.Lines.Add(FloattoStr(Value));
        end;
// Perform SSD
      for m:=0 to No_Samples_Trace-1 do
        begin
          Val1:=Input_Matrix[m];
          Val2:=Input_Matrix[m+1];

          if m+2>No_Samples_Trace then
            begin
              SSD_Matrix[m+1]:=0.01;
              if j<>(No_Traces-1) then
                Writeln(F1, '0.01');
              break;
            end;
          Val3:=Input_Matrix[m+2];


          if Val2>=0 then
            begin
              if (Val2>=Val1)and(Val2>Val3) then
                SSD_Matrix[m+1]:=Val2
              else if (Val2<Val1)and(Val2<Val3) then
                SSD_Matrix[m+1]:=Val2
              else if (Val2=Val3) then
                SSD_Matrix[m+1]:=0.01
              else
                SSD_Matrix[m+1]:=0.01;
            end
          else
          if Val2<0 then
            begin
              if (Val2<=Val1)and(Val2<Val3) then
                SSD_Matrix[m+1]:=Val2
              else if (Val2>Val1)and(Val2>Val3) then
                SSD_Matrix[m+1]:=Val2
              else if (Val2=Val3) then
                SSD_Matrix[m+1]:=0.01
              else
                SSD_Matrix[m+1]:=0.01;
            end;
          Writeln(F1, FloattoStr(SSD_Matrix[m+1]));
        end;
//      ProgressBar1.Position:=j+1;
      Label1.Caption:='Trace '+IntToStr(j);
      Label1.Repaint;
//Read Next Trace
      Read_File.Seek(3840+(No_Samples_Trace*4+240)*(j+1), soFromBeginning);
    end;

//  Memo3.Visible:=True;
//  Memo3.Lines.Add('Finished');
//  Memo3.ScrollBars:=ssBoth;
  Label1.Caption:='Finished';
  CloseFile(F1);
  Read_File.Free;
  ProgressBar1.Visible:=False;
  Form1.Cursor:=crDefault;


// Start Incoherency

  if OpenDialog2.Execute then
    begin
      AssignFile(Text_File, OpenDialog2.FileName);
      Reset(Text_File);
      AssignFile(F1, OpenDialog2.FileName+'_Inc_SSD2.txt');
      Rewrite(F1);
    end;

  for j := 0 to No_Samples_Trace-1 do
    begin
      Readln(Text_File,Value_String);
      Trace1[j]:=StrtoFloat(Value_String);
    end;
  for k := 0 to No_Traces-1 do
    begin
      for j := 0 to No_Samples_Trace-1 do
        begin
          if not (EOF(Text_File)) then
            begin
              Readln(Text_File,Value_String);
              if Value_String<>'' then
                Trace2[j]:=StrtoFloat(Value_String)
//              else
 //               Trace2[j]:=0.01;
            end;
        end;
      for i := 0 to No_Samples_Trace-1 do
        begin
          if Trace2[i]<>0 then
            Incoherency[i]:=(Trace1[i]/Trace2[i])-1
          else
            Incoherency[i]:=0;

          Writeln(F1, FloattoStr(Incoherency[i]));
        end;
      for i := 0 to No_Samples_Trace-1 do
        Trace1[i]:=Trace2[i];

      Label1.Caption:='Trace '+IntToStr(k);
      Label1.Repaint;

    end;
  Label1.Caption:='Finished';
  Label1.Repaint;
  CloseFile(F1);
  CloseFile(Text_File);
end;

end.
