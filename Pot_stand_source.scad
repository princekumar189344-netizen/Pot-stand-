// Simple Pot Stand CAD Source
// Student style simple model
// Units: mm

$fn = 32;

// Main sizes
base_radius = 60;
base_height = 5;

rim_outer = 70;
rim_inner = 62;
rim_height = 12;

leg_height = 52;
leg_top_width = 14;
leg_bottom_width = 20;
leg_depth = 20;

foot_width = 24;
foot_depth = 26;
foot_height = 4;

// Main round base
cylinder(
    r = base_radius,
    h = base_height
);

// Raised circular rim
translate([0,0,base_height])
difference() {
    cylinder(r = rim_outer, h = rim_height);
    cylinder(r = rim_inner, h = rim_height);
}

// One simple leg
module leg(angle) {

    rotate([0,0,angle])
    translate([48,-leg_depth/2,-leg_height])
    hull() {

        // lower part
        cube([
            leg_bottom_width,
            leg_depth,
            4
        ]);

        // upper part
        translate([
            (leg_bottom_width-leg_top_width)/2,
            0,
            leg_height
        ])
        cube([
            leg_top_width,
            leg_depth,
            4
        ]);
    }
}

// Three legs
leg(90);
leg(210);
leg(330);

// Small feet
module foot(angle) {

    rotate([0,0,angle])
    translate([58,-foot_depth/2,-leg_height-foot_height+2])
    cube([
        foot_width,
        foot_depth,
        foot_height
    ]);
}

foot(90);
foot(210);
foot(330);

// End of simple pot stand
