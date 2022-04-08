;-------1---------2---------3---------4---------5---------6---------7---------
;
;	Program:	pass.asm
;	Project#:	2
;	Name:		Lehi Alcantara
;	Class:		CS2810-601
;	Date:		09 Oct 2007
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
;	Description:	 This program will read in four characters from the keyboard and print out the characters 
;			 using the string print OS call.

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

MyMain		

		lea	r0, template	;point to template string
		trap	x22		;print string out
		
		ld	r0,newLine	;load new line
		trap	x21		;print new line

		lea	r0, message	;point to message string
		trap	x22		;print string out
		trap	x20		;gets the character from keyboard without echoing to the screen
		lea	r2, array	;create array in r2
		str	r0,r2,#0	;store r0 in r2 offset 0
		trap	x21		;prints out a character	
		ld	r0, newLine	;get <crlf>
		trap	x21		;print it out
			
		lea	r0, message	;point to template string
		trap	x22		;print string out
		trap	x20		;gets the character from keyboard without echoing to screen
		str	r0,r2,#1	;store r0 in r2 offset 1
		trap	x21		;prints out the character	
		ld	r0, newLine	;get <crlf>
		trap	x21		;print it out

		lea	r0, message	;point to template string
		trap	x22		;print string out
		trap	x20		;gets the character from keyboard without echoing to screen
		str	r0,r2,#2	;store r0 in r2 offset 2
		trap	x21		;prints out the character
		ld	r0, newLine	;get <crlf>
		trap	x21		;print it out			

		lea	r0, message	;point to template string
		trap	x22		;print string out
		trap	x20		;gets the character from keyboard without echoing to screen
		str	r0,r2,#3	;store r0 in r2 offset 3
		trap	x21		;prints out the character
		ld	r0, newLine	;get <crlf>
		trap	x21		;print it out	

		ld	r0,newLine	;load new line
		trap	x21		;print new line

		lea	r0, print	;point print string phrase "You input the characters: "
		trap	x22		;print string out
		
		lea	r0, array	;load the array into register zero (r0)
		trap	x22		;print the actual array

		ld	r0,newLine	;load new line
		trap	x21		;print new line
		
		ld	r0,newLine	;load new line
		trap	x21		;print new line
	
		lea	r0, term	;point to termination string
		trap	x22		;print string out
		

MyMainEnd	trap	x25		;stop the program


;-------1---------2---------3---------4---------5---------6---------7---------
;
;	Static Memory Allocation
;
;-------1---------2---------3---------4---------5---------6---------7---------

; constants
array		.BLKW	4		;array of 5 characters (4 characters and a null)
MyNull          .FILL	x0		;NULL
newLine		.FILL	x0A		;line feed and carrage return in LC-3
print		.STRINGZ	"You input the characters: "

template	.STRINGZ	"CS2810-601\nLehi Alcantara\nProject #2\n"
term		.STRINGZ	"Program execution terminated!\n"
message		.STRINGZ	"Please input a character: "


		.END			;end assembly directive


