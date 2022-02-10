using System;
/*
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
*/

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            Double a,s;
            Int64 n, i;
            a = Convert.ToDouble(Console.ReadLine());
            n = Convert.ToInt64(Console.ReadLine());
            s = 1;
            for (i=1; i<=n ; i++)
            {
                s = s * a+1;

            }
            Console.WriteLine(Convert.ToString(s));
         // Console.ReadKey();
        }
    }
}
