using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using System.Data.SqlClient;

namespace ChuongTrinhQLNhaSach
{
    public partial class FormChuongTrinh : Form
    {
        public FormChuongTrinh()
        {
            InitializeComponent();
        }
        SqlConnection conn;

        private void DanhMucToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void FormChuongTrinh_Load(object sender, EventArgs e)
        {
            PhanQuyen();
            string conString = ConfigurationManager.ConnectionStrings["QLNHASACH"].ConnectionString.ToString();
            conn = new SqlConnection(conString);
            conn.Open();
        }
        public void HienThi()
        {
            //string sqlSELECT = "SELECT MANV,TENNV,GIOITINH,MANQL,LUONG FROM NHANVIEN";
            ////adapt = new SqlDataAdapter(sqlSELECT, conn);
            //SqlCommand cmd = new SqlCommand(sqlSELECT, conn);
            //SqlDataReader dr = cmd.ExecuteReader();
            //DataTable dt = new DataTable();
            //dt.Load(dr);
            //dataGridView1.DataSource = dt;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
            DangNhap a = new DangNhap();
            a.Show();
        }

        private void nHÀSẢNXUẤTToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            NhaSX a = new NhaSX();
            a.Show();
            this.Hide();
        }

        private void tRANGCHỦToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Show();
        }

        private void mẶTHÀNGToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MatHang a = new MatHang();
            a.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string sqlTim = "SELECT * FROM NHANVIEN WHERE MANV LIKE '%" + textBox1.Text.Trim() + "%' OR TENNV LIKE '%" + textBox1.Text.Trim() + "%' OR GIOITINH LIKE '%" + textBox1.Text.Trim() + "%' ";
            SqlCommand cmd = new SqlCommand(sqlTim, conn);
            cmd.ExecuteNonQuery();
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            dataGridView1.DataSource = dt;
        }

        private void lOẠIMẶTHÀNGToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            BaoCao a = new BaoCao();
            a.Show();
            this.Hide();
        }
        void PhanQuyen()
        {
            switch(ToanCuc.TaiKhoan.Loaitk)
            {
                case TK_MK.LoaiTK.user:
                    DanhMucToolStripMenuItem.Enabled = lOẠIMẶTHÀNGToolStripMenuItem1.Enabled = mẶTHÀNGToolStripMenuItem.Enabled =  false;
                    break;
                case TK_MK.LoaiTK.nhanvien:
                    lOẠIMẶTHÀNGToolStripMenuItem1.Enabled = mẶTHÀNGToolStripMenuItem.Enabled =  false;
                    break;

            }
            lbl_LoaiTK.Text = ToanCuc.TaiKhoan.TenHienThi;
        }
    }
}
