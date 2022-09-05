load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")

cc_library(
    name = "greeter",
    srcs = ["src/greeter.cpp"],
    hdrs = ["src/greeter.h"],
    deps = [
        "@com_google_protobuf//:protobuf",
        "@zlib.c//:zlib.c",
        "//:arrayfire",
    ],
    # We define the visibilty explicitly so it can be accessed from other packages in the workspace.
    # https://bazel.build/concepts/visibility
    visibility = ["//visibility:public"],
)


cc_test(
    name = "tests",
    srcs = glob(["tests/**/*.cpp"]),
    deps = [
        "//greeter:greeter",
        "@com_google_googletest//:gtest_main",
    ],
)
