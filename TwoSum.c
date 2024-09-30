#include <stdio.h>

int main() {
    int size = 10;
    int target = 5;
    int result[2];
    int nums[size];
    int found = 0;

    for(int i = 0; i < size && !found; i++) {
        for(int j = i + 1; j < size && !found; j++) {
            if(nums[i] + nums[j] == target) {
                result[0] = i;
                result[1] = j;
                found = 1;
            }
        }
    }
    
    return 0;
}

