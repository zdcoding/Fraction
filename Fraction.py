class Fraction:
    def __init__(self):
        self.numerator = None
        self.denominator = None

    def __format(self,innFloat):
        ss = str(innFloat).strip()
        s = len(ss)
        z = s - ss.find(".") - 1
        a = int(innFloat*10**z)
        b = 10**z
        return [a,b]

    def __gcd(self,a,b,ans=[]):
        if b:
            return self.__gcd(b,a%b,ans+[int(a/b)])
        else:
            return ans

    def __fraction(self,cont=[]):
        n1,n2=cont.pop(),1
        while cont:
            n1,n2 = n2,n1
            n1 += n2*cont.pop()
        return [n1,n2]

    def ParseNumber(self,innFloat):
        fmt = self.__format(innFloat)
        arr = self.__gcd(fmt[0],fmt[1])
        fra = self.__fraction(arr)
        return fra

    def ParseRatio(self,num,don):
        fmt1 = self.__format(don)
        fmt2 = self.__format(num)
        arr = self.__gcd(fmt1[1]*fmt2[0] , fmt1[0]*fmt2[1])
        fra = self.__fraction(arr)
        return fra

if __name__ == '__main__':
    fraction = Fraction()
    print(fraction.ParseNumber(1.01234535))
    print(fraction.ParseRatio(1.6986,2.391))
