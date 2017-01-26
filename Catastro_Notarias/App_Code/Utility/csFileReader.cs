using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

public class csFileReader
{
    StreamReader strmReader;
    StringBuilder strBuilder;
    string rootPath;
    Dictionary<string, string> FileMap;

    public csFileReader(string rootPath)
    {
        this.rootPath = rootPath;
        FileMap = new Dictionary<string, string>()
        {
            {"Master", rootPath + @"Site.Master" },
            {"Padre", rootPath + @"Content\Templates\htmlPadre.html" },
            {"Hijo", rootPath + @"Content\Templates\htmlHijo.html" },
            {"HijoPadre", rootPath + @"Content\Templates\htmlHijoPadre.html" }
        };
    }

    public string ReadFile(string filename)
    {
        strmReader = new StreamReader(FileMap[filename]);
        strBuilder = new StringBuilder(strmReader.ReadToEnd());
        strmReader.Close();
        strmReader = null;
        string text = strBuilder.ToString();
        strBuilder = null;
        return text;
    }

    public string ReadFile(string filename, string inFileMark, string value)
    {
        strmReader = new StreamReader(FileMap[filename]);
        strBuilder = new StringBuilder(strmReader.ReadToEnd());
        strmReader.Close();
        strmReader = null;
        strBuilder.Replace(inFileMark, value);
        string text = strBuilder.ToString();
        strBuilder = null;
        return text;
    }

    public string ReadFile(string filename, Dictionary<string, string> map)
    {
        strmReader = new StreamReader(FileMap[filename]);
        strBuilder = new StringBuilder(strmReader.ReadToEnd());
        strmReader.Close();
        strmReader = null;
        int mapCount = map.Count;
        for (int x = 0; x < mapCount; x++)
        {
            strBuilder.Replace(map.Keys.ElementAt<string>(x), map.Values.ElementAt<string>(x));
        }
        string text = strBuilder.ToString();
        strBuilder = null;
        return text;
    }

    public string ReadText(string text, Dictionary<string, string> values)
    {
        strBuilder = new StringBuilder(text);
        int valuesCount = values.Count;
        for (int x = 0; x < valuesCount; x++)
        {
            strBuilder.Replace(values.Keys.ElementAt<string>(x), values.Values.ElementAt<string>(x));
        }
        string retText = strBuilder.ToString();
        strBuilder = null;
        return retText;
    }

    public string Replace(string text, string newText, string initialMark, string finalMark)
    {
        StringReader strReader = new StringReader(text);
        StringBuilder strBuilder = new StringBuilder();
        string line;
        bool inBlock = false;
        while ((line = strReader.ReadLine()) != null)
        {
            if (inBlock)
            {
                StringReader Reader = new StringReader(newText);
                string newLine;
                while ((newLine = Reader.ReadLine()) != null)
                {
                    strBuilder.AppendLine(newLine);
                }
                inBlock = false;
                while ((line = strReader.ReadLine().Trim()) != finalMark)
                {
                    //Set strReader's line's counter to finalMark line
                }
            }
            if (line.Trim() == initialMark)
                inBlock = true;
            strBuilder.AppendLine(line);
        }
        string retText = strBuilder.ToString();
        strBuilder = null;
        return retText;
    }

    public string ReplaceSinMarcas(string text, string newText, string initialMark, string finalMark)
    {
        StringReader strReader = new StringReader(text);
        StringBuilder strBuilder = new StringBuilder();
        string line;
        bool inBlock = false;
        while ((line = strReader.ReadLine()) != null)
        {
            if (inBlock)
            {
                StringReader Reader = new StringReader(newText);
                string newLine;
                while ((newLine = Reader.ReadLine()) != null)
                {
                    strBuilder.AppendLine(newLine);
                }
                inBlock = false;
                while ((line = strReader.ReadLine().Trim()) != finalMark)
                {
                    //Set strReader's line's counter to finalMark line
                }
                line = strReader.ReadLine();
                if (line == null)
                    line = "";
            }
            if (line.Trim() == initialMark)
                inBlock = true;
            else
                strBuilder.AppendLine(line);
        }
        string retText = strBuilder.ToString();
        strBuilder = null;
        return retText;
    }

    public string Substring(string text, string initialMark, string finalMark)
    {
        StringReader strReader = new StringReader(text);
        StringBuilder strBuilder = new StringBuilder();
        string line;
        bool inBlock = false;
        while ((line = strReader.ReadLine()) != null)
        {
            line = line.Trim();
            if (line == finalMark)
                break;
            if (inBlock)
                strBuilder.AppendLine(line);
            if (line == initialMark)
                inBlock = true;
        }
        strReader = null;
        string retText = strBuilder.ToString();
        strBuilder = null;
        return retText;
    }

    public string RemoveSubstring(string text, string initialMark, string finalMark)
    {
        StringReader strReader = new StringReader(text);
        StringBuilder strBuilder = new StringBuilder();
        string line;
        bool inBlock = false;
        while ((line = strReader.ReadLine()) != null)
        {
            line = line.Trim();
            if (line == initialMark)
                inBlock = true;
            if (!inBlock)
                strBuilder.AppendLine(line);
            if (line == finalMark)
                inBlock = false;
        }
        strReader = null;
        string retText = strBuilder.ToString();
        strBuilder = null;
        return retText;
    }
}