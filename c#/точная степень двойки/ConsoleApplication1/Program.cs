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
            Int64 m, i;
            m = Convert.ToInt64(Console.ReadLine());
            while (m > 1)
            {
                if (m % 2 == 0)
                {
                    m = m / 2;
                }
                else { m = 0; }
           
            }
            if (m == 1)
            {
              Console.WriteLine("YES");

            } else
            { Console.WriteLine("NO"); }
           // Console.ReadKey();
        }
    }
}
