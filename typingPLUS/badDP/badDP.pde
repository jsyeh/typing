//關於 Dynamic Programming 如何比較字的差別/答對幾個字?
//A BCDE
//AABCDE
//1. 分數的算法: 比對正確時, score++
//2. 每個字有2種可能
//3. 要開 227字(text1) x 300字(input)的 table
//4. table要做事時, 
//依照 PLUS_Animals.png 裡面的寫法, the vs. teh 如果2個字母反過來, 則2個都是錯的。
//但根據 editing distance的原本DP解法, 會有1個母是對的。
//我們應該改變 DP的作法, 
String text1="    Crazy Dog";
String input="    Crzay Dog";
int [][]table;
int[][]direction;//表示table[i][j]分數, 是由 1: 左邊, 2: 上面, 3: 左上 得來的
void setup(){
  runDP();
}
void draw(){
  
}
void runDP(){
  table = new int[text1.length()+1][input.length()+1];
  direction = new int[text1.length()+1][input.length()+1];
  //table[i][j] 表示 text1用了前i個字母, 與 input用了前j個字母, 有多少字母相同
  //for(int i=0; i<text1.length(); i++) table[i][0]=0; //這行可以不用寫, 因為 Java 的陣列 new出來時, 都是0
  //for(int j=0; j<input.length(); j++) table[0][j]=0;
  for(int i=1; i<=text1.length(); i++){
    for(int j=1; j<=input.length(); j++){
      if(text1.charAt(i-1)==input.charAt(j-1)){//多一個字母正確
        table[i][j]=table[i-1][j-1]+1;
        direction[i][j]=3;//左上角得到的分數, 表示黑色/正確
      }else if(table[i][j-1]>=table[i-1][j]){
        table[i][j]=table[i][j-1];
        direction[i][j]=2;//左邊得到分數, 表示是input無效一格
      }else{
        table[i][j]=table[i-1][j];
        direction[i][j]=1;//上面得到的分數
      }
    }
  }
  for(int i=0; i<=text1.length(); i++){
    for(int j=0; j<=input.length(); j++){
      print(nf(table[i][j],2)+" ");
    }
    println();
  }
  println(table[text1.length()][input.length()]);
}
