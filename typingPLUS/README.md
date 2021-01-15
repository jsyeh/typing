PLUS-style打字遊戲
==================

Background 背景說明
-------------------
因為我兒子非常著迷補習班(PLUS普拉斯)的打字遊戲。所以我就在他生日的這天, 模仿補習班的打字介面, 寫了一個程式, 讓我兒子可以每天在家練習打字/衝排名。


More Details 補充說明
---------------------
原本用許多 Processing 關於 String 字串 及 text() 顯示字串 相關的函式。
因想準確顯示出多行文字/自己進行排版。但後來發現 text()可用\n跳行, 這就簡單了。

目前這個版本, 只完成顯示文字/打字。

TODO: 還沒計分, 還沒 cursor, 還沒紅色顯示打錯的部分。

Reference 目錄裡, 有 學府文教機構 貼出來的圖片, 我照著量出字的長寬。
https://www.facebook.com/HSUEHFU.MPM/posts/2156578184397265/

![PrintScreen](PrintScreen.png)

Code Explain 程式碼說明
-----------------------

```Processing
String text1="     Crazy Dog was eating a hamburger.  Funny Cat took his hamburger\r\n"
           + "away.  Crazy Dog ran after Funny Cat.  Funny Cat jumped up to the top\r\n"
           + "of a bookshelf.  Crazy Dog couldn't catch Funny Cat.  Funny Cat\r\n"
           + "laughed at Crazy Dog."; //使用 Java String 字串 + 增加可讀性
String text2="     Animals live in every part of the earth.  They live in the air, in the\r\n"
           + "water, and on the land.  They can move from one place to another.  A\r\n"
           + "cow, a bird, a fish, a sheep, and a snake are all animals.  Butterflies,\r\n"
           + "eagles, elephants, goldfish, and people are all animals, too.";
PFont font1, font2, font3;
int boxX, boxY, boxW=930, boxH=300, textH=32; //文字框寬高
color bgColor=#069581; //背景藍綠色
void setup(){
  //參考 https://www.facebook.com/HSUEHFU.MPM/posts/2156578184397265/
  //println(text1.length()); //參考圖片寫227字, 表示跳行為Windows的\r\n
  //println(text2.length()); //參考圖片寫282字, 表示跳行為Windows的\r\n
  size(1024,768);
  font1=createFont("Times New Roman", textH); //打字區的字型
  font2=createFont("標楷體", textH); //左下方中文成績要使用
  //font3=createFont("Arial Nova", textH); //數字的字型, not available
  textFont(font1);
  textLeading(textH*1.25); //行距 1.25倍行高
  textAlign(LEFT, TOP); //對齊左上角,讓 text() 座標簡化
  boxX=(width-boxW)/2;
  boxY=20; //TODO: 之後要依解析度不同, 推算出 box的寬高、位置、字型大小
}
void draw(){
  background(bgColor);
  fill(255);
  rect(boxX, boxY,         boxW, boxH); //上方題目框
  rect(boxX, boxY+boxH+10, boxW, boxH); //下方打字框
  fill(0);
  text(text1, boxX+3, boxY);         //上方題目區
  text(input, boxX+3, boxY+boxH+20); //下方打字區
}
String input=""; //TODO: 重新開始時, 可再將 input="" 清空
void keyPressed(){
  if(key==BACKSPACE){ //按下BackSpace倒退鍵
    if(input.length()>0){ //如果有字可倒退, 就倒退1字元
      input = input.substring(0, input.length()-1); 
    }
  }else if(key==TAB){ //按下TAB鍵
    input += "     "; //普拉斯系統的TAB鍵代表5個空格
  }else if(key==ENTER){ //意外發現 Enter 可配合 text() 的\n功能
    input += "\r\n"; //跳行, 配合 textLeading()行距顯示
  }else if(key==ESC){ //按下ESC鍵, 要算分
    key = 0; // 但 ESC 也表示結束程式, 所以要把 key 改掉, 避免結束
    //https://forum.processing.org/one/topic/ignore-escape-key-do-other-action.html
    //TODO: calculate the score!
  }else if(key==CODED){
    //do nothing, 不記錄CODED特殊鍵
  }else{ //如果按下 普通字母/符號按鍵, 記錄下來
    input += key; //記錄下來
  }
}
```
