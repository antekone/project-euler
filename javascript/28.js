//
// project euler #28 in javascript
// written by antekone
//
// node 28.js  0.05s user 0.01s system 100% cpu 0.065 total
//
// http://anadoxin.org/blog
//
// 3 5 7 9       [+2]
// +5
// 13 17 21 25   [+4]
// +6
// 31 37 43 49   [+6]
// +8
// 57 65 73 81   [+8]
// +10
// 91 101 111 121 [+10]
//
// 133 145

var log = console.log
var num_add = 2
var n = 1
var sum = 1

for(var i = 0;;i++) {
    n += num_add
    sum += n
    if((i & 3) == 3) {
        num_add += 2
        if(num_add + 1 == 1001) {
            log("%d", sum)
            return;
        }
    }
}
