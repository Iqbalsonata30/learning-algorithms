// {1,2,3,4,5}
// for i = 1 through n
// key = numbers[i];
// f = i -1
// while(f >= 0 ) and numbers[f] < key{
// {2,1,1,4,5}
//   numbers[f+1] = numbers[f]
//   f -= 1
// }
// numbers[f+1] = key
//
// end for
//
// result {5,4,3,2,1}

const std = @import("std");
const mem = std.mem;
const expect = std.testing.expect;

pub fn insertionSort(numbers: []i32, n: usize) void {
    var i: usize = 1;
    while (i < n) : (i += 1) {
        const key: i32 = numbers[i];
        var j: i32 = @intCast(i - 1);
        while (j >= 0 and numbers[@intCast(j)] > key) : (j -= 1) {
            numbers[@intCast(j + 1)] = numbers[@intCast(j)];
        }
        numbers[@intCast(j + 1)] = key;
    }
}

pub fn insertionSortDec(numbers: []i32, n: usize) void {
    var i: usize = 1;
    while (i < n) : (i += 1) {
        const key: i32 = numbers[i];
        var f: i32 = @intCast(i - 1);
        while (f >= 0 and numbers[@intCast(f)] < key) : (f -= 1) {
            numbers[@intCast(f + 1)] = numbers[@intCast(f)];
        }
        numbers[@intCast(f + 1)] = key;
    }
}

test "test insertion sort with positive numbers" {
    var numbers = [_]i32{ 5, 4, 3, 2, 15, 2, 1 };
    var expected = [_]i32{ 1, 2, 2, 3, 4, 5, 15 };

    insertionSort(numbers[0..], numbers.len);
    try expect(mem.eql(i32, numbers[0..], expected[0..]));
}

test "test insertion sort with negative numbers" {
    var numbers = [_]i32{ 6, 12, -34, 2, 1, 30, 5, -3 };
    var expected = [_]i32{ -34, -3, 1, 2, 5, 6, 12, 30 };

    insertionSort(numbers[0..], numbers.len);
    try expect(mem.eql(i32, numbers[0..], expected[0..]));
}

test "test insertion sort with incorrect result" {
    var numbers = [_]i32{ 6, 12, -34, 2, 1, 30, 5, -3 };
    var expected = [_]i32{ -34, -4, 1, 2, 5, 6, 12, 30 };

    insertionSort(numbers[0..], numbers.len);
    try expect(!mem.eql(i32, numbers[0..], expected[0..]));
}

test "test insertion sort reversed order with positive numbers" {
    var numbers = [_]i32{ 5, 4, 3, 2, 15, 2, 1 };
    var expected = [_]i32{ 15, 5, 4, 3, 2, 2, 1 };

    insertionSortDec(numbers[0..], numbers.len);
    try expect(mem.eql(i32, numbers[0..], expected[0..]));
}

test "test insertion sort reversed order with negative numbers" {
    var numbers = [_]i32{ 6, 12, -34, 2, 1, 30, 5, -3 };
    var expected = [_]i32{ 30, 12, 6, 5, 2, 1, -3, -34 };

    insertionSortDec(numbers[0..], numbers.len);
    try expect(mem.eql(i32, numbers[0..], expected[0..]));
}

test "test insertion sort reversed order with incorrect result" {
    var numbers = [_]i32{ 6, 12, -34, 2, 1, 30, 5, -3 };
    var expected = [_]i32{ -34, -4, 1, 2, 5, 6, 12, 30 };

    insertionSortDec(numbers[0..], numbers.len);
    try expect(!mem.eql(i32, numbers[0..], expected[0..]));
}
