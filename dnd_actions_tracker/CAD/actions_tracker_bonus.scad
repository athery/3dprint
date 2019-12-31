include <_action_card_module.scad>;

linear_extrude(1.5) {
    union() {
        2d_action_card("B", 2);
        translate([0,18.8,0]) square([23,2.5]);
        //translate([7.5,10,0]) square([2,20]);
    }
}