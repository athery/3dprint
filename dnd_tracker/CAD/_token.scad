module square_token(sign) {
    linear_extrude(2) {
        square([20,5]);
        translate([2,4.5]) text(sign, 20, font="style:bold");
    }
}

module card_token(sign) {
    linear_extrude(2) {
        difference() {
            square([20,25]);
            translate([3.5,6]) text(sign, 16, font="style:bold");
        }
    }
}

module semicoin_token(sign) {
    linear_extrude(2) {
        intersection() {
            square([20,5]);
            translate([10, 15, 0]) circle(15);
        }
        translate([2,4.5]) text(sign, 20, font="style:bold");
    }
}

module coin_token(sign) {
    linear_extrude(2) {
        difference() {
            translate([7, 7, 0]) circle(12.5);
            text(sign, 16, font="style:bold");
        }
    }
}

module shield_token() {
    linear_extrude(2) {
        intersection() {
            square([20,5]);
            translate([10, 15, 0]) circle(15);
            }
        translate([-4,3,0]) scale(3.25) import("shield.svg");;
    }
}

module flame_token(sign) {
    linear_extrude(2) {
        intersection() {
            square([20,5]);
            translate([10, 15, 0]) circle(15);
            }
        difference() {
            translate([-7.5, 4, 0]) scale(0.1) import("flame.svg");
            translate([4,7,0]) text(sign, 16, font="style:bold");
        }
    }
}

module yinyang_token() {
    linear_extrude(2) {
        intersection() {
            square([20,5]);
            translate([10, 15, 0]) circle(15);
            }
        difference() {
            translate([-3,4,0]) scale(0.075) import("yinyang.svg");
            translate([10.5,22.5,0]) circle(2);
        }
        translate([10.5,11,0]) circle(2);
    }
}

module flash_token() {
    linear_extrude(2) {
        intersection() {
            square([20,5]);
            translate([10, 15, 0]) circle(15);
            }
        translate([-4,-0.5,0]) scale(0.25) import("flash.svg");
    }
}

module harp_token() {
    linear_extrude(2) {
        intersection() {
            square([20,5]);
            translate([10, 15, 0]) circle(15);
            }
        translate([-2,3,0]) scale(0.075) import("harp.svg");
    }
}

module pentagram_token() {
    linear_extrude(2) {
        intersection() {
            square([20,5]);
            translate([10, 15, 0]) circle(15);
            }
        translate([-3,3.5,0]) scale(0.425) import("pentagram.svg");
    }
}

module smallflame_token() {
    linear_extrude(2) {
        intersection() {
            square([20,5]);
            translate([10, 15, 0]) circle(15);
            }
        translate([-6,3.5,0]) scale(0.09) import("flame.svg");
    }
}

module smallflame2_token() {
    linear_extrude(2) {
        intersection() {
            square([20,5]);
            translate([10, 15, 0]) circle(15);
            }
        translate([-6,0.5,0]) scale(0.09) import("flame2.svg");
    }
}

module smallflame3_token() {
    linear_extrude(2) {
        intersection() {
            square([20,5]);
            translate([10, 15, 0]) circle(15);
            }
        translate([-3.5,3,0]) scale(0.08) import("flame3.svg");
    }
}

module smallflame4_token() {
    linear_extrude(2) {
        intersection() {
            square([20,5]);
            translate([10, 15, 0]) circle(15);
            }
        translate([-5.5,2.5,0]) scale(0.085) import("flame4.svg");
    }
}
