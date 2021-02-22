#************************************************************************
#*  PROGRAM NAME: In Out                                   	        *
#*  DESCRIPTION:  Demonstrates user input / output in x86-64 assembly . *
#*  AUTHORS:      Felix Luebken & Taco Timmers                          *
#************************************************************************

.text
titlestr:    	.asciz "Felix Luebken, Taco Timmers\nstudy numbers...\nAssignment 2: subroutines and I/O.\n"
promt:		.asciz "Please input a number: "
formatstr:	.asciz "%ld"

.global main
#************************************************************************
#*  SUBROUTINE:   main                                                  *
#*  DESCRIPTION:  main routine 	                                        *
#************************************************************************
main:
        pushq   %rbp                    #store the caller's base pointer
        movq    %rsp, %rbp              #initialize the base pointer

        movq    $0, %rax                #no vector registers for printf
        movq    $titlestr, %rdi         #load string titlestr
        call    printf                  #call printf subroutine

        jmp	inout			#call inout subroutine

	jmp     end                     #call end subroutine


inout:
#	movq	$0, %rax		#no vector registers for printf
#	movq	$promt, %rdi		#load string promt
#	call	printf

	subq	$8, %rsp		#reserves stack space for var
	leaq	 -8(%rbp), %rsi		#load address of stack var in rsi
#	movq	$formatstr, %rdi	#loads first arg of scanf
#       movq    $0, %rax                #no vector registers for scanf

	call	scanf

	

end:
        mov     $0, %rdi                #loads exit code
        call    exit                    #exits the program

