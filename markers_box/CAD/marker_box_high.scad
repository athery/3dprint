include <../../lib/threads.scad>;
$fn = 200;

box_height = 45;
screw_height = 9;

difference() {
    cylinder(box_height,25, 25);
    translate([0,0,2]){
        difference() {
            cylinder(box_height,23, 23);
            cylinder(box_height,12,12);
        }
    }
    translate([0,0, box_height - screw_height + 0.1]) metric_thread(diameter=20, pitch=2, length=screw_height, internal=true);
    translate([0,0,2]) cylinder(box_height - screw_height - 2 + 0.2,9,9);
}