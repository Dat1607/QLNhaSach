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
    public partial class MatHang : Form
    {
        public MatHang()
        {
            InitializeComponent();
        }
        SqlConnection conn;
        private void MatHang_Load(object sender, EventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["QLNHASACH"].ConnectionString.ToString();
            conn = new SqlConnection(conString);
            conn.Open();
            HienThi();
        }
        public void HienThi()
        {
            SqlCommand cmd = new SqlCommand("Hienthi_MH", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            dataGridView1.DataSource = dt;
        }

        private void btn_Them_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Them_MH", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("MAMH", txt_MaMH.Text);
            cmd.Parameters.AddWithValue("MANSX", txt_MaNSX.Text);
            cmd.Parameters.AddWithValue("MALH", txt_MaLH.Text);
            cmd.Parameters.AddWithValue("TENMH", txt_TenMH.Text);
            cmd.Parameters.AddWithValue("SOLUONG", int.Parse(txt_SoLuong.Text));
            cmd.Parameters.AddWithValue("NAMSX", int.Parse(txt_NSX.Text));
            cmd.ExecuteNonQuery();
            HienThi();
        }

        private void btn_Xoa_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Xoa_MH", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("MAMH", txt_MaMH.Text);
            cmd.ExecuteNonQuery();
            HienThi();
        }

        private void bnt_Sua_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Sua_MH", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("MAMH", txt_MaMH.Text);
            cmd.Parameters.AddWithValue("MANSX", txt_MaNSX.Text);
            cmd.Parameters.AddWithValue("MALH", txt_MaLH.Text);
            cmd.Parameters.AddWithValue("TENMH", txt_TenMH.Text);
            cmd.Parameters.AddWithValue("SOLUONG", int.Parse(txt_SoLuong.Text));
            cmd.Parameters.AddWithValue("NAMSX", int.Parse(txt_NSX.Text));
            cmd.ExecuteNonQuery();
            HienThi();
        }

        private void btn_TroVe_Click(object sender, EventArgs e)
        {
            this.Close();
            FormChuongTrinh a = new FormChuongTrinh();
            a.Show();
        }

        private void dataGridView1_RowEnter(object sender, DataGridViewCellEventArgs e)
        {
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if(dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].Value != null)
            {
                dataGridView1.CurrentRow.Selected = true;
                txt_MaMH.Text = dataGridView1.Rows[e.RowIndex].Cells["MAMH"].FormattedValue.ToString();
                txt_MaNSX.Text = dataGridView1.Rows[e.RowIndex].Cells["MANSX"].FormattedValue.ToString();
                txt_MaLH.Text = dataGridView1.Rows[e.RowIndex].Cells["MALH"].FormattedValue.ToString();
                txt_TenMH.Text = dataGridView1.Rows[e.RowIndex].Cells["TENMH"].FormattedValue.ToString();
                txt_SoLuong.Text = dataGridView1.Rows[e.RowIndex].Cells["SOLUONG"].FormattedValue.ToString();
                txt_NSX.Text = dataGridView1.Rows[e.RowIndex].Cells["NAMSX"].FormattedValue.ToString();

            }    
        }
    }
}
