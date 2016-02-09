extern crate num;
extern crate core;

use num::bigint::{ToBigUint, BigUint};

fn main() {
    let one: BigUint = num::one();
    let result =
        // Generate a vector of numbers from 1 to 100.
        (1..100)

        // Fold with this lambda function.
        .fold(one, |acc,y| acc * y.to_biguint().unwrap())

        // Convert resulting value into string.
        .to_str_radix(10)

        // Split the string into characters.
        .as_bytes()

        // Make a lazy iterator.
        .iter()

        // Apply this lambda function to each element in the vector specified by this iterator.
        // Application is lazy.
        .map(|b| b - 0x30)

        // Fold with this lambda function.
        .fold(0u32, |acc,b| acc + b as u32);

    println!("Result: {}", result);
}
