include <_action_card_module.scad>;

linear_extrude(1.5) {
    union() {
        2d_action_card("R", 1.5);
        translate([6.35,17.9,0]) square([6,2.1]);
    }
}