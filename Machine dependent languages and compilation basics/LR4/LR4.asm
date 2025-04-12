%define ROWS 4
%define COLUMNS 6    

    section .data
prsNum db "Enter matrix:", 10
lenPrsNum equ $-prsNum
space db " "
endLine db 10
ExitMsg db "Result:", 10
lenExit equ $-ExitMsg

    section .bss
InBuf resb 30
lenIn equ $-InBuf
OutBuf resb 10
mat resq 24

    section .text
    global _start
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, prsNum
    mov rdx, lenPrsNum
    syscall

    mov rcx, ROWS
    xor rdi, rdi

read_line:
    push rcx
    push rdi
    
    mov rax, 0
    mov rdi, 0
    mov rsi, InBuf
    mov rdx, lenIn
    syscall
    
    pop rdi
    mov rcx, rax
    xor rdx, rdx
    xor r8, r8

process_line:
    cmp byte[InBuf + rdx], 10
    je process_number
    
    cmp byte[InBuf + rdx], ' '
    jne next_sym

    mov byte[InBuf + rdx], 10
process_number:
    push rdx
    call StrToInt64  
    cmp ebx, 0 
    jne StrToInt64.Error
    mov [mat + 8 * rdi], rax
    inc rdi
    
    pop rdx
    mov r8, rdx
    inc r8
    lea rsi, [InBuf + r8]
next_sym:
    inc rdx
    loop process_line

    pop rcx
    dec rcx
    cmp rcx, 0
    jne read_line
    
    xor rcx, rcx
    mov rcx, COLUMNS
    xor r9, r9
    mov r9, COLUMNS
    dec r9

even_columns:
    dec rcx
    cmp rcx, -1
    je write_mat
    push rcx
    mov rdx, rcx
    xor rax, rax
    mov rcx, ROWS
summing_column:
    dec rcx
    mov r10, 8
    mov r11, r9
    inc r11
    imul r10, r11
    imul r10, rcx
    add rax, qword[mat + 8 * rdx + r10]
    cmp rcx, 0
    jne summing_column
    
    pop rcx
    mov bx, 2
    cwd
    idiv bx
    cmp rdx, 0
    jne even_columns  
    
    push rcx
    cmp rcx, r9
    je data_shift
    
    mov rbx, rcx    
columns_shift:
    mov rcx, ROWS
c_shift:
    dec rcx
    mov r10, 8
    mov r11, r9
    inc r11
    imul r10, r11
    imul r10, rcx
    sub r11, 8
    mov rdx, qword[mat + r10 + 8 * rbx + 8]
    mov [mat + r10 + 8 * rbx], rdx
    cmp rcx, 0
    jne c_shift
    
    inc rbx
    cmp rbx, r9
    jne columns_shift

data_shift:
    mov rcx, ROWS
    
n_shift:
    dec rcx
    mov rax, ROWS
    sub rax, rcx
    mov rdx, r9
    inc rdx
    imul rax, rdx

    mov r10, 8
    mov r11, r9
    inc r11
    imul r10, r11
    imul r10, rcx
    sub r10, 8
    mov rdx, 0
    mov qword[mat + r10 + 8 * rax], rdx
    xor rbx, rbx
n_swap:
    mov rdx, qword[mat + r10 + 8 * rbx + 8]
    mov [mat + r10 + 8 * rbx], rdx
    inc rbx
    cmp rbx, rax
    jne n_swap

    cmp rcx, 1
    jne n_shift

    pop rcx
    dec r9
    jmp even_columns
    
write_mat:
    mov rax, 1
    mov rdi, 1
    mov rsi, ExitMsg
    mov rdx, lenExit
    syscall
    cmp r9, -1
    je exit
    mov rbx, -1
write_line:
    cmp rbx, 3
    je exit
    inc rbx
    mov rcx, -1
write_num:
    inc rcx
    push rcx
    mov r10, 8
    mov r11, r9
    inc r11
    imul r10, r11
    imul r10, rbx
    mov rsi, OutBuf
    mov rax, [mat + r10 + 8 * rcx]
    cwde
    call IntToStr64
    mov rdx, rax
    mov rax, 1 
    mov rdi, 1 
    mov rsi, OutBuf 
    syscall
    pop rcx
    cmp rcx, r9
    jne print_space
    jmp end_line

exit:
    mov rax, 60
    xor rdi, rdi
    syscall

print_space:
    push rcx
    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall
    pop rcx
    jmp write_num

end_line:
    mov rax, 1
    mov rdi, 1
    mov rsi, endLine
    mov rdx, 1
    syscall
    jmp write_line    
%include "../lib642.asm"
