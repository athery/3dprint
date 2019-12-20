difference() {
        cylinder(0.4,25,25);
        translate([-33.5, 0, -0.1]) cylinder(3,10,10);
        translate([0, -33.5, -0.1]) cylinder(3,10,10);
        translate([33.5, 0, -0.1]) cylinder(3,10,10);
        translate([0, 33.5, -0.1]) cylinder(3,10,10);
        translate([-23.5, -23.5, -0.1]) cylinder(3,10,10);
        translate([-23.5, 23.5, -0.1]) cylinder(3,10,10);
        translate([23.5, -23.5, -0.1]) cylinder(3,10,10);
        translate([23.5, 23.5, -0.1]) cylinder(3,10,10);
    }
translate([-17,-15,0]) linear_extrude(2) scale([0.2, 0.2, 1])  import("../D&D.svg");