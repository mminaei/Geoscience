VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Caption         =   "Mehdi Vodjoudi FFT utility - winter 2003"
   ClientHeight    =   6120
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   11010
   Icon            =   "Form6.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6120
   ScaleWidth      =   11010
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text4 
      BackColor       =   &H00C0FFC0&
      Height          =   4935
      Left            =   8280
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   13
      Top             =   960
      Width           =   2535
   End
   Begin MSComDlg.CommonDialog cdlCommon 
      Left            =   2280
      Top             =   3720
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox Text3 
      Height          =   3255
      Left            =   6240
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   11
      Top             =   960
      Width           =   1935
   End
   Begin VB.CommandButton Command1 
      Caption         =   ">> FFT >>"
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2160
      TabIndex        =   7
      ToolTipText     =   "Å” «“ Ê«—œ ‰„Êœ‰ „ﬁ«œÌ— «Ì‰ ò·Ìœ —« »—«Ì  »œÌ· ”—Ì⁄ ›Ê—ÌÂ ›‘«— œÂÌœ"
      Top             =   1800
      Width           =   1935
   End
   Begin VB.TextBox Text2 
      Height          =   3255
      Left            =   4200
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      ToolTipText     =   "œ— «Ì‰ ” Ê‰ òÂ Å” «“ „Õ«”»«  ›⁄«· ŒÊ«Âœ ‘œ° „ﬁ«œÌ— ÕﬁÌﬁÌ  »œÌ· ›Ê—ÌÂ ‰„«Ì‘ œ«œÂ „Ì ‘Êœ"
      Top             =   960
      Width           =   1935
   End
   Begin VB.TextBox Text1 
      Height          =   3255
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      ToolTipText     =   $"Form6.frx":030A
      Top             =   960
      Width           =   1935
   End
   Begin VB.Frame Frame1 
      Caption         =   "Informatio"
      Height          =   1455
      Left            =   360
      TabIndex        =   2
      Top             =   4440
      Width           =   7815
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Caption         =   "Fast Fourier Transform Program"
         BeginProperty Font 
            Name            =   "Arial Black"
            Size            =   15.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   1200
         TabIndex        =   5
         Top             =   120
         Width           =   5535
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         Caption         =   "Written by Mehdi Vodjoudi"
         BeginProperty Font 
            Name            =   "Arial Black"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000C000&
         Height          =   255
         Left            =   2160
         TabIndex        =   4
         Top             =   600
         Width           =   3615
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         Caption         =   "IIEES M.S. Student - Winter 2003"
         BeginProperty Font 
            Name            =   "Arial Black"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2160
         TabIndex        =   3
         Top             =   960
         Width           =   3495
      End
   End
   Begin VB.Label Label9 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFC0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "„ﬁ«œÌ— ÿÌ›"
      BeginProperty Font 
         Name            =   "Traffic"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   8280
      MousePointer    =   2  'Cross
      TabIndex        =   14
      ToolTipText     =   "œ— «Ì‰ ” Ê‰ òÂ Å” «“ „Õ«”»«  ›⁄«· ŒÊ«Âœ ‘œ° „ﬁ«œÌ— „ÊÂÊ„Ì  »œÌ· ›Ê—ÌÂ ‰„«Ì‘ œ«œÂ „Ì ‘Êœ"
      Top             =   480
      Width           =   2535
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      BackColor       =   &H80000013&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "„ﬁ«œÌ— „ÊÂÊ„Ì"
      BeginProperty Font 
         Name            =   "Traffic"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   6240
      MousePointer    =   2  'Cross
      TabIndex        =   12
      ToolTipText     =   "œ— «Ì‰ ” Ê‰ òÂ Å” «“ „Õ«”»«  ›⁄«· ŒÊ«Âœ ‘œ° „ﬁ«œÌ— „ÊÂÊ„Ì  »œÌ· ›Ê—ÌÂ ‰„«Ì‘ œ«œÂ „Ì ‘Êœ"
      Top             =   480
      Width           =   1935
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BackColor       =   &H80000013&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "„ﬁ«œÌ— ÕﬁÌﬁÌ"
      BeginProperty Font 
         Name            =   "Traffic"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   4200
      MousePointer    =   2  'Cross
      TabIndex        =   8
      ToolTipText     =   "œ— «Ì‰ ” Ê‰ òÂ Å” «“ „Õ«”»«  ›⁄«· ŒÊ«Âœ ‘œ° „ﬁ«œÌ— ÕﬁÌﬁÌ  »œÌ· ›Ê—ÌÂ ‰„«Ì‘ œ«œÂ „Ì ‘Êœ"
      Top             =   480
      Width           =   1935
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackColor       =   &H80000013&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "œ«œÂ Â«Ì Ê—ÊœÌ"
      BeginProperty Font 
         Name            =   "Traffic"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   120
      MousePointer    =   2  'Cross
      TabIndex        =   6
      ToolTipText     =   $"Form6.frx":039E
      Top             =   480
      Width           =   1965
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      BackColor       =   &H000000FF&
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   495
      Left            =   2160
      TabIndex        =   10
      Top             =   1440
      Width           =   375
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      BackColor       =   &H000000FF&
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   495
      Left            =   120
      TabIndex        =   9
      Top             =   120
      Width           =   375
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuOpen 
         Caption         =   "&Open"
      End
      Begin VB.Menu mnuSave 
         Caption         =   "&Save"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "&Exit"
      End
   End
   Begin VB.Menu mnuAbout 
      Caption         =   "&About"
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const Pi = 3.14159265358979


Private Sub Command1_Click()
Result = True

Dim Counter As Integer
Dim numbers As Long

Counter = 0
numbers = 0

Dim Matrix() As Double
Dim MatrixI() As Double
Dim MatrixOut() As Double
Dim MatrixIOut() As Double
Dim MatrixTeif() As Double


Dim StringAray() As String
Dim str As String
Dim str2 As String

str = Text1.Text
    If (str = "") Then
         MsgBox "Sorry, U haven't entered any number", vbCritical, "Mehdi Vodjoudi"
         Exit Sub
    End If
str = Trim(str)
StringAray = Split(str, Chr(13), , vbTextCompare)
numbers = UBound(StringAray)


ReDim Matrix(numbers)
For Counter = 0 To numbers - 1
Matrix(Counter) = CDbl(StringAray(Counter))
Next Counter

ReDim MatrixI(numbers)
For Counter = 0 To numbers
MatrixI(I) = 0
Next Counter

Call FourierTransform(numbers, Matrix(), MatrixI(), MatrixOut(), MatrixIOut())

If (Result = True) Then

    str = ""
    For Counter = 0 To numbers - 1
    str = str + CStr(MatrixOut(Counter)) + Chr(13) + Chr(10)
    Next Counter
    Text2.Enabled = True
    Text2.Text = str

    str2 = ""
    For Counter = 0 To numbers - 1
    str2 = str2 + CStr(MatrixIOut(Counter)) + Chr(13) + Chr(10)
    Next Counter
    Text3.Enabled = True
    Text3.Text = str2
'Else
'    MsgBox "Sorry, there was an error in your input list, check it please,", , "Mehdi Vodjoudi"
End If

str = ""
ReDim MatrixTeif(numbers)
For Counter = 0 To numbers - 1
    MatrixTeif(Counter) = ((MatrixOut(Counter)) ^ 2 + (MatrixIOut(Counter)) ^ 2) ^ 0.5
    str = str + CStr(MatrixTeif(Counter)) + Chr(13) + Chr(10)
    Next Counter
    Text4.Enabled = True
    Text4.Text = str



End Sub

Private Sub Form_Load()
Text1.Text = ""
Text2.Text = "After Calculation you will see the REAL result here"
Text3.Text = "After Calculation you will see the Imaginary result here"
Text2.Enabled = False
Text3.Enabled = False
Text4.Enabled = False
End Sub


Private Sub mnuAbout_Click()

frmAbout.Show

End Sub

Private Sub mnuExit_Click()

End

End Sub

Private Sub mnuOpen_Click()
Dim strFileName As String
Dim strData As String
Dim intFileNum As Integer

cdlCommon.InitDir = App.Path
cdlCommon.Filter = "Text Files Contain a String of numbers separated by Enter (*.txt)|*.txt|"
cdlCommon.ShowOpen
strFileName = cdlCommon.FileName

Open strFileName For Input As #1
    Text1.Text = Input(LOF(1), 1)

Close #1

End Sub

Private Sub mnuSave_Click()

If (Not (Text4.Text = "")) Then
    cdlCommon.InitDir = App.Path
    cdlCommon.Filter = "Text Files Contain a String of numbers separated by Enter (*.txt)|*.txt|"
    cdlCommon.ShowSave

    Open cdlCommon.FileName For Binary As #1
         Put #1, 1, Text4.Text
    Close #1
Else
    MsgBox ("Your calculation box is empty")
    
End If
End Sub
