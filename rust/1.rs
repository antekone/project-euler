// project euler #1 problem in rust by antekone
// http://anadoxin.org/blog
//
// $ rustc 1.rs
// $ ./1

fn main() {
    println!("{}", (1is..1000).
             filter(|&x| x % 3 == 0 || x % 5 == 0).
             fold(0, |x, y| x + y));
}
