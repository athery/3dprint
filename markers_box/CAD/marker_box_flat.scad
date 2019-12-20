include <../../lib/threads.scad>;
$fn = 200;
difference() {
    cylinder(25,25, 25);
    translate([0,0,2]){
        difference() {
            cylinder(45,23, 23);
            cylinder(45,12,12);
        }
    }
    translate([0,0,15.1]) metric_thread(diameter=20, pitch=2, length=10, internal=true);
    translate([0,0,2]) cylinder(13.2,10,10);
}