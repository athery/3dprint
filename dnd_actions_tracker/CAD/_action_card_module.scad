module 2d_action_card(letter, letter_offset) {
    width=23;
    height=33;
    difference() {
            square([width, height]);
            translate([-1, 1.5, 0]) square([3, 5]);
            translate([-1, -1, 0]) square([1.5, 4]);
            translate([4, -1.5, 0]) square([width-8, 8]);
            translate([width-2, 1.5, 0]) square([3, 5]);
            translate([width-0.5, -1, 0]) square([2, 4]);
            translate([letter_offset, 10, 0]) text(letter, 20);
        }
}