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
            Int64 a;
            a = Convert.ToInt64(Console.ReadLine());
            a = a % 100;
            a = a / 10;
            Console.WriteLine(Convert.ToString(a));
        }
    }
}
