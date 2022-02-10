using System;
/*using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;*/

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            String[] mas = Console.ReadLine().Split(' ');
            Int64 a = Convert.ToInt64(mas[0]);
            Int64 i = Convert.ToInt64(mas[1]);
            Int64 j;
            for (j=1;j<= i; j++)
            {
                a = a / 2;

            }
            Console.WriteLine(a % 2);
          //  Console.ReadKey();

        }
    }
}
