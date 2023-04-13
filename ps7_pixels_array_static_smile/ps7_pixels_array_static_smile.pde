/*
 * Title:   Processing Sketch No. 7: Noisy Smile with pixels[]
 * Author:  hamzberg
 * Version: 1.0
 * Date:    16 March 2023
 * License: MIT
 * 
 * Note:
 *   - This sketch requires an image in the data folder.
 *     The image is the smile emoji from the Twemoji font provided
 *     by Twitter Open Source under the CC-BY 4.0 license.
 *
 * Description:
 *   - Noise effect created by randomizing the color of each pixel.
 *   - Intended to demonstrate manipulation of pixels using the
 *     pixels[].
 *
 */

PImage smile;

int index;

void setup() {
  
  size(480, 480);
  pixelDensity(1);
  
  smile = loadImage("smile.png");
  
}

void draw() {
 
 smile.resize(800, 800);
 image(smile, -width/3, -height/2.25);
 
 // Try a different set of RGB color integers!
 noisePixels(200, 100, 0);
  
}

// Makes the pixels in a sketch noisy
void noisePixels(int r, int g, int b) {
 
 loadPixels();
 
 for (int y = 0; y < height; y++) {

   for (int x = 0; x < width; x++) {

     // Gets pixel at coordinate
     index = (x + y * width);
     
     // Randomizes the color of the pixel
     pixels[index] = 
       color(
         int(random(pixels[index], (r * 100))), // Red
         int(random(pixels[index], (g * 100))), // Green
         int(random(pixels[index], (b * 100)))  // Blue
       );     
     
   }
   
 }
 
 updatePixels();
  
}
