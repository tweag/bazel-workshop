load("@rules_rust//rust:defs.bzl", "rust_binary", "rust_library", "rust_test")

rust_library(
    name = "lib",
    srcs = ["src/lib.rs"],
    deps = [],
)

rust_binary(
    name = "hello-rs",
    srcs = ["src/main.rs"],
    data = ["resources/data.txt"],
    deps = [
            ":lib",
            "//greeter:greeter",
            "@crate_index//:log",
            "@crate_index//:env_logger",
    ],
)

rust_test(
    name = "lib_test",
    srcs = ["tests/lib_test.rs"],
    deps = [":lib"],
)
