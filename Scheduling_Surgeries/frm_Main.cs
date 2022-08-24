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

        private void btn_Nurse_Click(object sender, EventArgs e)
        {
            frm_Nurse frm_Nurse= new frm_Nurse();
            frm_Nurse.ShowDialog();

        }

        private void btn_Surgery_Click(object sender, EventArgs e)
        {
            frm_Surgery_Name frm_Surgery_Name=  new frm_Surgery_Name();
            frm_Surgery_Name.ShowDialog();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            frm_Patient frm_Patient= new frm_Patient();
            frm_Patient.ShowDialog();
        }

        private void btn_Surgery_Room_Click(object sender, EventArgs e)
        {
            frm_Surgery_Room frm_Surgery_Room = new frm_Surgery_Room();
            frm_Surgery_Room.ShowDialog();
        }

        private void btn_Do_Surgery_Click(object sender, EventArgs e)
        {
            frm_Do_Surgery frm_Do_Surgery = new frm_Do_Surgery();
            frm_Do_Surgery.ShowDialog();
        }

        private void btn_Report_Click(object sender, EventArgs e)
        {
            frm_Report frm_Report= new frm_Report();
            frm_Report.ShowDialog();
        }
    }
}
