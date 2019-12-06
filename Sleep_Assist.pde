class Sleep_Assist {
  PImage awake;
  PImage sleep;

  int [] transition = {1, 2, 3};
  int transitionIndex = 0;
  
  int sequence = 0;

  Sleep_Assist() {
  }

  void displayCheck() {
    textSize(20);
    text("Do you go bed now", width/2, height/2 - 50);
  }

  void displayGoodnight() {
    sleep = loadImage("smileySleep.png");
    
    imageMode(CENTER);
    image(sleep, width/2, height/2);
  }

  void displayAwake() {
    awake = loadImage("smileyHappy.png");
    
    imageMode(CENTER);
    image(awake, width/2, height/2);
    
  }

  void transition() {
  }

  void buttons() {
    
  }

  void switchDisplay(){
    for(int i = 0; i <= 3;i++){
      transitionIndex++;
      switch(transition[transitionIndex]){
      case 1:
      displayCheck();
      break;
      case 2:
      displayGoodnight();
      break;
      case 3:
      displayAwake();
      break;
      }
    
    }
  
  }
  
}
