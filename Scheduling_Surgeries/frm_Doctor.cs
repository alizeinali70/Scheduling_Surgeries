using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.Sql;
using System.Data.SqlClient;


namespace Scheduling_Surgeries
{
    public partial class frm_Doctor : Form
    {

        SqlConnection conn = new SqlConnection(Properties.Settings.Default.sqlcon);

        public frm_Doctor()
        {
            InitializeComponent();
        }

       
        
        private void frm_Doctor_Load(object sender, EventArgs e)
        {
            Select();
        }

        private void btn_Back_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        public void Select()
        {
            SqlCommand cmd_select = new SqlCommand("sp_doctor_select", conn);
            cmd_select.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd_select);
            DataSet ds = new DataSet();
            da.Fill(ds);

            datagrid_Doctor.DataSource = ds.Tables[0];
        }

        private void btn_Save_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd_Insert = new SqlCommand("sp_doctor_insert",conn);
                cmd_Insert.CommandType = CommandType.StoredProcedure;
                cmd_Insert.Parameters.AddWithValue("@Fullname", txt_Fullname.Text);
                cmd_Insert.Parameters.AddWithValue("@Specialist", txt_Specialist.Text);
                cmd_Insert.Parameters.AddWithValue("@Busy", false);

                conn.Open();
                cmd_Insert.ExecuteNonQuery();
                conn.Close();
                Select();

            }
            catch (Exception exp)
            {
                conn.Close();
                MessageBox.Show(exp.Message);
            }
            


        }
    }
}
