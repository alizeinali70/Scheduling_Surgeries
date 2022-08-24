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
    {
        SqlConnection conn = new SqlConnection(Properties.Settings.Default.sqlcon);
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

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                //if (dt.Rows[i]["Busy"].Equals(false))
                    chbox_Nurse.Items.Add(dt.Rows[i]["Fullname"].ToString());
            }
        }
        private void btn_Back_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void btn_Save_Click(object sender, EventArgs e)
        {
            try
            {
                string Nurse = "";
                // Determine if there are any items checked.  
                if (chbox_Nurse.CheckedItems.Count != 0)
                {
                    // If so, loop through all checked items and print results.  
                    for (int x = 0; x < chbox_Nurse.CheckedItems.Count; x++)
                    {
                        Nurse = Nurse + chbox_Nurse.CheckedItems[x].ToString() + ",";
                    }
                }

                SqlCommand cmd_Insert = new SqlCommand("sp_do_surgery_insert", conn);
                cmd_Insert.CommandType = CommandType.StoredProcedure;

                cmd_Insert.Parameters.AddWithValue("@Dr_ID", cmb_Doctor.Text);
                cmd_Insert.Parameters.AddWithValue("@N_ID", Nurse);
                cmd_Insert.Parameters.AddWithValue("@S_ID", cmb_Surgery.Text);
                cmd_Insert.Parameters.AddWithValue("@S_R_ID", cmb_Surgery_Room.Text);
                cmd_Insert.Parameters.AddWithValue("@P_ID", cmb_Patient.Text);
                cmd_Insert.Parameters.AddWithValue("@Date", datetime_Date.Value.Date);
                cmd_Insert.Parameters.AddWithValue("@Start_Time", datetime_Start_Time.Value.TimeOfDay);
                cmd_Insert.Parameters.AddWithValue("@End_Time", datetime_End_Time.Value.TimeOfDay);
                if (chbox_Is_Emergency.Checked)
                    cmd_Insert.Parameters.AddWithValue("@Emergency", true);
                else
                    cmd_Insert.Parameters.AddWithValue("@Emergency", false);

                conn.Open();
                if (!Is_Busy())
                {
                    cmd_Insert.ExecuteNonQuery();
                    Update("sp_doctor_update", cmb_Doctor.Text);
                    for (int x = 0; x < chbox_Nurse.CheckedItems.Count; x++)
                    {
                        Update("sp_nurse_update", chbox_Nurse.CheckedItems[x].ToString());
                    }
                    MessageBox.Show("The data Saved successful", "Saved", MessageBoxButtons.OK);
                }
                else
                    MessageBox.Show("This Doctor is Busy now", "Error",MessageBoxButtons.OK );
                conn.Close();

            }
            catch (Exception exp)
            {
                conn.Close();
                MessageBox.Show(exp.Message);
            }




        }
        public void Update(string Sp, string Fullname)
        {
            SqlCommand cmdUpdate = new SqlCommand(Sp, conn);
            cmdUpdate.CommandType = CommandType.StoredProcedure;
            cmdUpdate.Parameters.AddWithValue("@Fullname", Fullname);
            cmdUpdate.Parameters.AddWithValue("@Busy", true);
            //  conn.Open();
            cmdUpdate.ExecuteNonQuery();
            //  conn.Close();
        }

        public bool Is_Busy()
        {
            SqlCommand cmd_Is_Busy = new SqlCommand("sp_doctor_is_busy", conn);
            cmd_Is_Busy.CommandType = CommandType.StoredProcedure;

            cmd_Is_Busy.Parameters.AddWithValue("@Fullname", cmb_Doctor.Text);
            cmd_Is_Busy.Parameters.AddWithValue("@Date", datetime_Date.Value.Date);
            cmd_Is_Busy.Parameters.AddWithValue("@End_Time", datetime_End_Time.Value.TimeOfDay);

            SqlDataReader dr = cmd_Is_Busy.ExecuteReader();
            if (dr.Read())
            {
                dr.Close();
                return true;
            }
            else
            {
                dr.Close();
                return false;
            }

           
           
        }
    }
}
