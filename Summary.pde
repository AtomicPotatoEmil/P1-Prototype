class Summary{
  PImage infoIcon;
  
  PImage [] tips = {loadImage("tip1.png"), loadImage("tip2.png"), loadImage("tip3.png"), loadImage("tip4.png"), loadImage("tip5.png")};
  int tipsIndex;
  Summary(){
    infoIcon = loadImage("infoIcon.png");
    
    tipsIndex = int(random(tips.length));
  }
  
  void drawTips(){
    image(tips[tipsIndex], 0, 0);
  }
  

  
}
