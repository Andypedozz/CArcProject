    .data
nums:       .word   0,1,2,3,4,5,6,7
target:     .word   1
result1:    .word   -1
result2:    .word   -1
n:          .word   8

    .text
start:
    LD      r1, n(r0)                   ; load number of elements (numsSize = n)
    LD      r2, target(r0)              ; load target value (value = target)
    DADDI   r10, r0, result1            ; load result1 (result1 = -1)
    DADDI   r11, r0, result2            ; load result2 (result2 = -1)

startLoop1:
    DADDI   r3, r0, 0                   ; for(int i = 0...)
    DADDI   r4, r0, nums                ; pointer to first element in outer loop
    BEQ     r3, r1, end                 ; if(i == numsSize) jump to end

startLoop2:
    DADDI   r5, r3, 1                   ; for(int j = i + 1...)
    LD      r7, 0(r4)                   ; load nums[i]
    BEQ     r5, r1, end                 ; if(j == numsSize) jump to end
    DADDI   r6, r4, 8                   ; move to next element

loop2:
    LD      r8, 0(r6)                   ; load nums[j]
    DADD    r9, r7, r8                  ; sum = nums[i] + nums[j]      1 
    BEQ     r9, r2, found               ; if(sum == target) -> found   2 
    DADDI   r5, r5, 1                   ; else increment j
    DADDI   r6, r4, 8                   ; move to next element
    BEQ     r5, r1, loop1               ; if(j != n) -> inner loop

    LD      r8, 0(r6)                   ; load nums[j]
    DADD    r9, r7, r8                  ; sum = nums[i] + nums[j]      
    BEQ     r9, r2, found               ; if(sum == target) -> found   
    DADDI   r5, r5, 1                   ; else increment j
    DADDI   r6, r4, 8                   ; move to next element
    BEQ     r5, r1, loop1               ; if(j != n) -> inner loop

    LD      r8, 0(r6)                   ; load nums[j]
    DADD    r9, r7, r8                  ; sum = nums[i] + nums[j]      
    BEQ     r9, r2, found               ; if(sum == target) -> found   
    DADDI   r5, r5, 1                   ; else increment j
    DADDI   r6, r4, 8                   ; move to next element
    BEQ     r5, r1, loop1               ; if(j != n) -> inner loop

    LD      r8, 0(r6)                   ; load nums[j]
    DADD    r9, r7, r8                  ; sum = nums[i] + nums[j]      
    BEQ     r9, r2, found               ; if(sum == target) -> found   
    DADDI   r5, r5, 1                   ; else increment j
    DADDI   r6, r4, 8                   ; move to next element
    BEQ     r5, r1, loop1               ; if(j != n) -> inner loop

    LD      r8, 0(r6)                   ; load nums[j]
    DADD    r9, r7, r8                  ; sum = nums[i] + nums[j]      
    BEQ     r9, r2, found               ; if(sum == target) -> found   
    DADDI   r5, r5, 1                   ; else increment j
    DADDI   r6, r4, 8                   ; move to next element
    BEQ     r5, r1, loop1               ; if(j != n) -> inner loop

    LD      r8, 0(r6)                   ; load nums[j]
    DADD    r9, r7, r8                  ; sum = nums[i] + nums[j]      
    BEQ     r9, r2, found               ; if(sum == target) -> found   
    DADDI   r5, r5, 1                   ; else increment j
    DADDI   r6, r4, 8                   ; move to next element
    BEQ     r5, r1, loop1               ; if(j != n) -> inner loop

    LD      r8, 0(r6)                   ; load nums[j]
    DADD    r9, r7, r8                  ; sum = nums[i] + nums[j]      
    BEQ     r9, r2, found               ; if(sum == target) -> found 
    DADDI   r5, r5, 1                   ; else increment j
    DADDI   r6, r4, 8                   ; move to next element
    BEQ     r5, r1, loop1               ; if(j != n) -> inner loop
    
loop1:
    DADDI   r3, r3, 1                   ; else increment i
    DADDI   r4, r4, 8                   ; else move to next element
    BEQ     r3, r1, end                 ; if(i == numsSize) jump to end
    J       startLoop2                  ; jump to startLoop2

found:
    SD     r3, 0(r10)                   ; save i
    SD     r5, 0(r11)                   ; save j

end:
    HALT                                ; end