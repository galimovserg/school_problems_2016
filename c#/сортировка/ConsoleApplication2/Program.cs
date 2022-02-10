using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication2
{
    class Program
    {
        static void quickSort(Int64[] a, int l, int r)
        {
            Int64 temp;
            Int64 x = a[l + (r - l) / 2];
            //запись эквивалентна (l+r)/2, 
            //но не вызввает переполнения на больших данных
            int i = l;
            int j = r;
            //код в while обычно выносят в процедуру particle
            while (i <= j)
            {
                while (a[i] < x) i++;
                while (a[j] > x) j--;
                if (i <= j)
                {
                    temp = a[i];
                    a[i] = a[j];
                    a[j] = temp;
                    i++;
                    j--;
                }
            }
            if (i < r)
                quickSort(a, i, r);

            if (l < j)
                quickSort(a, l, j);
        }
        static void Main()
        {
            Random bn = new Random();
            // Считываем размер массива,
            // который необходимо отсортировать
            int size;
            size = Convert.ToInt32(Console.ReadLine());
            // Динамически выделяем память под
            // хранение массива размера size
            //считываем строку
            /*string str = Console.ReadLine();
            //разбиваем по пробелам
            string[] mas = str.Split(' ');*/
            Int64[] a = new Int64[size];
            for (int i = 0; i < size; i++)
            {
                a[i] = bn.Next(10000)-5000;
            }

            quickSort(a, 0, size - 1);

            // Выводим отсортированный массив
            for (int i = 0; i < size; i++)
            {
                Console.Write(a[i]);
                Console.Write(' ');
            }
            Console.ReadKey();
        }
    }
}
