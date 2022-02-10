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
            Int64 i = Convert.ToInt64(Console.ReadLine());
            Int64 z1, z2, z3;
            z1 = i % 10;
            i = i / 10;
            z2 = i % 10;
            i = i / 10;
            z3 = i;
            Console.WriteLine(Convert.ToString(z1+z2+ z3));
           // Console.ReadKey();
        }
    }
}
