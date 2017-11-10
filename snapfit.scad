$fn=5;

module beam(w,h,d,j) {
    translate([0,0,d/2+15-1])
    clip(30,30,30,3,7,false );
    minkowski() {
        sphere(r=1);
        difference() {
            cube([w,h,d], center=true);

            cube([w-j,h-j,d], center=true);
        }
    }
}

module socket_beam(w,h,d,j) {

    difference() {
        minkowski() {
            sphere(r=1);
            difference() {
                
                cube([w,h,d], center=true);
                cube([w-j,h-j,d], center=true);
            }
        }
        translate([0,0,-d/2+15-2])
        scale([1.06,1.06,1.06])
        clip(w-10,h-10,30,j,7, true);
    }

        //    translate([0,0,-1])
            //cube([w-j,h-j,d-1], center=true);
        //}
    
    
    
}

// j - jut
//k - drop
module clip(w,h,d, j,k,filled=true) {
    minkowski() {
        sphere(r=1);
        difference() {
            union() {
                translate([0,0,j])
                hull() {
                    translate([0,0,d/2-k])
                    cube([w,h,k], center=true);
                
                    cube([w+j,h+j,j], center=true);
                }
                // base camfer outer
                hull() {
                    translate([0,0,-d+16])
                    cube([40,40,1],center=true);

                    translate([0,0,(d/2-k-d/2)])
                    cube([30,30,1],center=true);
                }
                 
                cube([w,h,d], center=true);

                
  
                
            }
            cube([w-j,h-j,d],center=true);
           hull() {
                translate([0,0,-d/2])
                cube([40-j,40-j,1],center=true);

                translate([0,0,(d/2-k-d/2)])
                cube([30-j,30-j,1],center=true);
            }

 
            // 4x cylinder cutouts
            translate([w/2,h/2,d/2-k])
            cylinder(r=j*2,h=d,center=true);

            translate([-w/2,h/2,d/2-k])
            cylinder(r=j*2,h=d,center=true);
            
            translate([-w/2,-h/2,d/2-k])
            cylinder(r=j*2,h=d,center=true);
            
            translate([w/2,-h/2,d/2-k])
            cylinder(r=j*2,h=d,center=true);
     
     
            }
    }
   
    
    if (filled) {
        cube([w,h,d],center=true);
    }
    
}



//clip(30,30,30,3,7,false );

//translate([0,0,-30])
//beam(40,40,30,3);

//translate([0,0,80])
//socket_beam(40,40,180,4);





// now ... an example!

// leg with a ball end (LOL)
translate([0,0,90]) {
    difference() {
        sphere(r=30,center=true,$fn=100);
        sphere(r=27,center=true,$fn=100);
        translate([0,0,-30])
        cube([37,37,60],center=true);
    }
}
socket_beam(40,40,180,4);



// leg with a hook end
translate([100,0,0])
socket_beam(40,40,180,4);





//beam(40,40,200,3);