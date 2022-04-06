;-------1---------2---------3---------4---------5---------6---------7---------
;
; Program: analyze.asm
; Project#: 4
; Name:  Lehi Alcantara
; Class:  CS2810-601
; Date:  24 Oct 2007
; Version: 1.0
;
; Ethics:  I declare that the following source code was written 
;   solely by me.  I understand that copying any source 
;   code, in whole or in part, constitutes cheating, 
;   and that I will receive a zero grade on this 
;   project if I am found in violation of this ethic. 
;   Project #1 exeception (source code is provided)
; 
;   X   _____________________________________ 
; 
; Description:  This program will read in input characters from the keyboard and 
;    print number of occurrences of which group is categorized until enter is
;    entered, non printable characters will not be accteptable as input.
;
;  
;-------1---------2---------3---------4---------5---------6---------7--------- 

;-------1---------2---------3---------4---------5---------6---------7---------
;
; Procedure: MyMain
; Precondition: none
; Postcondition: none
; Register usage: r0  general purpose  used input
;   r1  general purpose used
;   r2  general purpose used 
;   r3  general purpose used 
;   r4  general purpose used 
;   r5  general purpose used 
;   r6  stack pointer   used 
;   r7  procedure linkage   
;
;-------1---------2---------3---------4---------5---------6---------7--------- 
  .ORIG x3200  ;start assembly directive
 
SetUpProc 	add	r6,r6,#-1
		str	r7,r6,#0
		add	r6,r6,#-1
		str	r0,r6,#0
		add	r6,r6,#-1
		str	r1,r6,#0
		

		ldr	r1,r6,#0	;popping r6
		add	r6,r6,#1
		add	r1,r1,#0
		brz	restore		;condition to restore the vectors

set_vectors	lea	r0,set
		trap	x22
		
		lea	r1, TemplateProc
		sti	r1, vectable1

		lea	r1, PrintProc 
		sti	r1, vectable2

		lea	r1, SortProc 
		sti	r1, vectable3		
				

		ldr	r1,r6,#0
		add	r6,r6,#1
		ldr	r0,r6,#0
		add	r6,r6,#1
		ldr	r7,r6,#0
		add	r6,r6,#1

		add	r6,r6,#1
		ret



	
restore		lea	r0,print
		trap	x22		

		ld	r1,rest
		sti	r1, vectable1	
		
		ld	r1,rest	
		sti	r1, vectable2

		ld	r1,rest	
		sti	r1, vectable3

		ldr	r1,r6,#0	
		add	r6,r6,#1
		ldr	r7,r6,#0	
		add	r6,r6,#1
		ldr	r0,r6,#0	
		add	r6,r6,#1


		add	r6,r6,#1
		ret

		
TemplateProc	add	r6,r6,#-1
		str	r7,r6,#0
		add	r6,r6,#-1
		str	r0,r6,#0
		

		lea	r0, template
		trap	x22
		
		ldr	r0,r6,#0
		add	r6,r6,#1
		ldr	r7,r6,#0
		add	r6,r6,#1
		ret
	 
PrintProc	add	r0,r0,#15
		add	r6,r6,#-1
		str	r7,r6,#0
		add	r6,r6,#-1
		str	r0,r6,#0
		add	r6,r6,#-1
		str	r1,r6,#0
		add	r6,r6,#-1
		str	r4,r6,#0

		ldr	r4,r6,#5	;first element
		ldr	r1,r6,#4	;size array count
		
		lea	r0,printarray
		trap	x22
		add	r0,r4,#0
loop		trap	x21
		add	r0,r0,#1
		add	r1,r1,#-1
		brp	loop
		lea	r0,newLine
		trap	x21
		ldr	r4,r6,#0
		add	r6,r6,#1

		ldr	r1,r6,#0
		add	r6,r6,#1
		ldr	r0,r6,#0
		add	r6,r6,#1
		ldr	r7,r6,#0
		add	r6,r6,#1
		

		add	r6,r6,#2

		ret 

SortProc 	add	r6,r6,#-1
		str	r7,r6,#0
		add	r6,r6,#-1
		str	r0,r6,#0
		add	r6,r6,#-1
		str	r1,r6,#0
		add	r6,r6,#-1
		str	r4,r6,#0
		add	r6,r6,#-1
		str	r2,r6,#0

	






 

 ld r0,newLine		;load new line
 trap x21 		;print new line
 lea r0, term		;point to termination string
 trap x22  		;print string out

End trap x25  ;stop the program


;-------1---------2---------3---------4---------5---------6---------7---------
;
; Static Memory Allocation
;
;-------1---------2---------3---------4---------5---------6---------7---------
; constants

template .STRINGZ "CS2810-601\nLehi Alcantara\nProject #5\n"
newLine  .FILL x0A ;line feed and carrage return in LC-3
term  .STRINGZ "Program execution terminated!\n" 
set	.STRINGZ "Trap vectors are set up!"
print	.STRINGZ "restore vectors"
printarray	.STRINGZ "Printing array . . ."

vectable1	.FILL xF0
vectable2	.FILL xF1
vectable3	.FILL xF2

rest		.FILL xFD00

  .END  ;end assembly directive


