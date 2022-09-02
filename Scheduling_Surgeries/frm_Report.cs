using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Scheduling_Surgeries
{
    public partial class frm_Report : Form
    {
        SqlConnection conn = new SqlConnection(Properties.Settings.Default.sqlcon);

        public frm_Report()
        {
            InitializeComponent();
        }
        private void frm_Report_Load(object sender, EventArgs e)
        {
            Select();
        }
        private void btn_Back_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        public void Select()
        {
            var End_Date = datetime_StartDate.Value.Date.AddDays(7);
            SqlCommand cmd_select = new SqlCommand("sp_do_surgery_select_s_date", conn);
            cmd_select.CommandType = CommandType.StoredProcedure;
            cmd_select.Parameters.AddWithValue("@S_Date", datetime_StartDate.Value.Date);
          //  cmd_select.Parameters.AddWithValue("@E_Date", End_Date);
            SqlDataAdapter da = new SqlDataAdapter(cmd_select);
            DataSet ds = new DataSet();
            da.Fill(ds);

            datagrid.DataSource = ds.Tables[0];
        }

        private void btn_Search_Click(object sender, EventArgs e)
        {
            Select();
        }

        public void Select_week()
        {
            var End_Date = datetime_StartDate.Value.Date.AddDays(7);
            SqlCommand cmd_select = new SqlCommand("sp_do_surgery_select", conn);
            cmd_select.CommandType = CommandType.StoredProcedure;
            cmd_select.Parameters.AddWithValue("@S_Date", datetime_StartDate.Value.Date);
            cmd_select.Parameters.AddWithValue("@E_Date", End_Date);
            SqlDataAdapter da = new SqlDataAdapter(cmd_select);
            DataSet ds = new DataSet();
            da.Fill(ds);

            datagrid.DataSource = ds.Tables[0];
        }

        private void btn_Schedul_Click(object sender, EventArgs e)
        {
            Select_week();
        }
    }
}
