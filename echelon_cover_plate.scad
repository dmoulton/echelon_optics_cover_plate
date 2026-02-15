include <BOSL2/std.scad>;
include <BOSL2/screws.scad>

$fn = 64+0;

/* [Cover Size] */
bottom_w = 26;
top_w = 18;
length = 47;
height = 4;

/* [Screw Holes] */
hole_gutter = 6;
hole_offset = 19; // From back of the plate
hole_cb = 1; // Counter bore depth
screw_size = "6-32";

/* [Edge Notches] */
notch_width = 0.85;
notch_length = 6.5;
notch_offsets = [6.25, 15.6, 25]; // from the back of the plate
 
// -------

screw_params = str(screw_size, ",", height + .1);

module one_notch() {
    cuboid([notch_width * 2,notch_length,4], rounding=.5, edges="Z", anchor=BOTTOM+CENTER+FORWARD);
}

module notches(){
    for (y = notch_offsets) {
        translate([0, y, 0])
            one_notch();
        translate([bottom_w, y, 0])
            one_notch();
    }
}

module screw_holes() {
    translate([bottom_w - hole_gutter, length - hole_offset, height])
        screw_hole(screw_params, head="flat", counterbore=hole_cb, anchor=TOP);

    translate([hole_gutter, length - hole_offset, height])
        screw_hole(screw_params, head="flat", counterbore=hole_cb, anchor=TOP);
}

difference() {
    prismoid(size1=[bottom_w,length], size2=[top_w,length], h=height, anchor=BOTTOM+FORWARD+LEFT);
    screw_holes();
    notches();  
}
