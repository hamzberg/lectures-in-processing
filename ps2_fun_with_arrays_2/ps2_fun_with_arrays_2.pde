/*
 * Title:   Processing Sketch No. 2: Fun with Arrays 2
 * Author:  hamzberg
 * Version: 1.0
 * Date:    16 March 2023
 * License: MIT
 * 
 * Description:
 *   - Creates a pattern on a grid of small squares and big squares
 *     with smiles.
 *   - Intended to demonstrate control over random() with
 *     arrays and taking advantage of for loop updates.
 */

// Establishes the color palette
color[] color_Palette_Silly = {
  
  color(242, 136, 214), // Pink
  color(2, 115, 83),    // Green
  color(242, 159, 5),   // Yellow
  color(242, 213, 160), // Pale
  color(242, 71, 56),   // Red
  
};

int count;

void setup() {
 
  size(720, 720);
  pixelDensity(displayDensity());
  background(255);
  noStroke();
  
}

void draw() {

  smallSquares();
  
  bigSquares();
  
  noLoop();
  
}

// Creates the small green and pink squares
void smallSquares() {
  
  for (int y = -20; y < height; y += 40) {
   
    for (int x = -20; x < width; x += 40) {
     
        count++;
        
        // if count is an even number
        if (count % 2 == 0) {
          
          // Creates the pink base
          fill(color_Palette_Silly[0]);
          square(x, y, 40);
          
          // Creates the green smile
          fill(color_Palette_Silly[1]);          
          circle(x + 10, y + 10, 10);        
          circle(x + 30, y + 10, 10);        
          arc(x + 20, y + 20, 30, 30, 0, PI);
          
        // if count is an odd number
        } else if (count % 2 == 1) {
          
          // Creates the green base
          fill(color_Palette_Silly[1]);
          square(x, y, 40);
          
          // Creates the pink smile
          fill(color_Palette_Silly[0]);          
          circle(x + 10, y + 30, 10);        
          circle(x + 30, y + 30, 10);        
          arc(x + 20, y + 20, 30, 30, PI, PI*2);
          
        }
        
    }
       
  }
  
}

// Creates the large pale and yellow squares
void bigSquares() {
  
  // Because the square's size is less than the for loop update,
  // there will be gaps between each creation.
  
  for (int y = -20; y < height; y += 120) {
   
    for (int x = -20; x < width; x += 120) {
     
        count++;
        
        // if count is an even number
        if (count % 2 == 0) {
          
          // Creates the pale base
          fill(color_Palette_Silly[2]);
          square(x, y, 80);
          
          // Creates the yellow smile
          fill(color_Palette_Silly[3]);          
          circle(x + 20, y + 20, 20);        
          circle(x + 60, y + 20, 20);        
          arc(x + 40, y + 40, 60, 60, 0, PI);
        
        // if count is an odd number
        } else if (count % 2 == 1) {
          
          // Creates the yellow base
          fill(color_Palette_Silly[3]);
          square(x, y, 80);
          
          // Creates the pale smile
          fill(color_Palette_Silly[2]);          
          circle(x + 20, y + 60, 20);        
          circle(x + 60, y + 60, 20);        
          arc(x + 40, y + 40, 60, 60, PI, PI*2);
          
        }
        
    }
       
  }

}
