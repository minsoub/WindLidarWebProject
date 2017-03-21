﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Resources;

namespace WindLidarSystem
{
    public partial class WindLidarServer : Form
    {
        private ProcessReceiver process;
        protected StatusBar mainStatusBar;
        protected StatusBarPanel statusPanel;
        protected StatusBarPanel datetimePanel;
        private char[] delimiterChar = { ':' };
        private char[] delimiterChar2 = { '=' };
        private Point mousePoint;

        public struct StsInfo
        {
            public string s_code;
            public string s_sts;
            public string s_lastDt;
        }

        public struct FtsInfo
        {
            public string s_code;
            public string s_sts;
            public string s_lastDt;
        }
        private List<StsInfo> stList;
        private List<FtsInfo> ftList;

        public WindLidarServer()
        {
            InitializeComponent();

           // this.FormBorderStyle = FormBorderStyle.None;   // 윈도우 테두리 제거
            this.Text = "";
            this.ControlBox = false;
            //this.FormBorderStyle = Sizeable;

            process = null;

            btnStop.Enabled = false;
            
            txtIP.Text = ParamInitInfo.Instance.m_ftpIP;                     // UWA FTP IP Address
            txtPort.Text = ParamInitInfo.Instance.m_ftpPort;                 // UWA FTP Port
            txtID.Text = ParamInitInfo.Instance.m_ftpUser;                   // UWA FTP User
            txtPass.Text = ParamInitInfo.Instance.m_ftpPass;                 // UWA FTP User Password

            txtListenPort.Text = ParamInitInfo.Instance.m_listenPort;        // Listen Port
            txtClientRcvPort.Text = ParamInitInfo.Instance.m_clientRcvPort;  // Client Receive Port
            txtLocalSendPort.Text = ParamInitInfo.Instance.m_localPort;      // Local Port
            txtDestPort.Text = ParamInitInfo.Instance.m_dataclientport;      // 관측데이터에 대한 수신결과 전송 Port

            txtDBName.Text = ParamInitInfo.Instance.m_dbName;
            txtDBHost.Text = ParamInitInfo.Instance.m_dbHost;
            txtDBPort.Text = ParamInitInfo.Instance.m_dbPort;
            txtDBUserID.Text = ParamInitInfo.Instance.m_dbUser;
            txtDBUserPass.Text = ParamInitInfo.Instance.m_dbPass;

            txtFtpThreadTime.Text = ParamInitInfo.Instance.m_ftpThreadTime;
            txtStsThreadTime.Text = ParamInitInfo.Instance.m_stsThreadTime;


            createStatusBar();
            stList = new List<StsInfo>();
            ftList = new List<FtsInfo>();

            // 초기 세팅값
            defaultClear();


            // test image
            //ResourceManager rm = Properties.Resources.ResourceManager;
           // Bitmap myImage = (Bitmap)rm.GetObject("off");

            panel13211.BackgroundImage = Properties.Resources.off;
            panel13211.BackgroundImageLayout = ImageLayout.Stretch;

            panel13206.BackgroundImage = Properties.Resources.off;
            panel13206.BackgroundImageLayout = ImageLayout.Stretch;

            panel13210.BackgroundImage = Properties.Resources.off;
            panel13210.BackgroundImageLayout = ImageLayout.Stretch;

            panel1.BackgroundImage = Properties.Resources.ridar;
            panel1.BackgroundImageLayout = ImageLayout.Stretch;

            panelClose.BackgroundImage = Properties.Resources.close;
            panelClose.BackgroundImageLayout = ImageLayout.Stretch;

            panelHide.BackgroundImage = Properties.Resources.hide;
            panelHide.BackgroundImageLayout = ImageLayout.Stretch;

        }

        private void btnStart_Click(object sender, EventArgs e)
        {
            if (process == null)
            {
                logMessage("[WindLidarServer:Start] Process starting...");
                process = new ProcessReceiver(this);
                process.start();

                btnStart.Enabled = false;
                btnStop.Enabled = true;
            }
        }
        private void btnStop_Click(object sender, EventArgs e)
        {
            logMessage("[WindLidarServer:Stop] Process stopping...");
            process.abort();
            process = null;

            btnStart.Enabled = true;
            btnStop.Enabled = false;            
        }

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

        public void logMessage(string msg)
        {
            logMessage(lstLog, msg);
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

        private delegate void logMessageDelegate(ListBox _lstLog, string _msg);
        //private delegate void stsMessageDelegate(ListBox _lstLog, string _msg);

        public void stsMessage(string msg)
        {
            string[] msgArr = msg.Split(delimiterChar);

            string stCode = msgArr[1];
            string stSts = msgArr[2];
            string rcvTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            StsInfo item = new StsInfo();
            item.s_code = stCode;
            item.s_sts = stSts;
            item.s_lastDt = rcvTime;
            if (stList.Count() == 0)
            {
                stList.Add(item);
            }
            else
            {
                int found = 0;
                for (int i=0; i<stList.Count(); i++)
                {
                    if (stList[i].s_code == item.s_code)
                    {
                        stList[i] = item;
                        found = 1;
                    }
                }
                if (found == 0)
                {
                    stList.Add(item);   // new
                }
            }

            refreshWindow();
        }


        public void ftsMessage(string msg)
        {
            string[] msgArr = msg.Split(delimiterChar);

            string stCode = msgArr[1];
            string stSts = msgArr[2];
            string rcvTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            FtsInfo item = new FtsInfo();
            item.s_code = stCode;
            item.s_sts = stSts;
            item.s_lastDt = rcvTime;
            if (ftList.Count() == 0)
            {
                ftList.Add(item);
            }
            else
            {
                int found = 0;
                for (int i = 0; i < stList.Count(); i++)
                {
                    if (ftList[i].s_code == item.s_code)
                    {
                        ftList[i] = item;
                        found = 1;
                    }
                }
                if (found == 0)
                {
                    ftList.Add(item);   // new
                }
            }

            refreshWindow();
        }


        private void refreshWindow()
        {
            for (int i=0; i<stList.Count(); i++)
            {
                StsInfo item = stList[i];

                if (item.s_code == "13211")       // 일산
                {
                    UpdateRadioStsA(item.s_sts);
                    UpdateLableStaLastTime(item.s_lastDt);
                }
                if (item.s_code == "13210")       // 송도
                {
                    UpdateRadioStsB(item.s_sts);
                    UpdateLableStbLastTime(item.s_lastDt);
                }
                if (item.s_code == "13206")       //구로
                {
                    UpdateRadioStsC(item.s_sts);
                    UpdateLableStcLastTime(item.s_lastDt);
                }

                FtsInfo ftm = ftList[i];

                if (ftm.s_code == "13211")       // 일산
                {
                    UpdateLableFtaLastTime(ftm.s_lastDt);
                }
                if (ftm.s_code == "13210")       // 송도
                {
                    UpdateLableFtbLastTime(ftm.s_lastDt);
                }
                if (ftm.s_code == "13206")       //구로
                {
                    UpdateLableFtcLastTime(ftm.s_lastDt);
                }                
            }
        }

        public void stsDB(string msg)
        {
            if (msg == null) return;
            string[] msgArr = msg.Split(delimiterChar2);

            string stCode = msgArr[1];
            string stSts = msgArr[2];
            string rcvTime = msgArr[3];
            StsInfo item = new StsInfo();
            item.s_code = stCode;
            item.s_sts = stSts;
            item.s_lastDt = rcvTime;
            if (stList.Count() == 0)
            {
                stList.Add(item);
            }
            else
            {
                int found = 0;
                for (int i = 0; i < stList.Count(); i++)
                {
                    if (stList[i].s_code == item.s_code)
                    {
                        stList[i] = item;
                        found = 1;
                    }
                }
                if (found == 0)
                {
                    stList.Add(item);   // new
                }
            }

            refreshWindow();
        }

        private void UpdateLableStaLastTime(string msg)
        {
            if (lblstaLastTime.InvokeRequired)
            {
                lblstaLastTime.BeginInvoke(new Action(() => lblstaLastTime.Text = msg));
            }
            else
            {
                lblstaLastTime.Text = msg;
            }
        }
        private void UpdateLableStbLastTime(string msg)
        {
            if (lblstbLastTime.InvokeRequired)
            {
                lblstbLastTime.BeginInvoke(new Action(() => lblstbLastTime.Text = msg));
            }
            else
            {
                lblstbLastTime.Text = msg;
            }
        }
        private void UpdateLableStcLastTime(string msg)
        {
            if (lblstcLastTime.InvokeRequired)
            {
                lblstcLastTime.BeginInvoke(new Action(() => lblstcLastTime.Text = msg));
            }
            else
            {
                lblstcLastTime.Text = msg;
            }
        }

        private void UpdateLableFtaLastTime(string msg)
        {
            if (lblstaDataLastTime.InvokeRequired)
            {
                lblstaDataLastTime.BeginInvoke(new Action(() => lblstaDataLastTime.Text = msg));
            }
            else
            {
                lblstaDataLastTime.Text = msg;
            }
        }
        private void UpdateLableFtbLastTime(string msg)
        {
            if (lblstbDataLastTime.InvokeRequired)
            {
                lblstbDataLastTime.BeginInvoke(new Action(() => lblstbDataLastTime.Text = msg));
            }
            else
            {
                lblstbDataLastTime.Text = msg;
            }
        }
        private void UpdateLableFtcLastTime(string msg)
        {
            if (lblstcDataLastTime.InvokeRequired)
            {
                lblstcDataLastTime.BeginInvoke(new Action(() => lblstcDataLastTime.Text = msg));
            }
            else
            {
                lblstcDataLastTime.Text = msg;
            }
        }

        /**
         * 13211 : 일산
         */
        private void UpdateRadioStsA(string msg)
        {
            if (msg == "0")
            {
                if (panel13211.InvokeRequired)
                {
                    panel13211.BeginInvoke(new Action(() => panel13211.BackgroundImage = Properties.Resources.off));
                }
                else
                {
                    panel13211.BackgroundImage = Properties.Resources.off;
                }
            }
            else if (msg == "1")
            {
                if (panel13211.InvokeRequired)
                {
                    panel13211.BeginInvoke(new Action(() => panel13211.BackgroundImage = Properties.Resources.on));
                }
                else
                {
                    panel13211.BackgroundImage = Properties.Resources.on;
                }
            }
        }                        
        /**
         * 13210 : 송도
         */
        private void UpdateRadioStsB(string msg)
        {
            if (msg == "0")
            {
                if (panel13210.InvokeRequired)
                {
                    panel13210.BeginInvoke(new Action(() => panel13210.BackgroundImage = Properties.Resources.off));
                }
                else
                {
                    panel13210.BackgroundImage = Properties.Resources.off;
                }
            }
            else if (msg == "1")
            {
                if (panel13210.InvokeRequired)
                {
                    panel13210.BeginInvoke(new Action(() => panel13210.BackgroundImage = Properties.Resources.on));
                }
                else
                {
                    panel13210.BackgroundImage = Properties.Resources.on;
                }
            }
        }
        /**
         * 13206 : 구로
         */
        private void UpdateRadioStsC(string msg)
        {
            if (msg == "0")
            {
                if (panel13206.InvokeRequired)
                {
                    panel13206.BeginInvoke(new Action(() => panel13206.BackgroundImage = Properties.Resources.off));
                }
                else
                {
                    panel13206.BackgroundImage = Properties.Resources.off;
                }
            }
            else if (msg == "1")
            {
                if (panel13206.InvokeRequired)
                {
                    panel13206.BeginInvoke(new Action(() => panel13206.BackgroundImage = Properties.Resources.on));
                }
                else
                {
                    panel13206.BackgroundImage = Properties.Resources.on;
                }
            }
               
        }

        private void lstLog_DrawItem(object sender, DrawItemEventArgs e)
        {
            Console.WriteLine("lstLog_DrawItem called...");
            if (lstLog.Items.Count == 0)
            {
                return;
            }

            // owner draw를 사용하여 ListBox에 색칠하기
            Brush myBrush;
            string msg = lstLog.Items[e.Index].ToString();
            Console.WriteLine(msg);
            if (msg.Contains("error") == true) //<font color=red>") == true)
            {
                //lstLog.Items[e.Index] = lstLog.Items[e.Index].ToString().Replace("<font color=red>", "");
                myBrush = Brushes.Red;
            }
            else if(msg.Contains("info") == true) // <font color=blue>") == true)
            {
                lstLog.Items[e.Index] = lstLog.Items[e.Index].ToString().Replace("<font color=blue>", "");
                myBrush = Brushes.Blue;
            }
            else
            {
                myBrush = Brushes.DarkGray;
            }
            e.Graphics.DrawString(lstLog.Items[e.Index].ToString(), e.Font, myBrush, e.Bounds, StringFormat.GenericDefault);

            e.DrawFocusRectangle();

        }

        private void defaultClear()
        {
            lblstaLastTime.Text = "";
            lblstbLastTime.Text = "";
            lblstcLastTime.Text = "";

            lblstaDataLastTime.Text = "";
            lblstbDataLastTime.Text = "";
            lblstcDataLastTime.Text = "";

            txtListenPort.ReadOnly = true;
            txtDestPort.ReadOnly = true;
            txtClientRcvPort.ReadOnly = true;
            txtLocalSendPort.ReadOnly = true;


            txtIP.ReadOnly = true;
            txtPort.ReadOnly = true;
            txtID.ReadOnly = true;
            txtPass.ReadOnly = true;

            txtDBName.ReadOnly = true;
            txtDBHost.ReadOnly = true;
            txtDBPort.ReadOnly = true;
            txtDBUserID.ReadOnly = true;
            txtDBUserPass.ReadOnly = true;

            txtFtpThreadTime.ReadOnly = true;
            txtStsThreadTime.ReadOnly = true;
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

        private void WindLidarServer_MouseDown(object sender, MouseEventArgs e)
        {
            mousePoint = new Point(e.X, e.Y);
        }

        private void WindLidarServer_MouseMove(object sender, MouseEventArgs e)
        {
            if ((e.Button & MouseButtons.Left) == MouseButtons.Left)
            {
                Location = new Point(this.Left - (mousePoint.X - e.X),
                    this.Top - (mousePoint.Y - e.Y));
            }
        }

        private void panelHide_MouseClick(object sender, MouseEventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

    }
}
