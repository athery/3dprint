module token() {
    linear_extrude(2) {
        scale(0.75) union() {
            polygon([[1,0],[0,5],[20,5],[19,0]]);
            children(0);
        }
    }
}

//text_token("5");
module text_token(sign) {
    token() translate([0.5,4.5]) text(sign, 25, font="style:bold");
}

//shield_token();
module shield_token() {
    token() translate([-4,3,0]) scale(3.25) import("shield.svg");
}

//flame_text_token("8");
module flame_text_token(sign) {
    token() difference() {
            translate([-6, 4, 0]) scale(0.09) import("flame.svg");
            translate([4,6.5,0]) text(sign, 15, font="style:bold");
        }
}


// yinyang_token();
module yinyang_token() {
    token() union() {
        difference() {
            translate([-3,4,0]) scale(0.075) import("yinyang.svg");
            translate([10.5,22.5,0]) circle(2);
        }
        translate([10.5,11,0]) circle(2);
    }
}

//flash_token();
module flash_token() {
    token() translate([-4,-0.5,0]) {
        difference() {
            scale(0.25) import("flash.svg");
            square([50,2]);
        } 
    }
}

//harp_token();
module harp_token() {
    token() translate([-2,3,0]) scale(0.075) import("harp.svg");
}

//pentagram_token();
module pentagram_token() {
    token() translate([-3,3.5,0]) scale(0.425) import("pentagram.svg");
}


//flame_token();
module flame_token() {
    token() translate([-3.5,3,0]) scale(0.08) import("flame3.svg");
}


//axes_token();
module axes_token() {
    token() translate([-3.5,3,0]) scale(0.155) import("axes.svg");
}

//text_token("5");
//shield_token();
//flame_text_token("5");
//yinyang_token();
//flash_token();
//harp_token();
pentagram_token();
//flame_token();
//axes_token();