using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication5
{
    class Program
    {
       static Int64[] mas;
       static void qsorting(Int64 left,Int64 right)
        {
            Int64 buf = 0;
            Int64 i, j;
            i = left;
            j = right;


        }
        static void Main(string[] args)
        {
             
            mas = Console.ReadLine().Split(' ').Select(Int64.Parse).ToArray();
            
            qsorting(0, mas.Length - 1);
            Int64 i = 0;
            for (i = 1; i < mas.Length; i++)
            {
                Console.Write(Convert.ToString(mas[i]) + ' ');
            }
            Console.ReadKey();

        }
    }
}
