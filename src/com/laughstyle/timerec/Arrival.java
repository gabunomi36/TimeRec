package com.laughstyle.timerec;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;

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
		
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("utf-8");

		Calendar cal = Calendar.getInstance(Locale.JAPANESE);

	    TimeZone tz2 = TimeZone.getTimeZone("Asia/Tokyo");
	    cal.setTimeZone(tz2);

		int kind = Integer.parseInt(req.getParameter("kind"));
		String id = req.getParameter("id");
		
		String sKind = "";
		switch(kind)
		{
		case 0:
			sKind = "出社";
			break;
		case 1:
			sKind = "退出";
			break;
		case 2:
			sKind = "外出";
			break;
		case 3:
			sKind = "帰社";
			break;
		case 4:
			sKind = "有給";
			break;
		case 5:
			sKind = "欠勤";
			break;
		}
		
		String s = String.format("%02d/%02d %02d:%02d %sさんが%sしました", cal.get(Calendar.MARCH) + 1, cal.get(Calendar.DATE), cal.get(Calendar.HOUR_OF_DAY), cal.get(Calendar.MINUTE), id, sKind);
		resp.getWriter().println(s);
		System.out.println(s);
		
//		SpreadController sc = new SpreadController();
//		sc.test();
	}
}
