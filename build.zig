const std = @import("std");

pub fn build(b: *std.Build) void {
    _ = b.addModule("win32", .{
        .source_file = .{ .path = "win32.zig" },
    });

    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});

    const lib = b.addStaticLibrary(.{
        // the output will be libduck.a
        .name = "win32",
        // the code to our wrapper library
        .root_source_file = .{ .path = "win32.zig" },
        .target = target,
        .optimize = optimize,
    });

    b.installArtifact(lib);
}
