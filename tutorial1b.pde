PImage img; 

int[][] dat = new int [64][36];

  
  size(1280, 720);
  
  img = loadImage("ronan.jpg");
  
  
  img.loadPixels();
  
  for (int x = 0; x < 1280; x++){
    for (int y = 0; y < 720; y++){
      
      int temp = int(.63+brightness(img.pixels[x+y*1280])/255);
      
      img.pixels[x + y * 1280] = color (255*temp);
      
    }
  }
  
  img.updatePixels();

  for (int x = 0; x < 1280; x++){
    for (int y = 0; y < 720; y++){
            
      dat[x/20][y/20] += int(brightness(img.pixels[x + y * 1280]));
      
    }
  }
  
  loadPixels();
  
  for (int x = 0; x < 64; x++){    //   1280 / 20 = 64
    for (int y = 0; y < 36; y++){  //   720 / 20 = 36
      
      noStroke();
      
      fill(dat[x][y]/400);   // sets the color to the average of 400 pixels (20x20)
      
      rect (x*20, y*20, 20, 20); 
      
    }
  }
  
 
  
 // saveFrame("00001.png");