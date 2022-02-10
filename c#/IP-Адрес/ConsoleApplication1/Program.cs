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
            String[] mas = Console.ReadLine().Split('.');
            if ((mas[0].Length>0)&& (mas[0].Length < 4)&& ((mas[1].Length > 0) && (mas[1].Length < 4))&& ((mas[2].Length > 0) && (mas[2].Length < 4)) && ((mas[3].Length > 0) && (mas[3].Length < 4)))
            {
                if ((Convert.ToInt32(mas[0]) < 256)&& (Convert.ToInt32(mas[1]) < 256)&& (Convert.ToInt32(mas[2]) < 256)&& (Convert.ToInt32(mas[3]) < 256))
                {
                    Console.WriteLine("1");
                }
                else { Console.WriteLine("0"); }

            } else
            {
                Console.WriteLine("0");

            }
           // Console.ReadKey();
        }
    }
}
