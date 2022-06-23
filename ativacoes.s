.section .text
	.global ativar

ativar:
	movl $0, %eax          #Resets %rax back to zero.
	movl $0, %ebx          #Resets %rbx back to zero.
	movb $0, %ch           #The value that will be copied to estado_sistema_apartamento.
	movb $0b00001111, %cl  #Mask to delete the four most significant bits.
	
ativar_loop:
	cmpl $8, %ebx        #Checks if we have gone through every division of the current apartment.
	je end               #Jumps to the end of the method if we checked all eight divisions.
	
	movl %edi, %edx      #Creates a copy of %edi on %edx.
	andb %cl, %dl        #Removes the four most significant bits in %dl.
	
	shr $4, %rdi         #Shifts %rdi four bits to the right (Size of each apartment).
	incl %ebx            #Increments %ebx (Number of processed divisions).
	
	cmpb $12, %dl        #Checks the temperature of the current.
	jge inc_ptr          #Jumps back into the loop if the temperature is greater or equal to twelve.
	
	incl %eax            #Increments %eax (Number of times the climatisation system was turned on).
	or $0b00000001, %ch  #Places one on the bit corresponding to the current room.
	
inc_ptr:
	ror %ch              #Rotates %ch one bit to the right.
	jmp ativar_loop      #Jumps back into the loop.

end:
	movb %ch, (%rsi)     #Replaces the value of estado_sistema_apartamento with %ch.
	ret
