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
            Int64 i, j;
            i = Convert.ToInt64(Console.ReadLine());
            j = i % 100;
            Console.Write(Convert.ToString(i) + ' ');
            if ((j > 14) | (j < 11))
            {
                j = i % 10;
                switch (j)
                {
                    case 1: Console.WriteLine("bochka"); break;
                    case 2: Console.WriteLine("bochki"); break;
                    case 3: Console.WriteLine("bochki"); break;
                    case 4: Console.WriteLine("bochki"); break;
                    default: Console.WriteLine("bochek"); break;
                }
            }
            else
            {
                Console.WriteLine("bochek");
            }
        }
    }
}
