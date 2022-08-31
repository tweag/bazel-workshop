load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library", "cc_test")

cc_library(
    name = "greeter",
    srcs = ["greeter/greeter.cpp"],
    hdrs = ["greeter/greeter.h"],
    deps = [
        "@com_google_protobuf//:protobuf",
        "@zlib.c//:zlib.c",
    ],
    # We define the visibilty explicitly so it can be accessed from other packages in the workspace.
    # https://bazel.build/concepts/visibility
    visibility = ["//visibility:public"],
)

cc_binary(
    name = "hello-cc",
    srcs = ["hello-cc/main.cpp"],
    deps = [
      ":greeter",
    ],
)

cc_test(
    name = "tests",
    srcs = ["greeter/greeter_test.cpp"],
    deps = [
        "//:greeter",
        "@com_google_googletest//:gtest_main",
    ],
)
