// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

//test
    @50
    M=A //Memory[50]に50が入る
    



//　ほんまもんのやつ
//     @R2 //A命令
//     M=0 // Memory[R2] = 0 → R2のアドレスに0を入れる
//     @i
//     M=1
// (LOOP)
//     @i //A命令
//     D=M // DレジスタにMemory[i]を代入する
//     @R1 
//     D=D-M //D = i - R1 -> Dレジスタに(t-1)のDレジスタ-Memory[R1]を代入する
//     @END // A命令?
//     D;JGT //if(D > 0) goto END ->(t-1)Dレジスタの値が0以下の場合ENDに飛ぶ
//     @R0
//     D=M // D = R0
//     @R2
//     M=D+M // R2 = R2 + R0
//     @i
//     M=M+1 //i++
//     @LOOP
//     0;JMP
// (END)
//     @END
//     0;JMP
    



//     @i
//     M=1
//     @sum
//     M=0
// (LOOP)
//     @i
//     D=M
//     @100
//     D=D-A
//     @END
//     D;JGT
//     @i
//     D=M
//     @sum
//     M=D+M
//     @i
//     M=M+1
//     @LOOP
//     0;JMP
// (END)
//     @END
//     0;JMP