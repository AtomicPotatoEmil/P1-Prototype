class Summary{
  PImage mainUI;
  PImage infoIcon;
  PImage labels;
  
  String [] tipLabels = {};
  int tipsIndex = 0;
  
  Summary(){
    infoIcon = loadImage("infoIcon.png");
    mainUI = loadImage("mainUI.png");
  }
  
  void drawUI(){
    image(mainUI, 0, 0);
  }
  
}
