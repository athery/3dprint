padding = 10;
length = 190;
width = 50;
height = 6;
largeKnifeLength = (length - 4*padding)/3;
mediumKnifeLength = (length - 5*padding)/4;
smallKnifeLength = (length - 5*padding)/6;
nbMediumKnives = 2;
nbSmallKnives = 2;
sharpnerPocketRadius = 7.5;
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

difference() {
    cube([length,width,height]);
    for(i=[0:2]) {
        translate([(i+1)*padding+i*largeKnifeLength, padding, -0.1]) {
            knifeSlit(largeKnifeLength, knifeWidth, height+0.2, 1.2);
        }
    }
    for(i=[0:nbMediumKnives-1]) {
        translate([(i+1)*padding+i*mediumKnifeLength, width-padding-knifeWidth, -0.1]) {
            knifeSlit(mediumKnifeLength, knifeWidth, height+0.2, 1.5);
        }
    }
    
    for(i=[0:nbSmallKnives-1]) {
        translate([(i+1+nbMediumKnives)*padding+ nbMediumKnives*mediumKnifeLength + i*smallKnifeLength, width-padding-knifeWidth, -0.1]) {
            knifeSlit(smallKnifeLength, knifeWidth, height+0.2, 2);
        }
    }
    
    translate([(2+nbMediumKnives+nbSmallKnives)*padding+ nbMediumKnives*mediumKnifeLength + nbSmallKnives*smallKnifeLength - sharpnerPocketRadius/2, width-padding-knifeWidth, -0.1]) {
            cylinder(height+0.2, sharpnerPocketRadius, sharpnerPocketRadius);
        }
    
    //delete for full print
    //translate([2*padding + largeKnifeLength, -1, -1]) {
        //cube ([200, 200, 12]);
      //  }
}
    
    

