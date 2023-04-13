/*
 * Title:   Processing Sketch No. 4: Slanting Pixels with pixels[]
 * Author:  hamzberg
 * Version: 1.0
 * Date:    16 March 2023
 * License: MIT
 * 
 * Description:
 *   - Demonstration depicting a slanted smiley face.
 *   - Intended to demonstrate manipulation of pixels using the
 *     pixels[].
 */

int count;

void setup() {
  
  size(480, 480);
  
}

void draw() {

  smile();
  
  slantPixels();
  
}

// Creates a smiley face
void smile() {
  
  // background() is here to prevent constant pixel slanting
  background(255, 125, 0);
  strokeWeight(25);
  fill(255, 200, 0);
  
  // Base
  ellipse(width/2, height/2, width/1.25, height/1.25);
  
  // Left eye
  line(width/3, height/2.5, width/3, height/3.25);
  
  // Right eye
  line(width/1.5, height/2.5, width/1.5, height/3.25);
  
  // Mouth
  arc(width/2, height/2, width/2, height/2, 0, PI);
  
}

// Slants the pixels in a sketch
void slantPixels() {
 
  loadPixels();
  
  for(int i = 0; i < pixels.length - width; i += 1){
    
    // On every multiple of 480, increase count by one
    if (i % width == 0){
     
      count++;
      
    }
    
    // Current pixel equals the pixel ahead of it by integer count
    pixels[i] = pixels[i + count];                    
    
  }
  
  updatePixels();
  
  count = 0;
  
}
