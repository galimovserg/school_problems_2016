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
            Int64 m = mas[0],
                  n = mas[1],i,j,sq,count;
            count = 0;
           
            //if (m == 2) { count = 1; Console.WriteLine("2"); }
            for (i=m;i<= n; i++)
            {
                sq =Convert.ToInt64( Math.Round( Math.Sqrt(i)));
                for (j=2;j<= sq;j++)
                {
                    if (i % j == 0) { goto neprost; }

                }
                Console.WriteLine(Convert.ToString(i));
                count = 1;
                neprost: { }

            }
            if (count == 0) { Console.WriteLine("Absent"); }
            Console.ReadKey();
        }
    }
}
