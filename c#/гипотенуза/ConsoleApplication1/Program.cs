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
            Double x, y,z;
            x = Convert.ToDouble(Console.ReadLine());
            y= Convert.ToDouble(Console.ReadLine());
            z = Math.Sqrt(x*x+y*y);
            Console.WriteLine(Convert.ToString(z));
        }
    }
}
