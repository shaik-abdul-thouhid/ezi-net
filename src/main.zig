const std = @import("std");
const Io = std.Io;

pub fn main(init: std.process.Init) !void {
    const gpa = init.gpa;

    const stdout_buffer = try gpa.alloc(u8, 1024 * 4);
    defer gpa.free(stdout_buffer);

    var stdout_writer = std.Io.File.Writer.init(.stdout(), init.io, stdout_buffer);
    const stdout = &stdout_writer.interface;
    defer stdout.flush() catch {};

    try stdout.print("Hello, World!!!\n", .{});
}
