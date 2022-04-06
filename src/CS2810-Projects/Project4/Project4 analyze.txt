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
;   r1  general purpose  used test condition
;   r2  general purpose used counter
;   r3  general purpose used counter
;   r4  general purpose used counter
;   r5  general purpose used counter
;   r6  stack pointer   used counter
;   r7  procedure linkage   
;
;-------1---------2---------3---------4---------5---------6---------7--------- 
  .ORIG x3000  ;start assembly directive

MyMain  
 and r0,r0,#0
 and r1,r1,#0
 and r2,r2,#0
 and r3,r3,#0
 and r4,r4,#0
 and r5,r5,#0
 and r6,r6,#0
   
 lea r0, template	;point to template string
 trap x22		;print string out 
  
 ld r0,newLine 	;load new line
 trap x21 	 	;print new line

ASK  lea r0,prompt 	;prompt user to input a phrase
 trap x22  		;write the prompt
  
Input  trap x20  	;gets character from user
  
 ld r1,enter 		;check for termination "enter"
 ADD r1,r0,r1
 brz termination 	;end of program

 ld r1, space   	;add -31 to r1
 add r1,r0,r1 		;check for space
 brnz Input  		;condition
 trap x21

 ld r1, spaceadd 	;add -32 to r1
 add r1,r0,r1 		;check for space
 brz AddSpace		;condition
  

OtherGroup ld r1,grpc   ;check for printable characters
 add r1,r0,r1		
 brn Numbers		;check condition less than printable characters

 ld r1,grpc1		;check for printable characters
 add r1,r0,r1
 brnz OtherAdd		;add 1 to counter
  
Numbers  ld r1,num1     ;check for numbers
 add r1,r0,r1 
 brn OtherGroup1 	;check condition less than numbers

 ld r1,num2		;check for numbers
 add r1,r0,r1
 brnz NumberAdd	;add 1 to counter
  
  
OtherGroup1 ld r1,grpc12;check for printable characters
 add r1,r0,r1
 brn UpperCase		;check for less than printable characters 

 ld r1,grp21  		;check for printable characters
 add r1,r0,r1
 brnz AddOther3	 ;add 1 to counter
  

UpperCase ld r1,grp2	;check for Upper cases
 ADD  r1,r0,r1
 brn OtherGroup2 	;check for less than upper cases

  ld r1,upcs1		;check for Upper cases
  add r1,r0,r1
  brnz UpperAdd		;add 1 to counter
 

OtherGroup2 ld r1,grpc3	;check for printable characters
  add r1,r0,r1
  brn LowerCase 	;check for less than printable characters

  ld r1,grpc4		;check for printable characters
  add r1,r0,r1
  brnz AddOther2	;add 1 to counter
  

LowerCase ld r1,lowc	;check for lower cases
  add r1,r0,r1
  brn Input		;if less than lower cases go back to Input

  ld r1,lowc1		;check for lower cases
  add r1,r0,r1
  brnz AddLower		;add 1 to counter
 



OtherAdd add r3,r3,#1	;counterfor printable characters
  brnzp Numbers

NumberAdd add r4,r4,#1	;counter for numbers
  brnzp OtherGroup1

UpperAdd add r5,r5,#1	;counter for upper cases
  brnzp OtherGroup2

AddOther2 add r3,r3,#1	;counter for printable characters
  brnzp LowerCase

AddOther3 add r3,r3,#1	;counter for printable characters
  brnzp Input

AddSpace add r6,r6,#1	;counter for spaces
  brnzp OtherGroup

AddLower add r2,r2,#1	;counter for lower cases
  brnzp Input

  
termination 	
 ld r0,newLine 		;load new line
 trap x21 		;print new line
numbercase1		;check for numbers
 lea r0,numberss
 trap x22  		;print string out
 ld	r1,comp	
 add	r0, r4,r1
 brzp	display1	;print >9
 ld	r1,ascii	;add 48
 add	r0,r4,r1
 trap	x21		;print number
 ld r0,newLine  	;load new line
 trap x21 		;print new line
 br	uppercase1	

display1
 lea	r0,phrase
 trap	x22		;print >9
 ld r0,newLine 		;load new line
 trap x21 		;print new line

uppercase1	
 lea r0,upper
 trap x22  		;print string out
 ld	r1,comp 	;add -9
 add	r0, r5,r1
 brzp	display2	;print>9
 ld	r1,ascii	;add 48
 add	r0,r5,r1
 trap	x21		;print number
 ld r0,newLine  	;load new line
 trap x21  		;print new line
 br	lowercase1	

display2
 lea	r0,phrase
 trap	x22 		;print >9
 ld r0,newLine  	;load new line
 trap x21 		;print new line

lowercase1	
 lea r0,lowercs
 trap x22  		;print string out
 ld	r1,comp		;add-9
 add	r0, r2,r1
 brzp	display3	;print >9
 ld	r1,ascii	;add 48
 add	r0,r2,r1
 trap	x21		;print number
 ld r0,newLine		;load new line
 trap x21		;print new line
 br	spaces1		
display3
 lea	r0,phrase
 trap	x22		;print >9
 ld r0,newLine 		;load new line
 trap x21  		;print new line
  		
spaces1
 lea r0,spaces
 trap x22 		;print string out
 ld	r1,comp		;add -9
 add	r0, r6,r1
 brzp	display4	;print >9
 ld	r1,ascii	;add 48
 add	r0,r6,r1
 trap	x21		;print number
 ld r0,newLine 		;load new line
 trap x21  		;print new line
 br	other		
display4
 lea	r0,phrase
 trap	x22		;print >9
 ld r0,newLine  	;load new line
 trap x21 		;print new line
  		
other		
 lea r0,otherss
 trap x22  		;print string out
 ld	r1,comp		;add -9
 add	r0, r3,r1
 brzp	display5	;print >9
 ld	r1,ascii	;add 48
 add	r0,r3,r1
 trap	x21		;print number
 ld r0,newLine 		;load new line
 trap x21  		;print new line
 br	Ok
display5
 lea	r0,phrase
 trap	x22		;print >9
 ld r0,newLine		;load new line
 trap x21 		;print new line
 
Ok
 ld r0,newLine		;load new line
 trap x21 		;print new line		
 lea r0, term		;point to termination string
 trap x22  		;print string out

MyMainEnd trap x25  ;stop the program


;-------1---------2---------3---------4---------5---------6---------7---------
;
; Static Memory Allocation
;
;-------1---------2---------3---------4---------5---------6---------7---------
; constants
template .STRINGZ "CS2810-601\nLehi Alcantara\nProject #4\n"
newLine  .FILL x0A ;line feed and carrage return in LC-3
term  .STRINGZ "Program execution terminated!\n" 
prompt  .STRINGZ "Input a message to be analyzed: "
enter  .FILL #-10
space  .FILL #-31
spaceadd .FILL #-32
grpc  .FILL #-33
grpc1  .FILL #-47
num1  .FILL #-48
num2  .FILL #-57
grpc12  .FILL #-58
grp2 .FILL #-65
upcs1  .FILL #-90
grpc3  .FILL #-91 
grpc4  .FILL #-96
lowc  .FILL #-97
lowc1  .FILL #-122
save  .FILL #2
grp21	.FILL #-64
comp	.FILL #-9
test	.BLKW #1
ascii	.FILL #48
upper	.STRINGZ	"Upper Case: "
spaces	.STRINGZ	"Spaces: "
numberss	.STRINGZ "Numbers: "
lowercs		.STRINGZ	"Lower Case: "
equal		.STRINGZ	"="
phrase	.STRINGZ "> 9"
otherss	.STRINGZ	"All Others: "
  .END  ;end assembly directive



