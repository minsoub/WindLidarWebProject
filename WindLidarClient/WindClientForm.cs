﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindLidarClient
{
    public partial class WindClientForm : Form
    {
        private ObserverProcess process;
        delegate void Invoke_DoUIChange(string msg);

        protected StatusBar mainStatusBar;
        protected StatusBarPanel statusPanel;
        protected StatusBarPanel datetimePanel;
        protected IniFile myIniFile;
        protected string m_sndLocalPort;
        protected int m_st_rcv_port;
        protected int m_ft_rcv_port;
        private Point mousePoint;


        public WindClientForm()
        {
            InitializeComponent();

            // this.FormBorderStyle = FormBorderStyle.None;   // 윈도우 테두리 제거
            this.Text = "";
            this.ControlBox = false;
            //this.FormBorderStyle = Sizeable;


            process = null;

            myIniFile = new IniFile(@"D:\WindLidarClient.ini");

            txtIP.Text = myIniFile.Read("FTP_IP");
            txtPort.Text = myIniFile.Read("FTP_PORT");
            txtID.Text = myIniFile.Read("FTP_ID");
            txtPass.Text = myIniFile.Read("FTP_PASS");

            txtStIP.Text = myIniFile.Read("ST_IP");
            txtStPort.Text = myIniFile.Read("ST_PORT"); 

            cboSite.Items.Add(myIniFile.Read("ST_CODE1"));
            cboSite.Items.Add(myIniFile.Read("ST_CODE2"));
            cboSite.Items.Add(myIniFile.Read("ST_CODE3"));

            m_sndLocalPort = myIniFile.Read("SndLocalPort");
            m_st_rcv_port = System.Convert.ToInt32(myIniFile.Read("ST_RCV_PORT"));
            m_ft_rcv_port = System.Convert.ToInt32(myIniFile.Read("FT_RCV_PORT"));
            btnStart.Enabled = true;
            btnStop.Enabled = false;

            cboSite.SelectedIndex = 0;

            createStatusBar();

            panelClose.BackgroundImage = Properties.Resources.close;
            panelClose.BackgroundImageLayout = ImageLayout.Stretch;

            panelHide.BackgroundImage = Properties.Resources.hide;
            panelHide.BackgroundImageLayout = ImageLayout.Stretch;
        }

        private void btnStart_Click(object sender, EventArgs e)
        {

            if (process == null)
            {

                // validation check
                // IP, Port, ID, Pass
                if (txtIP.Text == "")
                {
                    MessageBox.Show("호스트를 입력하지 않았습니다", "입력에러", MessageBoxButtons.OK);
                    return;
                }
                if (txtPort.Text == "")
                {
                    MessageBox.Show("서버 FTP Port를 입력하지 않았습니다", "입력에러", MessageBoxButtons.OK);
                    return;
                }
                if (txtID.Text == "")
                {
                    MessageBox.Show("User ID를 입력하지 않았습니다", "입력에러", MessageBoxButtons.OK);
                    return;
                }
                if (txtPass.Text == "")
                {
                    MessageBox.Show("User Password를 입력하지 않았습니다", "입력에러", MessageBoxButtons.OK);
                    return;
                }

                process = new ObserverProcess(this);
                process.setHost(txtIP.Text);
                process.setID(txtID.Text);
                process.setPass(txtPass.Text);
                process.setPort(txtPort.Text);

                process.setStHost(txtStIP.Text);
                process.setStPort(txtStPort.Text);
                process.setStCode(cboSite.Text);

                process.setSndLocalPort(m_sndLocalPort, m_st_rcv_port, m_ft_rcv_port);

                txtIP.ReadOnly = true;
                txtPort.ReadOnly = true;
                txtID.ReadOnly = true;
                txtPass.ReadOnly = true;
                btnStart.Enabled = false;
                btnStop.Enabled = true;


                process.start();

                statusPanel.Text = "Process started. Action Start....";
                statusPanel.ToolTipText = "Last Activity";
            }
        }

        public void logMessage(string msg)
        {
            // 쓰레드에서 컨트롤 접근 제어 문제 해결
            //Dispatcher.Invoke(DispatcherPriority.Normal, new Action(delegate
            //{
            //if (process.Invoke)
            //   String sendTime = "[" + DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss") + "]";
            //    lstLog.Items.Insert(0, sendTime + msg); //  Add(msg); 
            //}));

            logMessage(lstLog, msg);
        }
        /**
         * ProgressBar의 시작점을 설정한다.
         * ProgressBar가 진행할 때 최초 시작점으로 0을 설정한다.
         */
        public void StartPointProgress(int data)
        {
            StartPointProgress(proBar, data);
        }
        /**
         * ProgressBar의 최대 Maximum의 숫자를 지정한다.
         */
        public void EndPointProgress(int data)
        {
            EndPointProgress(proBar, data);
        }
        /**
         * ProgressBar의 진행을 설정한다.
         */
        public void IngProgress(int data)
        {
            IngProgress(proBar, data);
        }

        private void logMessage(ListBox _lstLog, string _msg)
        {
            if (_lstLog.InvokeRequired)     // 해당 컨트롤이 Invoke를 요구한다면
            {
                _lstLog.Invoke(new logMessageDelegate(logMessage), new object[] { _lstLog, _msg });
            }
            else
            {
                string sendTime = " [" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]";
                // lstLog.Items.Insert(0, sendTime + _msg); //  Add(msg); 
                if (lstLog.Items.Count == 5000)
                {
                    lstLog.Items.RemoveAt(0);
                }
                lstLog.Items.Add(sendTime + _msg); //  Add(msg); 
                lstLog.SelectedIndex = lstLog.Items.Count - 1;
            }
        }

        private void StartPointProgress(ProgressBar _proBar, int _msg)
        {
            if (_proBar.InvokeRequired)     // 해당 컨트롤이 Invoke를 요구한다면
            {
                _proBar.Invoke(new StartPointProgressDelegate(StartPointProgress), new object[] { _proBar, _msg });
            }
            else
            {
                Console.WriteLine("ProgressBar Minimum : " + _msg);
                _proBar.Minimum = _msg;
                _proBar.Step = _msg;
            }
        }

        private void EndPointProgress(ProgressBar _proBar, int _msg)
        {
            if (_proBar.InvokeRequired)     // 해당 컨트롤이 Invoke를 요구한다면
            {
                _proBar.Invoke(new EndPointProgressDelegate(EndPointProgress), new object[] { _proBar, _msg });
            }
            else
            {
                Console.WriteLine("ProgressBar Maximum : " + _msg);
                _proBar.Maximum = _msg;
            }
        }
        private void IngProgress(ProgressBar _proBar, int _msg)
        {
            if (_proBar.InvokeRequired)     // 해당 컨트롤이 Invoke를 요구한다면
            {
                _proBar.Invoke(new IngProgressDelegate(IngProgress), new object[] { _proBar, _msg });
            }
            else
            {
                Console.WriteLine("ProgressBar process : " + _msg);
                _proBar.Step = _msg;
            }
        }


        private delegate void logMessageDelegate(ListBox _lstLog, string _msg);
        private delegate void StartPointProgressDelegate(ProgressBar _proBar, int _msg);
        private delegate void EndPointProgressDelegate(ProgressBar _proBar, int _msg);
        private delegate void IngProgressDelegate(ProgressBar _proBar, int _msg);

        private void createStatusBar()
        {
            mainStatusBar = new StatusBar();
            statusPanel = new StatusBarPanel();
            datetimePanel = new StatusBarPanel();

            // Set first panel properties and add to StatusBar
            statusPanel.BorderStyle = StatusBarPanelBorderStyle.Sunken;
            statusPanel.Text = "Application started. No action yet.";
            statusPanel.ToolTipText = "Last Activity";
            statusPanel.AutoSize = StatusBarPanelAutoSize.Spring;
            mainStatusBar.Panels.Add(statusPanel);

            // Set second panel properties and add to StatusBar
            string sendTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            datetimePanel.BorderStyle = StatusBarPanelBorderStyle.Raised;
            datetimePanel.ToolTipText = "Application Start Time : " + sendTime;
            datetimePanel.Text = "Application Start Time : " + sendTime;
            datetimePanel.AutoSize = StatusBarPanelAutoSize.Contents;
            mainStatusBar.Panels.Add(datetimePanel);
            mainStatusBar.ShowPanels = true;

            Controls.Add(mainStatusBar);
        }

        private void btnStop_Click(object sender, EventArgs e)
        {
            statusPanel.Text = "Process stoped. Action stop....";
            statusPanel.ToolTipText = "Last Activity";

            if (process != null)
            {
                process.abort();
                process = null;
            }
            txtIP.ReadOnly = false;
            txtPort.ReadOnly = false;
            txtID.ReadOnly = false;
            txtPass.ReadOnly = false;
            btnStart.Enabled = true;
            btnStop.Enabled = false;
        }

        private void panelHide_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void panelClose_Click(object sender, EventArgs e)
        {
            // 자원 해제
            if (btnStart.Enabled == false)
            {
                // 자원이 사용중이므로 자원을 해제할 수 있도록 한다.
                btnStop.PerformClick();
            }

            Application.Exit();
        }

        private void WindClientForm_MouseDown(object sender, MouseEventArgs e)
        {
            mousePoint = new Point(e.X, e.Y);
        }

        private void WindClientForm_MouseMove(object sender, MouseEventArgs e)
        {
            if ((e.Button & MouseButtons.Left) == MouseButtons.Left)
            {
                Location = new Point(this.Left - (mousePoint.X - e.X),
                    this.Top - (mousePoint.Y - e.Y));
            }
        }
    }
}
