namespace ThucHanhBuoi8
{
    partial class Advanced_Ex1
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
            this.btnShow = new System.Windows.Forms.Button();
            this.listViewLop = new System.Windows.Forms.ListView();
            this.SuspendLayout();
            // 
            // btnShow
            // 
            this.btnShow.AutoSize = true;
            this.btnShow.Location = new System.Drawing.Point(33, 11);
            this.btnShow.Margin = new System.Windows.Forms.Padding(2);
            this.btnShow.Name = "btnShow";
            this.btnShow.Size = new System.Drawing.Size(184, 43);
            this.btnShow.TabIndex = 4;
            this.btnShow.Text = "Hiển Thị";
            this.btnShow.UseVisualStyleBackColor = true;
            this.btnShow.Click += new System.EventHandler(this.btnShow_Click);
            // 
            // listViewLop
            // 
            this.listViewLop.HideSelection = false;
            this.listViewLop.Location = new System.Drawing.Point(33, 71);
            this.listViewLop.Margin = new System.Windows.Forms.Padding(2);
            this.listViewLop.Name = "listViewLop";
            this.listViewLop.Size = new System.Drawing.Size(679, 368);
            this.listViewLop.TabIndex = 3;
            this.listViewLop.UseCompatibleStateImageBehavior = false;
            this.listViewLop.View = System.Windows.Forms.View.Details;
            // 
            // Advanced_Ex1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnShow);
            this.Controls.Add(this.listViewLop);
            this.Name = "Advanced_Ex1";
            this.Text = "Advanced_Ex1";
            this.Load += new System.EventHandler(this.Advanced_Ex1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnShow;
        private System.Windows.Forms.ListView listViewLop;
    }
}