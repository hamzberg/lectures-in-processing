/*
 * Title:   Processing Sketch No. 3: Introduction to pixels[]
 * Author:  hamzberg
 * Version: 1.0
 * Date:    16 March 2023
 * License: MIT
 * 
 * Description:
 *   - Shifts pixels based on a given amount between a red circle 
 *     and blue circle on yellow background.
 *   - Intended to introduce manipulation of pixels using the
 *     pixels[].
 */


void setup() {
  
  size(480, 480);
  noStroke();
  background(255, 255, 0);
  
}

void draw() {
 
  // Creates the red circle
  fill(255, 0, 0);
  circle(width/1.3, height/2, 200);
  
  // Try a different integer!
  shiftPixels(50);
  
  // Creates the blue circle
  fill(0, 0, 255);
  circle(width/2.83, height/2, 200);
  
  // Try a different integer!
  shiftPixels(50); 
  
  noLoop();
  
}

// Shifts pixels based on parameter
void shiftPixels(int offset) {
 
  loadPixels();
  
  for(int i = offset; i < pixels.length - offset; i += offset) {
   
    // Gets pixel offset + x before and change it to offset after. 
    pixels[i - offset + 1] = pixels[i + offset];
    pixels[i - offset + 2] = pixels[i + offset];
    pixels[i - offset + 3] = pixels[i + offset];
    pixels[i - offset + 4] = pixels[i + offset];
    pixels[i - offset + 5] = pixels[i + offset];
    pixels[i - offset + 6] = pixels[i + offset];
    
  }
  
  updatePixels();
  
}
