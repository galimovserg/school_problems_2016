using System;
/*using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;*/

namespace ConsoleApplication1
{
    class Program
    {
        static Double distance(Double x1, Double y1, Double x2, Double y2)
        {
            return Math.Sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
        }
        static void Main(string[] args)
        {
            Console.WriteLine(distance(Convert.ToDouble(Console.ReadLine()), Convert.ToDouble(Console.ReadLine()), Convert.ToDouble(Console.ReadLine()), Convert.ToDouble(Console.ReadLine())));
            //Console.ReadKey();
        }
    }
    
}
