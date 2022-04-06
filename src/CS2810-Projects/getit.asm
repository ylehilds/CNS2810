;-------1---------2---------3---------4---------5---------6---------7---------
;
;	Program:	getit.asm
;	Project#:	3
;	Name:		Lehi Alcantara
;	Class:		CS2810-601
;	Date:		17 Oct 2007
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
;	Description:	 This program will read in input characters from the keyboard and 
;			 print out the word of the number inputted, in case is not a number
;			 or a non printable character it will display an error message
;			 until the delimeter character, ! , is inputted.
;		
;
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


Again		lea	r0, prompt	;point to message string
		trap	x22		;print string out
		trap	x20		;gets the character from keyboard 
					;without echoing to the screen
		ld	r2,delimeter	;initializes the delimeter which is 
					;space ascii #
		not	r2,r2		;inverts the ascii number
		add	r2,r2,#1	;second complement
		ADD	r1,r0,r2	;add r2 to r1
		brnz	NotNumber	;condition to decide if it is 
					;printable

		trap	x21		;prints character
		ld	r2,delimeter2 	;exclamantion mark end program 
					;ascii #
		NOT	r2,r2		;inverts
		ADD	r2,r2,#1	;2nd complement
		ADD	r1,r0,r2	;add r2 to r1 stores in r1
		brz	Termination	;condition to terminates program

SpelledOutdef	ld	r6,#0		;spell out the default switch 
		and	r6,r6,#0	;clears r6	
		ld	r3,default	;loads default ascii hex #
		not	r3,r3		;inverts
		add	r3,r3,#1	;2nd complement
		ADD	r6,r0,r3	;add r3 to r0, store in r6
		brzp	OutputFeault	;condition to print error for 
					;nonprintable characters
	
SpelledOut	ld	r3,case0	;spell out the zero switch
		not	r3,r3		;inverts
		add	r3,r3,#1	;2nd complement
		ADD	r1,r0,r3	;add r3 to r0, store in r1
		brz	Output		;condition to print zero

Spelledout1	ld	r3,case1	;spell out the one switch
		not	r3,r3		;inverts
		ADD	r3,r3,#1	;2nd complement
		ADD	r1,r0,r3	;add r3 to r0 and stores to r1
		brz	Output1		;condition to print one

SpelledOut2	ld	r3,case2	;spell out the two switch
		not	r3,r3		;inverts
		add	r3,r3,#1	;2nd complement
		ADD	r1,r0,r3	;add r3 to r0, stores in r1
		brz	Output2		;condition to print two

SpelledOut3	ld	r3,case3	;spell out the three switch
		not	r3,r3		;inverts
		add	r3,r3,#1	;2nd complement	
		ADD	r1,r0,r3	;add r3 to r0, stores in r1
		brz	Output3		;condtion to print three

SpelledOut4	ld	r3,case4	;spell out the four switch
		not	r3,r3		;inverts
		add	r3,r3,#1	;2nd complement
		ADD	r1,r0,r3	;add r3 to r0, stores 	
		brz	Output4		;condition to print four

SpelledOut5	ld	r3,case5	;spell out the five switch
		not	r3,r3		;inverts
		add	r3,r3,#1	;2nd complement
		ADD	r1,r0,r3	;add r3 to r0, stores in r1
		brz	Output5		;condition to print five

SpelledOut6	ld	r3,case6	;spell out the six switch
		not	r3,r3		;inverts
		add	r3,r3,#1	;2nd complement
		ADD	r1,r0,r3	;add r3 tor0, stores in r1
		brz	Output6		;condition to print six

SpelledOut7	
		ld	r3,case7	;spell out the seven switch
		not	r3,r3		;inverts
		add	r3,r3,#1	;2nd complement
		ADD	r1,r0,r3	;add r3 to r0, stores in r1
		brz	Output7		;condition to print seven

SpelledOut8	ld	r3,case8	;spell out the eight switch
		not	r3,r3		;inverts
		add	r3,r3,#1	;2nd complement
		ADD	r1,r0,r3	;add r3 to r0, stores r1
		brz	Output8		;condition to print eight

SpelledOut9	ld	r3,case9	;spell out the switch
		not	r3,r3		;inverts
		add	r3,r3,#1	;2nd complement
		ADD	r1,r0,r3	;add r3 to r0, stores in r1
		brz	Output9		;condition to print nine

OutputFeault	lea	r0,error	;point to template string
		trap	x22		;print string out
		brnzp	Again		;loop to AGAIN label

Output		lea	r0,zero		;point to template string
		trap	x22		;print string out
		brnzp	Again		;loop to AGAIN label
		
Output1		lea	r0,one		;point to template string
		trap	x22		;print string out
		brnzp	Again		;loop to Again label

Output2		lea	r0,two		;point to template string
		trap	x22		;print string out
		brnzp	Again		;loop to Again label

Output3		lea	r0,three	;point to template string
		trap	x22		;print string out
		brnzp	Again		;loop to Again label

Output4		lea	r0,four		;point to template string
		trap	x22		;print string out
		brnzp	Again		;loop to Again label

Output5		lea	r0,five		;point to template string
		trap	x22		;print string out
		brnzp	Again		;loop to Again label

Output6		lea	r0,six		;point to template string		
		trap	x22		;print string out	
		brnzp	Again		;loop to Again label

Output7		lea	r0,seven	;point to template string
		trap	x22		;print string out
		brnzp	Again		;loop to Again label

Output8		lea	r0,eight	;point to template string
		trap	x22		;print string out
		brnzp	Again		;loop to Again label

Output9		lea	r0,nine		;point to template string
		trap	x22		;print string out
		brnzp	Again		;loop to Again label
		

NotNumber	
		lea	r0, nonprintable;point to template string
		trap	x22		;print string out
		brnzp	Again		;loop to Again label

		
Termination	lea	r0, done	;termination
		trap	x22		;prints done

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
done		.STRINGZ	" Done!"
prompt		.STRINGZ	"Please input a number 0 - 9 : "
delimeter	.FILL   x20
delimeter2	.FILL	x21
template	.STRINGZ	"CS2810-601\nLehi Alcantara\nProject #3\n"
newLine		.FILL	x0A	;line feed and carrage return in LC-3
zero		.STRINGZ	" zero\n"
one		.STRINGZ	" one\n"
two		.STRINGZ	" two\n"
three		.STRINGZ	" three\n"
four		.STRINGZ	" four\n"
five		.STRINGZ	" five\n"
six		.STRINGZ	" six\n"
seven		.STRINGZ	" seven\n"
eight		.STRINGZ	" eight\n"
nine		.STRINGZ	" nine\n"
default		.FILL	x40
case0		.FILL	x30
case1		.FILL	x31
case2		.FILL	x32
case3		.FILL	x33
case4		.FILL	x34
case5		.FILL	x35
case6		.FILL	x36
case7		.FILL	x37
case8		.FILL	x38
case9		.FILL	x39
error		.STRINGZ	" Error! You did not input a number.\n"
term		.STRINGZ	"Program execution terminated!\n"
nonprintable	.STRINGZ	" Error! Your input was a non printable character.\n"
print		.STRINGZ	"You input the characters: "
		.END		;end assembly directive


