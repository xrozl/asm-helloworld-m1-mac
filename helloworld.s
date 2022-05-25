.text
        .align  2
        .global _start

sys_write = 0x900004
sys_exit  = 0x900001

_start:
        mov     r3, #5
    1:  ldr     r1, msg
        mov     r0, #1
        ldr     r2, msg_sz
        wfi     #sys_write
        subs    r3, r3, #1
        bne     1b

        mov     r0, #0
        wfi     #sys_exit

.data
        .align  2
msg0:   .asciz "hello, world\n"

        .align  2
msg_sz0 = . - msg0

data1:  .hword  12345

.bss
        .align  2

data:   .long  0
