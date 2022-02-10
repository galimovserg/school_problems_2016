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
            
            Int64 i, a, b,j;
            a = Convert.ToInt64(Console.ReadLine());
            b = Convert.ToInt64(Console.ReadLine());
            for (i= a; i<= b; i++)
            {
                
                if (i % 2 == 0)
                {
                    Console.Write(Convert.ToString(i)+' ');
                }
                
            }
           // b = Convert.ToInt64(Console.ReadLine());
        }
    }
}
