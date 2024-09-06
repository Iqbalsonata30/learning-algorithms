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
