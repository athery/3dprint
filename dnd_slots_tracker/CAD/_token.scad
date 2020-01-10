module token() {
    linear_extrude(2) {
        scale(0.75) union() {
            intersection() {
                square([20,5]);
                translate([10, 15, 0]) circle(15);
            }
            children(0);
        }
    }
}


module semicoin_token(sign) {
    token() translate([0.5,4.5]) text(sign, 25, font="style:bold");
}


module shield_token() {
    token() translate([-4,3,0]) scale(3.25) import("shield.svg");
}

module flame_token(sign) {
    token() difference() {
            translate([-6, 4, 0]) scale(0.09) import("flame.svg");
            translate([4,6.5,0]) text(sign, 15, font="style:bold");
        }
}


module yinyang_token() {
    token() union() {
        difference() {
            translate([-3,4,0]) scale(0.075) import("yinyang.svg");
            translate([10.5,22.5,0]) circle(2);
        }
        translate([10.5,11,0]) circle(2);
    }
}

module flash_token() {
    token() translate([-4,-0.5,0]) {
        difference() {
            scale(0.25) import("flash.svg");
            square([50,2]);
        } 
    }
}

module harp_token() {
    token() translate([-2,3,0]) scale(0.075) import("harp.svg");
}

module pentagram_token() {
    token() translate([-3,3.5,0]) scale(0.425) import("pentagram.svg");
}

module smallflame_token() {
    token() translate([-6,3.5,0]) scale(0.09) import("flame.svg");
}

module smallflame2_token() {
    token() translate([-6,0.5,0]) scale(0.09) import("flame2.svg");
}

module smallflame3_token() {
    token() translate([-3.5,3,0]) scale(0.08) import("flame3.svg");
}

module smallflame4_token() {
    token() translate([-5.5,2.5,0]) scale(0.085) import("flame4.svg");
}
