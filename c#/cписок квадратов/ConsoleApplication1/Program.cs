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
            Int64 a = Convert.ToInt64(Console.ReadLine());
            Int64 i, k;
            for (i = 1; i * i <= a; i++)
            {
                Console.WriteLine(Convert.ToString(i * i));
            }
            //Console.ReadKey();
        }
    }
}
