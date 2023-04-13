/*
 * Title:   Processing Sketch No. 1: Fun with Arrays
 * Author:  hamzberg
 * Version: 1.0
 * Date:    16 March 2023
 * License: MIT
 * 
 * Description:
 *   - Creates a pattern on a grid of arcs stopping at different
 *     radians while correlating with a color scheme.
 *   - Intended to demonstrate control over random() with
 *     arrays.
 */

//Establishes Color Palette
color[] color_Palette_Fun = {
 
  color(235, 182, 242), // Violet (Comically, this one is never shown.)
  color(65, 90, 166),   // Blue
  color(22, 115, 54),   // Green
  color(242, 125, 22),  // Orange
  color(242, 66, 27)    // Scarlet
  
};

//Establishes List of Radians
float[] radians_List = {
  
  0, // (The culprit.)
  HALF_PI,
  PI,
  (HALF_PI + PI),
  (2 * PI)
  
};

void setup() {
 
  size(480, 480);
  pixelDensity(displayDensity());
  background(0); 
  noStroke();

}

void draw() {
  
  // Goes through loop vertically
  for(int x = 12; x <= width; x += 50) {
    
    // Goes through loop horizontally
    for(int y = 12; y <= height; y += 50) {
   
      // Generates random number
      int rand_Num = int(random(0, 5));
      
      // Changes fill based on random number 
      // in the index of the Color Palette
      fill(color_Palette_Fun[rand_Num]);
      
      // Arc always starts at zero and is given a random end
      arc(x, y, 50, 50, 0, radians_List[rand_Num]);
      
      // Generates another random number
      rand_Num = int(random(0, 5));
      
      // Changes fill again based on random number 
      // in the index of the Color Palette
      fill(color_Palette_Fun[rand_Num]);
      
      // Arc always starts at zero and is given a random end
      arc(x, y, 25, 25, 0, radians_List[rand_Num]);
      
    }
  
  }
  
  // Stop sketch after loop
  noLoop();
  
}
