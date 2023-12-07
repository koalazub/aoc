const std = @import("std");

// look for numbers. The first number and the last number before termination of line

const words: []const []const u8 = &[_][]const u8{
    "9xcvx8xc",
    "3jmj5",
    "8l4j6",
    "3lvj2",
};

pub fn main() !void {
    var numsPerWord: [words.len][2]u8 = undefined; // 2 element array
    for (words, 0..) |word, i| {
        var first: u8 = 0;
        var isFirst: bool = false;
        var isLast: bool = false;
        var last: u8 = 0;
        for (word) |ch| {
            if (std.ascii.isDigit(ch)) {
                if (!isFirst) {
                    first = ch;
                    isFirst = true;
                }

                last = ch;
                isLast = true;
            }
        }
        if (isFirst) {
            numsPerWord[i][0] = first;
        }
        if (isLast) {
            numsPerWord[i][1] = last;
        }
    }

    for (numsPerWord, 0..) |n, i| {
        std.debug.print("Word: {}, nums: {s}\n", .{ i, n[0..2] });
    }
}

// what do I need to do
// iterate over each element
// each element is a string
// then iterate over each string
// look for a number,
// then move to the next element
test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
