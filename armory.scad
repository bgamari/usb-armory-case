inch=25.4;

wall = 1.0;  // wall thickness
buffer = 4.5;  // keychain hole buffer
board = [2.138*inch, 0.792*inch, 5.6]; // board size

module case() {
    difference() {
        translate([buffer/2, 0, 0])
             difference() {
             cube(board + [wall + buffer, 2*wall, 2*wall], center=true);

             // USB slot
             cube([2*board[0], 0.480*inch, 2.4], center=true);

             // board
             translate([wall, 0, 0])
             cube(board + [buffer, 0, 0], center=true);
        }

        // LED hole
        translate([-board[0]/2 + 12, 5, 0])
        cylinder(r=0.8,, h=2*board[2], $fn=16);

        translate([board[0]/2 + buffer/2, 0, 0])
        cylinder(r=3/2, h=2*board[2], $fn=16, center=true);
    }
}

case();
//color("blue") cube(board, center=true);
