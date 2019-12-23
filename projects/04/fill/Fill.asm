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
// RAM[24576] holds the value of keyboard
// RAM[16384] to RAM[24575] are screen pixels
(FILL_PROGRM)
	@KBD
	D=M
	
	@CLEAR_SCREEN
	D;JEQ
	@FILL_SCREEN
	0;JMP
	
(CLEAR_SCREEN)
	@8191
	D=A
(CLEAR_LOOP)
	@SCREEN
	A=D+A
	M=0
	
	@CLEAR_LOOP
	D=D-1;JGE
	
	@FILL_PROGRM
	0;JMP

(FILL_SCREEN)
	@8191
	D=A
(FILL_LOOP)
	@SCREEN
	A=D+A
	M=-1
	
	@FILL_LOOP
	D=D-1;JGE
	
	@FILL_PROGRM
	0;JMP
	
