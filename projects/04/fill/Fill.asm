// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


///////////////my code//////////////////
(INIT)
  @FLAG
  M=0   // initialize FLAG
(MONITOR)  // KEYが押されると黒に描画押されていないときは白に描画
  @50  // 画面の最大値(512 * 256 / 16) = 8192がはいる (テストで50を入れてる)
  D=A
  @i
  M=D //i = 8192(test = 50)
  @MAP // SCREEN offset
  M=0
  @KBD
  MD=M
  @DRAW
  D;JGT  // if (Memory[KBD] > 0) goto DRAW
  @ERASER
  D;JEQ  // if(Memory[KBD] == 0) goto ERASER
(DRAW)
  @FLAG
  M=1      // flag = 1
  @i
  MD=M-1   // i--
  @MONITOR
  D;JLT    // if (i < 0)goto MONITOR
  @MAP
  D=M
  @SCREEN
  A=A+D    //  Memory[SCREEN + MAP]
  M=-1     // DRAW black
  @MAP
  M=M+1    // MAP++
  @DRAW
  0;JMP
  (ERASER)
  @FLAG   
  D=M
  @MONITOR
  D;JEQ    // if(flag == 0) goto MONITOR
  @i
  MD=M-1  
  @INIT   
  D;JLT    // if(i < 0) goto INIT
  @MAP
  D=M
  @SCREEN
  A=A+D
  M=0
  @MAP
  M=M+1
  @ERASER
  0;JMP



/////////////////another code///////////////////
// // define screen size
//     @8192
//     D=A
//     @number_of_pixel
//     M=D

//     @R0
//     M=0     // Screen is empty at the start
// (LOOP)
//     @KBD
//     D=M
//     @KEY_PUSHED
//     D;JNE   // if KBD != 0 then goto KEY_PUSHED
// (KEY_NOT_PUSHED)
//     @R1
//     M=0     // R0=0
//     @CHECK_STATE_CHANGE
//     0;JMP
// (KEY_PUSHED)
//     @R1
//     M=1     // R1=1
// (CHECK_STATE_CHANGE)    // if R0 != R1 then screen is update
//     @R0
//     D=M     // D=R0
//     @R1
//     D=D-M   // D=R0-R1
//     @LOOP
//     D;JEQ   // if D == 0 then goto LOOP
//     @i
//     M=0
//     @R1
//     D=M
//     @R0
//     M=D
//     @EMPTY_SCREEN_LOOP
//     D;JEQ
// (FILL_SCREEN_LOOP)
//     @i
//     D=M
//     @number_of_pixel
//     D=M-D
//     @LOOP
//     D;JLT
//     @SCREEN
//     A=A+D
//     M=-1
//     @i
//     MD=M+1
//     @FILL_SCREEN_LOOP
//     0;JMP
// (EMPTY_SCREEN_LOOP)
//     @i
//     D=M
//     @number_of_pixel
//     D=M-D
//     @LOOP
//     D;JLT
//     @SCREEN
//     A=A+D
//     M=0
//     @i
//     MD=M+1
//     @EMPTY_SCREEN_LOOP
//     0;JMP












// keybordの入力調べ

// (LOOP)
//   @KBD  //入力があればmemory[KBD] = ASCIIになる
//   MD=M
//   @i  // i = memory[KBD]
//   M=D
//   @LOOP
//   0;JMP



// gotoを使うときはDを参照にしないとうまくいかない
// Dは数値をいじるとかコンペアしたり参照するときに使う
// Mは値の格納
// Aはメモリの位置を操作する、定数の格納


/////////////画面描画のアルゴリズム////////////////////

//     @50 // 画面のはじっこ
//     D=A
//     @i
//     M=D  // i=8192
//     @MAP // screenからのオフセット
//     M=0
// (LOOP)
//     @i
//     MD=M-1  // i--
//     // D=M
//     @END
//     D;JLT // if(i < 0) goto END
//     @MAP
//     D=M
//     @SCREEN
//     A=A+D  // Memory[SCREEN + MAP]
//     M=-1  //　Memory[SCREEN + MAP] = -1
//     @MAP
//     M=M+1  //MAP++
//     @LOOP  // goto LOOP
//     0;JMP
// (END)
//     @END
//     0;JMP

////////////メモリ操作のテスト///////////////
//     @dlaw   // memory[16] = 0
//     M=0 
//     @i
//     M=1
// (LOOP)
//     @i
//     D=M    // memory[17] = 1
//     @dlaw
//     A=A+D // memory[16 + i]
//     MD=1  //  memory[16 + i] = 1
//     @i
//     M=M+1  // memory[17] ++

//     @LOOP
//     0;JMP