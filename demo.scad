/*  This demo cut a 50x50x10 cube in 2 parts */
use <dovetail.scad>;

/* [Teeth] */

// Teeth count
Teeth_count = 5; // [2:10]

// Teeth height
Teeth_height = 8; // [2:20]

// Teeth clearance
Teeth_clearance = 4; // [1:10]

/* [General] */

// Displayed element choice
Debug_flag = false; // [true:Active, false:Unactive]

// Cube dimension
Cube_dimension = [50, 50, 10];

/**
 * [x, y, z]
 * - x : Teeth count
 * - y : Teeth height
 * - z : Teeth Clearance
 */
teeth = [Teeth_count, Teeth_height, Teeth_clearance / 10];

module amazing_design() {
    cube(size=Cube_dimension, center=true);
}

intersection() {
    amazing_design();
    cutter([0, 0, 0], Cube_dimension, teeth, true, Debug_flag);
}

intersection() {
    amazing_design();
    cutter([0, 0, 0], Cube_dimension, teeth, false, Debug_flag);
}
