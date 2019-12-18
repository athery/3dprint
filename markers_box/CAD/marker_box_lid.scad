$fn = 200;
union() {
    cylinder(2,25,25);
    translate([0,0,2]){
        ring(3,20,23);
        ring(3,7,10);
    }
}

module ring(height, inner_radius, outer_radius) {
    difference() {
        cylinder(height, outer_radius, outer_radius);
        translate([0,0,-0.1]) cylinder(height+0.2, inner_radius, inner_radius);
    }
  
}