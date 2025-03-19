namespace ThucHanhBuoi8
{
    partial class Advanced_Ex2
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
            this.txtTongDiem = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.comboBoxMonHoc = new System.Windows.Forms.ComboBox();
            this.btnLocDuLieu = new System.Windows.Forms.Button();
            this.listViewData = new System.Windows.Forms.ListView();
            this.ColumnSTT = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnTenSV = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnNgaySinh = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnTenMonHoc = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnDiem = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.SuspendLayout();
            // 
            // txtTongDiem
            // 
            this.txtTongDiem.Location = new System.Drawing.Point(227, 377);
            this.txtTongDiem.Margin = new System.Windows.Forms.Padding(2);
            this.txtTongDiem.Name = "txtTongDiem";
            this.txtTongDiem.Size = new System.Drawing.Size(66, 20);
            this.txtTongDiem.TabIndex = 16;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(104, 378);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(86, 20);
            this.label2.TabIndex = 15;
            this.label2.Text = "Tổng Điểm";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(56, 40);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(40, 20);
            this.label1.TabIndex = 14;
            this.label1.Text = "Môn";
            // 
            // comboBoxMonHoc
            // 
            this.comboBoxMonHoc.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.comboBoxMonHoc.FormattingEnabled = true;
            this.comboBoxMonHoc.Location = new System.Drawing.Point(122, 35);
            this.comboBoxMonHoc.Margin = new System.Windows.Forms.Padding(2);
            this.comboBoxMonHoc.Name = "comboBoxMonHoc";
            this.comboBoxMonHoc.Size = new System.Drawing.Size(124, 25);
            this.comboBoxMonHoc.TabIndex = 13;
            // 
            // btnLocDuLieu
            // 
            this.btnLocDuLieu.AutoSize = true;
            this.btnLocDuLieu.Location = new System.Drawing.Point(310, 26);
            this.btnLocDuLieu.Margin = new System.Windows.Forms.Padding(2);
            this.btnLocDuLieu.Name = "btnLocDuLieu";
            this.btnLocDuLieu.Size = new System.Drawing.Size(75, 42);
            this.btnLocDuLieu.TabIndex = 11;
            this.btnLocDuLieu.Text = "Lọc Dữ Liệu";
            this.btnLocDuLieu.UseVisualStyleBackColor = true;
            this.btnLocDuLieu.Click += new System.EventHandler(this.btnLocDuLieu_Click);
            // 
            // listViewData
            // 
            this.listViewData.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.ColumnSTT,
            this.columnTenSV,
            this.columnNgaySinh,
            this.columnTenMonHoc,
            this.columnDiem});
            this.listViewData.HideSelection = false;
            this.listViewData.Location = new System.Drawing.Point(27, 81);
            this.listViewData.Margin = new System.Windows.Forms.Padding(2);
            this.listViewData.Name = "listViewData";
            this.listViewData.Size = new System.Drawing.Size(637, 288);
            this.listViewData.TabIndex = 10;
            this.listViewData.UseCompatibleStateImageBehavior = false;
            this.listViewData.View = System.Windows.Forms.View.Details;
            // 
            // ColumnSTT
            // 
            this.ColumnSTT.Text = "STT";
            // 
            // columnTenSV
            // 
            this.columnTenSV.Text = "Tên Sinh Viên";
            this.columnTenSV.Width = 152;
            // 
            // columnNgaySinh
            // 
            this.columnNgaySinh.Text = "Ngày Sinh";
            this.columnNgaySinh.Width = 173;
            // 
            // columnTenMonHoc
            // 
            this.columnTenMonHoc.Text = "Tên Môn Học";
            this.columnTenMonHoc.Width = 130;
            // 
            // columnDiem
            // 
            this.columnDiem.Text = "Điểm";
            // 
            // Advanced_Ex2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.txtTongDiem);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.comboBoxMonHoc);
            this.Controls.Add(this.btnLocDuLieu);
            this.Controls.Add(this.listViewData);
            this.Name = "Advanced_Ex2";
            this.Text = "Advanced_Ex2";
            this.Load += new System.EventHandler(this.Advanced_Ex2_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtTongDiem;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox comboBoxMonHoc;
        private System.Windows.Forms.Button btnLocDuLieu;
        private System.Windows.Forms.ListView listViewData;
        private System.Windows.Forms.ColumnHeader ColumnSTT;
        private System.Windows.Forms.ColumnHeader columnTenSV;
        private System.Windows.Forms.ColumnHeader columnNgaySinh;
        private System.Windows.Forms.ColumnHeader columnTenMonHoc;
        private System.Windows.Forms.ColumnHeader columnDiem;
    }
}