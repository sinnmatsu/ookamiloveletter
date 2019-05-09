
var contenttimeString;
var contenttimeInt;
var contenttime;
var todays;
var targetDay;
var todayss;

var todaytime;
var todaytimes;
var tentime;

function reset(){
  
  $(".timerstartback").show();
  $(".timerstartbutton").show();
  $(".timerarea").hide();
  $(".checkbutton").hide();
  
};

function reset2(){
  
  $(".timerstartback").hide();
  $(".timerstartbutton").hide();
  $(".timerarea").show();
  $(".checkbutton").hide();
  
};

function reset3(){
  
  $(".timerstartback").hide();
  $(".timerstartbutton").hide();
  $(".timerarea").hide();
  $(".checkbutton").show();
  
};


function send(){
  $(".sendgaide").show();
  $(".takegaide").hide();
  console.log("送る")
};

function take(){
  $(".takegaide").show();
  $(".sendgaide").hide();
  console.log("受け取る")
};

function reset4(){
  $(".takegaide").hide();
  $(".sendgaide").show();
  console.log("リセット")
}




//10秒カウントダウン
function countdown(){
  //正体を確認するボタンを押してから10秒後に答えあわせボタンが発生する
  var tencount = setTimeout(function(){
    
    todaytime = new Date(); //今の時間を表示
    tentime = todaytime.setSeconds(todaytime.getSeconds() + 9); //10秒後
    
  },1000);
  
  var tencountdown = setInterval(function(){
    
    todaytimes = new Date()
    var remaintime = (tentime-todaytimes)
    
    if (remaintime >= 0){
      var h = Math.floor(remaintime / 3600000);//残りの日時を1hで割った時間を取得(1h＝3600000ms)
      var h1 = h % 24;//hを24で割った余り。ここでは使っていないが、残り○時間を取得したい時に。
      var m = Math.floor((remaintime - h * 3600000) / 60000);//分を取得(1分＝60000 ms)
      var s = Math.round((remaintime - h * 3600000 - m * 60000) / 1000);//秒を取得(1秒＝1000ms)
      //viewに常にカウントダウンの数字を表記する
      $(".countdowns").text( s );
      
      if ((h == 0) && (m == 0) && (s == 1)) {//指定の日時が来たら、
      
       clearInterval(tencountdown);//カウントダウンを止める
       reset3();
       
       }
    }else{ 
      
      
    }
    
  },1000);
};



function countdowntimer(){
  //一度タイマーが動き出したら止まらなくなる
  //これはあくまでタイマーだけの処理なので、rails の方で投稿それぞれのタイマーの状態をしっかりと管理する必要がある



  var countdown = setInterval(function(){
    
    var today = new Date(); //今の時間
    var daysBetween = Math.ceil((targetDay - today) / (24*60*60*1000));//経過日時を1日のミリ秒で割る
    
    
    contenttimeString = gon.settimer //クリックしたインスタンスのupdata_atの文字列が渡される
    contenttimeInt = Number(contenttimeString) //文字列から数値に変換
    contenttime = new Date(contenttimeInt);
    targetDay = contenttime.setSeconds(contenttime.getSeconds() + 60);
    
    var remainDay = (targetDay - today); //ターゲット時間までの残り時間
    // disclosure_at-todayにすることでそのインスタンスの残り時間がわかる
    
    console.log(today)
    console.log(contenttimeString)
    console.log(contenttime)
    console.log(remainDay)
    // disclosure_atカラムにセットされていたもの
    if (daysBetween >= 0){
      var h = Math.floor(remainDay / 3600000);//残りの日時を1hで割った時間を取得(1h＝3600000ms)
      var h1 = h % 24;//hを24で割った余り。ここでは使っていないが、残り○時間を取得したい時に。
      var m = Math.floor((remainDay - h * 3600000) / 60000);//分を取得(1分＝60000 ms)
      var s = Math.round((remainDay - h * 3600000 - m * 60000) / 1000);//秒を取得(1秒＝1000ms)
      //viewに常にカウントダウンの数字を表記する
      $(".countdowns").text(   h1 + ":" + m + ":" + s );
      
      if ((h == 0) && (m == 0) && (s == 0)) {//指定の日時が来たら、
      
       clearInterval(countdown);//カウントダウンを止める
        //確認ボタンを出現させる
       
       
       }
    }else{ 
      
      
    }
    
  },1000);
};


///////////////////////////////////////////////////

//モーダルを表示するJS処理

//modal
$(function(){
 
  //テキストリンクをクリックしたら
 $("#modal-open").click(function(){
      //body内の最後に<div id="modal-bg"></div>を挿入
     $("body").append('<div id="modal-bg"></div>');
 
    //画面中央を計算する関数を実行
    modalResize();
 
    //モーダルウィンドウを表示
        $("#modal-bg,#modal-main").fadeIn("slow");
 
    //画面のどこかをクリックしたらモーダルを閉じる
      $("#modal-bg,#modal-main").click(function(){
          $("#modal-main,#modal-bg").fadeOut("slow",function(){
         //挿入した<div id="modal-bg"></div>を削除
              $('#modal-bg').remove() ;
         });
 
        });
 
    //画面の左上からmodal-mainの横幅・高さを引き、その値を2で割ると画面中央の位置が計算できます
     $(window).resize(modalResize);
      function modalResize(){
 
            var w = $(window).width();
          var h = $(window).height();
 
            var cw = $("#modal-main").outerWidth();
           var ch = $("#modal-main").outerHeight();
 
        //取得した値をcssに追加する
            $("#modal-main").css({
                "left": ((w - cw)/2) + "px",
                "top": ((h - ch)/2) + "px"
          });
     }
   });
});