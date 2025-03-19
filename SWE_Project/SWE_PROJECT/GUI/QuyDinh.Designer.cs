
namespace GUI
{
    partial class QuyDinh
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(QuyDinh));
            this.richTextBoxAdmin = new System.Windows.Forms.RichTextBox();
            this.richTextBoxNV = new System.Windows.Forms.RichTextBox();
            this.richTextBoxDoiTra = new System.Windows.Forms.RichTextBox();
            this.btnDoiTra = new Guna.UI2.WinForms.Guna2Button();
            this.btnNhanVien = new Guna.UI2.WinForms.Guna2Button();
            this.btnAdmin = new Guna.UI2.WinForms.Guna2Button();
            this.SuspendLayout();
            // 
            // richTextBoxAdmin
            // 
            this.richTextBoxAdmin.Font = new System.Drawing.Font("Bahnschrift Condensed", 27.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.richTextBoxAdmin.Location = new System.Drawing.Point(277, 131);
            this.richTextBoxAdmin.Name = "richTextBoxAdmin";
            this.richTextBoxAdmin.Size = new System.Drawing.Size(963, 620);
            this.richTextBoxAdmin.TabIndex = 33;
            this.richTextBoxAdmin.Text = resources.GetString("richTextBoxAdmin.Text");
            // 
            // richTextBoxNV
            // 
            this.richTextBoxNV.Font = new System.Drawing.Font("Bahnschrift Condensed", 27.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.richTextBoxNV.Location = new System.Drawing.Point(277, 131);
            this.richTextBoxNV.Name = "richTextBoxNV";
            this.richTextBoxNV.Size = new System.Drawing.Size(963, 620);
            this.richTextBoxNV.TabIndex = 34;
            this.richTextBoxNV.Text = resources.GetString("richTextBoxNV.Text");
            // 
            // richTextBoxDoiTra
            // 
            this.richTextBoxDoiTra.Font = new System.Drawing.Font("Bahnschrift Condensed", 27.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.richTextBoxDoiTra.Location = new System.Drawing.Point(277, 131);
            this.richTextBoxDoiTra.Name = "richTextBoxDoiTra";
            this.richTextBoxDoiTra.Size = new System.Drawing.Size(963, 620);
            this.richTextBoxDoiTra.TabIndex = 35;
            this.richTextBoxDoiTra.Text = resources.GetString("richTextBoxDoiTra.Text");
            // 
            // btnDoiTra
            // 
            this.btnDoiTra.BorderThickness = 1;
            this.btnDoiTra.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnDoiTra.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnDoiTra.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnDoiTra.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnDoiTra.FillColor = System.Drawing.Color.Transparent;
            this.btnDoiTra.Font = new System.Drawing.Font("Bahnschrift", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDoiTra.ForeColor = System.Drawing.Color.Black;
            this.btnDoiTra.Image = global::GUI.Properties.Resources.icons8_bill_64;
            this.btnDoiTra.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnDoiTra.ImageSize = new System.Drawing.Size(50, 50);
            this.btnDoiTra.Location = new System.Drawing.Point(810, 25);
            this.btnDoiTra.Name = "btnDoiTra";
            this.btnDoiTra.Size = new System.Drawing.Size(295, 90);
            this.btnDoiTra.TabIndex = 32;
            this.btnDoiTra.Text = "ĐỔI TRẢ";
            this.btnDoiTra.TextOffset = new System.Drawing.Point(10, 0);
            this.btnDoiTra.Click += new System.EventHandler(this.btnDoiTra_Click);
            // 
            // btnNhanVien
            // 
            this.btnNhanVien.BorderThickness = 1;
            this.btnNhanVien.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnNhanVien.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnNhanVien.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnNhanVien.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnNhanVien.FillColor = System.Drawing.Color.Transparent;
            this.btnNhanVien.Font = new System.Drawing.Font("Bahnschrift", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnNhanVien.ForeColor = System.Drawing.Color.Black;
            this.btnNhanVien.Image = global::GUI.Properties.Resources.icons8_bill_64;
            this.btnNhanVien.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnNhanVien.ImageSize = new System.Drawing.Size(50, 50);
            this.btnNhanVien.Location = new System.Drawing.Point(426, 25);
            this.btnNhanVien.Name = "btnNhanVien";
            this.btnNhanVien.Size = new System.Drawing.Size(295, 90);
            this.btnNhanVien.TabIndex = 31;
            this.btnNhanVien.Text = "NHÂN VIÊN";
            this.btnNhanVien.TextOffset = new System.Drawing.Point(10, 0);
            this.btnNhanVien.Click += new System.EventHandler(this.btnNhanVien_Click);
            // 
            // btnAdmin
            // 
            this.btnAdmin.BorderThickness = 1;
            this.btnAdmin.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnAdmin.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnAdmin.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnAdmin.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnAdmin.FillColor = System.Drawing.Color.Transparent;
            this.btnAdmin.Font = new System.Drawing.Font("Bahnschrift", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAdmin.ForeColor = System.Drawing.Color.Black;
            this.btnAdmin.Image = global::GUI.Properties.Resources.icons8_bill_64;
            this.btnAdmin.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.btnAdmin.ImageSize = new System.Drawing.Size(50, 50);
            this.btnAdmin.Location = new System.Drawing.Point(35, 25);
            this.btnAdmin.Name = "btnAdmin";
            this.btnAdmin.Size = new System.Drawing.Size(295, 90);
            this.btnAdmin.TabIndex = 30;
            this.btnAdmin.Text = "ADMIN";
            this.btnAdmin.TextOffset = new System.Drawing.Point(10, 0);
            this.btnAdmin.Click += new System.EventHandler(this.btnAdmin_Click);
            // 
            // QuyDinh
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1578, 865);
            this.Controls.Add(this.richTextBoxDoiTra);
            this.Controls.Add(this.richTextBoxNV);
            this.Controls.Add(this.richTextBoxAdmin);
            this.Controls.Add(this.btnDoiTra);
            this.Controls.Add(this.btnNhanVien);
            this.Controls.Add(this.btnAdmin);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "QuyDinh";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "QuyDinh";
            this.Load += new System.EventHandler(this.QuyDinh_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private Guna.UI2.WinForms.Guna2Button btnAdmin;
        private Guna.UI2.WinForms.Guna2Button btnNhanVien;
        private Guna.UI2.WinForms.Guna2Button btnDoiTra;
        private System.Windows.Forms.RichTextBox richTextBoxAdmin;
        private System.Windows.Forms.RichTextBox richTextBoxNV;
        private System.Windows.Forms.RichTextBox richTextBoxDoiTra;
    }
}