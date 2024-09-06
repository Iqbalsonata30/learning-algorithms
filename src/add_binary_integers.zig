const std = @import("std");
pub fn addBinaryIntegers(a: []u8, b: []u8) ![]const u8 {
    var valA: u8 = 0;
    var valB: u8 = 0;
    var valC: u8 = 0;

    const allocator = std.heap.page_allocator;
    var list = std.ArrayList(u8).init(allocator);
    defer list.deinit();

    for (a, 0..) |item, index| {
        valA = @intCast(item * (2 * index));
        valA += item;
    }
    for (b, 0..) |item, index| {
        valB = @intCast(item * (2 * index));
        valB += item;
    }
    valC = valA + valB;
    while (valC != 1 or valC != 0) : (valC /= 2) {
        const res: u8 = valC % 2;
        list.append(res) catch unreachable;
    }
    const c = list.toOwnedSlice();
    return c;
}

// i have two inputs, which are a and b array of integers either 1 or 0
// the output should be an array of c which is the sum of these fcking two arrays and the value has to be stored in binary form
// a = [ 1, 0 ,1 ,1 ] = 1101  =13
// b = [ 0, 0, 1, 1] = 1100 = 12
// c = 25 [1,0,0,1,1] = 11001
//
// for a,index = item,0
//  valueA = item * (2 * index)
//  valueA += item
// end for
// for b,index = item,0
//  valueB = item * (2 * index)
//  valueB += item
// end for
//
// valueC = valueA + valueB
// while(valueC){
//   res = valueC % 2
//   insert into c res
//   valueC /= 2
//
//
// }
//
//
//
//
//
//
//
//
//
//
//
