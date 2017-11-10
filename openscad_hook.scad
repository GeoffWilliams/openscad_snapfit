
module corner(s,w) {
    intersection() {
    x=s+5;
    rotate_extrude(convexity=100, $fn=100)
    translate([x,0,0])
    offset()
    difference() {
        square([s,s],center=true);
        square([s-w,s-w],center=true);
    }

    translate([0,0,-s])
    cube([s+x,s+x,s+x]);

    }
}

module endcap_blob(s,w) {
    difference() {
        hull() {
            sphere(r=s/2);
            
            linear_extrude(1)
            offset()
            difference() {
                square([s,s],center=true);
                square([s-w,s-w],center=true);
            }    
        }
     
    
        translate([0,0,s/2])
        cube([s,s,s], center=true);
    }
}

module endcap(s,w) {
    difference() {
        
        endcap_blob(s,w);
        translate(0,0,w)
        endcap_blob(s-w,w);
    }

}

module tube(s,w, l) {
    linear_extrude(l)
    offset()
    difference() {
        square([s,s],center=true);
        square([s-w,s-w],center=true);
    }
   
}

corner(40,2);

translate([-10,45,0])
rotate([0,90,0])
endcap(40,2);

translate([-10,45,0])
rotate([0,90,0])
tube(40,2,10);

translate([45,0,0])
rotate([90,0,0])
tube(40,2,80);

translate([5,-97,0])
rotate([0,90,35])
tube(40,2,60);