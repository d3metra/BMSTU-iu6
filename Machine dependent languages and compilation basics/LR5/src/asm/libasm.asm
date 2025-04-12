section .text
    extern print_string
    global del_characters

del_characters:
    push rbp 
    mov rbp, rsp

    push rax
    push rbx
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    
    xor rbx, rbx ; адрес начала строки    
    xor rdx, rdx ; длина последовательности символов
    xor r8, r8 ; адрес ПРЕДШЕСТВУЮЩЕЙ последовательности символов
    xor r9, r9 ; адрес ОСНОВНОЙ последовательности символов
    xor r10, r10 ; адрес ПОБОЧНОЙ последовательности
    xor r11, r11 ; адрес начала усечения строки
   
    lea rbx, [rdi]
    mov r8, rbx
    dec r8
    mov rcx, rsi ; длина строки
    mov rax, '#'
    repne scasb
    mov r9, rdi
    dec r9
    
next_main_seq:
    mov rcx, rsi
    mov r14, r9
    sub r14, rbx
    sub rcx, r14
    dec rcx
    cmp rcx, 0
    je return
    repne scasb
    mov r10, rdi
    dec r10
    mov r11, r9
    mov rdx, r9
    sub rdx, r8
    xor r12, r12 ; флаг наличия удаления последовательности

next_side_seq:
    xor r13, r13 ; флаг наличия различий между последовательностями символов
    xor rcx, rcx ; смещение внутри последовательностей символов
sequence_compare:
    dec rcx
    mov rax, rdx
    add rax, rcx
    cmp rax, 0
    je compare_end
    mov r14b, byte[r9 + rcx]
    mov r15b, byte[r10 + rcx]
    cmp r14b, r15b
    je sequence_compare
    inc r13

compare_end:
    mov rax, '#'
    cmp r13, 1
    jne truncate_string
    mov r11, r10
    jmp skip_truncate
truncate_string:
    inc r12
    call _memmove
    sub rsi, rdx
    mov r10, r11
skip_truncate:
    mov rdi, r10
    inc rdi
    mov rcx, rsi
    mov r14, r11
    sub r14, rbx
    sub rcx, r14
    dec rcx
    cmp rcx, 0
    je main_seq_cycle
    repne scasb
    mov r10, rdi
    dec r10
    jmp next_side_seq

main_seq_cycle:
    cmp r12, 0
    jg delete_main_seq

    mov r8, r9
    mov rdi, r9
    inc rdi
    mov rcx, rsi
    mov r14, r9
    sub r14, rbx
    sub rcx, r14
    dec rcx
    cmp rcx, 0
    je return
    repne scasb
    mov r9, rdi
    dec r9
    jmp next_main_seq
delete_main_seq:
    call _delete_seq
    sub rsi, rdx
    mov rdi, rbx
    mov rcx, rsi
    repne scasb
    jne return
    mov r9, rdi
    dec r9
    mov r8, rbx
    dec r8
    jmp next_main_seq
    
return:
    lea rdi, [rbx]
    pop rax
    pop rbx
    pop rcx
    pop rdx
    pop r8
    pop r9
    pop r10
    pop r11
    pop r12
    pop r13

    call print_string
    mov rsp, rbp
    pop rbp
    ret

_memmove:
    mov rcx, rsi
    mov r14, r10
    sub r14, rbx
    sub rcx, r14
    dec rcx
    cmp rcx, 0
    je last_seq1
    mov r14, 1
swap_data1:
    mov r15b, byte[r10 + r14]
    mov byte[r10 + r14], 0
    mov [r11 + r14], r15b
    inc r14
    loop swap_data1
    mov byte[r11 + r14], 0
    jmp return_memmove
last_seq1:
    mov rcx, rdx
zeroing1:
    mov byte[r11 + rcx], 0
    loop zeroing1
return_memmove:
    ret

_delete_seq:
    mov rcx, rsi
    sub rcx, rdx
    mov r14, 1
    cmp rcx, 0
    jne swap_data2
    mov byte[r8 + 1], 0
    jmp return_delete_seq
swap_data2:
    mov r15b, byte[r9 + r14]
    mov byte[r9 + r14], 0
    mov [r8 + r14], r15b
    inc r14
    loop swap_data2
    mov byte[r8 + r14], 0
    jmp return_delete_seq
return_delete_seq:
    ret
