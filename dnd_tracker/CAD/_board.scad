$fn=100;
module disc(radius=15,fontsize=6,thickness=3,padding=1, hole_radius=2.1) {
    difference() {
        cylinder(thickness,radius,radius);
        translate([0,0,-0.1]) cylinder(thickness+.2,hole_radius,hole_radius);
        for (i = [0:9]) {
            rotate([0,0,i*36]) translate([0,radius-fontsize/2-padding,thickness-1]) linear_extrude(1.1) mirror([0,1,0]) mirror([1,0,0]) text(str(i),fontsize, font = "style:bold", halign = "center", valign = "center");
        }
        for (i=[0:36]) {
            rotate([0,0,i*10]) translate([0,-1*radius-2.5,-0.1]) linear_extrude(7) polygon([[4,0],[-4,0],[0,3]],[[0,1,2]]);
        }
    }
}

module pincher(radius=2, thickness=3.5, slit=1.5, wall=0.75, lip=0.5, lip_height=1) {
    difference() {
        union() {
            cylinder(thickness, radius, radius);
            translate([0,0,thickness]) cylinder(lip_height,radius+0.5, radius);
        }
        translate([-radius-lip,-slit/2,0]) cube([2*(radius+lip),slit,thickness+lip_height+.1]);
        cylinder(thickness+lip_height+.1,radius-wall,radius-wall);
    }
}

module disc_slot(disc_radius=15, disc_thickness=3) {
    slot_radius = disc_radius + 1;
    slot_depth = disc_thickness + 0.5;
    board_size = 2*(disc_radius+10);
    board_thickness = slot_depth + 2.5 + 0.25;
    
    difference() {
        translate([-board_size/2, -board_size/2, 0]) cube([board_size,board_size-12.5,board_thickness]);
        translate([0,0,3]) cylinder(slot_depth,slot_radius,slot_radius);
        difference() {
            translate([0,-22.5,board_thickness-1]) linear_extrude(2) polygon([[4,0],[-4,0],[0,6]],[[0,1,2]]);
            translate([0,-22.5,board_thickness-1]) linear_extrude(2) polygon([[2.5,0],[-2.5,0],[0,4]],[[0,1,2]]);     
        }
    }
    translate([0,0,3]) pincher();
}

module occulter(disc_radius=15) {
    difference() {
        cylinder(2.5, disc_radius+2,disc_radius+2);
        translate([0,0,-0.1]) cylinder(0.5+0.1, disc_radius+1,disc_radius+1);
        cylinder(1.5, 4, 4);
        translate([-3.5, -19, -0.1]) cube([7,12,2.5+0.2]);
        translate([-disc_radius, disc_radius-2.5, -0.1]) cube([2*disc_radius,disc_radius,2.5+0.2]);
    }
}

// assembly test
translate([0,0,-3]) disc_slot();
translate([0,0,0.25]) disc();
translate([0,0,3.25]) occulter();



