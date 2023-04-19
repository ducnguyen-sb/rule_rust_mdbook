load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@rules_rust//crate_universe:defs.bzl", "crates_repository")


def com_github_mdbook_fetch_archive():
    _VERSION = "0.4.28"
    _SHA256 = "3f24b2550d71e87a93f2d4da5f3980d7be6919421ba9aeb368515f14478ecc8a"
    maybe(
        http_archive,
        name = "com_github_rust_lang_mdbook",
        build_file = "//cargo_mdbook:BUILD.mdbook.bazel",
        sha256 = _SHA256,
        urls = [
            "https://github.com/rust-lang/mdBook/archive/refs/tags/v0.4.28.zip",
        ],
        strip_prefix = "mdBook-{version}".format(version = _VERSION),
        type = "zip",
    )

    crates_repository(
        name = "crate_index_cargo_mdbook",
        cargo_lockfile = "@com_github_rust_lang_mdbook//:Cargo.lock",
        manifests = ["@com_github_rust_lang_mdbook//:Cargo.toml"],
    )
    