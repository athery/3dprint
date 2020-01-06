$fn=200;
include <_module.scad>;

rotate([180,0,0]) occulters("HD",1);

//prototype just for testing disc fastening
//intersection() {
//    rotate([180,0,0]) occulters("HD",1);
//    translate([-0.2,-20,-20]) cube(40,40,40);
//}