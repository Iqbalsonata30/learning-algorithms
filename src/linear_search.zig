// for i = first index through n
//  if a[i] == x
//    return i
//  i += 1
// end for
// return nil
//
//
// initialization = i = first index true until end of array
// maintenance = if a[i] == x return i if not still inc the i
// termination == if the array of the index i is equal to the target or i exceeds length of the array
//
//
// input = [1,2,3,4,5,6];
// target = 4;

const std = @import("std");
const expect = std.testing.expect;
const mem = std.mem;
pub fn linearSearch(items: []i32, x: i32) ?i32 {
    for (items, 0..) |item, i| {
        if (item == x) {
            return @intCast(i);
        }
    }
    return null;
}

test "test valid linear search" {
    var numbers = [_]i32{ 3, 5, 3, 2, 1, 3 };
    const target: i32 = 5;
    const expected: i32 = 1;

    const res: ?i32 = linearSearch(numbers[0..], target);
    try expect(res == expected);
}

test "test linear search with null result" {
    var numbers = [_]i32{ 1, 2, 13, 45, 23, 100 };
    const target: i32 = 5;
    const expected: ?i32 = null;

    const res: ?i32 = linearSearch(numbers[0..], target);
    try expect(res == expected);
}


