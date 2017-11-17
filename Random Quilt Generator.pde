//These are the variables I used to ake this program.
PGraphics img;
int seed;
int s = 200;
int xpos=50;
int ypos=50;
int w=50;
int h = 50;
float col = 0;
float row = 0;
float panelSize=50;
float r=0;
float g=0;
float b=0;
float ryPos=0;
float exPos=30;
float rxPos=random(265);
float eyPos=10;

//This function makes the size of the window 800x600.
void setup() {
  size(800, 600);         //Makes the size of the window 800x600
  background(100);        //Makes grey background
}

//This function generates a random quilt size when key is pressed
void keyPressed() {
  background(100);        //Makes grey background
  drawColumn();           //Calls drawColumn function
  drawRow();              //Calls drawRow function
  b=random(256);          //Produces a random value for int b
  panelSize=panelSize+1;  //Makes the panel size grow after each click
  w=w+1;                  //Allows for offscreen image to grow in size
  h=h+1;  //Allows for offscreen image to grow in size
}

//This function calls the drawQuilt function and allows for change in size to happen
void draw() {
  drawQuilt();
}

//This function draws the quilt
void drawQuilt() {
  for (float x = 0; x<=row; x=x+panelSize) {
    for (float y = 0; y<=col; y=y+panelSize) {
      drawPanel(x+10, y+10, w, h);      //Provides offscreen image
      if ((x+y)%2==0) {
        fill(x, y, b);                  //Makes fill for the panels
        rect(x+10, y+10, panelSize, panelSize);             //This is the panel
      }
    }
  }
}

//This function randomizes the row quantity
void drawRow() {
  row = random(750);          //Provides random number for row
}

//This function randomizes the column quantity
void drawColumn() {
  col=random(550);            //Provides random munber for column
}

//This function will be the offscreen image
void drawPanel(float x, float y, int w, int h) {
  PGraphics img = createGraphics(w, h);
  img.beginDraw();
  img.background(255);
  img.stroke(0);
  img.fill(255, 0, 0);
  img.ellipse(mouseX, mouseY, w/4, h/4);
  img.translate(w/2, h/2);
  img.fill(#0D55A0);
  img.rect(rxPos, ryPos, 20, 10);
  img.ellipse(exPos+25, eyPos, 10, 10);
  img.ellipse(exPos+15, eyPos, 10, 10);
  img.rotate(random(PI));
  img.fill(x, y, 0);
  img.ellipse(0, 0, random(0, 10), random(0, 20));
  img.endDraw();
  image(img, x, y);
  rxPos=rxPos+0.1;
  exPos=exPos+0.1;
  if (rxPos > 50) {
    rxPos=-50;
    exPos=-60;
  }
}
