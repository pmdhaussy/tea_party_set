/**
 * Tea party elements
 */
use <../Librairies/dotSCAD-3.2.2/src/rounded_cube.scad>
use <../Librairies/dotSCAD-3.2.2/src/rounded_cylinder.scad>
$fn=120;

cooking_knife();
translate([0, 30, 0]) cooking_fork();

module cooking_knife() {
  handle();

  // blade
  translate([70, 17, 4.5]) {
    minkowski() {
      intersection() {
        r=200;
        translate([10, 188, 0]) cylinder(2, r, r);
        translate([0, -22, 0]) rounded_cube([70, 22, 2], 2);
      }
      cylinder(0.001, 2, 2);
    }
  }
  
  // blade reinforcement
  translate([72, 13, 5.5])
    rotate([0, 90, 0])
      rounded_cylinder([3.5, 1.5], 25, 1);
}

module cooking_fork() {
  handle();

  // body
  translate([70, 6, 4.5]) {
    cube([45, 10, 2]);
  }
  // teeth
  translate([110, 3, 4.5]) {
    minkowski() {
      difference() {
        cube([30, 16, 2]);
        translate([1, 1, -1]) cube([30+1, 14, 2+2]);
      }
      cylinder(0.001, 2, 2);
    }
  }
}

module handle() {
  difference() {
    rs=1;
    translate([rs, rs, rs]) {
      minkowski() {
        union() {
          translate([10, 10, 0]) cylinder(9, 10, 10);
          minkowski() {
            s=1;
            r=2;
            translate([10, r, 0]) cube([63-2*r, 20-2*r, 9-s]);
            cylinder(s, r, r);
          }
        }
        sphere(rs);
      }
    }
    // Hook hole
    translate([4.5, 6.5, -1]) {
      h=11+2;
      translate([4.5, 4.5, 0]) cylinder(h, 4.5, 4.5);
      translate([4.5, 0, 0]) cube([11, 9, h]);
      translate([11+4.5, 4.5, 0]) cylinder(h, 4.5, 4.5);
    }
  }
}
