using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using SeismicProcessing.Framework.IO;
using SeismicProcessing.Framework.Entities;

namespace Seismic_Processing_Foundation
{
	public partial class MainForm : Form
	{
		public MainForm()
		{
			InitializeComponent();
		}

		private void openToolStripMenuItem_Click(object sender, EventArgs e)
		{
			
			OpenFileDialog openFileDialog1 = new OpenFileDialog();
			openFileDialog1.InitialDirectory = "";
			openFileDialog1.Filter = "SEG-Y files |*.segy; *.sgy|SEGY files|*.segy|SGY files|*.sgy";
			openFileDialog1.FilterIndex = 1;
			openFileDialog1.RestoreDirectory = true;
			
//			BinaryReader reader = new BinaryReader(file.OpenRead());
			
			if (openFileDialog1.ShowDialog() == DialogResult.OK)
			{
				try
				{
					FileInfo file = new FileInfo(openFileDialog1.FileName);
					if (file.FullName != null)
					{
						treeView1.Nodes.Add(file.FullName);
						using (BinaryReader reader = new BinaryReader(file.OpenRead()))
						{
							Importer newSurvey = new Importer();
							Endianneess fileEndianness = new Endianneess();
							newSurvey.ParseSurvey(file.FullName, fileEndianness);
							MessageBox.Show("Finished!");
						}
					}
				}
				catch (Exception ex)
				{
					MessageBox.Show("Error: Could not read file from disk. Original error: " + ex.Message);
				}
			}
		}

		private void openFileDialog1_FileOk(object sender, CancelEventArgs e)
		{

		}

		private void exitToolStripMenuItem_Click(object sender, EventArgs e)
		{
			Environment.Exit(0);
		}

		private void richTextBox1_TextChanged(object sender, EventArgs e)
		{

		}
	}
}
