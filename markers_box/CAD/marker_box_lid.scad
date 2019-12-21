include <../../lib/threads.scad>;
$fn = 200;

screw_height = 7;

union() {
    difference() {
        cylinder(2,25,25);
        translate([-33.5, 0, -0.1]) cylinder(3,10,10);
        translate([0, -33.5, -0.1]) cylinder(3,10,10);
        translate([33.5, 0, -0.1]) cylinder(3,10,10);
        translate([0, 33.5, -0.1]) cylinder(3,10,10);
        translate([-23.5, -23.5, -0.1]) cylinder(3,10,10);
        translate([-23.5, 23.5, -0.1]) cylinder(3,10,10);
        translate([23.5, -23.5, -0.1]) cylinder(3,10,10);
        translate([23.5, 23.5, -0.1]) cylinder(3,10,10);
    }
    translate([0,0,2]){
        difference() {
            metric_thread (diameter=18.5, pitch=2, length=screw_height);
            cylinder(screw_height+0.1, 7, 7);
        };
    }
}
