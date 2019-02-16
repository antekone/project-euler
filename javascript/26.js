//
// project euler #26 in javascript
// written by antekone
//
// node 26.js  0.12s user 0.00s system 104% cpu 0.116 total
//
// http://anadoxin.org/blog
//

var log = console.log

function searchState(n, d, arr) {
    for(var i = arr.length - 1; i >= 0; i--) {
        var [an, ad] = arr[i]
        if(an == n && ad == d) {
            return arr.length - i
        }
    }

    return -1
}

function countFracCycles(denominator) {
    numerator = 10
    states = []

    while(true) {
        var f = Math.floor(numerator / denominator)
        n = searchState(numerator, f, states)
        if(n >= 0)
            return n

        states.push([numerator, f])
        numerator = 10 * (numerator - (denominator * f))
        if(numerator == 0)
            return 0;
    }
}

var bn = 0
var bi = 0

for(var i = 2; i < 1000; i++) {
    var n = countFracCycles(i)
    if(n > bn) {
        bn = n
        bi = i
    }
}

log(bi)
