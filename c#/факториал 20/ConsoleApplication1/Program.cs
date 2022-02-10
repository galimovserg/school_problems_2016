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
            Int64 a, i;
            a = 1;
            for (i=1;  i<=20;  i++)
            {
                a = a * i;
            }
            Console.WriteLine(Convert.ToString(a));
            a = Convert.ToInt64(Console.ReadLine());
        }
    }
}
