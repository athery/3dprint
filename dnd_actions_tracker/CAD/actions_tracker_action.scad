include <_action_card_module.scad>;

linear_extrude(1.5) {
    union() {
        2d_action_card("A", 2.25);
        translate([0,17.5,0]) square([20,2]);
    }
}