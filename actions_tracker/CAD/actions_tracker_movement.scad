include <_action_card_module.scad>;

linear_extrude(1.5) {
    union() {
        2d_action_card("M", 0);
    }
}