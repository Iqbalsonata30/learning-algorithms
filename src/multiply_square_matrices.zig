const std = @import("std");

pub fn main() void {
    const A = [2][2]i8{
        [2]i8{ 1, 2 },
        [2]i8{ 3, 4 },
    };

    const B = [2][2]i8{
        [2]i8{ 5, 6 },
        [2]i8{ 8, 1 },
    };

    const C = [2][2]i8{
        [2]i8{ 0, 0 },
        [2]i8{ 0, 0 },
    };

    std.debug.print("result : {any}\n", .{multiplySquareMatrices(A, B, C, 2)});
}

// -- Rows
// | Column
//
//
// AB = c11 (1 * 5) + (2 * 8) -> 5 + 16 = 21
//      c12 (1 * 6) + (2 * 1) -> 6 + 2 = 8
//      c21 (3 * 5) + (4 * 8) -> 15 + 32 = 47
//      c22 (3 * 6) + (4 * 1) -> 18 + 4 -> 22
// C = 21 8
//     47 22
//

fn multiplySquareMatrices(A: [2][2]i8, B: [2][2]i8, C: [2][2]i8, n: usize) [2][2]i8 {
    var i: usize = 0;
    var j: usize = 0;
    var k: usize = 0;

    var c: [2][2]i8 = C;

    while (i < n) : (i += 1) { // compute entries in each of n rows
        while (j < n) : (j += 1) { // compute n entries in row i
            while (k < n) : (k += 1) {
                c[i][j] = c[i][j] + A[i][k] * B[k][j];
            }
            k = 0;
        }
        j = 0;
    }

    return c;
}
