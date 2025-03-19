
namespace Exercise13
{
    partial class MainForm
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
            this.groupBox_PN = new System.Windows.Forms.GroupBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.maskedTextBox1 = new System.Windows.Forms.MaskedTextBox();
            this.btn_CreatePN = new System.Windows.Forms.Button();
            this.btn_SavePN = new System.Windows.Forms.Button();
            this.groupBox_CTPN = new System.Windows.Forms.GroupBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.comboBox2 = new System.Windows.Forms.ComboBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.textBox4 = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.textBox5 = new System.Windows.Forms.TextBox();
            this.groupBox_PN.SuspendLayout();
            this.groupBox_CTPN.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox_PN
            // 
            this.groupBox_PN.Controls.Add(this.btn_SavePN);
            this.groupBox_PN.Controls.Add(this.btn_CreatePN);
            this.groupBox_PN.Controls.Add(this.maskedTextBox1);
            this.groupBox_PN.Controls.Add(this.comboBox1);
            this.groupBox_PN.Controls.Add(this.textBox3);
            this.groupBox_PN.Controls.Add(this.textBox1);
            this.groupBox_PN.Controls.Add(this.label4);
            this.groupBox_PN.Controls.Add(this.label3);
            this.groupBox_PN.Controls.Add(this.label2);
            this.groupBox_PN.Controls.Add(this.label1);
            this.groupBox_PN.Location = new System.Drawing.Point(23, 22);
            this.groupBox_PN.Name = "groupBox_PN";
            this.groupBox_PN.Size = new System.Drawing.Size(961, 226);
            this.groupBox_PN.TabIndex = 0;
            this.groupBox_PN.TabStop = false;
            this.groupBox_PN.Text = "Phiếu Nhập";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(24, 37);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(104, 23);
            this.label1.TabIndex = 1;
            this.label1.Text = "Mã Phiếu Nhập";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(24, 100);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(77, 23);
            this.label2.TabIndex = 2;
            this.label2.Text = "Ngày Nhập";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(462, 37);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(98, 23);
            this.label3.TabIndex = 3;
            this.label3.Text = "Nhà Cung Cấp";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(462, 100);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(79, 23);
            this.label4.TabIndex = 4;
            this.label4.Text = "Thành Tiền";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(143, 34);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(282, 30);
            this.textBox1.TabIndex = 5;
            // 
            // textBox3
            // 
            this.textBox3.Location = new System.Drawing.Point(566, 100);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(282, 30);
            this.textBox3.TabIndex = 7;
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(566, 33);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(282, 31);
            this.comboBox1.TabIndex = 8;
            // 
            // maskedTextBox1
            // 
            this.maskedTextBox1.Location = new System.Drawing.Point(143, 100);
            this.maskedTextBox1.Mask = "00/00/0000";
            this.maskedTextBox1.Name = "maskedTextBox1";
            this.maskedTextBox1.Size = new System.Drawing.Size(282, 30);
            this.maskedTextBox1.TabIndex = 9;
            this.maskedTextBox1.ValidatingType = typeof(System.DateTime);
            // 
            // btn_CreatePN
            // 
            this.btn_CreatePN.Image = global::Exercise13.Properties.Resources.icons8_edit_64;
            this.btn_CreatePN.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_CreatePN.Location = new System.Drawing.Point(115, 147);
            this.btn_CreatePN.Name = "btn_CreatePN";
            this.btn_CreatePN.Size = new System.Drawing.Size(226, 45);
            this.btn_CreatePN.TabIndex = 10;
            this.btn_CreatePN.Text = "Tạo Phiếu Nhập";
            this.btn_CreatePN.UseVisualStyleBackColor = true;
            // 
            // btn_SavePN
            // 
            this.btn_SavePN.Image = global::Exercise13.Properties.Resources.icons8_save_48;
            this.btn_SavePN.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_SavePN.Location = new System.Drawing.Point(408, 147);
            this.btn_SavePN.Name = "btn_SavePN";
            this.btn_SavePN.Size = new System.Drawing.Size(206, 45);
            this.btn_SavePN.TabIndex = 11;
            this.btn_SavePN.Text = "Lưu Phiếu Nhập";
            this.btn_SavePN.UseVisualStyleBackColor = true;
            // 
            // groupBox_CTPN
            // 
            this.groupBox_CTPN.Controls.Add(this.textBox5);
            this.groupBox_CTPN.Controls.Add(this.button1);
            this.groupBox_CTPN.Controls.Add(this.button2);
            this.groupBox_CTPN.Controls.Add(this.comboBox2);
            this.groupBox_CTPN.Controls.Add(this.textBox2);
            this.groupBox_CTPN.Controls.Add(this.textBox4);
            this.groupBox_CTPN.Controls.Add(this.label5);
            this.groupBox_CTPN.Controls.Add(this.label6);
            this.groupBox_CTPN.Controls.Add(this.label7);
            this.groupBox_CTPN.Controls.Add(this.label8);
            this.groupBox_CTPN.Location = new System.Drawing.Point(23, 270);
            this.groupBox_CTPN.Name = "groupBox_CTPN";
            this.groupBox_CTPN.Size = new System.Drawing.Size(961, 226);
            this.groupBox_CTPN.TabIndex = 12;
            this.groupBox_CTPN.TabStop = false;
            this.groupBox_CTPN.Text = "Chi Tiết Phiếu Nhập";
            // 
            // button1
            // 
            this.button1.Image = global::Exercise13.Properties.Resources.icons8_save_48;
            this.button1.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.button1.Location = new System.Drawing.Point(408, 147);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(206, 45);
            this.button1.TabIndex = 11;
            this.button1.Text = "Lưu Phiếu Nhập";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // button2
            // 
            this.button2.Image = global::Exercise13.Properties.Resources.icons8_edit_64;
            this.button2.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.button2.Location = new System.Drawing.Point(115, 147);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(226, 45);
            this.button2.TabIndex = 10;
            this.button2.Text = "Tạo Phiếu Nhập";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // comboBox2
            // 
            this.comboBox2.FormattingEnabled = true;
            this.comboBox2.Location = new System.Drawing.Point(566, 33);
            this.comboBox2.Name = "comboBox2";
            this.comboBox2.Size = new System.Drawing.Size(282, 31);
            this.comboBox2.TabIndex = 8;
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(566, 100);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(282, 30);
            this.textBox2.TabIndex = 7;
            // 
            // textBox4
            // 
            this.textBox4.Location = new System.Drawing.Point(143, 34);
            this.textBox4.Name = "textBox4";
            this.textBox4.Size = new System.Drawing.Size(282, 30);
            this.textBox4.TabIndex = 5;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(462, 100);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(69, 23);
            this.label5.TabIndex = 4;
            this.label5.Text = "Số Lượng";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(462, 37);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(97, 23);
            this.label6.TabIndex = 3;
            this.label6.Text = "Mã Sản Phẩm";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(24, 100);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(77, 23);
            this.label7.TabIndex = 2;
            this.label7.Text = "Ngày Nhập";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(24, 37);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(104, 23);
            this.label8.TabIndex = 1;
            this.label8.Text = "Mã Phiếu Nhập";
            // 
            // textBox5
            // 
            this.textBox5.Location = new System.Drawing.Point(143, 97);
            this.textBox5.Name = "textBox5";
            this.textBox5.Size = new System.Drawing.Size(282, 30);
            this.textBox5.TabIndex = 12;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 23F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(996, 707);
            this.Controls.Add(this.groupBox_CTPN);
            this.Controls.Add(this.groupBox_PN);
            this.Font = new System.Drawing.Font("Bahnschrift Condensed", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "MainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Phiểu Nhập Hàng";
            this.groupBox_PN.ResumeLayout(false);
            this.groupBox_PN.PerformLayout();
            this.groupBox_CTPN.ResumeLayout(false);
            this.groupBox_CTPN.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox_PN;
        private System.Windows.Forms.MaskedTextBox maskedTextBox1;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btn_SavePN;
        private System.Windows.Forms.Button btn_CreatePN;
        private System.Windows.Forms.GroupBox groupBox_CTPN;
        private System.Windows.Forms.TextBox textBox5;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.ComboBox comboBox2;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.TextBox textBox4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
    }
}

