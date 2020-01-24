slot_depth = 4.25;
slot_length = 15.5;
slot_width = 2.2;
thickness = slot_depth +1;
margin=2.4;
padding=5;


module slot(angle=75) {
    rotate([angle,0,0]) linear_extrude(slot_width) polygon([[0.75,0],[0,4.5],[15.5,4.5],[14.75,0]]);
}

module board(columns=4,lines=5) {
    board_length = 2*margin+columns*slot_length+(columns-1)*padding;
    board_width = 2*margin+lines*slot_width+(lines-1)*padding;

    difference() {
        cube([board_length, board_width, thickness]);
        for (column = [0:columns-1]) {
            for (line = [0:lines-1]) {
                translate([margin+(slot_length+padding)*column, slot_width+margin-1+(slot_width+padding)*line,1]) slot();
            }
        }
    }
    
    graveyard_width = 2*margin+slot_length;
    
    //left graveyard
    //translate([-graveyard_width*2, 0, 0]) graveyard("", board_width, 2*(lines-1));
    translate([-graveyard_width, 0, 0]) graveyard("court", board_width, 2*(lines-1));
    
    //right graveyard
    translate([board_length, 0, 0]) graveyard("long", board_width, 2*(lines-1));
    //translate([board_length+graveyard_width, 0, 0]) graveyard("", board_width, 2*(lines-1));
}

module graveyard(text, width, nbslots) {
    difference() {
        cube([2*margin+slot_length,width, thickness]);
        translate([margin,2*margin,thickness-slot_depth]){
            for (line = [0:nbslots]) {
                translate([0,line*(slot_width+1),0]) slot(90);
            }
        }
        translate([margin+3,width-4,thickness-1.5]) linear_extrude(2) text(text,3, font = "style:bold");
        translate([margin+2, margin+1, thickness - slot_depth]) cube([slot_length - 4, nbslots*(slot_width+1) ,slot_depth+0.1]);
    }
}

$fn=200;
board(3,5);
    