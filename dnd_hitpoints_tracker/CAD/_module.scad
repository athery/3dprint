// just the disc with grip side and numbers 0 to 9
module disc(
    radius=14,
    fontsize=6,
    thickness=2.8,
    padding=1, 
    hole_radius=3.75) 
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
            translate([0, 0, -0.1]) {
                difference(){
                    cylinder(5,5.5,5.5);
                    translate([0,0,-0.1]) cylinder(5.2,4.5, 4.5);
                    translate([-7,-3.5,-0.1]) cube([14,7,thickness+0.2]);    
                }
                rotate([0,0,-38]) cube([1.5,5.5,5]);
                rotate([0,0,-38+180]) cube([1.5,5.5,5]);
            }
    }
    rotate([0,0,-36]) translate([0,3.75,0]) cylinder(thickness,0.75,0.75);
    rotate([0,0,-36+180]) translate([0,3.75,0]) cylinder(thickness,0.75,0.75);
    
}

translate([50, 0, 0]) {
    difference(){
        }
}

//just the cloved cylinder to hold the disc down but let it spin
module pincher(
    radius=3.75, 
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

module trapezoid_prism(height, top_width, bottom_width, length) {
    points = [
        [0,0,0],[bottom_width,0,0],
        [bottom_width,length,0],[0,length,0],
        [(bottom_width-top_width)/2,0,height],[bottom_width-((bottom_width-top_width)/2),0,height],
        [bottom_width-((bottom_width-top_width)/2),length,height],[(bottom_width-top_width)/2,length,height],
    ];
    faces = [
              [0,1,2,3],  // bottom
              [4,5,1,0],  // front
              [7,6,5,4],  // top
              [5,6,2,1],  // right
              [6,7,3,2],  // back
              [7,4,0,3]]; // left;
    polyhedron(points, faces);
}

//board, hollow disc and pincher to place the disc into
module disc_slot(
    disc_radius=14, 
    disc_thickness=3) 
{
    slot_radius = disc_radius + 1;
    slot_depth = disc_thickness+0.1;
    board_size = 2*(disc_radius+2);
    board_thickness = slot_depth + 1.6;
    
    difference() {
        translate([-board_size/2, -board_size/2, 0]) cube([board_size,board_size-3.5,board_thickness]);
        translate([0,0,slot_depth/2]) cylinder(slot_depth+0.1,slot_radius,slot_radius);
        
        translate([-board_size/2+2.5-0.1,-board_size/2-0.1,board_thickness-2.1]) trapezoid_prism(2.2,1.7,2.2,board_size);
        
        translate([board_size/2-2.5-2-0.1,-board_size/2-0.1,board_thickness-2.1]) trapezoid_prism(2.2,1.7,2.2,board_size);
        
         translate([-board_size/2+2.4,-board_size/2+3.5,board_thickness-2.1]) cube([board_size-4.8,6.5,3]);
    }
    translate([0,0,board_thickness - slot_depth]){
        difference() {
            cylinder(disc_thickness, 3.3, 3.3);
            for (i = [0:9]) {
                rotate([0,0,i*36]) translate([0,3.8,0]) cylinder(slot_depth+0.1,1,1);
            }
        }
    }
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
    front_clearance = 3.5;
    
    rotate([0,0,180]) {
        difference() {
            translate([-board_size/2, -board_size/2+3.5, 0]) cube([board_size,board_size-front_clearance,thickness]);
            //translate([0, 0, -0.1]) cylinder(clearance_height+0.1, clearance_radius, clearance_radius);
            points = [
                [0,0,0],[window_width,0,0],
                [window_width,window_height,0],[0,window_height,0],
            [-2,-2,thickness+0.2],[window_width+2,-2,thickness+0.2],
                [window_width+2,window_height+2,thickness+0.2],[-2,window_height+2,thickness+0.2],
            ];
            faces = [
              [0,1,2,3],  // bottom
              [4,5,1,0],  // front
              [7,6,5,4],  // top
              [5,6,2,1],  // right
              [6,7,3,2],  // back
              [7,4,0,3]]; // left;
            translate([-window_width/2, -disc_radius-2*wall, -0.1]) polyhedron(points, faces);
            
        }
    }
    
    backprism_length =3;
    frontprism_length = 3;
    
    translate([-board_size/2+2.5,-board_size/2,-2]) trapezoid_prism(2.1,1.5,2,backprism_length);
    
    translate([board_size/2-2.5-2.,-board_size/2,-2]) trapezoid_prism(2.1,1.5,2,backprism_length);
    
    translate([-board_size/2+2.5,board_size/2-front_clearance-frontprism_length,-2]) trapezoid_prism(2.1,1.5,2,frontprism_length);
    
    translate([board_size/2-2.5-2.,board_size/2-front_clearance-frontprism_length,-2]) trapezoid_prism(2.1,1.5,2,frontprism_length);
}

// place multiple disc slots every 32mm
module slots(nb=3, width=32) {
    for (i=[0:nb-1]) translate([i*32,0,-1.6]) disc_slot();
}

//place multiple discs every 32mm
module discs(nb=3, spacing=32) {
    for (i=[0:nb-1]) translate([i*spacing,0,0]) disc();
}

//place multiple occulters/lids every 32mm
module occulters(label="Hit points",nb=3, width=32, engraving=1) {
    difference() {
        for (i=[0:nb-1]) {
           translate([i*32,0,3.1]) occulter();
        }
        rotate([0,0,180]) 
            translate([-width*(nb-1)/2,4,4.1]) 
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
$fn=100;
fulldemo("~ Points de vie ~",3);
//fulldemo("Hit points",2);
//$fn=100;
//fulldemo("HD",1);