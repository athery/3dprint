module key_shape() {
    points = [
        [0,-6],
        [25,-14],
        [32.5,9],
        [28,14.5],
        [0,6]
    ];
    polygon(points);
}

module outer_shape() {
    points = [
        [0,-16],
        [24,-30],
        [37.5,-30],
        [45,-24],
        [45,24],
        [37.5,30],
        [24,30],
        [0,16]
    ];
    polygon(points);
}

module clip() {
    translate([0,1.4,0]) rotate([90,0,0]) linear_extrude(2.8) union() {
        square([1,3.5]);
        polygon([[1,2],[2,3],[1,3.5]]); 
    }
}

module cliphole() {
    translate([0,1.5,0]) rotate([90,0,0])linear_extrude(3) union() {
        square([1.1,4]);
        polygon([[1.1,1.9],[2.1,2.9],[2.1,4],[1.1,4]]); 
    }
}

module clips() {
    translate([0,12,3.5]) rotate([0,0,0]) clip();
    translate([0,-12,3.5]) rotate([0,0,0]) clip();
    translate([45,18,3.5]) rotate([0,0,180]) clip();
    translate([45,0,3.5]) rotate([0,0,180]) clip();
    translate([45,-18,3.5]) rotate([0,0,180]) clip();
    translate([31,30,3.5]) rotate([0,0,-90]) clip();
    translate([31,-30,3.5]) rotate([0,0,90]) clip();
    translate([14,24.18,3.5]) rotate([0,0,-60]) clip();
    translate([14,-24.18,3.5]) rotate([0,0,60]) clip();
}

module clipholes() {
    translate([0,0,7]) rotate([180,0,0]) mirror([1,0,0]) {
        translate([0,12,3.5]) rotate([0,0,0]) cliphole();
        translate([0,-12,3.5]) rotate([0,0,0]) cliphole();
        translate([45,18,3.5]) rotate([0,0,180]) cliphole();
        translate([45,0,3.5]) rotate([0,0,180]) cliphole();
        translate([45,-18,3.5]) rotate([0,0,180]) cliphole();
        translate([31,30,3.5]) rotate([0,0,-90]) cliphole();
        translate([31,-30,3.5]) rotate([0,0,90]) cliphole();
        translate([14,24.18,3.5]) rotate([0,0,-60]) cliphole();
        translate([14,-24.18,3.5]) rotate([0,0,60]) cliphole();
    }
}

module right_half_key_handle() {
    thickness = 7;
    key_thickness = 3;
    difference() {
        linear_extrude(thickness/2) outer_shape();
        translate([-0.1,0,thickness/2-key_thickness/2]) linear_extrude(key_thickness/2+0.1) key_shape();
    }
}

module right_half_key_handle_with_clips() {
    right_half_key_handle();
    clips();
}

module left_half_key_handle() {
    difference()    {
        mirror([1,0,0]) right_half_key_handle();
        clipholes();
    }
}


//comment one if you want to print only the other
translate([2.5,0,0]) right_half_key_handle_with_clips();
translate([-2.5,0,0]) left_half_key_handle();
