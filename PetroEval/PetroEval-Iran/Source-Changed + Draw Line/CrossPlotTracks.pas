unit CrossPlotTracks;

interface
                                {405}
uses
  Graphics, Forms, Dialogs, StdCtrls, Controls, Classes, SysUtils,
  ExtCtrls;

type
  TCross_Plot_Tracks = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Button3: TButton;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Button4: TButton;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cross_Plot_Tracks   :TCross_Plot_Tracks;

implementation

uses Main_Form, CrossPlot , SelectLog;

{$R *.dfm}

procedure TCross_Plot_Tracks.Button1Click(Sender: TObject);
var
Temp_Value: Real;
Error_Code: Integer;
Depth_Start, Depth_Stop:Real;
begin
  with MainForm do
    begin
      Val(LabeledEdit1.Text, Temp_Value, Error_Code);
      if Error_Code=0 then
        Depth_Start:=Temp_Value
      else
        begin
          MessageDlg('Please enter a valid number for the start value of depth range!', mtError, [mbOk],0);
          Exit;
        end;
      Val(LabeledEdit2.Text, Temp_Value, Error_Code);
      if Error_Code=0 then
        Depth_Stop:=Temp_Value
      else
        begin
          MessageDlg('Please enter a valid number for the stop value of depth range!', mtError, [mbOk],0);
          Exit;
        end;
      Cross_Plot:=TCross_Plot.Create(Application);
      Cross_Plot.Depth_Start:=Depth_Start;
      Cross_Plot.Depth_Stop:=Depth_Stop;
      Operation_Canceled:=False;
      Cross_Plot.Show;
    end;
  Close;
end;

procedure TCross_Plot_Tracks.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TCross_Plot_Tracks.CheckBox1Click(Sender: TObject);
begin
  GroupBox4.Visible:=CheckBox1.Checked;
  MainForm.Is_CrossPlot_3D:=CheckBox1.Checked;
  if CheckBox1.Checked then
    begin
      Cross_Plot_Tracks.Width:=Cross_Plot_Tracks.Width+197;
      Button1.Left:=Button1.Left+197;
      Button2.Left:=Button2.Left+197;
    end
  else
    begin
      Cross_Plot_Tracks.Width:=Cross_Plot_Tracks.Width-197;
      Button1.Left:=Button1.Left-197;
      Button2.Left:=Button2.Left-197;
    end;
end;

procedure TCross_Plot_Tracks.Button3Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.XAxis_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.XAxis_Track_Number:=Select_Log.Selected_Track_Number;
      Label2.Caption:=MainForm.Charts[MainForm.XAxis_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure TCross_Plot_Tracks.Button4Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.YAxis_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.YAxis_Track_Number:=Select_Log.Selected_Track_Number;
      Label4.Caption:=MainForm.Charts[MainForm.YAxis_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

procedure TCross_Plot_Tracks.Button5Click(Sender: TObject);
begin
  Select_Log:=TSelect_Log.Create(Self);
  Select_Log.ShowModal;
  MainForm.ZAxis_Track_Number:=Select_Log.Selected_Track_Number;
  if Select_Log.Selected_Track_Number<>-1 then
    begin
      MainForm.ZAxis_Track_Number:=Select_Log.Selected_Track_Number;
      Label6.Caption:=MainForm.Charts[MainForm.ZAxis_Track_Number].Title.Text.Text;
    end;
  Select_Log.Free;
end;

end.
