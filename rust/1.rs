// project euler #1 problem in rust by antekone
// http://anadoxin.org/blog
//
// $ rustc 1.rs
// $ ./1

fn main() {
    let mut sum = 0is;

    for i in 1is..1000 {
        if i % 3 == 0 || i % 5 == 0 {
            sum += i;
        }
    }

    println!("{}", sum);
}
