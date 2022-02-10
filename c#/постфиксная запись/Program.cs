using System;
/*using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;*/

namespace ConsoleApplication13
{
    class Program
    {
        static void Main(string[] args)
        {
            Int64[] mas = new Int64[-10,1000];
            Int64 lenpos = 0;
            Boolean newword = true;
            Char ch = Convert.ToChar(Console.Read());
            while (ch != '\n')
            {
                if (ch == '+')
                {
                    mas[lenpos - 1] = mas[lenpos] + mas[lenpos - 1];
                    lenpos--; newword = true;
                } else
                if (ch=='-') {
                    mas[lenpos - 1] = mas[lenpos-1] - mas[lenpos ];
                    lenpos--; newword = true;
                } else 
                    if (ch=='*')
                {
                    mas[lenpos - 1] = mas[lenpos - 1] * mas[lenpos];
                    if (lenpos > 0)
                    {
                        lenpos--;
                    } else
                    {
                        lenpos = 1; break;
                    }
                    newword = true;
                } else
                if (ch==' ')
                {
                    newword = true;
                } else
                {
                    if (newword)
                    {
                        lenpos++;
                        newword = false;
                        mas[lenpos] = Convert.ToInt64(ch) - 48;
                    } else
                    {
                        mas[lenpos] = mas[lenpos]*10+ Convert.ToInt64(ch) - 48;
                    }
                }
                
                ch = Convert.ToChar(Console.Read());
                
            }
            Console.WriteLine(Convert.ToString(mas[1]));
            //Console.ReadKey();
        }
    }
}
