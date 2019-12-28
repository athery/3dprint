$fn=100;
padding = 10;
length = 190;
width = 50;
height = 6;
largeKnifeLength = (length - 4*padding)/3;
mediumKnifeLength = (length - 5*padding)/4;
smallKnifeLength = (length - 5*padding)/6+1;
nbMediumKnives = 2;
nbSmallKnives = 2;
sharpnerPocketRadius = 5.6;
knifeWidth = 6;

module knifeSlit(l, w, h, offset){
        slitPoints = [
          [  0,  offset,  0 ],  //0
          [ l,  offset,  0 ],  //1
          [ l,  w-offset,  0 ],  //2
          [  0,  w-offset,  0 ],  //3
          [  0,  0,  h ],  //4
          [ l,  0,  h ],  //5
          [ l,  w,  h ],  //6
          [  0,  w,  h ]]; //7
          
        slitFaces = [
          [0,1,2,3],  // bottom
          [4,5,1,0],  // front
          [7,6,5,4],  // top
          [5,6,2,1],  // right
          [6,7,3,2],  // back
          [7,4,0,3]]; // left
          
        polyhedron( slitPoints, slitFaces );
    }
    
module large_knife_slit() {
    knifeSlit(largeKnifeLength, knifeWidth, height+0.2, 1.2);
}

module medium_knife_slit() {
    knifeSlit(mediumKnifeLength, knifeWidth, height+0.2, 1.5);
}

module small_knife_slit() {
    knifeSlit(smallKnifeLength, knifeWidth, height+0.2, 2);
}

module sharpner_slit() {
    cylinder(height+0.2, sharpnerPocketRadius, sharpnerPocketRadius);
}

module real_holder() {
    difference() {
        cube([length,width,height]);
        for(i=[0:2]) {
            translate([(i+1)*padding+i*largeKnifeLength, padding, -0.1]) large_knife_slit();
        }
        for(i=[0:nbMediumKnives-1]) {
            translate([(i+1)*padding+i*mediumKnifeLength, width-padding-knifeWidth, -0.1]) medium_knife_slit();
        }
        
        for(i=[0:nbSmallKnives-1]) {
            translate([(i+1+nbMediumKnives)*padding+ nbMediumKnives*mediumKnifeLength + i*smallKnifeLength, width-padding-knifeWidth, -0.1]) small_knife_slit();
        }
        
        translate([length-padding-sharpnerPocketRadius, width-padding-sharpnerPocketRadius, -0.1]) sharpner_slit();
    }
}

module test_holder() {
    difference() {
        cube([largeKnifeLength+10,width-15,height]);
        translate([5,5,-0.1]) large_knife_slit();
        translate([5,15,-0.1]) medium_knife_slit();
        translate([5,25,-0.1]) small_knife_slit();
        translate([50,25,-0.1]) sharpner_slit();
    }
}

module sharpner_holder() {
    difference() {
        cube([15,15,height]);
        translate([7.5,7.5,-0.1]) sharpner_slit();
    }
}

real_holder();
//test_holder();
//sharpner_holder();
    

