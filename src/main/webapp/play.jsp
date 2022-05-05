<%@page import="util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
// 残数の更新処理(残数の取得、更新、保存など)    
    //     int totalNum = 0;
	//残数用の変数。仮で25をセットしている。必要に応じて変更

   String totalNumStr =  (String)session.getAttribute("totalNum");  //石の残数を取得し文字列で代入
   if (Utility.isNullOrEmpty(totalNumStr)) {  //石の残数データがnullまたは空出ないかをutilityで見る
		totalNumStr = "25";  //石の残数がnullまたは空の場合は"25"を代入する
	}else{
		
	}
   
   int totalNum = Integer.parseInt(totalNumStr);  //石の残数データを文字列から整数へ変換
   
   int tn= 0 ;  //tn:石の残数から取りたい石の数を引いた数を代入するための変数
   
   String numstr = request.getParameter("num");  //取りたい石の数のデータを文字列で取得
   if (Utility.isNullOrEmpty(numstr)) {  //取得したデータにnullまたは空にいないかをutilityで見る
	    numstr = "0";  //nullまたは空の場合は"0"を代入する
	}
   
   int nums = Integer.parseInt(numstr);  //取りたい石の数を文字列から整数へ変換
   
   tn = totalNum - nums;  //石の残数から取りたい石の数を引いた数をtnに代入
   
   String s = Utility.getStoneDisplayHtml(tn);  //tnに代入された数分の石●をｓに代入し、htmlで表示
   
   String tnStr = "" + tn;  //空を入れたのち、取りたい分の石を取ったあとのデータを文字列で代入
   
   session.setAttribute("totalNum",tnStr);  //

   
// プレイヤーの切替処理(プレイヤーの取得、切替、保存など)

	String player = "A";   
	String player1 = "B";
	session.setAttribute("A", player);
	session.setAttribute("B", player1);
	
 	while (totalNum < 0) {
 		   
		String playerstr = (String)session.getAttribute(player);
	
		if(Utility.isNullOrEmpty(playerstr)){
			player = "A";
		}else if(playerstr.equals("B")){
			player = "A";
		}
		session.setAttribute("A", player);
		if(totalNum==1){
			break;
		}
		
		playerstr = (String)session.getAttribute(player1);
	
		if(Utility.isNullOrEmpty(playerstr)){
			player = "B";
		}else if(playerstr.equals("A")){
			player = "B";
		
		session.setAttribute("B", player1);

		if(totalNum<=1){
			break;
		}
	
 	}		
  
   
   
//    session.setAttribute("", player);
//     String player1 = "A";
//     String player2 = "B";
//     session.setAttribute("A", player1);
//     session.setAttribute("B", player2);
   
// 	while (totalNum <= 0) {
		
// 		String playerstr = (String)session.getAttribute(player);
		
// 		if(Utility.isNullOrEmpty(playerstr)){
// 			player = "A";
// 		}else if(playerstr.equals("B")){
// 			player = "A";
// 		}
// 		if(totalNum==1){
// 			break;
// 		}
// 		session.setAttribute("A", player);
		
		
// 		playerstr = (String)session.getAttribute(player);
		
// 		if(playerstr.equals("A")){
// 			player = "B";
// 		}
// 		if(totalNum<=1){
// 			break;
// 		}
// 		session.setAttribute("B", player);
		
// }		


	
	// 残数が0以下の場合、結果ページへ遷移
	// (responseオブジェクトのsendRedirectメソッドを使用する)

	//残数が0以下なら、「〇〇.jsp」へ遷移
	if (tn <= 0) {
		response.sendRedirect("finish.jsp");
	}
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
    <h2>
      石の総数:<%=tn%>個
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
      プレイヤー<%=player%>の番
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