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
            Int64 a = Convert.ToInt64(Console.ReadLine());
            while (a>0)
            {
                Console.Write(Convert.ToString(a % 2));
                a = a / 2;
            }
            //Console.ReadKey();
        }
    }
}
