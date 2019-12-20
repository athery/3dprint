include <../../lib/threads.scad>;
$fn = 200;
difference() {
    union() {
    cylinder(2,14, 14);
    translate([0,0,2]){
        
            cylinder(9,12,12);
        
    }
    }
    translate([0,0,2]) metric_thread(diameter=20, pitch=2, length=9.1, internal=true);
}