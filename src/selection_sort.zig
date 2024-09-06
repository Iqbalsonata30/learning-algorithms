// input (best-case): i have an array reversed order.
// output : the array in sorted order
//
// in selection sort i need to find the smallest number in array and compare a[1] through end
//
// input : [5,4,3,2,1]
// input : [1,2,3,4,5]
// output : [1,1,2,4,5]
// running time : is clearly n squared.
//
// for i = 0 through n
// f = 0;
//   for z = 1 trough n
//    if array[f] > array[z]
//      temp = array[z]
//      array[z] = array[f]
//      array[f] = temp;
//    end if
//    f += 1
//   end for
// end for
//
// the inialization = is i = 0, f = 0 and z = 1. 
// maintenance = there are 2 whiles, where the first one, i need it for terminated the array, and the another one is the key point,so i'm able to  compare each of these values.
// termination = exacly where the i exists, because if it exceeds the n, the loop is terminated.
// either the best case or the worst case is  theta n squared


pub fn selectionSort(nums: []i32) void {
    var i: usize = 0;
    const n: usize = nums.len;
    while (i < n) : (i += 1) {
        var f: usize = 0;
        var z: usize = 1;
        while (z < n) : (z += 1) {
            if (nums[f] > nums[z]) {
                const temp: i32 = nums[z];
                nums[z] = nums[f];
                nums[f] = temp;
            }
            f += 1;
        }
    }
}
