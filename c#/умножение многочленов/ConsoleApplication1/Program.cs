using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        class mnogochlen
        {
            /*массив коэфициентов*/
            public Int64[] vip= new Int64[105];
            /*длина многочлена*/
            public Int64 length;
            /*очистка многочлена*/
            public void set()
            {
                Int64 i = 0;
                for (i=0;i<=100;i++)
                {
                    this.vip[i] = 0;
                }
                this.length = 0;
            }
            /*чтение многочлена из строки*/
            public void readln(String s)
            {
                this.set();
                Int64 i;
                for (i = 0; i < s.Length; i++)
                {

                }
            }
            /*вывод сообщения*/
            public void writeln()
            {

            }
            
        }
        static void Main(string[] args)
        {

        }
    }
}
