use std::fs;
use std::io::{self, prelude::*};

/**
 * @see: https://opensource.com/article/23/1/read-write-files-rust
 */

fn main() -> std::io::Result<()> {
    /* Simple write */
    println!("Writing using simple write way.");
    fs::write("my_file.txt", b"your base does belong to us")?;

    /* Write using file descriptor and opening modes */
    println!("Writing using file descriptor and opening modes.");
    let mut file_handler = fs::OpenOptions::new()
        .append(true)
        .open("my_file.txt")?;

    file.write_all(b"rainbow to the stars")?;
}
