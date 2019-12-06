class Sleep_Assist {
  PImage awake;
  PImage sleep;

  int [] transition = {1, 2, 3};
  int transitionIndex = 0;
  
  int sequence = 0;

  Sleep_Assist() {
  }

  void displayCheck() {
    
  }

  void displayGoodnight() {
    sleep = loadImage("smileySleep.png");
  }

  void displayAwake() {
    awake = loadImage("smileyHappy.png");
    
  }

  void transition() {
  }

  void buttons() {
  }

  void switchDisplay(){
    for(int i = 0; i <= 3;i++){
      switch(transition[transitionIndex]){
      case 1:
      
      break;
      case 2:
      
      break;
      case 3:
      
      break;
      }
    
    }
  
  }
  
}
