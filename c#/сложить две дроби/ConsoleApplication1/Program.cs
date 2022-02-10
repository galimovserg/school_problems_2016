using System;
//using System.Collections.Generic;
using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            Int64[] mas = Console.ReadLine().Split(' ').Select(Int64.Parse).ToArray();
            Int64 a = Math.Abs(mas[0]);
            Int64 b = Math.Abs(mas[1]);
            Int64 c = Math.Abs(mas[2]);
            Int64 d = Math.Abs(mas[3]);
            Int64 nok, m, n, cs, i;
            if ((a <= 100)&&(b<=100)&&(c<=100)&&(d<=100))
            {
                if (b > d)
                {
                    m = b;
                    n = d;
                }
                else
                {
                    m = d;
                    n = b;
                }


                while ((m >= 1) && (n >= 1))
                {
                    if (m >= n) { m = m - n; } else { n = n - m; }
                }
                nok = Math.Abs(m - n);
                nok = (d * b) / nok;
                cs = a * (nok / b) + c * (nok / d);

                for (i = 2; i <= nok; i++)
                {
                    
                   
                    while (((cs % i == 0) & (nok % i == 0)))
                    {
                        cs = cs / i;
                        nok = nok / i;
                    }

                }
                Console.WriteLine(Convert.ToString(cs) + " " + Convert.ToString(nok));
                //Console.ReadKey();
            }
        }
    }
}
