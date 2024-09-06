pub fn linearSearch(items: []i32, x: i32) ?i32 {
    for (items, 0..) |item, i| {
        if (item == x) {
            return @intCast(i);
        }
    }
    return null;
}

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
