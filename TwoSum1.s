    .data
nums:       .word   0,1,2,3,4,5,6,7
target:     .word   14
index1:     .word   -1
index2:     .word   -1
n:          .word   8

    .text
start:
    LD      r1, n(r0)                   ; load number of elements
    LD      r2, target(r0)              ; load target value
    DADDI   r10, r0, index1             ; load index1
    DADDI   r11, r0, index2             ; load index2

startLoop1:
    DADDI   r3, r0, 0                   ; i = 0
    DADDI   r4, r0, nums                ; first element of nums outer

startLoop2:
    DADDI   r5, r0, 0                   ; j = 0
    DADDI   r6, r0, nums                ; first element of nums inner
    LD      r7, 0(r4)                   ; load nums[i]

loop2:
    LD      r8, 0(r6)                   ; load nums[j]
    DADD    r9, r7, r8                  ; sum = nums[i] + nums[j]
    BEQ     r9, r2, found               ; if(sum == target) -> found
    DADDI   r5, r5, 1                   ; else increment j
    DADDI   r6, r6, 8                   ; move to next element
    BNE     r5, r1, loop2               ; if(j != n) -> inner loop 

loop1:
    DADDI   r3, r3, 1                   ; increment i
    DADDI   r4, r4, 8                   ; move to next element
    BNE     r3, r1, startLoop2          ; if(i != n) -> loop2
    BEQ     r3, r1, end                 ; else -> end

found:
    SD     r3, 0(r10)                   ; save i
    SD     r5, 0(r11)                   ; save j

end:
    HALT                                ; end