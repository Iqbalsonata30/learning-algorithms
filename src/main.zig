const std = @import("std");
const print = std.debug.print;
const selectionSort = @import("selection_sort.zig").selectionSort;

pub fn main() !void {
    var numbers = [_]i32{ 5, 4, 1, 2, 1,34,12,2 };
    selectionSort(numbers[0..]);

    print("{any}\n",.{numbers});

}
