; count_primes.asm
; Counts the number of primes from 1 to n (inclusive)
; int64_t count_primes(int64_t n)
; Arguments:
;   n - in RDI
; Returns:
;   count - in RAX

section .text
    global count_primes

count_primes:
    mov rbx, rdi        ; n (limit)
    xor rcx, rcx        ; count = 0
    mov rsi, 2          ; current = 2

.outer_loop:
    cmp rsi, rbx
    jg .done            ; if current > n, done
    mov r8, 1           ; is_prime = 1
    cmp rsi, 2
    jl .not_prime       ; skip numbers < 2

    mov r9, 2           ; divisor = 2
.check_div:
    cmp r9, rsi
    jge .after_check    ; if divisor >= current, stop
    mov rax, rsi
    cqo
    div r9              ; rax = rsi / r9, rdx = remainder
    test rdx, rdx
    jz .not_prime       ; if remainder == 0, not prime
    inc r9
    jmp .check_div

.after_check:
    jmp .is_prime

.not_prime:
    mov r8, 0

.is_prime:
    cmp r8, 1
    jne .next
    inc rcx             ; count++

.next:
    inc rsi
    jmp .outer_loop

.done:
    mov rax, rcx        ; return count
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
