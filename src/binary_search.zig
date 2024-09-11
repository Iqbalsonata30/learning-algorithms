// input = [1,2,3,4,5,6]
// target = 4
// output = 3
// binarySearch(arr,target)
//
//
// first = 0
// last = input.length - 1
// while(first > last)
//   mid = first + (last - first) / 2
//   if target == arr[mid]{
//     return mid;
//   }else if target > arr[mid]{
//     first = mid + 1;
//   }else{
//     last = mid
//   }
// end while
//

const std = @import("std");
const expect = std.testing.expect;

fn binarySearch(numbers: []i32, target: i32) i32 {
    var first: u32 = 0;
    var last: u32 = @intCast(numbers.len - 1);
    while (first < last) {
        const mid: u32 = first + (last - first) / 2;
        if (target > numbers[mid]) {
            first = mid + 1;
        } else if (target < numbers[mid]) {
            last = mid;
        } else {
            return @intCast(mid);
        }
    }
    return -1;
}

test "test binary search with correct result" {
    var numbers = [_]i32{ 1, 2, 3, 4, 5, 6 };
    const target: i32 = 4;
    const expected: i32 = 3;
    const res: i32 = binarySearch(numbers[0..], target);
    try expect(res == expected);
}

test "test binary search  target not found." {
    var numbers = [_]i32{ 1, 2, 3, 4, 5, 6 };
    const target: i32 = 11;
    const expected: i32 = -1;
    const res: i32 = binarySearch(numbers[0..], target);
    try expect(res == expected);
}
