use <publicDomainGearV1.1.scad>



module zembatka_zas(liczba_zembow)
{
     difference()
    {
    union()
        {
        gear(mm_per_tooth=6,number_of_teeth=liczba_zembow,hole_diameter=5,         thickness=30, twist=0);
 
          
        }
   
    }  
    
}

module sruba(wysokosc)
{
   cylinder(r=2,h=wysokosc,center=true,$fn=6);
}


module zembatka50(liczba_zembow)
{
     difference()
    {
    union()
        {
        gear(mm_per_tooth=6,number_of_teeth=liczba_zembow,hole_diameter=80,         thickness=45, twist=0);
   
        }
            cylinder(r=40,h=100,center=true,$fn=100);
            translate([-43,0,15.1])
            sruba(15);
            translate([43,0,15.1])
            sruba(15);
   
    }  
    
}
module kamera()
{
    difference()
    {
        union()
        {
            cube([180,30,5],true);
            
        }
        
           cube([18,10,20],true);
        
           translate([-43,0,0])
            sruba(15);
            translate([43,0,0])
            sruba(15);
        
           translate([-20,0,0])
            sruba(15);
            translate([20,0,0])
            sruba(15);
        
           translate([-30,0,0])
            sruba(15);
            translate([30,0,0])
            sruba(15);
        
           translate([-50,0,0])
            sruba(15);
            translate([50,0,0])
            sruba(15);
        
           translate([-60,0,0])
            sruba(15);
            translate([60,0,0])
            sruba(15);
            
              translate([-70,0,0])
            sruba(15);
            translate([70,0,0])
            sruba(15);
                 translate([-80,0,0])
            sruba(15);
            translate([80,0,0])
            sruba(15);
    }
    
}

module zembatka_glowna(liczba_zembow)
{
     difference()
    {
    union()
        {
        gear(mm_per_tooth=6,number_of_teeth=liczba_zembow,hole_diameter=80,         thickness=30, twist=0);
   

        }

            translate([-43,0,8])
            sruba(15);
            translate([43,0,8])
            sruba(15);
   
    }  
    
}

module silnik()
{ 
   difference()
    { 
    union()
        {
        //translate([-25,0,-24])
        cube([48,48,64],true); 
        translate([23,0,0])
        cube([3,100,64],true);    
   

        translate([-20.5,-53.8,-30.5])
        cube([90,60,3],true);
            
        }
        translate([0,0,2.1])
        cube([44,44,60],true);
        translate([-25,0,0])
        cube([60,10,100],true); 
        translate([25,-30,29])
        rotate([90,90,90])
        sruba(10);
        translate([25,30,29])
        rotate([90,90,90])
        sruba(10);
        translate([25,-40,29])
        rotate([90,90,90])
        sruba(10);
        translate([25,40,29])
        rotate([90,90,90])
        sruba(10);
        
        translate([-60,-29.5,-30.5])
        sruba(20);
          translate([-60,-78,-30.5])
        sruba(20);
              translate([-8,-34.5,-30.5])
        sruba(20);
        
                 translate([-8,-62.5,-30.5])
        sruba(20);

    }
}

module podloze()
{
    difference()
    {
        union()
        {
            translate([-30,0,0])
            cube([130,100,5],true);
            
            //wtyki
            translate([-53.4,0,22.5])
            cylinder(r=20,h=45,center=true,$fn=50);
               
   
            
        }
        translate([-87.6,30,0])
        rotate([90,90,90])
        sruba(20);
        translate([-87.6,-30,0])
        rotate([90,90,90])
        sruba(20);
        translate([-87.6,40,0])
        rotate([90,90,90])
        sruba(20);
        translate([-87.6,-40,0])
        rotate([90,90,90])
        sruba(20);
        
        translate([-15,30,0])
        sruba(20);
           translate([15,30,0])
        sruba(20);
           translate([-15,-30,0])
        sruba(20);
           translate([15,-30,0])
        sruba(20);
        
        translate([-53.4,0,12.5])
        cube([18,10,120],true);
        
    }
    
    
}

module wtyk()
{
    difference()
    {
        union()
        {
            
           translate([6,0,22])
           cube([10,15,17],true); 
            
           translate([6,0,-7])
           cube([10,36,50],true); 
            
           translate([-18.5,0,-35])
           cube([59,36,6],true); 
            
      
       
            
    

        }
        
           translate([6,0,22])
           cube([11,5,20],true); 
        
        translate([0,0,-1])
        rotate([0,90,0])
        cylinder(r=14.65,h=50,center=true,$fn=100);
                translate([-17,0,-30])
        sruba(50);
                translate([-27,0,-30])
        sruba(50);
                translate([-37,0,-30])
        sruba(50);
                translate([-32,5,-30])
        sruba(50);
                translate([-32,-5,-30])
        sruba(50);
        
                 translate([6,0,25])
            rotate([90,0,0])
           sruba(50); 
        
    
        
       /* 
        translate([-33.5,12,-35])
        rotate([0,90,0])
        sruba(30);
        translate([-33.5,-12,-35])
        rotate([0,90,0])
        sruba(30);
    */
                 translate([-37,0,-33.4])
        cylinder(r=5,h=3,center=true,$fn=100);
                translate([-32,5,-33.4])
        cylinder(r=5,h=3,center=true,$fn=100);
                translate([-32,-5,-33.4])
        cylinder(r=5,h=3,center=true,$fn=100);
                         translate([-27,0,-33.4])
        cylinder(r=5,h=3,center=true,$fn=100);
                         translate([-17,0,-33.4])
        cylinder(r=5,h=3,center=true,$fn=100);
    }
    
    
}


module rozstaw()
{
    difference()
    {
        union()
        {
            cube([180,40,7],true);
            
        }
        
        
            translate([-40,0,0])
            sruba(15);
            translate([40,0,0])
            sruba(15);
            translate([-30,0,0])
            sruba(15);
            translate([30,0,0])
            sruba(15);
            translate([-20,0,0])
            sruba(15);
            translate([20,0,0])
            sruba(15);
            translate([-10,0,0])
            sruba(15);
            translate([10,0,0])
            sruba(15);
            translate([0,0,0])
            sruba(15);
            translate([50,0,0])
            sruba(15);
            translate([-50,0,0])
            sruba(15);  
            translate([60,0,0])
            sruba(15);
            translate([-60,0,0])
            sruba(15);   
            translate([70,0,0])
            sruba(15);
            translate([-50,0,0])
            sruba(15);   
            translate([-70,0,0])
            sruba(15);
            translate([-80,0,0])
            sruba(15);   
            translate([80,0,0])
            sruba(15); 
            
            translate([-40,10,0])
            sruba(15);
            translate([40,10,0])
            sruba(15);
            translate([-30,10,0])
            sruba(15);
            translate([30,10,0])
            sruba(15);
            translate([-20,10,0])
            sruba(15);
            translate([20,10,0])
            sruba(15);
            translate([-10,10,0])
            sruba(15);
            translate([10,10,0])
            sruba(15);
            translate([0,10,0])
            sruba(15);
            translate([50,10,0])
            sruba(15);
            translate([-50,10,0])
            sruba(15);  
            translate([60,10,0])
            sruba(15);
            translate([-60,10,0])
            sruba(15);   
            translate([70,10,0])
            sruba(15);
            translate([-50,10,0])
            sruba(15);   
            translate([-70,10,0])
            sruba(15);
            translate([-80,10,0])
            sruba(15);   
            translate([80,10,0])
            sruba(15); 
            
            translate([-40,-10,0])
            sruba(15);
            translate([40,-10,0])
            sruba(15);
            translate([-30,-10,0])
            sruba(15);
            translate([30,-10,0])
            sruba(15);
            translate([-20,-10,0])
            sruba(15);
            translate([20,-10,0])
            sruba(15);
            translate([-10,-10,0])
            sruba(15);
            translate([10,-10,0])
            sruba(15);
            translate([0,-10,0])
            sruba(15);
            translate([50,-10,0])
            sruba(15);
            translate([-50,-10,0])
            sruba(15);  
            translate([60,-10,0])
            sruba(15);
            translate([-60,-10,0])
            sruba(15);   
            translate([70,-10,0])
            sruba(15);
            translate([-50,-10,0])
            sruba(15);   
            translate([-70,-10,0])
            sruba(15);
            translate([-80,-10,0])
            sruba(15);   
            translate([80,-10,0])
            sruba(15); 
     
    }
    
}



color("red")
translate([119.5,0,29.5])
podloze();

color("blue")
silnik();

translate([8.25,0,50])  
color("yellow")
zembatka_zas(10);

color("green")

translate([65.7,0,54.6])
rotate([0,0,10.75])
zembatka50(50);



translate([65.7,0,79.5])
rotate([0,0,10.75])
kamera();

rotate([0,0,10.75])
rotate([0,0,90])
translate([-12,5.5,85.5])
rozstaw();


color("pink")
rotate([0,0,10.75])
rotate([0,0,180])
translate([33,12,127])
wtyk();

color("pink")
rotate([0,0,10.75])
rotate([0,0,180])
translate([33,-68,127])
wtyk();

color("pink")
rotate([0,0,10.75])
rotate([0,0,180])
translate([33,92,127])
wtyk();

/*
color("pink")
translate([160,18,120])
rotate([0,0,10.75])
wtyk();

