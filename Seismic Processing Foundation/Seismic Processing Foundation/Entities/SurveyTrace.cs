using System;
using System.Collections.Generic;
//using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SeismicProcessing.Framework.Entities
{
	public class SurveyTrace
	{
		public int ID { get; set; }
		public int X { get; set; }
		public int Y { get; set; }
		public int Inline { get; set; }
		public int XLine { get; set; }
		public TraceIdentificationCode IdentificationCode { get; set; }
		public virtual List<float> Samples { get; set; }
		//[Column("SurveyID")]
		public Survey Survey { get; set; }
	}
}
