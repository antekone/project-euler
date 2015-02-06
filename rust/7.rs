// Project Euler problem #7 in Rust by antekone.
// http://anadoxin.org/blog
//
// usage:
//
// $ rustc 7.rs
// $ ./7 | grep 10001
//
// The answer will be printed on the screen ;)

use std::num::Float;

// Sieve of Erastothenes.

fn e_sieve(n: usize) {
    let mut A: Vec<bool> = Vec::new();
    A.resize(n, true);

    let sqrtn: usize = (n as f32).sqrt() as usize;
    for i in (2us..sqrtn) {
        let mut j = i * i;

        if(! A[i]) {
            continue;
        }

        while(j < n) {
            A[j] = false;
            j += i;
        }
    }

    let mut cnt = 1us;
    for i in (2us..n) {
        if(A[i]) {
            println!("idx={} prime={}", cnt, i);
            cnt += 1;
        }
    }
}

fn main() {
    e_sieve(211000);
}
