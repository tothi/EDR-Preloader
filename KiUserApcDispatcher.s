.section .text

.extern GetNtContinue

.global KiUserApcDispatcher

KiUserApcDispatcher:
    pushq %rbp
    movq %rsp, %rbp

loop:
    call GetNtContinue
    movq %rsp, %rcx
    movq $1, %rdx
    call *%rax
    jmp loop

    popq %rbp
    ret
