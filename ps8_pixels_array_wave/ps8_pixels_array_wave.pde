/*
 * Title:              Processing Sketch No. 8: Waving Pixels with pixels[]
 * Adapted:            https://processing.org/examples/sinewave.html
 * Original Author:    Daniel Shiffman
 * Derivative Author:  hamzberg
 * Version:            1.0
 * Date:               16 March 2023
 * License:            MIT
 * 
 * Description:
 *   - Creating waving text with the pixels created with PFont
 *   - Intended to demonstrate manipulation of pixels using the
 *     pixels[].
 *
 * Note:
 *   - This sketch requires the Tile Warp font in the data folder.
 *     Tilt Warp is a font provided by Google Fonts and created
 *     by Andy Clymer. It is licensed under the Open Font License.
 *
 * Controls:
 *   - Use the keyboard to type any character. 
 *     (Does not include upper case.) 
 *
 * !BUG!
 *   - When the text enters a new page, the first letter
 *     of user input is skipped.
 *   - When the user's text goes beyond a line, they are
 *     unable to go back to the previous line by deleting.
 *
 */

// Initialize String to take in Text
String input = "";

// Variables for calculating the sine wave
int x_Spacing = 16;
int wave_Width;
float theta = 0.0;
float amplitude = 8.0;
float period = 500.0;
float dx;
float[] y_Values;

// Integers to parse through arrays
int parse_Pixels;
int parse_Waves;

void setup() {
  
  size(720, 480);
  
  PFont tilt_Warp = createFont("tilt_warp.ttf", 128);
  textFont(tilt_Warp);
  
  wave_Width = width + 16;
  dx = (TAU / period) * x_Spacing;
  y_Values = new float[wave_Width / x_Spacing]; 
  
}

void draw() {
  
  makeBackground();

  writeText();
  
  calculateWave();
  
  wavePixels();
  
}

// Creates the text
void writeText() {
  
  textSize(82); fill(255);
  text(input, 20, 80);
  
}

void keyPressed() {
  
    // Characters
    if (key == 'a') { input += "a"; }
    if (key == 'b') { input += "b"; }
    if (key == 'c') { input += "c"; }
    if (key == 'd') { input += "d"; }
    if (key == 'e') { input += "e"; }
    if (key == 'f') { input += "f"; }
    if (key == 'g') { input += "g"; }
    if (key == 'h') { input += "h"; }
    if (key == 'i') { input += "i"; }
    if (key == 'j') { input += "j"; }
    if (key == 'k') { input += "k"; }
    if (key == 'l') { input += "l"; }
    if (key == 'm') { input += "m"; }
    if (key == 'n') { input += "n"; }
    if (key == 'o') { input += "o"; }
    if (key == 'p') { input += "p"; }
    if (key == 'q') { input += "q"; }
    if (key == 'r') { input += "r"; }
    if (key == 's') { input += "s"; }
    if (key == 't') { input += "t"; }
    if (key == 'u') { input += "u"; }
    if (key == 'v') { input += "v"; }
    if (key == 'w') { input += "w"; }
    if (key == 'x') { input += "x"; }
    if (key == 'y') { input += "y"; }
    if (key == 'z') { input += "z"; }
    
    // numbers
    if (key == '1') { input += "1"; }
    if (key == '2') { input += "2"; }
    if (key == '3') { input += "3"; }
    if (key == '4') { input += "4"; }
    if (key == '5') { input += "5"; }
    if (key == '6') { input += "6"; }
    if (key == '7') { input += "7"; }
    if (key == '8') { input += "8"; }
    if (key == '9') { input += "9"; }
    if (key == '0') { input += "0"; }
    
    // Symbols
    if (key == '~') { input += "~"; }
    if (key == '`') { input += "`"; }
    if (key == '!') { input += "!"; }
    if (key == '@') { input += "@"; }
    if (key == '#') { input += "#"; }
    if (key == '$') { input += "$"; }
    if (key == '%') { input += "%"; }
    if (key == '^') { input += "^"; }
    if (key == '&') { input += "&"; }
    if (key == '*') { input += "*"; }
    if (key == '(') { input += "("; }
    if (key == ')') { input += ")"; }
    if (key == '-') { input += "-"; }
    if (key == '_') { input += "_"; }
    if (key == '+') { input += "+"; }
    if (key == '=') { input += "="; }
    if (key == '{') { input += "{"; }
    if (key == '}') { input += "}"; }
    if (key == '[') { input += "["; }
    if (key == '}') { input += "]"; }
    if (key == '|') { input += "|"; }
    if (key == '\\') { input += "\\"; }
    if (key == ':') { input += ":"; }
    if (key == ';') { input += ";"; }
    if (key == '\"') { input += "\""; }
    if (key == '\'') { input += "\'"; }
    if (key == '<') { input += "<"; }
    if (key == '>') { input += ">"; }
    if (key == ',') { input += ","; }
    if (key == '.') { input += "."; }
    if (key == '/') { input += "/"; }
    if (key == '?') { input += "?"; }
    if (key == ' ') { input += " "; }
    if (key == ENTER) { input += "\n"; }
    
    // Deletes last character on a line.
    if ((key == BACKSPACE) && (input.length() > 0)) { 
      
      input = input.substring(0, input.length() -1); 
    
    }
    
    // Returns text to start of line when hitting character maximum
    if ((input.length() != 0) && (input.length() % 15 == 0)) {

       input += "\n";
    
    }
    
    // Deletes text if longer than 45 characters
    if (input.length() >= 45) { 
    
      input = ""; 
    
    } 
    
    // DEBUG
    // println(input.length() + " " + input + "\n");
    // println(input.charAt(input.length()));

}

void makeBackground() {
  
  // background() is here to prevent constant pixel slanting
  background(255);
  noStroke();
  
  int blue_Intensity = 250;
 
  for(int y = 0; y < height; y += 150) {
    
    fill(0, 0, blue_Intensity);
  
    for(int x = 0; x < width; x += 100) {
   
      circle(x + 50, y + 50, 200); 
    
    }
    
    // Subtracts value to increase strength of blue
    blue_Intensity -= 50;
    
  }
  
}

// Calculates sine wave y-axis values and puts them in y_Values[]
// Sourced from Daniel Shiffman
void calculateWave() {
  
  // Value for changing the speed of the waves.
  theta += 0.02;

  // Calculates a y-axis value for every x-axis position
  float x = theta;
  for (int i = 0; i < y_Values.length; i++) {
    
    y_Values[i] = sin(x) * amplitude;
    x += dx;
  
  }
}


// Waves the pixels in a sketch
void wavePixels() {
 
  loadPixels();
  
  for(int i = 0; i < pixels.length - width; i += 1){
    
    // On every multiple of the width, parse_Pixels equals y_Values[parse_Waves]
    if (i % width == 0){
     
       // Parses through the y_Values[]
       parse_Waves++;

       // Catches parse_Waves if it goes farther than the length of (y_Values[] - 15)
       if(parse_Waves >= y_Values.length - 15) { parse_Waves = 0; }
       
       parse_Pixels = int(y_Values[parse_Waves]);
       
    }
    
    // Catches parse_Pixels if it goes below 0
    if( parse_Pixels <= -1 ) { parse_Pixels = 0; }
    
    // Current pixel equals the pixel ahead of it by integer parse_Pixels
    pixels[i] = pixels[i + parse_Pixels];                    
    
  }
  
  updatePixels();
  
  // Restarts the parsers
  parse_Waves = 0;
  parse_Pixels = 0;
  
}
