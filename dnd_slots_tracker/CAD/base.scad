slot_depth = 4.25;
slot_length = 15.5;
slot_width = 2.2;

module slot() {
    rotate([75,0,0]) linear_extrude(slot_width) polygon([[0.75,0],[0,4.5],[15.5,4.5],[14.75,0]]);
}

module board(columns=4,lines=5,margin=2.4, padding=5) {
    board_length = 2*margin+columns*slot_length+(columns-1)*padding;
    board_width = 2*margin+lines*slot_width+(lines-1)*padding;
    board_thickness = slot_depth+1;

    difference() {
        cube([board_length, board_width, board_thickness]);
        for (column = [0:columns-1]) {
            for (line = [0:lines-1]) {
                translate([margin+(slot_length+padding)*column, slot_width+margin-1+(slot_width+padding)*line,1]) slot();
            }
        }
    }
}

$fn=200;
board(4,5);