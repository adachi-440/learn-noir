use dep::std;

unconstrained fn main(input: [u8; 32], n: Field) -> pub [u8; 32] {
   let mut out: [u8; 32] = [0; 32];

    for i in 0..32
    {
        std::println("---------------------------------");
        std::println(i + n);
        std::println(((i + n) as u32) < (32 as u32));
        if ((i + n) as u32) < (32 as u32)
        {
            out[i] = input[i+n];
            std::println(out);
        } else {
            std::println("i + n is more than 32");
        }
    }

    // let num = (n + 20) as u32;
    // std::println(num);
    // if ((num) as u32) < (32 as u32)
    //     {
    //         // Index out of bounds, array has size 32, but index was 32
    //         out[20] = input[num];
    //         std::println(out);
    //     } else {
    //         std::println("i + n is more than 32");
    //     }
    out
}

#[test]
fn test_main() {
    let input = [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xb8, 0x8f, 0x61, 0xe6, 0xfb, 0xda, 0x83, 0xfb, 0xff, 0xfa, 0xbe, 0x36, 0x41, 0x12, 0x13, 0x74, 0x80, 0x39, 0x80, 0x18];
    let expected = [0xb8,0x8f,0x61,0xe6,0xfb,0xda,0x83,0xfb,0xff,0xfa,0xbe,0x36,0x41,0x12,0x13,0x74,0x80,0x39,0x80,0x18,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00];
    let n = 12;
    let result = main(input, n);
    assert_eq(result, expected);
}
