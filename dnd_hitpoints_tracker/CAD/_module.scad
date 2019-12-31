// just the disc with grip side and numbers 0 to 9
module disc(
    radius=14,
    fontsize=6,
    thickness=3,
    padding=1, 
    hole_radius=2.1) 
{
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

//just the cloved cylinder to hold the disc down but let it spin
module pincher(
    radius=2, 
    thickness=3.5, 
    slit=2, 
    wall=1, 
    lip=0.25, 
    lip_height=1) 
{
    difference() {
        union() {
            cylinder(thickness, radius, radius);
            translate([0,0,thickness]) cylinder(lip_height,radius+lip, radius-lip);
        }
        translate([-radius-lip,-slit/2,0]) cube([2*(radius+lip),slit,thickness+lip_height+.1]);
        cylinder(thickness+lip_height+.1,radius-wall,radius-wall);
    }
}

//board, hollow disc and pincher to place the disc into
module disc_slot(
    disc_radius=14, 
    disc_thickness=3) 
{
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

//lid to hide the disc and show only selected number
module occulter(
    disc_radius=14, 
    thickness=2, 
    plot_height=4.5, 
    plot_width=3, 
    plot_thickness=1.8, 
    clearance_radius=3, 
    clearance_height=1, 
    wall=1, 
    window_width=6.5, 
    window_height=10) 
{    
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

// place multiple disc slots every 32mm
module slots(nb=3, width=32) {
    for (i=[0:nb-1]) translate([i*32,0,-2]) disc_slot();
}

//place multiple discs every 32mm
module discs(nb=3, spacing=32) {
    for (i=[0:nb-1]) translate([i*spacing,0,0]) disc();
}

//place multiple occulters/lids every 32mm
module occulters(label="Hit points",nb=3, width=32, engraving=0.5) {
    difference() {
        for (i=[0:nb-1]) {
           translate([i*32,0,3.25]) occulter();
        }
        rotate([0,0,180]) 
            translate([-width*(nb-1)/2,4,4.75]) 
                linear_extrude(engraving+0.1) {
                    text(label,8, font = "style:bold", halign = "center", valign = "center");
        }
    }      
}

//fully assembled model for 1 or 3 slots
module fulldemo(label, nb) {
    slots(nb);
    discs(nb);
    occulters(label, nb);
}

//uncomment to test
//$fn=100;
//fulldemo("~ Points de vie ~",3);
//fulldemo("Hit points",2);
//fulldemo("HD",1);