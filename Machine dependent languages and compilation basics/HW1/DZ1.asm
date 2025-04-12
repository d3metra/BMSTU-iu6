%include "../lib64.asm"    

    section .data
prsString db "Enter string:", 10
lenString equ $-prsString
space db " "
ExitMsg db "Number of words containing more than 3 characters:", 10
lenExit equ $-ExitMsg

    section .bss
InBuf resb 35
lenIn equ $-InBuf
OutBuf resb 2

    section .text
    global _start
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, prsString
    mov rdx, lenString
    syscall
    
    mov rax, 0
    mov rdi, 0
    mov rsi, InBuf
    mov rdx, lenIn
    syscall

    cld
    lea rdi, [InBuf]
    mov al, " "
    xor rbx, rbx
    mov rcx, lenIn
cycle:
    mov rdx, rdi
    repne scasb
    push rdi
    sub rdi, rdx
    cmp rdi, 5
    jl next
    inc rbx
next:
    pop rdi
    cmp rcx, 0
    jne cycle
    
    mov rax, 1
    mov rdi, 1
    mov rsi, ExitMsg
    mov rdx, lenExit
    syscall
    
    mov rsi, OutBuf
    mov rax, rbx
    cwde
    call IntToStr64
    mov rdx, rax
    mov rax, 1 
    mov rdi, 1 
    mov rsi, OutBuf 
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
