
namespace Exercise11
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.panel_Left = new System.Windows.Forms.Panel();
            this.btnHW_Ex1 = new System.Windows.Forms.Button();
            this.btnEx2 = new System.Windows.Forms.Button();
            this.btnEx1 = new System.Windows.Forms.Button();
            this.btnMau1 = new System.Windows.Forms.Button();
            this.panel_Top = new System.Windows.Forms.Panel();
            this.label_Val = new System.Windows.Forms.Label();
            this.panel_Container = new System.Windows.Forms.Panel();
            this.pictureBox_Val = new System.Windows.Forms.PictureBox();
            this.button1 = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.panel_Left.SuspendLayout();
            this.panel_Top.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox_Val)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // panel_Left
            // 
            this.panel_Left.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(5)))), ((int)(((byte)(84)))), ((int)(((byte)(159)))));
            this.panel_Left.Controls.Add(this.btnHW_Ex1);
            this.panel_Left.Controls.Add(this.btnEx2);
            this.panel_Left.Controls.Add(this.btnEx1);
            this.panel_Left.Controls.Add(this.btnMau1);
            this.panel_Left.Controls.Add(this.pictureBox1);
            resources.ApplyResources(this.panel_Left, "panel_Left");
            this.panel_Left.Name = "panel_Left";
            // 
            // btnHW_Ex1
            // 
            this.btnHW_Ex1.BackColor = System.Drawing.Color.RoyalBlue;
            resources.ApplyResources(this.btnHW_Ex1, "btnHW_Ex1");
            this.btnHW_Ex1.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnHW_Ex1.Name = "btnHW_Ex1";
            this.btnHW_Ex1.UseVisualStyleBackColor = false;
            // 
            // btnEx2
            // 
            this.btnEx2.BackColor = System.Drawing.Color.RoyalBlue;
            resources.ApplyResources(this.btnEx2, "btnEx2");
            this.btnEx2.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnEx2.Name = "btnEx2";
            this.btnEx2.UseVisualStyleBackColor = false;
            // 
            // btnEx1
            // 
            this.btnEx1.BackColor = System.Drawing.Color.RoyalBlue;
            resources.ApplyResources(this.btnEx1, "btnEx1");
            this.btnEx1.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnEx1.Name = "btnEx1";
            this.btnEx1.UseVisualStyleBackColor = false;
            // 
            // btnMau1
            // 
            this.btnMau1.BackColor = System.Drawing.Color.RoyalBlue;
            resources.ApplyResources(this.btnMau1, "btnMau1");
            this.btnMau1.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnMau1.Name = "btnMau1";
            this.btnMau1.UseVisualStyleBackColor = false;
            this.btnMau1.Click += new System.EventHandler(this.btnMau1_Click);
            // 
            // panel_Top
            // 
            this.panel_Top.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(5)))), ((int)(((byte)(84)))), ((int)(((byte)(159)))));
            this.panel_Top.Controls.Add(this.pictureBox_Val);
            this.panel_Top.Controls.Add(this.button1);
            this.panel_Top.Controls.Add(this.label_Val);
            resources.ApplyResources(this.panel_Top, "panel_Top");
            this.panel_Top.Name = "panel_Top";
            // 
            // label_Val
            // 
            resources.ApplyResources(this.label_Val, "label_Val");
            this.label_Val.BackColor = System.Drawing.Color.Transparent;
            this.label_Val.ForeColor = System.Drawing.SystemColors.Control;
            this.label_Val.Name = "label_Val";
            // 
            // panel_Container
            // 
            this.panel_Container.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(221)))), ((int)(((byte)(242)))), ((int)(((byte)(253)))));
            resources.ApplyResources(this.panel_Container, "panel_Container");
            this.panel_Container.Name = "panel_Container";
            // 
            // pictureBox_Val
            // 
            this.pictureBox_Val.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox_Val.Image = global::Exercise11.Properties.Resources.dashboard_icon;
            resources.ApplyResources(this.pictureBox_Val, "pictureBox_Val");
            this.pictureBox_Val.Name = "pictureBox_Val";
            this.pictureBox_Val.TabStop = false;
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.Color.Transparent;
            resources.ApplyResources(this.button1, "button1");
            this.button1.ForeColor = System.Drawing.Color.Transparent;
            this.button1.Image = global::Exercise11.Properties.Resources.icons8_delete_48;
            this.button1.Name = "button1";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            resources.ApplyResources(this.pictureBox1, "pictureBox1");
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.TabStop = false;
            this.pictureBox1.Click += new System.EventHandler(this.pictureBox1_Click);
            // 
            // MainForm
            // 
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.panel_Container);
            this.Controls.Add(this.panel_Top);
            this.Controls.Add(this.panel_Left);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "MainForm";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.panel_Left.ResumeLayout(false);
            this.panel_Top.ResumeLayout(false);
            this.panel_Top.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox_Val)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel_Left;
        private System.Windows.Forms.Button btnHW_Ex1;
        private System.Windows.Forms.Button btnEx2;
        private System.Windows.Forms.Button btnEx1;
        private System.Windows.Forms.Button btnMau1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Panel panel_Top;
        private System.Windows.Forms.Label label_Val;
        private System.Windows.Forms.Panel panel_Container;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.PictureBox pictureBox_Val;
    }
}

