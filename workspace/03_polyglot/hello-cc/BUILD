load("@rules_cc//cc:defs.bzl", "cc_binary")

cc_binary(
    name = "hello-cc",
    srcs = ["main.cpp"],
    deps = [
        # TODO Demo internal library to hello-cc
        # ":hello-greet",
        "//greeter:greeter",
    ],
)
