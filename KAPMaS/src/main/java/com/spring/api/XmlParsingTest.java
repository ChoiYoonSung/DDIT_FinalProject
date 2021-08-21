package com.spring.api;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlParsingTest {
	
	
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
	
	public static void main(String[] args) {
		int page = 1;
		try {
			while(true) {
				String url = "http://api.dbpia.co.kr/v2/search/search.xml";
				String key = "519846bda4500d41d1d8b1cac79424b7";
				String target = "se";
				String searchall = "발명";
				
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				
				doc.getDocumentElement().normalize();
				System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
				
				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("baseinfo");
				System.out.println("파싱할 리스트 수 : "+ nList.getLength());
				
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){
						
						Element eElement = (Element) nNode;
						System.out.println("######################");
						//System.out.println(eElement.getTextContent());
						System.out.println("금융사  : " + getTagValue("kor_co_nm", eElement));
						System.out.println("상품 코드  : " + getTagValue("fin_prdt_cd", eElement));
						System.out.println("상품명 : " + getTagValue("fin_prdt_nm", eElement));
						System.out.println("연평균 수익률  : " + getTagValue("avg_prft_rate", eElement));
						System.out.println("공시 이율  : " + getTagValue("dcls_rate", eElement));
						}	// for end
					}	// if end
				
				page += 1;
				System.out.println("page number : "+page);
				if(page > 12){	
					break;
				}
			}	// while end
			
			}catch(Exception e) {
				e.printStackTrace();
		}
		
	}

}
