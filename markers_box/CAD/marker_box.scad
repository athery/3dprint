$fn = 200;
difference() {
    cylinder(45,25, 25);
    translate([0,0,2]){
        difference() {
            cylinder(45,23, 23);
            cylinder(45,12,12);
        }
    }
    translate([0,0,2]) cylinder(45,10,10);
}