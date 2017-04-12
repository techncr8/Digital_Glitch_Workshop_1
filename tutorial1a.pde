PImage img; 
  
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

  image(img, 0, 0);
  
  //saveFrame("00001.png");