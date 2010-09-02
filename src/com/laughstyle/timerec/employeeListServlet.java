package com.laughstyle.timerec;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.arnx.jsonic.JSON;
import com.laughstyle.timerec.model.*;


public class employeeListServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws IOException {
		doPost(req, resp);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws IOException {
	
		List<EmployeeInfo> list = new ArrayList<EmployeeInfo>();
		
		for(int i = 0; i < 10; i++)
		{
			EmployeeInfo ei = new EmployeeInfo(String.format("%05d", i), "社員", String.format("%d号", i), "data/hiroki.png", "こんにつは", "在席");
			list.add(ei);
		}
		
		String json = JSON.encode(list);
		resp.setHeader("Content-Disposition", "filename=sample.json");
		resp.setContentType("text/josn;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		System.out.println(json);
		
		out.print(json);
		out.close();
	}
}
