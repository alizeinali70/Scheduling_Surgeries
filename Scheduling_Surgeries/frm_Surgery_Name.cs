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
    public partial class frm_Surgery_Name : Form
    {
        SqlConnection conn = new SqlConnection(Properties.Settings.Default.sqlcon);
        public frm_Surgery_Name()
        {
            InitializeComponent();
        }
private void frm_Surgery_Name_Load(object sender, EventArgs e)
        {
            Select();
        }

        public void Select()
        {
            SqlCommand cmd_select = new SqlCommand("sp_surgery_name_select", conn);
            cmd_select.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd_select);
            DataSet ds = new DataSet();
            da.Fill(ds);

            datagrid.DataSource = ds.Tables[0];
        }

        private void btn_Save_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd_Insert = new SqlCommand("sp_surgery_name_insert", conn);
                cmd_Insert.CommandType = CommandType.StoredProcedure;
                cmd_Insert.Parameters.AddWithValue("@Fullname", txt_Fullname.Text);
                cmd_Insert.Parameters.AddWithValue("@Min_Duration", int.Parse(txt_Min_Duration.Text));
                cmd_Insert.Parameters.AddWithValue("@Max_Duration", int.Parse(txt_Max_Duration.Text));
               

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

        private void btn_Back_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
