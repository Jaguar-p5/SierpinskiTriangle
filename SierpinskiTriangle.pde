boolean[] keys = new boolean[222]; // 222 is the highest keyCode value i know

public void keyPressed(){keys[keyCode] = true;}
public void keyReleased(){keys[keyCode] = false;}

// True is pressed, False is released
public boolean getState(int keyCode) {
  return keys[keyCode];
}
float r;
float q;
float xOff;
float zOff;
float yOff;
void setup(){
size(1600, 1400, P3D);
frameRate(111);
xOff = 0;
zOff = 0;
yOff = 0;
r = 0.5;
q = 1;
}


void s(int len, float topX, float topY, float topZ){
if (len <= 20){
  beginShape();
stroke(topX+88, topY+88, topZ+88);
vertex(-len + topX, -len + topY, -len + topZ);
vertex( len + topX, -len + topY, -len + topZ);
vertex(   0 + topX,    0 + topY,  len + topZ);

vertex( len + topX, -len + topY, -len + topZ);
vertex( len + topX,  len + topY, -len + topZ);
vertex(   0 + topX,    0 + topY,  len + topZ);

vertex( len + topX, len + topY, -len + topZ);
vertex(-len + topX, len + topY, -len + topZ);
vertex(   0 + topX,   0 + topY,  len + topZ);

vertex(-len + topX,  len + topY, -len + topZ);
vertex(-len + topX, -len + topY, -len + topZ);
vertex(   0 + topX,    0 + topY,  len + topZ);
endShape();
}

else {
  s(len/2, topX, topY, topZ);
  s(len/2, topX-len*r, topY-len*r , topZ-len*q);
  s(len/2, topX+len*r, topY-len*r, topZ-len*q);
  s(len/2, topX+len*r, topY+len*r, topZ-len*q);
  s(len/2, topX-len*r, topY + len*r, topZ - len*q);
}
}

void draw(){
if(getState(65)) xOff += 0.1;
if(getState(83)) zOff += 0.01;
if(getState(68)) yOff += 0.1;
fill(22, 22, 22, 17);
rect(0, 0, 2222, 2222);
translate(width/2, height/2, 333);
stroke(255);
strokeWeight(0.65);
rotateX(PI/2 + xOff);
rotateZ(-PI/6 + zOff);
rotateY(yOff);
noFill();
s(300, 0, 0, 333);

}
