package com.laughstyle.timerec;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laughstyle.timerec.model.*;

public class Arrival extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws IOException {
		doPost(req, resp);
	}
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws IOException {
	
		resp.setHeader("Content-Disposition", "filename=sample.json");
		resp.setContentType("text/josn;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		 
		out.print("[[\"red\", \"inu\"],[\"blue\", \"saru\"],[\"yellow\", \"kuma\"]]");
		out.close();
	}
}
