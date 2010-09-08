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
			"[伝言]今日はインフルエンザでお休み頂きます。コアラさん、○○○さんから荷物が届きますので私のデスクに置いておいてくださいね",
			"[お知らせ]○○○カンパニーへプレゼンしに行ってきます。不在中お客様からお電話あった場合はメールください",
			"[お知らせ]今週は取れなかった夏期休暇を取ります。緊急の連絡はTwitterに願いします",
			"[気になるニュース]原口一博総務相は８日午前、国会内で記者会見を開き、民主党代表選で小沢一郎前幹事長を支持することを表明した。",
			"[通知]今日の夜はメンテナンスのためサーバーが停止します。",
			"[昼ご飯]ペペロンチーノを食べました",
			"[話題]サッカー・キリンチャレンジ杯（日本２－１グアテマラ、７日、長居）日本代表はグアテマラ代表に２－１の勝利。南アＷ杯後の２試合を連勝した。就労ビザの取得が遅れてベンチ入りできないため、スタンドから視察したアルベルト・ザッケローニ新監督（５７）は「責任を感じた」と“本格始動”への意欲を新たに。（サンケイスポーツ）"
		};
		
		String[] fn = {"カピバラ","コアラ","トイ","とうま","當麻"};
		String[] ln = {"花子","太郎","ともこ","弘樹"};
		
		Random rnd = new Random();
		
		for(int i = 0; i < 10; i++)
		{
			EmployeeInfo ei = new EmployeeInfo(String.format("%05d", i), fn[i % 5], ln[rnd.nextInt(ln.length)], String.format("data/%s", sa[i % 5]), sm[rnd.nextInt(sm.length)], "在席");
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
