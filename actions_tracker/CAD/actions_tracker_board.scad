$fn=200;

module slot(offset, width) {
    translate([0,0,offset]) {
        linear_extrude(width) {
            difference() {
                union() {
                    circle(5);
                    polygon([[5,-2],[-5,5],[-5, 7], [5,7]]);
                }
                circle(1.25);
            }
        }
    }
}

module base(length, width, height) {
    linear_extrude(length) {
        translate([1.25, 7-width, 0]) {
            square([height, width]);
        }
    }
}

module full_board() {
    rotate([0,90,0]) {
        difference() {
            union() {
                base(96,39.5,3.75);
                slot(0,2);
                slot(22,4);
                slot(46,4);
                slot(70,4);
                slot(94,2);
            }
            translate([-5.5, -40, 12]) sphere(12);
            translate([-5.5, -40, 36]) sphere(12);
            translate([-5.5, -40, 60]) sphere(12);
            translate([-5.5, -40, 84]) sphere(12);
        }
    }
}

module mono_board() {
    rotate([0,90,0]) {
        difference() {
            union() {
                base(24,39.5,3.75);
                slot(0,2);
                slot(22,2);
            }
            translate([-5.5, -40, 12]) sphere(12);
        }
    }
}

full_board();
//mono_board();