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

    public partial class frm_Do_Surgery : Form
    {SqlConnection conn = new SqlConnection(Properties.Settings.Default.sqlcon);
        public frm_Do_Surgery()
        {
            InitializeComponent();
        }

        private void frm_Do_Surgery_Load(object sender, EventArgs e)
        {
            Select_Doctor();
            Select_Surgery();
            Select_Surgery_Room();
            Select_Patient();
            Select_Nurse();
        }
        public void Select_Doctor()
        {
            SqlCommand cmd_select = new SqlCommand("sp_doctor_select", conn);
            cmd_select.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd_select);
            DataSet ds = new DataSet();
            da.Fill(ds);

            cmb_Doctor.DataSource = ds.Tables[0];
            cmb_Doctor.ValueMember = "Fullname";
        }
        public void Select_Surgery()
        {
            SqlCommand cmd_select = new SqlCommand("sp_surgery_name_select", conn);
            cmd_select.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd_select);
            DataSet ds = new DataSet();
            da.Fill(ds);

            cmb_Surgery.DataSource = ds.Tables[0];
            cmb_Surgery.ValueMember = "Fullname";
        }
        public void Select_Surgery_Room()
        {
            SqlCommand cmd_select = new SqlCommand("sp_surgery_room_select", conn);
            cmd_select.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd_select);
            DataSet ds = new DataSet();
            da.Fill(ds);

            cmb_Surgery_Room.DataSource = ds.Tables[0];
            cmb_Surgery_Room.ValueMember = "Fullname";
        }

        
        public void Select_Patient()
        {
            SqlCommand cmd_select = new SqlCommand("sp_patient_select", conn);
            cmd_select.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd_select);
            DataSet ds = new DataSet();
            da.Fill(ds);

            cmb_Patient.DataSource = ds.Tables[0];
            cmb_Patient.ValueMember = "Fullname";
        }
        
        public void Select_Nurse()
        {
            SqlCommand cmd_select = new SqlCommand("sp_nurse_select", conn);
            cmd_select.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd_select);
            DataTable dt = new DataTable();
            da.Fill(dt);

            for(int i = 0; i < dt.Rows.Count; i++)
            {
                chbox_Nurse.Items.Add(dt.Rows[i]["Fullname"].ToString());
            }
        }

        private void btn_Back_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
