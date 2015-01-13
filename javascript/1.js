// project euler #1 in javascript by antekone
// http://anadoxin.org/blog
//
// deps: node.js
//
// usage:
// $ node 1.js

var sum = 0;

for(var i = 0; i < 1000; ++i) {
    if(i % 3 == 0 || i % 5 == 0) {
        sum += i;
    }
}

console.log(sum);
