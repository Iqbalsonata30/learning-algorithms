// input : [5,4,3,2,1]
// output : [1,2,3,4,5]
// n = 5
// running time : theta n squared
//
//
// for i to n -1
// for j = n - 1 down to i + 1
// if A[j] < A[j - 1]{
//    tmp = A[j];
//    A[j] = A[j-1]
//    A[j-1] = tmp;
// }

const std = @import("std");

fn bubbleSort(A: []i32, n: usize) void {
    var i: usize = 0;
    var tmp: i32 = 0;
    while (i < n - 1) : (i += 1) {
        var j: usize = n - 1;
        while (j >= (i + 1)) : (j -= 1){
            if (A[j] < A[j - 1]) {
                tmp = A[j];
                A[j] = A[j - 1];
                A[j - 1] = tmp;
            }
        }
    }
}

test "test bubble sort " {
    var numbers = [_]i32{ 5, 4, 3, 2, 1 };
    const length: usize = numbers.len;

    bubbleSort(&numbers, length);
    std.debug.print("{any}\n", .{numbers});
}
