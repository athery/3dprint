$fn=100;
module disc(radius=14,fontsize=6,thickness=3,padding=1, hole_radius=2.1) {
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

module pincher(radius=2, thickness=3.5, slit=2, wall=1, lip=0.25, lip_height=1) {
    difference() {
        union() {
            cylinder(thickness, radius, radius);
            translate([0,0,thickness]) cylinder(lip_height,radius+lip, radius-lip);
        }
        translate([-radius-lip,-slit/2,0]) cube([2*(radius+lip),slit,thickness+lip_height+.1]);
        cylinder(thickness+lip_height+.1,radius-wall,radius-wall);
    }
}

module disc_slot_front(disc_radius=14, disc_thickness=3) {
    slot_radius = disc_radius + 1;
    slot_depth = disc_thickness + 0.5;
    board_size = 2*(disc_radius+2);
    board_thickness = slot_depth + 1.5 + 0.25;
    
    difference() {
        translate([-board_size/2, -board_size/2, 0]) cube([board_size,board_size-3.5,board_thickness]);
        translate([0,0,slot_depth/2]) cylinder(slot_depth+0.1,slot_radius,slot_radius);
    }
    translate([0,0,slot_depth/2]) pincher();
}

module disc_slot_back(disc_radius=15, disc_thickness=3) {
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

module occulter_front(disc_radius=14, thickness=2, plot_height=4.5, plot_width=3, plot_thickness=1.8, clearance_radius=3, clearance_height=1, wall=1, window_width=6.5, window_height=10) {
    board_size = 2*(disc_radius+2);
    rotate([0,0,180]) {
        difference() {
            translate([-board_size/2, -board_size/2+3.5, 0]) cube([board_size,board_size-3.5,thickness]);
            translate([0, 0, -0.1]) cylinder(clearance_height+0.1, clearance_radius, clearance_radius);
            translate([-window_width/2, -disc_radius-2*wall, -0.1]) cube([window_width,window_height,thickness+0.2]);
        }
        translate([-plot_width/2, -plot_thickness/2, -plot_height+clearance_height]) cube([plot_width, plot_thickness, plot_height]);
    }
}

module occulter_back(disc_radius=15, thickness=2.5, plot_height=4.5, plot_width=3, plot_thickness=1.8, clearance_radius=3, clearance_height=1.5, wall=1, window_width=7, window_height=10, trunc=2.5) {
        difference() {
            cylinder(thickness, disc_radius+2*wall,disc_radius+2*wall);
            translate([0,0,-0.1]) cylinder(0.5+0.1, disc_radius+wall,disc_radius+wall);
            cylinder(clearance_height, clearance_radius, clearance_radius);
            translate([-window_width/2, -disc_radius-2*wall, -0.1]) cube([window_width,window_height,thickness+0.2]);
            translate([-disc_radius, disc_radius-trunc, -0.1]) cube([2*disc_radius,disc_radius,thickness+0.2]);
        }
        translate([-plot_width/2, -plot_thickness/2, -plot_height+clearance_height]) cube([plot_width, plot_thickness, plot_height]);
}



// assembly test
//translate([0,0,-3]) disc_slot_back();
//translate([0,0,3.25]) occulter_back();

module singlepack() {
        union() {
            translate([0,0,-2]) disc_slot_front();
            translate([0,0,0]) disc();
            translate([0,0,3.25]) occulter_front();
        }
}

module slots(nb=3, width=32) {
    for (i=[0:nb-1]) translate([i*32,0,-2]) disc_slot_front();
}

module discs(nb=3) {
    for (i=[0:nb-1]) translate([i*32,0,0]) rotate([0,0,-i*36]) disc();
}

module occulters(nb=3, width=32, engraving=0.5) {
    difference() {
        for (i=[0:nb-1]) {
           translate([i*32,0,3.25]) occulter_front();
        }
        rotate([0,0,180]) translate([-width,5,4.75]) linear_extrude(engraving+0.1) text("Points de vie",8, font = "style:bold", halign = "center", valign = "center");
    }      
}

//assembly

slots();
discs();
occulters();

//singlepack();




