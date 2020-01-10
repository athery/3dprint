slot_depth = 5;
slot_length = 16;
slot_width = 2.5;

module slot() {
    rotate([90,0,0]) linear_extrude(slot_width) {
        scale(0.75) intersection() {
            square([21.5,5]);
            translate([10.75, 15, 0]) circle(15);
        }
    }
}

module board(columns=4,lines=5,margin=2.5, padding=5) {
    board_length = 2*margin+columns*slot_length+(columns-1)*padding;
    board_width = 2*margin+lines*slot_width+(lines-1)*padding;
    board_thickness = slot_depth;

    difference() {
        cube([board_length, board_width, board_thickness]);
        for (column = [0:columns-1]) {
            for (line = [0:lines-1]) {
                translate([margin+(slot_length+padding)*column, slot_width+margin+(slot_width+padding)*line,1.25]) slot();
            }
        }
    }
}

$fn=200;
board(4,5);