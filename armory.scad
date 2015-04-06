inch=25.4;

wall = 1.0;  // wall thickness
buffer = 4.5;  // keychain hole buffer
board = [2.138*inch, 0.798*inch, 5.6]; // board size

module pill(dims) {
     x = dims[0];
     y = dims[1];
     r = y/2;
     union() {
          square([x - 2*r, y], center=true);
          for (i = [-1, 1])
          translate([i * (x - 2*r) / 2, 0])
          circle(r);
     }
}

module case() {
    difference() {
        translate([buffer/2, 0, 0])
        difference() {
             //cube(board + [wall + buffer, 2*wall, 2*wall], center=true);
             rotate([90, 0, 90])
             linear_extrude(board[0] + wall + buffer, center=true)
             pill([board[1] + 2*wall, board[2] + 2*wall] + [4,0], $fn=40);

             // USB slot
             cube([2*board[0], 0.5*inch, 2.4], center=true);

             // board
             translate([wall, 0, 0])
             cube(board + [buffer, 0, 0], center=true);
        }

        // LED hole
        translate([-board[0]/2 + 13.5, 5, 0])
        cylinder(r=0.8,, h=2*board[2], $fn=16);

        translate([board[0]/2 + buffer/2, 0, 0])
        cylinder(r=3/2, h=2*board[2], $fn=16, center=true);
    }
}

case();
//color("blue") cube(board, center=true);

//pill([100, 20]);
