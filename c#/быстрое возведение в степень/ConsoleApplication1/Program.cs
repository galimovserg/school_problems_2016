using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
       static  Double m,n;
       static Double ft (Int64 i)
        {
           if (i>0)
            {
                if (i%2==0) {
                    n = ft(i / 2);
                    return  n*n;

                } else
                {
                    return ft(i - 1) * m;
                }


            } else {
                return 1;
            }
        }
        static void Main(string[] args)
        {
            Int64 len;
            String[] mas = Console.ReadLine().Split(' ');
            m =Convert.ToDouble( mas[0]);
            len = Convert.ToInt64(mas[1]);
            Console.WriteLine(Convert.ToString(ft(len)));
          //  Console.ReadKey();
        }
    }
}
