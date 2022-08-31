extern crate lib;

#[cfg(test)]
mod test {

    #[test]
    fn test_magic_number() {
        assert_eq!(42, lib::magic_number());
    }
}
