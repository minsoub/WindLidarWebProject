package com.hist.windlidar.common;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

public class CommonUtil {
	
	private static CommonUtil single = new CommonUtil();
    
	public static CommonUtil getInstance(){
	        
		return single;
	    
	}
	
	/**
	 * ������ ��¥�� �����Ѵ�.
	 * ���� ������ yyyy-MM-dd �������� �����Ѵ�.
	 * 
	 * example) SimpleDateFormat("yyyy-MM-dd_HHmmss")
	 * 
	 * @return
	 */
	public String getCurrentDate()
	{
		String dt = null;
		
		dt = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		
		return dt;
	}
	/**
	 * ������ ����� �����Ѵ�.
	 * ���� ������ yyyy-MM �������� �����Ѵ�.
	 * 
	 * example) SimpleDateFormat("yyyy-MM")
	 * 
	 * @return
	 */
	public String getCurrentMonth()
	{
		String dt = null;
		
		dt = new SimpleDateFormat("yyyy-MM").format(Calendar.getInstance().getTime());
		
		return dt;
	}
	
	/**
	 * �־��� ���� �������� ���� ��¥�� �����Ѵ�.
	 * 
	 * @param fmt
	 * @return
	 */
	public String getCurrentFormat(String fmt)
	{
		String dt = null;
		
		dt = new SimpleDateFormat(fmt).format(Calendar.getInstance().getTime());
		
		return dt;
	}
	/**
	 * ���Ϻ��� �Ϸ����� ��¥�� �����Ѵ�.
	 * 
	 * @return
	 */
	public String getYesaterDay()
	{
		Date dt = new Date();
		Calendar c = Calendar.getInstance(); 
		c.setTime(dt); 
		c.add(Calendar.DATE, -1);
		
		return new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
	}
	
	/**
	 * �־��� ��-���� ���ڸ� ���ڸ� ���ؼ� �����Ѵ�.
	 * 
	 * @param dtm
	 * @return
	 * @throws ParseException
	 */
	public int getLastDay(String dtm) throws ParseException
	{
		Calendar cal = Calendar.getInstance();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date to = transFormat.parse(dtm+"-01");

		cal.setTime(to);
		
		int last_day = cal.getMaximum(Calendar.DAY_OF_MONTH);
		
		
		return last_day;		
	}
	/**
	 * ���ڸ� �Է¹޾Ƽ� 2�ڸ��� ���ڿ��� ��ȯ�ؼ� �����Ѵ�.
	 * 
	 * @param idx
	 * @return
	 */
	public String getNumericChar(int idx)
	{
		if (idx < 10)
		{
			return "0"+String.valueOf(idx);
		}
		else {
			return String.valueOf(idx);
		}
	}
	
	/**
	 * XML �����͸� �о �Ľ����ؼ� Map���� �����Ѵ�.
	 * 
	 * @param xmlData
	 * @return
	 */
	public Map<String, Object> parseXML(String xmlData)
	{
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	    DocumentBuilder documentBuilder;
	    Map<String, Object> info = new HashMap<String, Object>();
	    
	    
		try {
			documentBuilder = factory.newDocumentBuilder();

	 
			// xml ���ڿ��� InputStream���� ��ȯ
			InputStream is = new ByteArrayInputStream(xmlData.getBytes());
			// �Ľ� ����
			Document doc = documentBuilder.parse(is);
			// �ֻ��� ��� ã��
			Element element = doc.getDocumentElement();

			NodeList items = element.getElementsByTagName("RemoteConnect");
			NodeList items1 = element.getElementsByTagName("LidarState");
			NodeList items2 = element.getElementsByTagName("State");
			NodeList items3 = element.getElementsByTagName("Error");

			//getAttributes().getNamedItem("data").getNodeValue()
			
			
			Node item = items.item(0);
			if (item != null)
			{
				String msg = "";
				if (item.getAttributes().getNamedItem("Value").getNodeValue().equals("0"))
				{
					msg = "no connection";
				}
				else
				{
					msg = "connected";
				}
				info.put(item.getNodeName(), msg);   // item.getAttributes().getNamedItem("Value").getNodeValue());
			}
			Node item2 = items1.item(0);
			if (item2 != null)
			{
				String msg = getLidarStatus(item2.getAttributes().getNamedItem("Value").getNodeValue());
				info.put(item2.getNodeName(), msg);  //  item2.getAttributes().getNamedItem("Value").getNodeValue());
			}
			
			int count = items2.getLength();
			for (int i=0; i<count; i++)
			{
				Node tm = items2.item(i);
				if (tm != null)
				{
					String msg = "";
					if (tm.getAttributes().getNamedItem("Value").getNodeValue().equals("0"))
					{
						msg = "no";
					}
					else 
					{
						msg = "yes";
					}
					info.put(tm.getAttributes().getNamedItem("Name").getNodeValue(),  msg);  // tm.getAttributes().getNamedItem("Value").getNodeValue());
				}
			}
			Node item4 = items3.item(0);
			if (item4 != null)
			{
				info.put(item4.getAttributes().getNamedItem("Source").getNodeValue(), item4.getAttributes().getNamedItem("Message").getNodeValue());
			}

		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return info;
	}
	
	
	private String getLidarStatus(String data)
	{
		String msg = "";
		int type = Integer.parseInt(data);
		
		switch(type)
		{
		case 0:
			msg = "state is unknown";
			break;
		case 1:
			msg = "ready for operation";
			break;
		case 2:
			msg = "peparation for scanning";
			break;
		case 3:
			msg = "scanning";
			break;
		case 4:
			msg = "scanning is stopping";
			break;
		case 5:
			msg = "scanning is stopped";
			break;
		case 6:
			msg = "scanning is completed";
			break;
		case 7:
			msg = "an error occurred during scanning";
			break;
		}
		return msg;
	}
}
