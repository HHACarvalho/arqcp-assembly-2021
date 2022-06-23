.section .text
	.global estado_global

estado_global:
	movl $0, %eax  #Resets %rax back to zero.
	movl $0, %ebx  #Resets %rbx back to zero.
	
estado_global_loop:
	cmpl %ebx, %edx  #Checks if we have gone through every apartment.
	je end           #Jumps to the end of the method if we checked all three apartments.
	
	pushq %rax  #Copies the value of %rax to the stack.
	pushq %rbx  #Copies the value of %rbx to the stack.
	pushq %rdx  #Copies the value of %rdx to the stack.
	pushq %rsi  #Copies the value of %rsi to the stack.
	pushq %rdi  #Copies the value of %rdi to the stack.
	
	movl (%rdi, %rbx, 4), %edi  #Copies the current
	call ativar                 #Calls the function.
	
	movl %eax, %ecx  #Copies the return of the fuction to a temporary registry.
	
	popq %rdi  #Restores the value of %rdi
	popq %rsi  #Restores the value of %rsi
	popq %rdx  #Restores the value of %rdx
	popq %rbx  #Restores the value of %rbx
	popq %rax  #Restores the value of %rax
	
	addl %ecx, %eax  #Adds the return of the function to %eax.
	
	incq %rsi        #Increments the pointer in %rsi by one (byte pointer).
	incl %ebx        #Increments %ebx (Number of processed apartments).
	jmp estado_global_loop  #Unconditionally jumps back into the loop.

end:
	ret
