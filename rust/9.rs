fn main() {
    let mut a = 1i32;
    let mut b = 2i32;
    let mut c = 3i32;

    loop {
        c += 1;
        if(a + b + c > 1000) {
            b += 1;
            c = b + 1;
            if(b > 998) {
                a += 1;
                b = a + 1;
                c = b + 1;

                if(a > 998) {
                    return;
                }
            }
        } else if(a*a + b*b == c*c && a + b + c == 1000) {
            println!("product: {}", a*b*c);
            return;
        }
    }
}
