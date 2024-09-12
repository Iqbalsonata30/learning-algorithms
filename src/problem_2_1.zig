// Consider a modification to merge sort in which n/k sublists of length k are sorted using insertion sort.
// then merge using the standard merging mechanism, where k is a value to be determined
//
//
// input [1,11,5,2,9,12,8,10];
// output [1.2.5,11.8,9,10,12];
//

// n = length of array
// k = sublist

const std = @import("std");
const mem = std.mem;
const expect = std.testing.expect;

fn insertionSortSublist(A: []i32, n: u32, k: u32) void {
    var i: u32 = 0;
    const sl = n / k;

    while (i < sl) : (i += 1) {
        var start: u32 = i * k;
        const end_index: u32 = (i + 1) * k - 1;
        insertionSort(A, &start, end_index);
    }
}

fn insertionSort(A: []i32, start: *u32, end: u32) void {
    while (start.* < end) : (start.* += 1) {
        const i: u32 = start.*;
        const key: i32 = A[@intCast(i + 1)];
        var f: i32 = @intCast(start.*);
        while (f >= 0 and A[@intCast(f)] > key) : (f -= 1) {
            A[@intCast(f + 1)] = A[@intCast(f)];
        }
        A[@intCast(f + 1)] = key;
    }
}

test "test problem 2.1 insertino sort in theta (nk)" {
    var numbers = [_]i32{ 9, 2, 3, 5, 1, 12, 8, 10 };
    const length: u32 = numbers.len;
    const expected = [_]i32{ 2, 3, 5, 9, 1, 8, 10, 12 };
    insertionSortSublist(numbers[0..], length, 4);

    try expect(mem.eql(i32, numbers[0..], expected[0..]));
}
