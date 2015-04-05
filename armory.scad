inch=25.4;

wall = 1.0;  // wall thickness
buffer = 5;  // keychain hole buffer
board = [2.138*inch, 0.792*inch, 5.6]; // board size

module case() {
    difference() {
        translate([buffer/2, 0, 0])
             difference() {
             cube(board + [wall + buffer, 2*wall, 2*wall], center=true);

             cube([2*board[0], 0.475*inch, 2.3], center=true);

             translate([wall, 0, 0])
             cube(board + [buffer, 0, 0], center=true);
        }

        translate([board[0]/2 + buffer/2, 0, 0])
        #cylinder(r=3/2, h=2*board[2], $fn=16, center=true);
    }
}

case();
//color("blue") cube(board, center=true);
