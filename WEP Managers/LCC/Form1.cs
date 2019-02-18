using System;
using System.Data;
using System.Linq;
using System.Windows.Forms;
using System.Reflection;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using System.Drawing;
using System.ComponentModel;

namespace LCC
{

    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }


        public string[] DBFile;
        public Int16 Line_Number;
                const string AssetFileAddress = "F:\\WEP Managers\\Asset List.xlsx";
        //public readonly string AssetFileAddress = "\\\\wepsbs\\Company Shared Data\\Data\\Assets\\Asset List.xlsx";
        public readonly string BreakevenFileAddress = "\\\\wepsbs\\Company Shared Data\\Data\\Assets\\Breakeven Analysis.xlsx";
        //        private string db_string = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source = \\\\wepsbs\\Asset List.xlsx; Extended Properties =\"Excel 12.0 Xml;HDR=YES;IMEX=1\"";

        public readonly string[] Areas = { "Central Bee", "Plymouth", "West Cosden", "Lake Corpus Christi", "Matagorda, Misc", "Danbury Dome",
                                "Yougeen, Ext", "LaBahia", "Moos_CYMRI", "Seeligson_CYMRI", "Burnell_CYMRI", "Misc, Abandoned"};
        private int Shutins;
        private int AllWells;


        public void OpenDataBaseFile(string dbFile)
        {
            //
        }
        public void SaveDataBaseFile(string dbFile)
        {
            //
        }
        private void openToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //            
        }
        private void saveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //
        }
        private void newToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //
        }
        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        private void MainForm_Load(object sender, EventArgs e)
        {

            typeof(DataGridView).InvokeMember(
               "DoubleBuffered", BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.SetProperty, null,
               dataGridView1, new object[] { true });
            typeof(DataGridView).InvokeMember(
               "DoubleBuffered", BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.SetProperty, null,
               dataGridView2, new object[] { true });
            typeof(DataGridView).InvokeMember(
               "DoubleBuffered", BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.SetProperty, null,
               dataGridView3, new object[] { true });
            typeof(DataGridView).InvokeMember(
               "DoubleBuffered", BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.SetProperty, null,
               dataGridView4, new object[] { true });

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Cursor.Current = Cursors.WaitCursor;

            if (comboBox1.Text != "")
            {
                AllWells = 0;
                Shutins = 0;
                ReadAssetFile(AssetFileAddress, comboBox1.Text);
                ReadBreakevenFile(BreakevenFileAddress, comboBox1.Text);
            }

            Cursor.Current = Cursors.Default;

        }

        private void ReadBreakevenFile(string breakevenFileAddress, string areaname)
        {
            DataTable dt1 = new DataTable();
            dt1.Columns.Add(new DataColumn("Well Name", typeof(string)));
            dt1.Columns.Add(new DataColumn("Unit", typeof(string)));
            dt1.Columns.Add(new DataColumn("Breakeven Price", typeof(string)));
            //dt1.Columns.Add(new DataColumn("Today's Margin per Unit", typeof(string)));

            string value0;
            string value1 = " ";
            string value2;
            string value3;
            //string value4;


            for (int i = 8; i < 82; i++)
            {
                value0 = XLGetCellValueNoFormula(breakevenFileAddress, "Data", "B" + Convert.ToString(i));
                value1 = XLGetCellValueNoFormula(breakevenFileAddress, "Data", "C" + Convert.ToString(i));
                value2 = XLGetCellValueNoFormula(breakevenFileAddress, "Data", "O" + Convert.ToString(i));
                value3 = string.Format("{0:$#.00}", Convert.ToDecimal((XLGetCellValueNoFormula(breakevenFileAddress, "Data", "P" + Convert.ToString(i)))));
                //value4 = string.Format("{0:#.00}", Convert.ToDecimal((XLGetCellValueNoFormula(breakevenFileAddress, "Data", "Q" + Convert.ToString(i)))));
                //value4 = XLGetCellValueNoFormula(breakevenFileAddress, "Data", "Q" + Convert.ToString(i));

                // Make sure date value is not empty
                if ((value0==areaname)&(value1 != ""))
                {
                    dt1.Rows.Add(new object[] { value1, value2, value3/*, value4*/ });
                }
            }


            dataGridView5.DataSource = dt1;
        }

        private void ReadAssetFile(string assetFileAddress, string areaname)
        {
            
            DataTable dt1 = new DataTable();
            dt1.Columns.Add(new DataColumn("Well Name", typeof(string)));
            dt1.Columns.Add(new DataColumn("Well Number", typeof(string)));
            dt1.Columns.Add(new DataColumn("SI Date", typeof(string)));
            dt1.Columns.Add(new DataColumn("Back on Date", typeof(string)));
            dt1.Columns.Add(new DataColumn("Rework Provision", typeof(string)));
            dt1.Columns.Add(new DataColumn("End Lease", typeof(string)));
            dt1.Columns.Add(new DataColumn("Land Provision", typeof(string)));
            dt1.Columns.Add(new DataColumn("Comments", typeof(string)));
            dt1.Columns.Add(new DataColumn("RRC Deadlines", typeof(string)));
            dt1.Columns.Add(new DataColumn("RRC Required Action", typeof(string)));
            dt1.Columns.Add(new DataColumn("Cost of Action", typeof(string)));
            dt1.Columns.Add(new DataColumn("Gauger", typeof(string)));
//            dt1.Columns.Add(new DataColumn("Offline?", typeof(string)));

            string value1;
            string value2;
            string value3;
            string value4;
            string value5;
            string value6;
            string value7;
            string value8;
            string value9;
            string value10;
            string value11;
            string value12;

            string AreaName1 = "";
            string AreaName2 = Convert.ToString(comboBox1.Items[comboBox1.Items.IndexOf(areaname) + 1]);
            string AreaName3 = "";
            int l = 1;
//            int k = 1;
            int m = 1;
            while (AreaName3 != AreaName2)
            {
                AreaName1 = XLGetCellValue(assetFileAddress, "WEP Assets", "A" + Convert.ToString(m));
                //l = m;
                while ((AreaName1 == areaname))
                {
                    AreaName3 = XLGetCellValue(assetFileAddress, "WEP Assets", "A" + Convert.ToString(m+l));
                    if (AreaName3 == AreaName2)
                    {
                        AllWells = l;
                        break;
                    }
                    l++;
                }
                m++;
            }

            // Read values for Central Bee
            for (int i = m-1; i < AllWells+m-1; i++)
            {
                value1 = XLGetCellValue(assetFileAddress, "WEP Assets", "B" + Convert.ToString(i));
                value2 = XLGetCellValue(assetFileAddress, "WEP Assets", "C" + Convert.ToString(i));
                value3 = XLGetCellValue(assetFileAddress, "WEP Assets", "R" + Convert.ToString(i));
                value4 = XLGetCellValue(assetFileAddress, "WEP Assets", "S" + Convert.ToString(i));
                value5 = XLGetCellValue(assetFileAddress, "WEP Assets", "U" + Convert.ToString(i));
                value6 = XLGetCellValue(assetFileAddress, "WEP Assets", "V" + Convert.ToString(i));
                value7 = XLGetCellValue(assetFileAddress, "WEP Assets", "W" + Convert.ToString(i));
                value8 = XLGetCellValue(assetFileAddress, "WEP Assets", "X" + Convert.ToString(i));
                value9 = XLGetCellValue(assetFileAddress, "WEP Assets", "Y" + Convert.ToString(i));
                value10 = XLGetCellValue(assetFileAddress, "WEP Assets", "Z" + Convert.ToString(i));
                value11 = XLGetCellValue(assetFileAddress, "WEP Assets", "AA" + Convert.ToString(i));
                value12 = XLGetCellValue(assetFileAddress, "WEP Assets", "AB" + Convert.ToString(i));
                //value10 = XLGetCellValue(assetFileAddress, "WEP Assets", "Q" + Convert.ToString(i));

                // Make sure date value is not empty

                double d;
                bool isNumeric = double.TryParse(value3, out d);
                if (isNumeric)
                {
                    value3 = DateTime.FromOADate(d).ToShortDateString();
                }

                isNumeric = double.TryParse(value4, out d);
                if (isNumeric)
                {
                    value4 = DateTime.FromOADate(d).ToShortDateString();
                }

                isNumeric = double.TryParse(value6, out d);
                if (isNumeric)
                {
                    value6 = DateTime.FromOADate(d).ToShortDateString();
                }

                isNumeric = double.TryParse(value9, out d);
                if (isNumeric)
                {
                    value9 = DateTime.FromOADate(d).ToShortDateString();
                }
                /*                if ((value3 != "")&(value3 != "?")&(value3 != null))
                                {
                                    double d = double.Parse(value3);
                                    value3 = DateTime.FromOADate(d).ToShortDateString();
                                }
                                if ((value6 != "") & (value6 != "Past Due") & (value6 != "?") & (value6 != null))
                                {
                                    double d = double.Parse(value6, d);
                                    value6 = DateTime.FromOADate(d).ToShortDateString();
                                }*/
                dt1.Rows.Add(new object[] { value1, value2, value3, value4, value5, value6, value7, value8, value9, value10, value11, value12 });
            }


            dataGridView1.DataSource = dt1;
            //           setRowNumber(dataGridView1);


            // Change font color for SI wells
            /*            string val = "Offline";
                        for (int i = 0; i <= dataGridView1.Rows.Count - 1; i++)
                        {
                            if (val == Convert.ToString(dt1.Rows[i][dt1.Columns.Count - 1]))
                            {
                                dataGridView1.Rows[i].DefaultCellStyle.ForeColor = System.Drawing.Color.Red;
                                Shutins = Shutins + 1;
                            }
                        }*/
            dataGridView1.Sort(dataGridView1.Columns[0], ListSortDirection.Ascending);

//            textBox2.Text = Convert.ToString(Shutins);
//            textBox1.Text = Convert.ToString(AllWells - Shutins );

        }

        public static string XLGetCellValue(string fileName, string sheetName, string addressName)
        {
            string value = null;
            try
            {


            using (SpreadsheetDocument document =
              SpreadsheetDocument.Open(fileName, false))
            {
                WorkbookPart wbPart = document.WorkbookPart;

                // Find the sheet with the supplied name, and then use that Sheet
                // object to retrieve a reference to the appropriate worksheet.
                Sheet theSheet = wbPart.Workbook.Descendants<Sheet>().
                  Where(s => s.Name == sheetName).FirstOrDefault();

                if (theSheet == null)
                {
                    throw new ArgumentException("sheetName");
                }

                // Retrieve a reference to the worksheet part, and then use its 
                // Worksheet property to get a reference to the cell whose 
                // address matches the address you supplied:
                WorksheetPart wsPart =
                  (WorksheetPart)(wbPart.GetPartById(theSheet.Id));
                Cell theCell = wsPart.Worksheet.Descendants<Cell>().
                  Where(c => c.CellReference == addressName).FirstOrDefault();

                // If the cell does not exist, return an empty string:
                if (theCell != null)
                {
                    //                    value = theCell.CellValue.Text;
                    value = theCell.InnerText;

                    // If the cell represents a numeric value, you are done. 
                    // For dates, this code returns the serialized value that 
                    // represents the date. The code handles strings and Booleans
                    // individually. For shared strings, the code looks up the 
                    // corresponding value in the shared string table. For Booleans, 
                    // the code converts the value into the words TRUE or FALSE.
                    if (theCell.DataType != null)
                    {
                        switch (theCell.DataType.Value)
                        {
                            case CellValues.SharedString:
                                // For shared strings, look up the value in the shared 
                                // strings table.
                                var stringTable = wbPart.
                                  GetPartsOfType<SharedStringTablePart>().FirstOrDefault();
                                // If the shared string table is missing, something is 
                                // wrong. Return the index that you found in the cell.
                                // Otherwise, look up the correct text in the table.
                                if (stringTable != null)
                                {
                                    value = stringTable.SharedStringTable.
                                      ElementAt(int.Parse(value)).InnerText;
                                }
                                break;

                            case CellValues.Boolean:
                                switch (value)
                                {
                                    case "0":
                                        value = "FALSE";
                                        break;
                                    default:
                                        value = "TRUE";
                                        break;
                                }
                                break;
                        }
                    }
                }
            }
            return value;
            }
            catch
            {
                MessageBox.Show("The file is open in another machine. Please close it and try again.");
                return value;
            }
        }

        public static string XLGetCellValueNoFormula(string fileName, string sheetName, string addressName)
        {
            string value = null;

            using (SpreadsheetDocument document =
              SpreadsheetDocument.Open(fileName, false))
            {
                WorkbookPart wbPart = document.WorkbookPart;

                // Find the sheet with the supplied name, and then use that Sheet
                // object to retrieve a reference to the appropriate worksheet.
                Sheet theSheet = wbPart.Workbook.Descendants<Sheet>().
                  Where(s => s.Name == sheetName).FirstOrDefault();

                if (theSheet == null)
                {
                    throw new ArgumentException("sheetName");
                }

                // Retrieve a reference to the worksheet part, and then use its 
                // Worksheet property to get a reference to the cell whose 
                // address matches the address you supplied:
                WorksheetPart wsPart =
                  (WorksheetPart)(wbPart.GetPartById(theSheet.Id));
                Cell theCell = wsPart.Worksheet.Descendants<Cell>().
                  Where(c => c.CellReference == addressName).FirstOrDefault();

                // If the cell does not exist, return an empty string:
                if (theCell != null)
                {
                    value = theCell.CellValue.Text;
//                    value = theCell.InnerText;

                    // If the cell represents a numeric value, you are done. 
                    // For dates, this code returns the serialized value that 
                    // represents the date. The code handles strings and Booleans
                    // individually. For shared strings, the code looks up the 
                    // corresponding value in the shared string table. For Booleans, 
                    // the code converts the value into the words TRUE or FALSE.
                    if (theCell.DataType != null)
                    {
                        switch (theCell.DataType.Value)
                        {
                            case CellValues.SharedString:
                                // For shared strings, look up the value in the shared 
                                // strings table.
                                var stringTable = wbPart.
                                  GetPartsOfType<SharedStringTablePart>().FirstOrDefault();
                                // If the shared string table is missing, something is 
                                // wrong. Return the index that you found in the cell.
                                // Otherwise, look up the correct text in the table.
                                if (stringTable != null)
                                {
                                    value = stringTable.SharedStringTable.
                                      ElementAt(int.Parse(value)).InnerText;
                                }
                                break;

                            case CellValues.Boolean:
                                switch (value)
                                {
                                    case "0":
                                        value = "FALSE";
                                        break;
                                    default:
                                        value = "TRUE";
                                        break;
                                }
                                break;
                        }
                    }
                }
            }
            return value;
        }

        private void setRowNumber(DataGridView dgv)
        {
            foreach (DataGridViewRow row in dgv.Rows)
            {
                row.HeaderCell.Value = String.Format("{0}", row.Index + 1);
            }
        }

        private void dataGridView1_Sorted(object sender, EventArgs e)
        {
            //string val1 = "Offline";
            string val1 = "";
            string val2 = "";
            Shutins = 0;
            for (int i = 0; i <= dataGridView1.Rows.Count - 1; i++)
            {
                val1 = Convert.ToString(dataGridView1.Rows[i].Cells[2].Value.ToString());
                val2 = Convert.ToString(dataGridView1.Rows[i].Cells[3].Value.ToString());
                if (val1 != "")
                {
                    if (val2 == "")
                    {
                        dataGridView1.Rows[i].DefaultCellStyle.ForeColor = System.Drawing.Color.Red;
                        Shutins = Shutins + 1;
                    }
                }
            }
            textBox2.Text = Convert.ToString(Shutins);
            textBox1.Text = Convert.ToString(AllWells - Shutins);








            /*           for (int i = 0; i <= dataGridView1.Rows.Count - 1; i++)
                       {
                           val2 = Convert.ToString(dataGridView1.Rows[i].Cells[dataGridView1.Columns.Count - 1].Value.ToString());
                           if (val1 == val2)
                           {
                               dataGridView1.Rows[i].DefaultCellStyle.ForeColor = System.Drawing.Color.Red;
                               Shutins = Shutins + 1;
                           }
                       }*/
        }

    }

}
