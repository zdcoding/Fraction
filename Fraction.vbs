' Author    :    zdcoding@protonmail.com
' Date        :    2021-10-30   

Class Fraction
    Function Format(num)
        Dim ss
        ss = Trim(CStr(num))
        Dim ll
        ll = Len(ss)
        Dim xx
        xx = ll - Instr(1,ss,".")
        Dim a
        a = CLng( num * 10^xx )
        Dim b
        b = 10^xx
        Dim abTuple(2)
        abTuple(0) = a
        abTuple(1) = b
        Format = abTuple
    End Function

    Function GetComplexFractionGCD(a,b,arr)
        If b <> 0 Then
            Dim curPosition
        curPosition = Ubound(arr)
        ReDim Preserve arr(curPosition+1)
        arr(curPosition) = Fix(a/b)
        GetComplexFractionGCD = GetComplexFractionGCD( b , a mod b , arr )
        Else
            GetComplexFractionGCD = arr
        End If
    End Function

    Function GetIrreducibleFraction(arr)
        Dim n1
        n1 = arr(Ubound(arr)-1)
        ReDim Preserve arr(Ubound(arr)-1)
        Dim n2
        n2 = 1
        While Ubound(arr) > 0
            Dim tmp
            tmp = n2
            n2 = n1
            n1 = tmp
            n1 = n1 + n2*arr(Ubound(arr)-1)
            ReDim Preserve arr(Ubound(arr)-1)
        Wend
        Dim abTuple(2)
        abTuple(0) = n1
        abTuple(1) = n2
        GetIrreducibleFraction = abTuple
    End Function

    Function FromNumber(inFloat)
        Dim fmt 
        fmt = Format(inFloat)
        Dim arr()
        ReDim arr(0)
        Dim seq
        seq = GetComplexFractionGCD(fmt(0),fmt(1),arr)
        FromNumber = GetIrreducibleFraction(seq)
    End Function

    Function FromRatio(inFloat1,inFloat2)
        Dim den 
        den = Format(inFloat2)
        If den(0) = 0 Then
            Err.Raise 22,"OVERFLOW","DIVIDED BY ZERO","inFloat2"
        End If
        Dim num
        num = Format(inFloat1)
        Dim arr()
        ReDim arr(0)
        Dim seq
        seq = GetComplexFractionGCD(num(0)*den(1),num(1)*den(0),arr)
        FromRatio = GetIrreducibleFraction(seq)
    End Function
End Class


'' TEST CODE
Dim t
Set t = new Fraction
n = t.FromNumber(1.300076125)
Msgbox n(0) & ":" & n(1)
r = t.FromRatio(1.60048,5.4)
Msgbox r(0) & ":" & r(1)
