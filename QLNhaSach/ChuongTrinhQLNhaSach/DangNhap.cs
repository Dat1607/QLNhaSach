using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ChuongTrinhQLNhaSach
{
    public partial class DangNhap : Form
    {
        List<TK_MK> lstTaiKhoan = DSTaiKhoan.Instance.LstTaiKhoan;
        public DangNhap()
        {
            InitializeComponent();
        }
        bool KiemTraDangNhap(string tk, string mk)
        {
            for (int i = 0; i < lstTaiKhoan.Count; i++)
            {
                if (tk == lstTaiKhoan[i].Tk && mk == lstTaiKhoan[i].Mk)
                {
                    ToanCuc.TaiKhoan = lstTaiKhoan[i];
                    return true;
                }    
            }
            return false;

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (KiemTraDangNhap(txt_TaiKhoan.Text, txt_MatKhau.Text))
            {
                FormChuongTrinh f = new FormChuongTrinh();
                f.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Sai tài khoản hoặc mật khẩu!", "Lỗi");
                txt_TaiKhoan.Focus();
            }
        }

        private void btn_Thoat_Click(object sender, EventArgs e)
        {
            DialogResult dg = MessageBox.Show("Bạn có chắc muốn thoát?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (dg == DialogResult.OK)
                Application.Exit();
        }
    }
}
