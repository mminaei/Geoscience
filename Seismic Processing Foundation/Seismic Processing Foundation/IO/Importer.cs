using SeismicProcessing.Framework.Entities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SeismicProcessing.Framework.IO
{
	public class Importer
	{
		//private string filePath;
		//private BinaryReader reader;

		//public Importer(string filePath)
		//{
		//	this.filePath = filePath;
		//
		public Survey ParseSurvey(string filePath, Endianneess endianness)
		{
			FileInfo file = new FileInfo(filePath);
			Survey result = new Survey();
			using (BinaryReader reader = new BinaryReader(file.OpenRead()))
			{
				result.EBCDIC = ASCIIEncoding.ASCII.GetString(reader.ReadBytes(3200));
				reader.ReadBytes(16);
				result.SamplingInterval = ReadShort(reader, endianness);
				reader.ReadBytes(2);
				result.SampleCount = ReadShort(reader, endianness);
				reader.ReadBytes(2);
				result.DataSampleFormatCode = (SurveyDataSampleFormatCode)ReadShort(reader, endianness);
				reader.ReadBytes(374);
				result.Traces = new List<SurveyTrace>(
					(int)((file.Length - 3600) / (result.SampleCount * GetSampleCodeSize(result.DataSampleFormatCode) + 240)));
				for (int i = 0; i < result.Traces.Capacity; i++)
				{
					SurveyTrace trace = new SurveyTrace();
					reader.ReadBytes(180);
					trace.X = ReadInt(reader, endianness);
					trace.Y = ReadInt(reader, endianness);
					trace.Inline = ReadShort(reader, endianness);
					trace.XLine = ReadShort(reader, endianness);
					reader.ReadBytes(48);
					trace.Samples = new List<float>(result.SampleCount);
					for (int j = 0; j < result.SampleCount; j++)
					{
						trace.Samples.Add(ReadSample(reader, result.DataSampleFormatCode, endianness));
					}

					result.Traces.Add(trace);
				}
			}
			return result;
		}

		private float ReadSample(BinaryReader reader, SurveyDataSampleFormatCode dataSampleFormatCode, Endianneess endianness)
		{
			byte[] data = reader.ReadBytes(GetSampleCodeSize(dataSampleFormatCode));

			switch (dataSampleFormatCode)
			{
				case SurveyDataSampleFormatCode.IBM4BytesFloatingPoint:
					return ConvertToFloat(data, endianness, dataSampleFormatCode);
				case SurveyDataSampleFormatCode.Normal4Bytes:
					return ConvertToInt(data, endianness);
				case SurveyDataSampleFormatCode.Normal2Bytes:
					return ConvertToShort(data, endianness);
				case SurveyDataSampleFormatCode.IEEE4BytesFloatingPoint:
					return ConvertToFloat(data, endianness, dataSampleFormatCode);
				case SurveyDataSampleFormatCode.Normal1Byte:
					return data[0];
				case SurveyDataSampleFormatCode.FixedPoint4Bytes:
				//
				// TODO: Implement Later
				//
				case SurveyDataSampleFormatCode.Option1:
				case SurveyDataSampleFormatCode.Option2:
				default:
					return float.MinValue;
			}
		}

		private float ConvertToFloat(byte[] data, Endianneess endianness, SurveyDataSampleFormatCode dataSampleFormatCode)
		{
			CheckEndianness(data, endianness);
			return BitConverter.ToSingle(data, 0);
		}

		private float ParseSample(byte[] data, Endianneess endianness)
		{
			switch (data.Length)
			{
				case 1:
					return data[0];
				case 2:
					return ConvertToShort(data, endianness);
				case 4:
					return ConvertToInt(data, endianness);
				default:
					return float.MinValue;
			}
		}

		private short GetSampleCodeSize(SurveyDataSampleFormatCode surveyDataSampleFormatCode)
		{
			switch (surveyDataSampleFormatCode)
			{
				case SurveyDataSampleFormatCode.IBM4BytesFloatingPoint:
				case SurveyDataSampleFormatCode.Normal4Bytes:
				case SurveyDataSampleFormatCode.FixedPoint4Bytes:
				case SurveyDataSampleFormatCode.IEEE4BytesFloatingPoint:
					return 4;
				case SurveyDataSampleFormatCode.Normal2Bytes:
					return 2;
				case SurveyDataSampleFormatCode.Option1:
				case SurveyDataSampleFormatCode.Option2:
					return -1;
				case SurveyDataSampleFormatCode.Normal1Byte:
					return 1;
				default:
					return 0;
			}
		}

		private int ReadInt(BinaryReader reader, Endianneess endianness)
		{
			return ConvertToInt(reader.ReadBytes(4), endianness);
		}

		private short ReadShort(BinaryReader reader, Endianneess endianness)
		{
			return ConvertToShort(reader.ReadBytes(2), endianness);
		}

		private int ConvertToInt(byte[] data, Endianneess endianness)
		{
			CheckEndianness(data, endianness);
			return BitConverter.ToInt32(data, 0);
		}

		private short ConvertToShort(byte[] data, Endianneess endianness)
		{
			CheckEndianness(data, endianness);
			return BitConverter.ToInt16(data, 0);

		}

		private void CheckEndianness(byte[] data, Endianneess endianness)
		{
			if ((BitConverter.IsLittleEndian && endianness == Endianneess.BigEndian) ||
				(!BitConverter.IsLittleEndian && endianness == Endianneess.LittleEndian))
				Array.Reverse(data);
		}

		//private void Swap(byte[] data, int count)
		//{
		//	for (int i = 0; i < count/2; i++)
		//	{
		//		byte tmp = data[count - i - 1]; //data[3] or data[1]
		//		data[count - i - 1] = data[i]; // data[3] = data[0] or data[1] = data[0]
		//		data[i] = tmp; // data[0] = data[3] or data[0] = data[1]
		//	}
		//}
	}
}
