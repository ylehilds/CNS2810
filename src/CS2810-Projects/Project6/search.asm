;-------1---------2---------3---------4---------5---------6---------7---------
;
; Program: search.asm
; Project#: 6
; Name:  Lehi Alcantara
; Class:  CS2810-601
; Date:  15 Nov 2007
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
; Description:  This program searches for a specific data from a file
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
  .ORIG x3000  ;start assembly directive
;set the three functions to be a determined trap address
	
	and	r6,r6,#0
	lea	r0,template		;print name
	trap	x22
	lea	r0,lookingPrint
	trap	x22
	
loop	ldi	r1,pointer		;r1 is pointer address x4000
	ld	r2,mask			;r2 is mask -> xC083
	and	r3,r1,r2
	ld	r6,searchcomp		;load  x7F80 to make sure we got a match that we want (negative value of mask 1000000010000000)
	add	r3,r3,r6
	brz	Print			;print if it is a match

back	ld	r1,pointer
	add	r1,r1,#1		;increment the pointer
	st	r1,pointer		;store it
	ldi	r4,end			;check for end of memory address -> x40FF
	not	r4,r4			;2nd complement
	add	r4,r4,#1
	add	r5,r4,r1		;compare pointer with end
	brnz	loop			;loop
	brp	final			;branch to final

Print	
	
	ld	r2,counter
	add	r2,r2,#1
	st	r2,counter
	and	r2,r2,#0
	add	r2,r2,#4		
		
	lea	r0,message		;print message
	PUTS
;iteration 1
iterator1 and	r6,r6,#0
	ld	r1,pointer
	brn	eight		
	jsr	additself
back8	add	r1,r1,#0
	brn	four	
	jsr	additself

back4	add	r1,r1,#0
	brn	two	
	jsr	additself

back2	add	r1,r1,#0
	brn	myzero	
	br	test1
	;jsr	additself
	;br	iterator2

eight		add	r1,r1,r1
		add	r6,r6,#8
		br	back8
four		add	r1,r1,r1
		add	r6,r6,#4
		br	back4

two		add	r1,r1,r1
		add	r6,r6,#2
		br	back2

myzero		add	r1,r1,r1
		add	r6,r6,#1

test1	lea	r5,ARRAY12
	add	r5,r5,r6
	ldr	r0,r5,#0
	trap	x21



iterator2	add	r2,r2,#-1
		brp	iterator1
		br	back

additself	st	r7,saver7
		add	r1,r1,r1
		ld	r7,saver7
		ret

nodata		lea	r0,nodataMessage	;no data print message
		trap	x22
		br	final1
enddata		lea	r0,endMessage		;print end message
		trap	x22
		br	final1


final				
		ld	r0,counter
		brz	nodata
		br	enddata

final1		ld r0,newLine	  ;load new line
 		trap x21 	  ;print new line
		lea r0, term 	  ;point to termination string
		trap x22 	  ;print string out
	
		

		End trap x25  	  ;stop the program

;-------1---------2---------3---------4---------5---------6---------7---------
;
; Static Memory Allocation
;
;-------1---------2---------3---------4---------5---------6---------7---------
; constants 

saver0	.FILL x0
saver1	.FILL x0
saver2	.FILL x0
saver3	.FILL x0
ARRAY12	.STRINGZ "0123456789ABCDEF"
template .STRINGZ "CS2810-601\nLehi Alcantara\nProject #6\n"

saver4	.FILL x0
endMessage	.STRINGZ "\nEnd of Search\n"
newLine  .FILL x0A ;line feed and carrage return in LC-3
term  .STRINGZ "Program execution terminated!\n"
message	.STRINGZ "MATCH FOUND AT ADRESSES:\n 0x"
nodataMessage	.STRINGZ "Match not found\n End of search"
saver7	.FILL x0
counter	.FILL	x0
mask	.FILL xC083

end	.FILL x40FF
pointer	.FILL x4000
searchcomp	.FILL x7F80
lookingPrint .STRINGZ "Looking for the following:    0b10XXXXXX1XXXXX00\n                             @ Addresses 0x4000 to 0x40FF\n"
divide	.FILL	xFFF0
mask1	.FILL	x00F0
zero	.fILL	X30
fourty	.fILL	x40
savecount	.FILL x0
moreprint	.STRINGZ "0x"
test	.FILL #16









  .END  ;end assembly directive


