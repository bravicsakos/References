# References
References for CV

## Thesis
**-- Software is under construction, not fully representative of final product --**

**The goal:**
  Creating a software that lets medical personnel visualize and inspect large digitalized images while seamlessly collecting information     and building a database for the training of a neural network.
  
**Features:**
  - Loading and processing image files straight from the digitalizer with the use of an external program
  - Rescaling the image for multiple resolutions with value interpolation
  - Projects: create project folders for different images and load the already processed ones at will
  - Small resolution preview of the full image
  - The full scale view renders four images and can be moved with the arrow keys
  - INI configuration file for easy access
  - Sequence based data structure for the saved information
  
**To be added:**
  - Small image in full scale window to show location of the viewer on the whole image
  - Quality of life inprovements
  - The capturing of images for the neural network by drawing tablet and Tobii
  
## Small Projects

These are little sketches made because of interest in the language or the actual task.

**_PictureToParticles_**
  **The goal:**
      Loading an image, making each pixel black or white based on their hue and creating particles of the black pixels with physics and         steering behaviors.
      
  **Features**
   - Loading an image and making some of its pixels particles
   - Eploding the whole picture by moving the particles into a random location one by one or at the same time
   - Rearranging the particles to their original position making the picture again
      
  **Problems:**
   - The Processing enviroments draw function which draws shapes on the screen can't handle too many drawn objects so it causes huge       FPS drops on larger particle counts
      
**_TextToParticles_**
  **The goal:**
      Writing text on the keyboard and rendering the characters with points as particles.
      
  **Features:**
   - Writing characters on the keyboard makes random placed particles on the screen
   - Right Arrow: adds physics to the particles present
   - Down Arrow: adds the original location in the text as target location to the particles
   - Left Arrow: adds random location on the screen as target location to the particles
   - Up Arrow: resets the line so the new charachters override the old ones
   - '.' character: deletes the old characters
   - ENTER: new line
      
**_TheGameOfLife_**
  **The goal:**
      Making John Conway's Game of Life 'cellular automaton'.
      
  **Features:**
   - The base Game of Life game
   - Drawing with mouse
   - Coloring of cells: they start as yellow and the longer they live the more red they become
   - Coloring of the cells' paths: the path which the cells take turns grey and dissapears with time
