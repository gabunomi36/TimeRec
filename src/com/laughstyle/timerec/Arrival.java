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
		
	    //(5)TimeZoneオブジェクトの生成
	    TimeZone tz2 = TimeZone.getTimeZone("Asia/Tokyo");
	    //(6)TimeZoneオブジェクトの変更
	    cal.setTimeZone(tz2);
				
		String s = String.format("出社：%02d/%02d %02d:%02d", cal.get(Calendar.MARCH) + 1, cal.get(Calendar.DATE), cal.get(Calendar.HOUR_OF_DAY), cal.get(Calendar.MINUTE));
		resp.getWriter().println(s);
		System.out.println(s);
		
		SpreadController sc = new SpreadController();
		sc.test();
	}
}
