using System;
/*using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;*/

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            Int64 a = Convert.ToInt64(Console.ReadLine());
            Int64 aa = a % 10;  //ЕДИНИЦЫ
            Int64 ab = (a / 10)%10;//ДЕСЯТКИ
            Int64 ac = (a / 100) % 10;//СОТНИ
            Int64 ad = (a / 1000) % 10;//ТЫСЯЧИ
            switch (ad)
            {
                case 1: { Console.Write("M"); break; }
                case 2: { Console.Write("MM"); break; }
                case 3: { Console.Write("MMM"); break; }


            }
            switch (ac) 
            {
                case 1: { Console.Write("C"); break; }
                case 2: { Console.Write("CC"); break; }
                case 3: { Console.Write("CCC"); break; }
                case 4: { Console.Write("CD"); break; }
                case 5: { Console.Write("D"); break; }
                case 6: { Console.Write("DC"); break; }
                case 7: { Console.Write("DCC"); break; }
                case 8: { Console.Write("DCCC"); break; }
                case 9: { Console.Write("CM"); break; }
            }

            switch (ab)
            {
                case 1: { Console.Write("X");   break; }
                case 2: { Console.Write("XX");  break; }
                case 3: { Console.Write("XXX"); break; }
                case 4: { Console.Write("XL");  break; }
                case 5: { Console.Write("L");   break; }
                case 6: { Console.Write("LX");  break; }
                case 7: { Console.Write("LXX"); break; }
                case 8: { Console.Write("LXXX");break; }
                case 9: { Console.Write("XC");  break; }
            }
            switch (aa)
            {
                case 1: { Console.Write("I");   break; }
                case 2: { Console.Write("II");  break; }
                case 3: { Console.Write("III"); break; }
                case 4: { Console.Write("IV");  break; }
                case 5: { Console.Write("V");   break; }
                case 6: { Console.Write("VI");  break; }
                case 7: { Console.Write("VII"); break; }
                case 8: { Console.Write("VIII");break; }
                case 9: { Console.Write("IX");  break; }
            }
            
          //  Console.ReadKey();
        }
    }
}
