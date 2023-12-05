const std = @import("std");

// look for numbers. The first number and the last number before termination of line

const words: []const []const u8 = &[_][]const u8{
    "9xcvx8xc",
    "3jmj5",
    "8lkj6",
    "3lvj2",
};
pub fn main() !void {
    var nums: [100]u8 = undefined;
    var len: usize = 0;
    for (words) |str| {
        for (str) |w| {
            if (std.ascii.isDigit(w)) {
                nums[len] = w;
                len += 1;
            }
        }
    }
    std.debug.print("nums: {s}\n", .{nums[0..len]});
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
