/* This file is generated by genstat. */
/* No manual modification is permitted. */

package com.netease.game.stat;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

{{range .}}  
// {{.Comment}}
public class {{.Name}}Mgr
{
	private static {{.Name}}Mgr instance;
	
    {{range .Members}}
    // {{.Comment}}
    private int {{.Name}};
    {{end}}
    {{range .Arrays}}
    // {{.Comment}}
    private int[] {{.Name}} = new int[{{.Length}}];
    {{end}}
    {{range .TopArrays}}
    // {{.Comment}}
    private int[] {{.Name}} = new int[{{.Length}}];
    {{end}}    
    {{range .HashMaps}}
    // {{.Comment}}
    private ConcurrentHashMap<Integer, Integer> {{.Name}} = new ConcurrentHashMap<Integer, Integer>();
    {{end}}    
	
	// {{.Comment}}
    public {{.Name}}Mgr()
	{
		clear();
	}
	
	public static {{.Name}}Mgr instance()
	{
		if (instance == null)
		{
			synchronized ({{.Name}}Mgr.class)
			{
				if (instance == null)
				{
					instance = new {{.Name}}Mgr();
					return instance;
				}
			}
		}
		return instance;
	}
	
	public void sortArray(int[] src, int[] desId, int[] desVal, boolean isMax)
	{
		int srcSize = src.length;
		int desSize = desId.length;
		if (isMax)
		{
			for (int i = 0; i < desSize; i++)
			{
				desId[i] = 0;
				desVal[i] = 0;
				int max = 0;
				for (int j = 0; j < srcSize; j++)
				{
					if (src[j] > max)
					{
						desId[i] = j;
						desVal[i] = src[j];
						max = src[j];
					}
				}
				src[desId[i]] = 0;
			}
		}
		else
		{
			for (int i = 0; i < desSize; i++)
			{
				desId[i] = 0;
				desVal[i] = 0;
				int min = 0xFFFFFFFF;
				for (int j = 0; j < srcSize; j++)
				{
					if (src[j] < min && src[j] > 0)
					{
						desId[i] = j;
						desVal[i] = src[j];
						min = src[j];
					}
				}
				src[desId[i]] = 0xFFFFFFFF;
			}
		}
	}

	public void sortHashMap(ConcurrentHashMap<Integer, Integer> map, int[] desId, int[] desVal, boolean isMax)
	{
		int desSize = desId.length;
		if (isMax)
		{
			for (int i = 0; i < desSize; i++)
			{
				desId[i] = 0;
				desVal[i] = 0;
				int max = 0;
				for (Map.Entry<Integer, Integer> e : map.entrySet())
				{
					if (e.getValue() > max)
					{
						desId[i] = e.getKey();
						desVal[i] = e.getValue();
						max = e.getValue();
					}
				}
				if (map.containsKey(desId[i]))
				{
					map.put(desId[i], 0);
				}
			}
		}
		else
		{
			for (int i = 0; i < desSize; i++)
			{
				desId[i] = 0;
				desVal[i] = 0;
				int min = 0xFFFFFFFF;
				for (Map.Entry<Integer, Integer> e : map.entrySet())
				{
					if (e.getValue() < min && e.getValue() > 0)
					{
						desId[i] = e.getKey();
						desVal[i] = e.getValue();
						min = e.getValue();
					}
				}
				if (map.containsKey(desId[i]))
				{
					map.put(desId[i], 0);
				}
			}
		}
	}
		
    {{range .Members}}
    // get {{.Comment}}
    public int get{{.Name}}()
    {
        return {{.Name}};
    }
    
    // set {{.Comment}}
    public void set{{.Name}}(int _{{.Name}})
    {
        {{.Name}} = {{if eq .Cmp "max"}}_{{.Name}} > {{.Name}} ? _{{.Name}} : {{.Name}}{{else if eq .Cmp "min"}}_{{.Name}} < {{.Name}} ? _{{.Name}} : {{.Name}}{{else}}_{{.Name}}{{end}};
    }
    
    {{if not .Cmp}}// add {{.Comment}}
    public void add{{.Name}}(int _{{.Name}})
    {
        {{.Name}} += _{{.Name}};
    }{{end}}
    {{end}}
    
    {{range .Arrays}}     
	// set {{.Comment}}
    public void set{{.Name}}(int index, int _{{.Name}})
    {
		if (index >= {{.Length}} || index < 0)
        {
            return;
        }
        {{.Name}}[index] += _{{.Name}};
    }
	
    // add {{.Comment}}
    public void add{{.Name}}(int index, int _{{.Name}})
    {
        if (index >= {{.Length}} || index < 0)
        {
            return;
        }
        {{.Name}}[index] += _{{.Name}};
    }
    {{end}}
	
    {{range .TopArrays}}      
	// set {{.Comment}}
    public void set{{.Name}}(int index, int _{{.Name}})
    {
		if (index >= {{.Length}} || index < 0)
        {
            return;
        }
        {{.Name}}[index] += _{{.Name}};
    }
	       
    // add {{.Comment}}
    public void add{{.Name}}(int index, int _{{.Name}})
    {
        if (index >= {{.Length}} || index < 0)
        {
            return;
        }
        {{.Name}}[index] += _{{.Name}};
    }
    {{end}}
	
    {{range .HashMaps}}     
	// set {{.Comment}}
    public void set{{.Name}}(int index, int _{{.Name}})
    {
		{{.Name}}.put(index, _{{.Name}});
    }
	        
    // add {{.Comment}}
    public void add{{.Name}}(int index, int _{{.Name}})
    {
        if ({{.Name}}.containsKey(index))
        {
            int val = {{.Name}}.get(index);
            val += _{{.Name}};
            {{.Name}}.put(index, val);
        }
        else
        {
            {{.Name}}.put(index, _{{.Name}});
        }
    }
	
    // add {{.Comment}}
    public void add{{.Name}}(int index)
    {
        if ({{.Name}}.containsKey(index))
        {
            int val = {{.Name}}.get(index);
            val += 1;
            {{.Name}}.put(index, val);
        }
        else
        {
            {{.Name}}.put(index, 1);
        }
    }
    {{end}}
    
    public void clear()
	{
		{{range .Members}}
		// {{.Comment}}
		{{.Name}} = 0;
		{{end}}
		{{range .Arrays}}
		// {{.Comment}}
		for (int i = 0; i < {{.Name}}.length; i++)
		{
			{{.Name}}[i] = 0;
		}
		{{end}}
		{{range .TopArrays}}
		// {{.Comment}}
		for (int i = 0; i < {{.Name}}.length; i++)
		{
			{{.Name}}[i] = 0;
		}
		{{end}}
		{{range .HashMaps}}
		// {{.Comment}}
		{{.Name}}.clear();
		{{end}}
	}

    public void printLog(String strFile)
	{
		File file = null;
		try
		{
			file = new File("log/");
			if (!file.exists())
			{
				file.mkdirs();
			}
			file = new File("log/" + strFile);
			if (!file.exists())
			{
				file.createNewFile();
			}
		}
		catch (IOException e)
		{
			e.printStackTrace();
			return;
		}
		
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);

		{{range .TopArrays}}
		// {{.Comment}}
		int[] u{{.Name}}Id = new int[{{.Top}}];
		int[] u{{.Name}}Val = new int[{{.Top}}];
		sortArray({{.Name}}, u{{.Name}}Id, u{{.Name}}Val, {{if .Cmp}}false{{else}}true{{end}});
		{{end}}
		{{range .HashMaps}}
		// {{.Comment}}
		int[] u{{.Name}}Id = new int[{{.Top}}];
		int[] u{{.Name}}Val = new int[{{.Top}}];
		sortHashMap({{.Name}}, u{{.Name}}Id, u{{.Name}}Val, {{if .Cmp}}false{{else}}true{{end}});
		{{end}}
		
		String str = String.format("=============================%s=============================\n" +
			{{range .Members}}
			// {{.Comment}}
			"{{.Name}}\t%d\t{{.Comment}}\n" +
			{{end}}
			{{range .Arrays}}{{$comment := .Comment}}{{$name := .Name}}
			{{range $i,$e := genlist .Length}}
			// {{$comment}} {{$i}}
			"{{$name}}{{$i}}\t%d\t{{$comment}}{{$i}}\n" +
			{{end}}
			{{end}}
			{{range .TopArrays}}{{$comment := .Comment}}{{$name := .Name}}
			{{range $i,$e := genlist .Top}}
			// {{$comment}} {{$i}}
			"{{$name}}Id{{$i}}\t%d\t{{$comment}}Id{{$i}}\n{{$name}}Val{{$i}}\t%d\t{{$comment}}Val{{$i}}\n" +
			{{end}}
			{{end}}
			{{range .HashMaps}}{{$comment := .Comment}}{{$name := .Name}}
			{{range $i,$e := genlist .Top}}
			// {{$comment}} {{$i}}
			"{{$name}}Id{{$i}}\t%d\t{{$comment}}Id{{$i}}\n{{$name}}Val{{$i}}\t%d\t{{$comment}}Val{{$i}}\n" +
			{{end}}
			{{end}}
			"\n"
			
			, time
			{{range .Members}}
			// {{.Comment}}
			, {{.Name}}
			{{end}}
			{{range .Arrays}}{{$comment := .Comment}}{{$name := .Name}}
			{{range $i,$e := genlist .Length}}
			// {{$comment}} {{$i}}
			, {{$name}}[{{$i}}]
			{{end}}
			{{end}}
			{{range .TopArrays}}{{$comment := .Comment}}{{$name := .Name}}
			{{range $i,$e := genlist .Top}}
			// {{$comment}} {{$i}}
			, u{{$name}}Id[{{$i}}], u{{$name}}Val[{{$i}}]
			{{end}}
			{{end}}
			{{range .HashMaps}}{{$comment := .Comment}}{{$name := .Name}}
			{{range $i,$e := genlist .Top}}
			// {{$comment}} {{$i}}
			, u{{$name}}Id[{{$i}}], u{{$name}}Val[{{$i}}]
			{{end}}
			{{end}}
			);
			
		clear();
		
		try
		{
			FileOutputStream out = new FileOutputStream(file, true);
			out.write(str.toString().getBytes("utf-8"));
			out.close();
		}
		catch (IOException e)
		{
			e.printStackTrace();
			return;
		}
		
	}
    
}
{{end}}
