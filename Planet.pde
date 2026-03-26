// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 14-18: Object-oriented solar system

class Planet {
  // Each planet object keeps track of its own angle of rotation.
  float theta;      // Rotation around sun
  float diameter;   // Size of planet
  float distance;   // Distance from sun
  float orbitspeed; // Orbit speed
  color fillcolor = color((int) random(0, 256), (int) random(0, 256), (int) random(0, 256)); // (int) random(0, 256) generates a random integer number between 0 and 256 (starting at zero, and up to, but not including, 256)
 
  // Each Planet now has a Moon!
  Moon[] moons;
 
  Planet(float distance_, float diameter_, int moonsqty_) {
    distance = distance_;
    diameter = diameter_;
    theta = 0;
    orbitspeed = random(0.01,0.03);
    
    // create the Moon 24 pixels from the planet with a diameter of 5
    moons = new Moon[moonsqty_];
    
    for(int i = 0; i < moons.length; i++){
      moons[i] = new Moon(24 * random(1, 5), 8 * random(0.5, 2), fillcolor);
    }
  }
  
  void update() {
    // Increment the angle to rotate
    theta += orbitspeed;
    // Update the moons
    for(int i = 0; i < moons.length; i++){
      moons[i].update();
    }
  }
  
  void display() {
    // Before rotation and translation, the state of the matrix is saved with pushMatrix().
    pushMatrix(); 
    // Rotate orbit
    rotate(theta); 
    // translate out distance
    translate(distance,0); 
    stroke(0);
    fill(fillcolor);
    ellipse(0,0,diameter,diameter);
    // The planet is drawn, now draw the moons
    for(int i = 0; i < moons.length; i++){
      moons[i].display();
    }
    
    // Once the planet is drawn, the matrix is restored with popMatrix() so that the next planet is not affected.
    popMatrix(); 
  }
}
