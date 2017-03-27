package com.hist.windlidar.common;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class CommandMap {

    Map<String,Object> map = new HashMap<String,Object>();   
    

    public Object get(String key){
        return map.get(key);
    }
     
    public void put(String key, Object value){
        map.put(key, value);
    }

    public Object remove(String key){
        return map.remove(key);
    }

    public boolean containsKey(String key){
        return map.containsKey(key);
    }

    public boolean containsValue(Object value){
        return map.containsValue(value);
    }

    public void clear(){
        map.clear();
    }

    public Set<Entry<String, Object>> entrySet(){
        return map.entrySet();
    }

    public Set<String> keySet(){
        return map.keySet();
    }

    public boolean isEmpty(){
        return map.isEmpty(); 
    }

    public void putAll(Map<? extends String, ?extends Object> m){
        map.putAll(m);
    }

    public Map<String,Object> getMap(){
        return map;
    }
    
    
    public int getPage()
    {
    	if (get("page") == null)
    	{
    		put("page", 1);
    	}
    	
    	System.out.println(get("page"));
    	return Integer.parseInt(get("page").toString());
    }
    
    public void setPage(Integer page)
    {
    	if (Integer.parseInt(get("page").toString()) < 1)
    	{
    		put("page", 1);
    		return;
    	}
    	put("page", page);
    }
    
    public void setCount(Integer count)
    {
    	if (Integer.parseInt(get("page").toString()) < 1)
    	{
    		
    		return;
    	}
    	put("count", count);
    	
    	calcPage();
    }
    
    private void calcPage()
    {
    	// page 변수는 현재 페이지 번호
    	int page = Integer.parseInt(get("page").toString());
    	int tempEnd = (int)(Math.ceil(page/10.0) * 10);
    	int count = Integer.parseInt(get("count").toString());
    			
    	// 시작 페이지 계산
    	put("start", tempEnd - 9);
    	
    	if (tempEnd * 10 > count) {
    		put("end", (int)Math.ceil(count / 10.0));
    	}else {
    		put("end", tempEnd);   // 실제 count가 tempEnd보다 많을 경우
    	}
    	int start = Integer.parseInt(get("start").toString());
    	int end = Integer.parseInt(get("end").toString());
    	
        put("prev", start != 1);
        put("next", end * 10 < count);
    }
}
