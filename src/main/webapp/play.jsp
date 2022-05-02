<%@page import="util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
        
    // 残数の更新処理(残数の取得、更新、保存など)    
//     int totalNum = 0;
	//残数用の変数。仮で25をセットしている。必要に応じて変更

   String totalNumStr =  (String)session.getAttribute("totalNum");  
   if (Utility.isNullOrEmpty(totalNumStr)) {
		totalNumStr = "25";
	}else{
		
	}
   
   int totalNum = Integer.parseInt(totalNumStr);
   
   int tn= 0 ;
   
   String numstr = request.getParameter("num");
   if (Utility.isNullOrEmpty(numstr)) {
	    numstr = "0";
	}
   int nums = Integer.parseInt(numstr);
   tn = totalNum - nums;
   
   String s = Utility.getStoneDisplayHtml(tn);
   
   String tnStr = "" + tn;
   
   session.setAttribute("totalNum",tnStr);
   
//    Utility.isNullOrEmpty(str)

// プレイヤーの切替処理(プレイヤーの取得、切替、保存など)
    
    String player = "A";  // プレイヤー用の変数。仮で"A"をセットしている。必要に応じて変更
    
    if (player.equals("A")){
    	out.println("A"); 
    }else{
    	out.println("B");	
    } 
  
  
    
    // 残数が0以下の場合、結果ページへ遷移
    // (responseオブジェクトのsendRedirectメソッドを使用する)
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java基礎課題</title>
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
  <h1>石取りゲーム</h1>

  <div class="info">
    <h2>石の総数
      <%=
       	tn
       %>
       個
    </h2>
    <p class="stone">
      <%    
          // todo:このprint分は仮の処理。実装が完了したら削除する。
          // 表示する文字列("●●～")をメソッドを使い取得し、取得した文字列を表示する
          out.println(s);
      %>
    </p>
  </div>
  <div class="info">
    <h2>
      プレイヤーxxの番
    </h2>

    <form action="play.jsp">
      <p>
        石を
        <input type="number" name="num" min="1" max="3">
        個取る<br> ※1度に3個取れます。
      </p>
      <button class="btn" type="submit">決定</button>
    </form>
  </div>
</body>
</html>