	.file	"ceaser-cipher.c"
	.text
	.section	.rodata
.LC0:
	.string	"Your rot number is %d\n"
	.text
	.globl	cipher
	.type	cipher, @function
cipher:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	cipher, .-cipher
	.section	.rodata
.LC1:
	.string	"Enter the rot number: "
.LC2:
	.string	"%d"
.LC3:
	.string	"malloc problem"
.LC4:
	.string	"Enter your message below: "
.LC5:
	.string	"realloc problem"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-32(%rbp), %eax
	movl	%eax, %edi
	call	cipher
	call	getchar@PLT
	movl	$10, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L3
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L11
.L3:
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -20(%rbp)
	jmp	.L5
.L8:
	movl	-4(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -20(%rbp)
	jne	.L6
	sall	-4(%rbp)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L6
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$1, %eax
	jmp	.L11
.L6:
	movl	-20(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -20(%rbp)
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	-28(%rbp), %edx
	movb	%dl, (%rax)
.L5:
	call	getchar@PLT
	movl	%eax, -28(%rbp)
	cmpl	$10, -28(%rbp)
	je	.L7
	cmpl	$-1, -28(%rbp)
	jne	.L8
.L7:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movl	$0, -24(%rbp)
	jmp	.L9
.L10:
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	putchar@PLT
	addl	$1, -24(%rbp)
.L9:
	movl	-24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L10
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Debian 13.3.0-5) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
