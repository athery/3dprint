include <../../lib/threads.scad>;
$fn = 200;
union() {
    difference() {
        cylinder(2,12,12);
    }
    translate([0,0,2]){
        difference() {
            metric_thread (diameter=18.5, pitch=2, length=7);
            cylinder(7.1, 7, 7);
        };
    } 
}
