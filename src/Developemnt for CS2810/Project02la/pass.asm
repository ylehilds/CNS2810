;-------1---------2---------3---------4---------5---------6---------7---------
;
;	Program:	pass.asm
;	Project#:	1
;	Name:		Lehi Alcantara
;	Class:		CS2810-601
;	Date:		05 Oct 2007
;	Version:	1.0
;
;	Ethics:		I declare that the following source code was written 
;			solely by me.  I understand that copying any source 
;			code, in whole or in part, constitutes cheating, 
;			and that I will receive a zero grade on this 
;			project if I am found in violation of this ethic. 
;			Project #1 exeception (source code is provided)
; 
;			X   _____________________________________	
;	
;	Description:	This program will read in four characters from the keyboard and 
;	print out the characters using the string print OS call.
;		
;-------1---------2---------3---------4---------5---------6---------7---------

;-------1---------2---------3---------4---------5---------6---------7---------
;
;	Procedure:	MyMain
;	Precondition:	none
;	Postcondition:	none
;	Register usage:	r0		general purpose		used
;			r1		general purpose
;			r2		general purpose
;			r3		general purpose
;			r4		general purpose
;			r5		general purpose
;			r6		stack pointer		
;			r7		procedure linkage			
;
;-------1---------2---------3---------4---------5---------6---------7---------
		.ORIG x3000		;start assembly directive

MyMain		lea	r0, template	;point to template string
		trap	x22		;print string out
		lea	r0, question	;point to question
		trap	x20		;print string out
		trap	x22		;read single charater
		trap	x20		;read 
		;trap	x20		;read single character
		;trap	x20		;read single charater
		;trap	x20		;read single character
;		lea	r0, message	;point to message string
;		trap	x22		;print string out		

		lea	r0, term	;point to termination string
		trap	x22		;print string out

		ld	r0, newLine	;get <crlf>
		trap	x21		;print it out

MyMainEnd	trap	x25		;stop the program


;-------1---------2---------3---------4---------5---------6---------7---------
;
;	Static Memory Allocation
;
;-------1---------2---------3---------4---------5---------6---------7---------

; constants
null		.STRINGZ	"\n"
question	.STRINGZ	"Please insert a character: \n"
newLine		.FILL	x0A		;line feed and carrage return in LC-3

template	.STRINGZ	"CS2810-601\nLehi Alcantara\nProject #2\n"
term		.STRINGZ	"Program execution terminated!\n"

;message		.STRINGZ	"\n     \"Hello World\" \n\n"


		.END			;end assembly directive


