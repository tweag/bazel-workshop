# Build Arrayfire with cmake
load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

cmake(
    name = "arrayfire",
    cache_entries = {
        "CMAKE_BUILD_TYPE": "Release",
        "AF_BUILD_CPU": "ON",
        "AF_BUILD_CUDA": "OFF",
        "AF_BUILD_OPENCL": "OFF",
        "AF_BUILD_EXAMPLES": "OFF",
        "AF_WITH_IMAGEIO": "OFF",
        "BUILD_TESTING": "OFF",
        "AF_BUILD_DOCS": "OFF",
    },
    build_args = [
        "--verbose",
        "--",
        "-j `nproc`",
    ],
    lib_source = "@arrayfire//:all_srcs",
    out_shared_libs = ["libaf.so", "libafcpu.so"],
    visibility = ["//visibility:public"],
)

