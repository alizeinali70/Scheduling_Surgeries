namespace Scheduling_Surgeries
{
    partial class frm_Doctor
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frm_Doctor));
            this.label1 = new System.Windows.Forms.Label();
            this.txt_Fullname = new System.Windows.Forms.TextBox();
            this.datagrid = new System.Windows.Forms.DataGridView();
            this.txt_Specialist = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.btn_Save = new System.Windows.Forms.Button();
            this.btn_Update = new System.Windows.Forms.Button();
            this.btn_Back = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.datagrid)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(10, 7);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(97, 30);
            this.label1.TabIndex = 0;
            this.label1.Text = "Fullname";
            // 
            // txt_Fullname
            // 
            this.txt_Fullname.Location = new System.Drawing.Point(114, 5);
            this.txt_Fullname.Margin = new System.Windows.Forms.Padding(2);
            this.txt_Fullname.Name = "txt_Fullname";
            this.txt_Fullname.Size = new System.Drawing.Size(214, 35);
            this.txt_Fullname.TabIndex = 1;
            // 
            // datagrid
            // 
            this.datagrid.AllowUserToAddRows = false;
            this.datagrid.AllowUserToDeleteRows = false;
            this.datagrid.AllowUserToResizeColumns = false;
            this.datagrid.AllowUserToResizeRows = false;
            this.datagrid.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.datagrid.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.datagrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.datagrid.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
            this.datagrid.Location = new System.Drawing.Point(2, 93);
            this.datagrid.Margin = new System.Windows.Forms.Padding(2);
            this.datagrid.MultiSelect = false;
            this.datagrid.Name = "datagrid";
            this.datagrid.ReadOnly = true;
            this.datagrid.Size = new System.Drawing.Size(498, 169);
            this.datagrid.TabIndex = 7;
            // 
            // txt_Specialist
            // 
            this.txt_Specialist.Location = new System.Drawing.Point(114, 54);
            this.txt_Specialist.Margin = new System.Windows.Forms.Padding(2);
            this.txt_Specialist.Name = "txt_Specialist";
            this.txt_Specialist.Size = new System.Drawing.Size(214, 35);
            this.txt_Specialist.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(10, 56);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(99, 30);
            this.label2.TabIndex = 3;
            this.label2.Text = "Specialist";
            // 
            // btn_Save
            // 
            this.btn_Save.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btn_Save.BackgroundImage")));
            this.btn_Save.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btn_Save.Location = new System.Drawing.Point(394, 24);
            this.btn_Save.Margin = new System.Windows.Forms.Padding(2);
            this.btn_Save.Name = "btn_Save";
            this.btn_Save.Size = new System.Drawing.Size(48, 49);
            this.btn_Save.TabIndex = 3;
            this.btn_Save.UseVisualStyleBackColor = true;
            this.btn_Save.Click += new System.EventHandler(this.btn_Save_Click);
            // 
            // btn_Update
            // 
            this.btn_Update.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btn_Update.BackgroundImage")));
            this.btn_Update.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btn_Update.Location = new System.Drawing.Point(343, 24);
            this.btn_Update.Margin = new System.Windows.Forms.Padding(2);
            this.btn_Update.Name = "btn_Update";
            this.btn_Update.Size = new System.Drawing.Size(48, 49);
            this.btn_Update.TabIndex = 4;
            this.btn_Update.UseVisualStyleBackColor = true;
            this.btn_Update.Visible = false;
            // 
            // btn_Back
            // 
            this.btn_Back.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btn_Back.BackgroundImage")));
            this.btn_Back.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btn_Back.Location = new System.Drawing.Point(446, 24);
            this.btn_Back.Margin = new System.Windows.Forms.Padding(2);
            this.btn_Back.Name = "btn_Back";
            this.btn_Back.Size = new System.Drawing.Size(48, 49);
            this.btn_Back.TabIndex = 5;
            this.btn_Back.UseVisualStyleBackColor = true;
            this.btn_Back.Click += new System.EventHandler(this.btn_Back_Click);
            // 
            // label3
            // 
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 60F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.label3.ForeColor = System.Drawing.Color.Red;
            this.label3.Location = new System.Drawing.Point(3, 262);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(497, 87);
            this.label3.TabIndex = 18;
            this.label3.Text = "Add Doctor";
            // 
            // frm_Doctor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(12F, 30F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.ClientSize = new System.Drawing.Size(502, 345);
            this.ControlBox = false;
            this.Controls.Add(this.label3);
            this.Controls.Add(this.btn_Back);
            this.Controls.Add(this.btn_Update);
            this.Controls.Add(this.btn_Save);
            this.Controls.Add(this.txt_Specialist);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.datagrid);
            this.Controls.Add(this.txt_Fullname);
            this.Controls.Add(this.label1);
            this.Font = new System.Drawing.Font("Segoe UI", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Margin = new System.Windows.Forms.Padding(6, 7, 6, 7);
            this.Name = "frm_Doctor";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Load += new System.EventHandler(this.frm_Doctor_Load);
            ((System.ComponentModel.ISupportInitialize)(this.datagrid)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txt_Fullname;
        private System.Windows.Forms.DataGridView datagrid;
        private System.Windows.Forms.TextBox txt_Specialist;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btn_Save;
        private System.Windows.Forms.Button btn_Update;
        private System.Windows.Forms.Button btn_Back;
        private System.Windows.Forms.Label label3;
    }
}