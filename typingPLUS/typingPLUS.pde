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
int []len=new int[10];
int lineN=0;
void setup(){
  //參考 https://www.facebook.com/HSUEHFU.MPM/posts/2156578184397265/
  println(text1.length()); //參考圖片寫227字, 表示跳行為Windows的\r\n
  println(text2.length()); //參考圖片寫282字, 表示跳行為Windows的\r\n
  size(1024,768);
  font1=createFont("Times New Roman", textH); //打字區的字型
  font2=createFont("標楷體", textH); //左下方中文成績要使用
  //font3=createFont("Arial Nova", textH); //數字的字型, not available
  textFont(font1);
  textLeading(textH*1.25); //行距 1.25倍行高
  boxX=(width-boxW)/2;
  boxY=20;
}
void draw(){
  background(bgColor);
  fill(255);
  rect(boxX, boxY,         boxW, boxH);  //上方題目框
  rect(boxX, boxY+boxH+10, boxW, boxH);  //下方打字框
  fill(0); //TODO: 之後用 textAlign(LEFT,TOP) 可簡化 text()
  text(text1, boxX+3, boxY+textH);         //上方題目區
  text(input, boxX+3, boxY+boxH+textH+20); //下方打字區
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
    input += '\n'; //跳行, 配合 textLeading()行距顯示
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
//以下是無用的程式碼, 刪除
//因text()可直接用 '\n' 跳行, 所以 prepareLayout()函式就不需要了
//int prepareLayout(String line, int width){//text box 文字框寬度,決定一行幾個字
//  int ans=0;
//  for(int i=0; i<line.length(); i++){
//    if( textWidth(line.substring(0,i))>=width ){
//      break;//太長,就不要再找下一個字了
//    }
//    if( line.charAt(i)==' ') ans=i;//遇到空格,才能斷字
//    if( i==line.length()-1) ans=i+1;
//  }//Q: 要問一下兒子, 最右邊的 Enter是不是要自己按。
//  //如果要按 Enter,則斷字方法就要改用人工斷字串
//  if(ans==0) ans=line.length();
//  return ans;
//}
  //因text()可直接用 '\n' 跳行, 所以 setup() 不再使用 prepareLayout() 斷行了!
  //len[0]=0;
  //for(int i=1;    ; i++){
  //  len[i]=prepareLayout(text1.substring(len[i-1]), boxW) + len[i-1];
  //  if(len[i]==text1.length()){
  //    lineN=i;
  //    break;
  //  }
  //  println(len[i]);
  //}
  //println("lineN:"+lineN, text1.length());
  //lineN=5;
  //下面是我在變成 for迴圈前, 試著做出來的暴力表列法, 後來變成上方的for迴圈
  //len[1]=prepareLayout(text1.substring(len[0]), boxW) + len[0];
  //len[2]=prepareLayout(text1.substring(len[1]), boxW) + len[1];
  //len[3]=prepareLayout(text1.substring(len[2]), boxW) + len[2];

  //因text()可直接用 '\n' 跳行, 所以 draw() 不再需要自己斷行了!
  //for(int i=0; i<lineN; i++){
  //  text(text1.substring(len[i], len[i+1]), boxX, boxY+i*textH+textH);
  //}
