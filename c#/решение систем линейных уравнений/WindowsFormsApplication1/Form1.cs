using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        Label g;
        public struct matrix
        {
           private Double[,] mas;
           private int n, m;
            private int[] counts;
            public void releng(int n,int m)
            {
                this.n = n;//количество строк
                this.m = m;//количество переменных + 1
                mas = new double[n, m];
            }
            public void load(string[] s)
            {
                int i, j; n = s.Length; m = s.Length+1;
                
                mas = new double[n, n + 1];
                for (i = 0; i < s.Length; i++)
                {
                    string[] stt = s[i].Split(' ');
                    for (j=0;j<stt.Length;j++)
                    {
                        mas[i, j] = Convert.ToDouble(stt[j]);
                    }
                }
            }
            public void swap(int l1,int l2)
            {
                double buf=0;
                int i;
                if ((l1<n)&&(l1>=0)&& (l2 < n) && (l2 >= 0))
                {
                    for (i = 0; i <= n; i++)
                    {
                        buf = mas[l1, i];
                        mas[l1, i] = mas[l2, i];
                        mas[l2, i] = buf;
                    }
                }
            }
            public void sorting()
            {
                int i = 0, j = 0;
                counts = new int[n];
                for (i = 0; i < n; i++)
                {
                    counts[i] = 0;
                    for (j = 0; j <= n; j++)
                    {
                        if (mas[i, j] == 0)
                        {
                            counts[i]++;
                        }
                        else {
                            j = n + 1;
                        }

                    }
                }
                for (i=0;i< n-1; i++)
                {
                    for (j=0;j< n-1; j++)
                    {
                        if (counts[j] > counts[j + 1])
                        {
                            int buf = 0;
                            swap(j, j + 1);
                            buf = counts[j];
                            counts[j] = counts[j + 1];
                            counts[j + 1] = buf;
                        }
                    }
                }
            }
            public void mmm()
                
            {
                g:{ }
                int i = 0, j = 0 ;
                
                sorting();
                for (i=0;i< n-1; i++)
                {
                    if (counts[i] < n + 1)
                    {
                        if (counts[i] == counts[i + 1])
                        {
                            for (j = i + 1; j < n; j++)
                            {
                                if (mas[i, counts[i]]!=0)
                                {
                                    summa(i, j, -mas[j, counts[i]] / mas[i, counts[i]]);
                                    prz(j, mas[j, counts[i]] / mas[i, counts[i]]);
                                    counts[j]++;
                                }
                                
                            }
                            sorting();
                        }
                    }
                }
                
            }
            public string[] print()
            {
                string[] s = new string[n];
                int i,j;
                for (i=0;i< n; i++)
                {
                    s[i] = "";
                    for (j=0;j< n; j++)
                    {
                        s[i] = s[i] +Convert.ToString( mas[i, j]) + " ";
                    }
                    s[i] = s[i] + Convert.ToString(mas[i, n]);
                }
                return s;
            }
            public int leng()
            {
                return this.n;
            }
            public void summa(int l1,int l2,double k)
            {
                int i = 0;
                if ((l1 < n) && (l2 < n)){
                    for (i=0;i<= n; i++)
                    {
                        mas[l2, i] = k * mas[l1, i]+mas[l2,i];
                    }
                }
            }

            public void prz(int l, double k)
            {
                int i = 0;
                for (i=0;i<= n; i++)
                {
                    mas[l, i] = mas[l, i] * k;
                }
            }
        }
        
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

            textBox1.Clear();
            textBox2.Clear();
           
        }
        
        private void button1_Click(object sender, EventArgs e)
        {
            textBox2.Clear();
            int ii = 0;
            matrix m =new matrix();
            string[] s= textBox1.Lines;
            
            m.load(s);
            m.mmm();
            s = m.print();
            for (ii=0;ii<s.Length;ii++) {
                textBox2.Text += s[ii] + Environment.NewLine;
            }
        }
    }
}
