/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Bean.CollegeBean;
import Model.InfosDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 import java.util.List;
 import org.apache.commons.fileupload.FileItem;
 import org.apache.commons.fileupload.servlet.ServletFileUpload;
 import org.apache.commons.fileupload.FileItemFactory;
 import org.apache.commons.fileupload.disk.DiskFileItemFactory;
 import org.apache.commons.io.output.DeferredFileOutputStream;

 import java.io.*;
 import java.util.Iterator;

 import org.apache.poi.hssf.usermodel.HSSFSheet;
 import org.apache.poi.hssf.usermodel.HSSFWorkbook;
 import org.apache.poi.ss.usermodel.Cell;
 import org.apache.poi.ss.usermodel.Row;
 import org.apache.poi.xssf.usermodel.XSSFSheet;
 import org.apache.poi.xssf.usermodel.XSSFWorkbook;

 import javax.naming.Context;
 import java.sql.ResultSet;
 import java.sql.PreparedStatement;
 import java.sql.SQLException;
 import java.sql.Connection;
import java.util.ArrayList;
 import javax.sql.DataSource;
 import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author divinity
 */
public class UploadList extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter(); 
        
        String file_name = "";
        String extension = "";
        String cellData="";
        InputStream input = null;
        ArrayList <String[]> list=new ArrayList<String[]>();
        String[] arr;

        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List items = null;
        try 
        {
            items = upload.parseRequest(request);
        } catch (Exception e) 
        {
            e.printStackTrace();
        }
        
        try
        {
            Iterator itr = items.iterator();
            while (itr.hasNext()) 
            {
                FileItem item = (FileItem) itr.next();
                file_name = item.getName();
                input = item.getInputStream();
            }
            if(!file_name.equals(""))
            {
                extension = file_name.substring(file_name.indexOf("."));
                if (extension.equalsIgnoreCase(".xlsx"))
                {
                    XSSFWorkbook wb = new XSSFWorkbook(input);
                    // Get first sheet from the workbook
                    XSSFSheet sheet = wb.getSheetAt(0);
                    Row row,header;
                    int r= sheet.getLastRowNum();
                    int headerCnt=0;
                    header =sheet.getRow(3);
                    String[] headerText=new String[10];
                    for(int i=0;i<10;i++)
                    {
                        try{
                        headerText[i]= header.getCell(i).getStringCellValue();
                        headerCnt++;
                        }
                        catch (Exception e){}
                    }
                    arr=new String[headerCnt];
                    System.arraycopy(headerText, 0, arr, 0, headerCnt);
                    list.add(arr);
                    for(int i=4;i<=r;i++)
                    {   arr=new String[headerCnt];
                        row=sheet.getRow(i);
                        for(int j=0;j<headerCnt;j++)
                        {
                            try{cellData=row.getCell(j).getStringCellValue();
                            arr[j]=cellData;
                            }catch (Exception e){}
                        }
                        list.add(arr);
                    }
                    InfosDao dao=new InfosDao();
                    ArrayList<CollegeBean> collegeList=dao.getAllCollegeInfo();
                    request.setAttribute("collegeList", collegeList);
                    request.setAttribute("fileName", file_name.substring(0, file_name.lastIndexOf('.')));
                    request.setAttribute("itemList", list);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/uploadInTable.jsp");
                    dispatcher.forward( request, response );
                }
                else if (extension.equalsIgnoreCase(".xls"))
                {
                    HSSFWorkbook workbook = new HSSFWorkbook(input);
                    // Get first sheet from the workbook
                    HSSFSheet sheet = workbook.getSheetAt(0);
                    Row row,header;
                    int r= sheet.getLastRowNum();
                    int headerCnt=0;
                    header =sheet.getRow(3);
                    String[] headerText=new String[10];
                    for(int i=0;i<10;i++)
                    {
                        try{
                        headerText[i]= header.getCell(i).getStringCellValue();
                        headerCnt++;
                        }
                        catch (Exception e){}

                    }
                    arr=new String[headerCnt];
                    System.arraycopy(headerText, 0, arr, 0, headerCnt);
                    list.add(arr);
                    for(int i=4;i<=r;i++)
                    {
                        arr=new String[headerCnt];
                        row=sheet.getRow(i);
                        for(int j=0;j<headerCnt;j++)
                        {
                            try{cellData=row.getCell(j).getStringCellValue();
                            arr[j]=cellData;
                            }catch (Exception e){} 
                        }
                        list.add(arr);
                    }
                    InfosDao dao=new InfosDao();
                    ArrayList<CollegeBean> collegeList=dao.getAllCollegeInfo();
                    request.setAttribute("collegeList", collegeList);
                    request.setAttribute("fileName", file_name.substring(0, file_name.lastIndexOf('.')));
                    request.setAttribute("itemList", list);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/uploadInTable.jsp");
                    dispatcher.forward( request, response );
                }else
                {
                    request.setAttribute("temp", "File Is Not In Proper Format !!!");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/upload.jsp");
                    dispatcher.forward( request, response );
                }
                
            }
            else
            {
                request.setAttribute("temp", "Please Select File !!!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/upload.jsp");
                dispatcher.forward( request, response );
            }
        }
        catch(Exception e)
        {
            request.setAttribute("temp", "Error Loading File !!! Check contents and format of file.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/upload.jsp");
            dispatcher.forward( request, response );
        }
        
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/upload.jsp");
        dispatcher.forward( req, resp );
        return;
    }
    


}
