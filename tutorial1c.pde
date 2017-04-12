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
  
  for (int x = 0; x < 64; x++){
    for (int y = 0; y < 36; y++){
      
      noStroke();
      
      fill(dat[x][y]/400);
            
      for (int p = 0; p < 20; p++){
        for (int q = 0; q < 20; q++){
          
          int x_actual = x * 20 + p;
          int y_actual = y * 20 + q;
          
          pixels[x_actual + y_actual*1280] = color(int(brightness(color(img.pixels[x_actual + y_actual*1280]))) | 
                                              int(brightness(color(abs(((p*q)%255)*dat[x][y]/400)%255))));
          
        }
      }
    }
  }
  
  
  updatePixels();
  //image(img2, 0, 0);
  
  saveFrame("part3.png");