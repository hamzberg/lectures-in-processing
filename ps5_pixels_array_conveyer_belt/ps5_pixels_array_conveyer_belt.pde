/*
 * Title:   Processing Sketch No. 5: Conveyer Belt with pixels[]
 * Author:  hamzberg
 * Version: 1.0
 * Date:    16 March 2023
 * License: MIT
 * 
 * Description:
 *   - Conveyer belt effect created by copying the pixels based on
 *     Mouse's X-axis position.
 *   - Intended to demonstrate manipulation of pixels using the
 *     pixels[].
 *
 * Controls:
 *   - Hold down any mouse button to draw.
 *
 * Note:
 *   - Image Mode uses an image generated by Processing.
 *   - Uncomment the all the code underneath the "// Image Mode" 
 *     comments code to see it.
 *   - May run at a low framerate depending on user's
 *     computer.
 * 
 * !BUG!
 *   - If the user's mouse button is held down while they move
 *     the cursor to the left side outside of the window, the sketch
 *     will crash.
 */

// Image Mode
// PGraphics graphics_Sunflower;
// PImage image_Sunflower;

void setup() {
  
  size(480, 480);
  pixelDensity(displayDensity());
  noStroke();
  frameRate(60);
  
  // Image Mode
  // graphics_Sunflower = createGraphics(720, 720);  
  // imageMode(CENTER);

}

void draw() {

  // Image Mode
  // graphicsSunflower();  
  // image_Sunflower = loadImage("graphics_Sunflower.PNG");
  
 if (mousePressed) {
   
   // Green and Blue color values are manipulated by mouseX and mouseY
   fill(255, mouseX, mouseY);
   
   // Ellipse position correlates to mouse position
   // Ellipse size correlates to half of mouse position
   ellipse(mouseX, mouseY, mouseX/2, mouseX/2);
   
   // Image Mode
   // image_Sunflower.resize(abs(mouseX/2), abs(mouseX/2));
   // image(image_Sunflower, mouseX, mouseY);
   
 }
 
 conveyerBelt();
 
}

void conveyerBelt() {
  
 loadPixels();
 
 for (int x = 0; x < (pixels.length - mouseX); x++) {
  
   // Speed based on MouseX
    pixels[x] = pixels[x + (mouseX / 2)];
   
   // Normal Speed
   //pixels[x] = pixels[x + 1];
   
   // x10 Speed
   //pixels[x] = pixels[x + 10];
   
 }
 
 updatePixels();  
  
}

// Image Mode
/*void graphicsSunflower() {
 
    //commands - creates the Sunflower graphic
  graphics_Sunflower.beginDraw();
    int fill_Switch = 0;
    graphics_Sunflower.noStroke();
    for (int i = 0; i < 135; i += 45){
      if (fill_Switch % 2 == 0) { graphics_Sunflower.fill(0); } 
        else if (fill_Switch % 2 == 1) { graphics_Sunflower.fill(255, 125, 0); }
      graphics_Sunflower.circle(360, 360, 360 - i);    
      graphics_Sunflower.circle(360, 540, 180 - i);
      graphics_Sunflower.circle(540, 360, 180 - i);
      graphics_Sunflower.circle(360, 180, 180 - i);
      graphics_Sunflower.circle(180, 360, 180 - i);  
      graphics_Sunflower.circle(480, 480, 180 - i);
      graphics_Sunflower.circle(240, 240, 180 - i);
      graphics_Sunflower.circle(480, 240, 180 - i);
      graphics_Sunflower.circle(240, 480, 180 - i);
      fill_Switch++; 
    }
    graphics_Sunflower.fill(255, 125, 0); graphics_Sunflower.circle(415, 305, 110);
    graphics_Sunflower.noFill(); graphics_Sunflower.stroke(0); graphics_Sunflower.strokeWeight(5);
    graphics_Sunflower.arc(415, 300, 65, 35, PI, PI*2 + QUARTER_PI/2);
    graphics_Sunflower.arc(415, 300, 65, 30, PI, PI*2);
    graphics_Sunflower.arc(415, 300, 65, 25, PI, PI*2);
    graphics_Sunflower.arc(435, 280, 20, 20, 0, HALF_PI);
    graphics_Sunflower.arc(445, 285, 20, 20, 0, HALF_PI);
    graphics_Sunflower.noStroke(); graphics_Sunflower.fill(0);
    graphics_Sunflower.ellipse(415, 305, 15, 40);
    graphics_Sunflower.ellipse(415, 305, 40, 15);
    graphics_Sunflower.noFill(); graphics_Sunflower.stroke(255, 125, 0); graphics_Sunflower.strokeWeight(5);
    graphics_Sunflower.arc(305, 300, 65, 35, HALF_PI + QUARTER_PI + QUARTER_PI/2, PI);
    graphics_Sunflower.arc(305, 300, 65, 30, PI, PI*2);
    graphics_Sunflower.arc(305, 300, 65, 25, PI, PI*2);
    graphics_Sunflower.arc(285, 280, 20, 20, HALF_PI, PI);
    graphics_Sunflower.arc(275, 285, 20, 20, HALF_PI, PI);
    graphics_Sunflower.noStroke(); graphics_Sunflower.fill(255, 125, 0);
    graphics_Sunflower.ellipse(305, 305, 15, 40);
    graphics_Sunflower.ellipse(305, 305, 40, 15);
    graphics_Sunflower.noFill(); graphics_Sunflower.stroke(255, 125, 0); graphics_Sunflower.strokeWeight(5);
    for (int i = 5; i <= 30; i += 5){ graphics_Sunflower.arc(360, 380, 180, 125 - i, 0, PI); }
  graphics_Sunflower.endDraw();
  graphics_Sunflower.save("data/graphics_Sunflower.PNG");

  
}*/
