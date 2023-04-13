/*
 * Title:   Processing Sketch No. 6: Making Mario Run with pixels[]
 * Author:  hamzberg
 * Version: 1.0
 * Date:    16 March 2023
 * License: MIT
 * 
 * Note:
 *   - This sketch requires an image in the data folder.
 *     The image is of Mario, an intellectual property
 *     and Copyright of Nintendo Co. Ltd.
 *
 * Description:
 *   - Creates a pixel ghosting effect with a PImage.
 *   - Intended to demonstrate manipulation of pixels using the
 *     pixels[].
 *
 * Controls:
 *   - Press number keys 1 through 9 for different blending methods.
 *
 */
 
PImage mario;

void setup() {
  
  size(480, 480);
  pixelDensity(displayDensity());
  frameRate(30);
  
  mario = loadImage("mario03.png");
  
}

void draw() {
  
 image(mario, width/12, 0);
 
 // Try a different integer!
 ghostPixels(10);
 
 controls();
 
}

// Creates the ghosting effect
void ghostPixels(int offset) {
  
 loadPixels();
 
 for (int x = 0; x < (pixels.length - offset); x++) {
  
   // Copies the pixel ahead of current one by integer offset.
   pixels[x] = pixels[x + offset];
   
 }
 
 updatePixels();
  
}

// Provides controls to the user
void controls() {

 if (keyPressed) {
   
   if (key == '1') {     
     blendMode(ADD);     
   }
   
   if (key == '2') {     
     blendMode(SUBTRACT);     
   }
   
   if (key == '3') {     
     blendMode(MULTIPLY);     
   }
   
   if (key == '4') {     
     blendMode(SCREEN);     
   }
   
   if (key == '5') {     
     blendMode(DIFFERENCE);     
   }
   
   if (key == '6') {     
     blendMode(EXCLUSION);     
   }
   
   if (key == '7') {     
     blendMode(LIGHTEST);     
   }
   
   if (key == '8') {     
     blendMode(DARKEST);     
   }
   
   if (key == '9') {     
     blendMode(REPLACE);     
   }
   
 } 
  
}
