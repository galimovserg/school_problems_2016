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
            Int64 a, b, c;
            a = Convert.ToInt64(Console.ReadLine());
            b = Convert.ToInt64(Console.ReadLine());
            c = Convert.ToInt64(Console.ReadLine());
            if ((a<b+c)&&(b<a+c)&&(c<a+b)&&(c>0)&&(b>0)&&(a>0)) {
                Console.WriteLine("YES");
            } else
            {
                Console.WriteLine("NO");
            }
        }
    }
}
