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
    public partial class BaoCao : Form
    {
        public BaoCao()
        {
            InitializeComponent();
        }

        private void BaoCao_Load(object sender, EventArgs e)
        {
            CrystalReport1 rpt = new CrystalReport1();
            crystalReportViewer1.ReportSource = rpt;
            crystalReportViewer1.DisplayStatusBar = false;
            crystalReportViewer1.DisplayToolbar = true;
            crystalReportViewer1.Refresh();
        }

        private void btn_show_Click(object sender, EventArgs e)
        {
            //CrystalReport1 rpt = new CrystalReport1();
            //crystalReportViewer1.ReportSource = rpt;

            //crystalReportViewer1.Refresh();
            //crystalReportViewer1.DisplayToolbar = false;
            //crystalReportViewer1.DisplayStatusBar = false;
            this.Close();
            FormChuongTrinh a = new FormChuongTrinh();
            a.Show();
        }
    }
}
