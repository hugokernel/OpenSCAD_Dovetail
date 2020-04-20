# Dovetail parametric generator for OpenSCAD / Générateur de queue d'aronde pour OpenSCAD

You want to print a OpenSCAD design too large for your 3D printer ?

Try to cut them with a dovetail !

![Dovetail](https://github.com/hugokernel/OpenSCAD_Dovetail/blob/master/example.png?raw=true)

## Use

Open the demo.scad file with OpenSCAD to see the cut in action.

With OpenSCAD version higher than 2019.05, you can use customizer to apply some settings.

## Example

```OpenSCAD
use <dovetail.scad>;

// Your amazing design you want to cut
module amazing_design() {
    cube(size=[50, 50, 10], center=true);
}

// First, setup the cutting position: middle cut
position = [0, 0, 0];

// Next, setup the dimension of the cut: use the bounding box of your design
dimension = [50, 50, 10];

// Finally, setup the dovetail:
// - Teeth count
// - Teeth height
// - Teeth Clearance
teeth = [5, 8, 0.5];

// Now, cut !

// Extract the first part...
intersection() {
    amazing_design();
    cutter(position=[0, 0, 0], dimension=dimension, teeths=teeth, male=true);
}

// ... and the second part
intersection() {
    amazing_design();
    cutter(position=[0, 0, 0], dimension=dimension, teeths=teeth, male=false);
}
```
