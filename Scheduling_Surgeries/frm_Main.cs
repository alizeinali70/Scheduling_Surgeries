using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Scheduling_Surgeries
{
    public partial class frm_Main : Form
    {
        public frm_Main()
        {
            InitializeComponent();
        }

        private void btn_Exit_Click(object sender, EventArgs e)
        {
            this.Close();
            this.Dispose();
        }

        private void btn_Doctor_Click(object sender, EventArgs e)
        {
            frm_Doctor frm_Doctor = new frm_Doctor();
            frm_Doctor.ShowDialog();
        }
    }
}
