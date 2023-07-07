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
    public partial class NhaSX : Form
    {
        public NhaSX()
        {
            InitializeComponent();
        }
        SqlConnection conn;
        private void NhaSX_Load(object sender, EventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["QLNHASACH"].ConnectionString.ToString();
            conn = new SqlConnection(conString);
            conn.Open();
            HienThi();
        }

        private void NhaSX_FormClosing(object sender, FormClosingEventArgs e)
        {
            conn.Close();
        }
        public void HienThi()
        {
            SqlCommand cmd = new SqlCommand("HienThi_NSX", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            dataGridView1.DataSource = dt;
        }

        private void btn_Them_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Them_NSX", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("MANSX", txt_MaNSX.Text);
            cmd.Parameters.AddWithValue("TENNSX", txt_TenNSX.Text);
            cmd.Parameters.AddWithValue("DCNSX", txt_DCNSX.Text);
            cmd.Parameters.AddWithValue("DTNSX", txt_DTNSX.Text);
            cmd.ExecuteNonQuery();
            HienThi();
        }

        private void btn_Sửa_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Sua_NSX", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("MANSX", txt_MaNSX.Text);
            cmd.Parameters.AddWithValue("TENNSX", txt_TenNSX.Text);
            cmd.Parameters.AddWithValue("DCNSX", txt_DCNSX.Text);
            cmd.Parameters.AddWithValue("DTNSX", txt_DTNSX.Text);
            cmd.ExecuteNonQuery();
            HienThi();
        }

        private void btn_Xoa_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Xoa_NSX", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("MANSX", txt_MaNSX.Text);
            cmd.ExecuteNonQuery();
            HienThi();
        }

        private void btn_Tim_Click(object sender, EventArgs e)
        {
            string sqlTim = "SELECT * FROM NHASANXUAT WHERE MANSX = @MANSX OR TENNSX = @TENNSX ";
            SqlCommand cmd = new SqlCommand(sqlTim, conn);
            cmd.Parameters.AddWithValue("MANSX", txt_Tim.Text);
            cmd.Parameters.AddWithValue("TENNSX", txt_Tim.Text);
            cmd.Parameters.AddWithValue("DCNSX", txt_DCNSX.Text);
            cmd.Parameters.AddWithValue("DTNSX", txt_DTNSX.Text);
            cmd.ExecuteNonQuery();
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            dataGridView1.DataSource = dt;

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void btn_TroVe_Click(object sender, EventArgs e)
        {
            this.Close();
            FormChuongTrinh a = new FormChuongTrinh();
            a.Show();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].Value != null)
            {
                dataGridView1.CurrentRow.Selected = true;
                txt_MaNSX.Text = dataGridView1.Rows[e.RowIndex].Cells["MANSX"].FormattedValue.ToString();
                txt_TenNSX.Text = dataGridView1.Rows[e.RowIndex].Cells["TENNSX"].FormattedValue.ToString();
                txt_DCNSX.Text = dataGridView1.Rows[e.RowIndex].Cells["DCNSX"].FormattedValue.ToString();
                txt_DTNSX.Text = dataGridView1.Rows[e.RowIndex].Cells["DTNSX"].FormattedValue.ToString();
            }
        }
    }
}
