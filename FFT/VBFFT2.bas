Attribute VB_Name = "VBFFT"
Option Explicit
Const Pi = 3.14159265358979
Public Result As Boolean

Function NumberOfBitsNeeded(PowerOfTwo As Long) As Byte
    Dim I As Byte
    For I = 0 To 16
        If (PowerOfTwo And (2 ^ I)) <> 0 Then
            NumberOfBitsNeeded = I
            Exit Function
        End If
    Next
End Function

Function IsPowerOfTwo(X As Long) As Boolean
    If (X < 2) Then IsPowerOfTwo = False: Exit Function
    If (X And (X - 1)) = False Then IsPowerOfTwo = True
End Function

Function ReverseBits(ByVal Index As Long, NumBits As Byte) As Long
    Dim I As Byte, Rev As Long
    
    For I = 0 To NumBits - 1
        Rev = (Rev * 2) Or (Index And 1)
        Index = Index \ 2
    Next
    
    ReverseBits = Rev
End Function

Sub FourierTransform(NumSamples As Long, RealIn() As Double, ImageIn() As Double, RealOut() As Double, ImagOut() As Double, Optional InverseTransform As Boolean = False)
    Dim AngleNumerator As Double
    Dim NumBits As Byte, I As Long, j As Long, K As Long, n As Long, BlockSize As Long, BlockEnd As Long
    Dim DeltaAngle As Double, DeltaAr As Double
    Dim Alpha As Double, Beta As Double
    Dim TR As Double, TI As Double, AR As Double, AI As Double
    
    If InverseTransform Then
        AngleNumerator = -2# * Pi
    Else
        AngleNumerator = 2# * Pi
    End If

    If (IsPowerOfTwo(NumSamples) = False) Or (NumSamples < 2) Then
        Call MsgBox("Error in procedure Fourier:" + vbCrLf + " NumSamples is " + CStr(NumSamples) + ", which is not a positive integer power of two.", , "MEHDI VODJOUDI FFT ROUTIN")
        Result = False
        Exit Sub
    End If
   
   Result = True
   ReDim RealOut(NumSamples - 1)
   ReDim ImagOut(NumSamples - 1)
    NumBits = NumberOfBitsNeeded(NumSamples)
    For I = 0 To (NumSamples - 1)
        j = ReverseBits(I, NumBits)
        RealOut(j) = RealIn(I)
        ImagOut(j) = ImageIn(I)
    Next
    
    BlockEnd = 1
    BlockSize = 2
    
    Do While BlockSize <= NumSamples
        DeltaAngle = AngleNumerator / BlockSize
        Alpha = Sin(0.5 * DeltaAngle)
        Alpha = 2# * Alpha * Alpha
        Beta = Sin(DeltaAngle)
        
        I = 0
        Do While I < NumSamples
            AR = 1#
            AI = 0#
            
            j = I
            For n = 0 To BlockEnd - 1
                K = j + BlockEnd
                TR = AR * RealOut(K) - AI * ImagOut(K)
                TI = AI * RealOut(K) + AR * ImagOut(K)
                RealOut(K) = RealOut(j) - TR
                ImagOut(K) = ImagOut(j) - TI
                RealOut(j) = RealOut(j) + TR
                ImagOut(j) = ImagOut(j) + TI
                DeltaAr = Alpha * AR + Beta * AI
                AI = AI - (Alpha * AI - Beta * AR)
                AR = AR - DeltaAr
                j = j + 1
            Next
            
            I = I + BlockSize
        Loop
        
        BlockEnd = BlockSize
        BlockSize = BlockSize * 2
    Loop

    If InverseTransform Then
        'Normalize the resulting time samples...
        For I = 0 To NumSamples - 1
            RealOut(I) = RealOut(I) / NumSamples
            ImagOut(I) = ImagOut(I) / NumSamples
        Next
    End If
End Sub
