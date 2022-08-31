use std::fs::File;
use std::io::BufReader;

use lib;

#[link(name = "greeter")]
extern {
    fn greet(n: u32) -> ();
}

pub fn do_greet() -> () {
    unsafe {
        greet(lib::magic_number());
    }
}


pub fn open_input(file_path: &str) -> std::io::BufReader<std::fs::File> {
    let file = match File::open(file_path) {
        Err(why) => panic!("couldn't open, {}", why),
        Ok(file) => file,
    };
    BufReader::new(file)
}

fn main()  {
    use log;
    use std::io::prelude::*;

    do_greet();

    env_logger::init();
    log::info!("Starting");
    for line in open_input("./hello-rs/resources/data.txt").lines() {
          log::info!("{}", line.unwrap());
    }

}
