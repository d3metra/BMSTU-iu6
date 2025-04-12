 section .data
prsA db "Enter a:", 10
lenPrsA equ $-prsA
prsK db "Enter k(<> 0):", 10
lenPrsK equ $-prsK
prsX db "Enter x:", 10
lenPrsX equ $-prsX
ErrorMsg db "Varning! Devision by zero!", 10, "k should be equal to 0", 10, 10
lenError equ $-ErrorMsg
ExitMsg db "Result:", 10
lenExit equ $-ExitMsg

    section .bss
InBuf resb 10
lenIn equ $-InBuf
OutBuf resb 10
a resw 1
k resw 1
x resw 1
f resw 1

    section .text
    global _start
_start:
    ; Enter a
    mov rax, 1 
    mov rdi, 1 
    mov rsi, prsA
    mov rdx, lenPrsA
    syscall  

    mov rax, 0
    mov rdi, 0
    mov rsi, InBuf
    mov rdx, lenIn
    syscall

    mov rsi, InBuf 
    call StrToInt64 
    cmp ebx, 0
    jne StrToInt64.Error 
    mov [a], ax

writeK:
    ; Enter K
    mov rax, 1
    mov rdi, 1
    mov rsi, prsK
    mov rdx, lenPrsK
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, InBuf
    mov rdx, lenIn
    syscall

    mov rsi, InBuf
    call StrToInt64
    cmp ebx, 0
    jne StrToInt64.Error
    cmp ax, 0
    je errorK
    mov [k], ax

    mov ax, [a]
    mov dx, [k]
    imul dx
    cmp ax, 0
    JLE lessThanZero
    mov rax, 1
    mov rdi, 1
    mov rsi, prsX
    mov rdx, lenPrsX
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, InBuf
    mov rdx, lenIn
    syscall
    
    mov rsi, InBuf
    call StrToInt64
    cmp ebx, 0
    jne StrToInt64.Error
    xor dx, dx
    mov dx, [a]
    imul dx
    mov [f], ax
    jmp continue

lessThanZero:
    mov cx, [k]
    mov ax, [a]
    imul cx, ax
    xor ax, ax
    xor dx, dx
    mov ax, 120
    mov bx, [k]
    cwd
    idiv bx
    add cx, ax
    mov [f], cx    

continue:
    mov rax, 1
    mov rdi, 1
    mov rsi, ExitMsg
    mov rdx, lenExit
    syscall
    
    mov rsi, OutBuf
    mov ax, [f]
    cwde
    call IntToStr64
    mov rdx, rax
    mov rax, 1 
    mov rdi, 1 
    mov rsi, OutBuf 
    syscall
    

; exit
    mov rax, 60
    xor rdi, rdi
    syscall

errorK:
    mov rax, 1
    mov rdi, 1
    mov rsi, ErrorMsg
    mov rdx, lenError
    syscall
    jmp writeK

%include "../lib64.asm"
