package com.laughstyle.timerec;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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
		String[] sa = new String[]{"a.JPG","b.jpg","c.JPG","c.png","d.png","hiroki.png"};
		
		String[] sm = new String[]{
			"今日はインフルエンザでお休み頂きます。コアラさん、○○○さんから荷物が届きますので私のデスクに置いておいてくださいね",
			"○○○カンパニーへプレゼンしに行ってきます。不在中お客様からお電話あった場合はメールください",
			"今週は取れなかった夏期休暇を取ります。緊急の連絡はTwitterでお願いします",
			"台風9号は6日午後、長崎県・五島列島の西の東シナ海を北北東に進んだ。7日午後には、暴風域を伴い九州北部に最接近するといい、気象庁は暴風や高波、大雨に警戒を呼び掛けた。(時事通信)"
		};
		
		Random rnd = new Random();
		
		for(int i = 0; i < 10; i++)
		{
			EmployeeInfo ei = new EmployeeInfo(String.format("%05d", i), "社員", String.format("%d号", i), String.format("data/%s", sa[i % 5]), sm[rnd.nextInt(sm.length)], "在席");
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
