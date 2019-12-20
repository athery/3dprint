include <../../lib/threads.scad>;
$fn = 200;
union() {
    difference() {
        cylinder(2,25,25);
        translate([-33, 0, -0.1]) cylinder(3,10,10);
        translate([0, -33, -0.1]) cylinder(3,10,10);
        translate([33, 0, -0.1]) cylinder(3,10,10);
        translate([0, 33, -0.1]) cylinder(3,10,10);
        translate([-23.2, -23.2, -0.1]) cylinder(3,10,10);
        translate([-23.2, 23.2, -0.1]) cylinder(3,10,10);
        translate([23.2, -23.2, -0.1]) cylinder(3,10,10);
        translate([23.2, 23.2, -0.1]) cylinder(3,10,10);
    }
    translate([0,0,2]){
        difference() {
            metric_thread (diameter=18.5, pitch=2, length=7);
            cylinder(7.1, 7, 7);
        };
    }
}
