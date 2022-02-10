using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            Double a, b, c, d, x1, x2;
            a = Convert.ToDouble(Console.ReadLine());
            b = Convert.ToDouble(Console.ReadLine());
            c = Convert.ToDouble(Console.ReadLine());
            d = b * b - 4 * a * c;
            if (d>0)
            {
                Console.WriteLine(Convert.ToString((-b + Math.Sqrt(d)) / (2 * a))+" "+ Convert.ToString((-b  - Math.Sqrt(d)) / (2 * a)));
            } else
            {
                if (d==0)
                {
                    Console.WriteLine(Convert.ToString(-b / (2 * a)));

                }


            }
            a = Convert.ToDouble(Console.ReadLine());

        }
    }
}
