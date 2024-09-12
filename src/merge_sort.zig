// input : [2,4,6,7,1,2,3,5]
// output : [1,2,2,3,4,5,6,7]
// Running time is theta n log n;

// input [3,41,52,26,38,57,9,49]

const std = @import("std");
const mem = std.mem;
const expect = std.testing.expect;

fn mergeSort(A: []i32, left: usize, right: usize) !void {
    if (left >= right) {
        return;
    }

    const mid: usize = left + (right - left) / 2;
    try mergeSort(A, left, mid);
    try mergeSort(A, mid + 1, right);

    try merge(A, left, mid, right);
}

fn merge(A: []i32, left: usize, mid: usize, right: usize) !void {
    var allocator = std.heap.page_allocator;
    const n1: usize = mid - left + 1;
    const n2: usize = right - mid;
    var i: usize = 0;
    var j: usize = 0;
    var k: usize = left;
    const L = try allocator.alloc(i32, n1);
    const R = try allocator.alloc(i32, n2);
    defer allocator.free(L);
    defer allocator.free(R);

    for (L, 0..) |*item, idx| {
        item.* = A[@intCast(left + idx)];
    }
    for (R, 0..) |*item, idx| {
        item.* = A[@intCast(mid + 1 + idx)];
    }

    while (i < n1 and j < n2) {
        if (L[i] <= R[j]) {
            A[k] = L[@intCast(i)];
            i += 1;
        } else {
            A[k] = R[@intCast(j)];
            j += 1;
        }
        k += 1;
    }

    while (i < n1) : (i += 1) {
        A[k] = L[@intCast(i)];
        k += 1;
    }

    while (j < n2) : (j += 1) {
        A[k] = R[@intCast(j)];
        k += 1;
    }
}

test "test merge sort with correct result" {
    var numbers = [_]i32{ 2, 4, 6, 7, 1, 2, 3, 5 };
    const expected = [_]i32{ 1, 2, 2, 3, 4, 5, 6, 7 };
    const length: usize = numbers.len - 1;
    try mergeSort(numbers[0..], 0, length);

    try expect(mem.eql(i32, numbers[0..], expected[0..]));
}

test "test merge sort with negative numbers" {
    var numbers = [_]i32{ 2, 4, -6, -7, 1, 2, 3, 5 };
    const expected = [_]i32{ -7, -6, 1, 2, 2, 3, 4, 5 };
    const length: usize = numbers.len - 1;
    try mergeSort(numbers[0..], 0, length);

    try expect(mem.eql(i32, numbers[0..], expected[0..]));
}

test "test merge sort with incorrect result" {
    var numbers = [_]i32{ 2, 4, 6, 7, 1, 2, 3, 5 };
    const expected = [_]i32{ 4, 2, 1, 3, 5, 6, 7 };
    const length: usize = numbers.len - 1;
    try mergeSort(numbers[0..], 0, length);

    try expect(!mem.eql(i32, numbers[0..], expected[0..]));
}

test "test merge sort with another postiive numbers" {
    var numbers = [_]i32{ 12, 3, 7, 9, 14, 6, 11, 2, 1 };
    const expected = [_]i32{ 1, 2, 3, 6, 7, 9, 11, 12, 14 };
    const length: usize = numbers.len - 1;
    try mergeSort(numbers[0..], 0, length);

    try expect(mem.eql(i32, numbers[0..], expected[0..]));
}
