use std::fs;
use std::io::{self, prelude::*};

/**
 * @see: https://opensource.com/article/23/1/read-write-files-rust
 */

fn main() -> std::io::Result<()> {
    /* bo:simple read */
    let file_content = fs::read_to_string("my_file.txt")?;
    println!(":: Simple read output\n   {}\n\n", file_content);
    /* eo:simple read */

    /* bo:line wise read */
    let file_handler = fs::File::open("my_file.txt")?;
    let content_as_lines = io::BufReader::new(file_handler).lines();

    println!(":: Line wise read");
    for current_line in content_as_lines {
        if let Ok(_current_line) = current_line {
            println!("   {}, _current_line")
        }
    }
    /* eo:line wise read */
}
