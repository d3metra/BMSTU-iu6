    section .data
prsM db "Enter m:", 10
lenPrsM equ $-prsM
prsA db "Enter a:", 10
lenPrsA equ $-prsA
ExitMsg db "Result:", 10
lenExit equ $-ExitMsg

    section .bss
InBuf resb 10
lenIn equ $-InBuf
OutBuf resb 10
a resw 1
m resw 1
b resw 1
x resw 1

    section .text
    global _start
_start:
    ; Enter m
    mov rax, 1 ; системная функция 1 (write)
    mov rdi, 1 ; дескриптор файла stdout=1
    mov rsi, prsM ; адрес выводимой строки
    mov rdx, lenPrsM ; длина выводимой строки
    syscall  ; вызов системной функции

    mov rax, 0 ; системная функция 0 (read)
    mov rdi, 0 ; дескриптор файла stdin=0
    mov rsi, InBuf ; адрес вводимой строки
    mov rdx, lenIn ; длина вводимой строки
    syscall ; вызов системной функции

    mov rsi, InBuf ; адрес введённой строки
    call StrToInt64 
    cmp ebx, 0 ; проверка кода ошибки
    jne StrToInt64.Error ; при преобразовании обнаружена ошибка
    mov [m], ax ; запись числа в память

    ; Enter a
    mov rax, 1 ; системная функция 1 (write)
    mov rdi, 1 ; дескриптор файла stdout=1
    mov rsi, prsA ; адрес выводимой строки
    mov rdx, lenPrsA ; длина выводимой строки
    syscall ; вызов системной функции

    mov rax, 0 ; системная функция 0 (read)
    mov rdi, 0 ; дескриптор файла stdin=0
    mov rsi, InBuf ; адрес вводимой строки
    mov rdx, lenIn ; длина вводимой строки
    syscall ; вызов системной функции

    mov rsi, InBuf ; адрес введённой строки
    call StrToInt64
    cmp ebx, 0 ; проверка кода ошибки
    jne StrToInt64.Error ; при преобразовании обнаружена ошибка
    cmp ebx, 0 ; проверка кода ошибки
    mov [a], ax ; запись числа в память

    mov rax, 0
    mov rcx, 0
    mov rdx, 0
    mov dx, [m] ; загрузка числа в регистр
    sub dx, 5 ; m - 5
    mov ax, [m] ; загрузка числа в регистр
    add ax, 2 ; m + 2
    imul dx, ax ; (m - 5) * (m + 2)
    add dx, [m] ; (m - 5) * (m + 2) + m
    mov cx, dx
    mov rax, 0
    mov rdx, 0
    mov ax, [a] ; загрузка числа в регистр
    mov bx, 2 ; загрузка числа в регистр
    cwd
    idiv bx ; a/2
    add cx, ax ; (m - 5) * (m + 2) + m + a/2
    mov [x], cx ; загрузка результата в память
    
    mov rax, 1
    mov rdi, 1
    mov rsi, ExitMsg
    mov rdx, lenExit
    syscall

    mov rsi, OutBuf
    mov ax, [x]
    cwde
    call IntToStr64
    mov rdx, rax
    mov rax, 1 
    mov rdi, 1 
    mov rsi, OutBuf 
    syscall

    ; exit
    mov rax, 60 ; системная функция 60 (exit)
    xor rdi, rdi ; return code 0
    syscall ; вызов системной функции
    
%include "../lib64.asm"
