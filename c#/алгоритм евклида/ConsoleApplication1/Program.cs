using System;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            int a, b ,c=0,count=0;
            String[] s = Console.ReadLine().Split(' ');
            a = Convert.ToInt32( s[0]);
            b = Convert.ToInt32(s[1]);
            if (a < b) {
                c = a;
                a = b;
                b = c;
            }
            while (Math.Abs(b)>0)
            {
                count++;
                c = b;
                b=a%b;
                a = c;
            }
            Console.WriteLine(Convert.ToString(a)+" "+Convert.ToString(count));
          
        }
    }
}
