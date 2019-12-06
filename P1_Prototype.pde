SaveData save;
LoadData load;

JSONObject mainLoad;

PImage sleepHover;
PImage sleepIcon;
PImage summaryHover;
PImage summaryIcon;
PImage lexiconHover;
PImage lexiconIcon;
PImage mainUI;
PImage smileyHappy;
PImage smileySleep;
PImage background;

int sleepAssistX = 0;
int summaryX = 158;
int logbookX = 320;
int toolbarY = 710;

Logbook b1;

/*Hvis i skal gemme en int så brug funktionen:
  save.saveInt(name, number); I skal give den variable i gemmer et navn for at den kan blive gemt i JSON filen,
  f.eks save.saveInt("five", 5);
  Der er også lavet funktioner for at gemme String's og Boolean's:
  save.saveString(name, string);
  save.saveBoolean(name, bool);
*/
/*Hvis i skal load en variable skal i bruges funktionen:
  load.loadInt(name); for f.eks int variabler, i skal skrive det navn som i har givet variablen i JSON filen for at load den,
  f.eks load.loadInt("five");
  Det samme med:
  load.loadString(name);
  load.loadBoolean(name);
*/


String PAGE = "sleep assist";
String Logbook = "logbook";
void setup() {

  save = new SaveData();
  load = new LoadData();
  b1 = new Logbook();
  
  mainLoad = new JSONObject();
  

  
  save.saveInt("test variable", 5);
  
  sleepHover = loadImage("sleepHover.png");
  sleepIcon = loadImage("sleepIcon.png");
  summaryHover = loadImage("summaryHover.png");
  summaryIcon = loadImage("summaryIcon.png");
  lexiconHover = loadImage("lexiconHover.png");
  lexiconIcon = loadImage("lexiconIcon.png");
  mainUI = loadImage("mainUI.png");
  smileyHappy = loadImage("smileyHappy.png");
  smileySleep = loadImage("smileySleep.png");
  background = loadImage("background.png");
  
  
  size(480, 853);
}


void draw() {
  
  switch(PAGE){
    case "sleep assist":
      sleepAssist();
      break;   
      case "logbook":
      b1.logbookDraw();
  }
  
}



void sleepAssist(){
  mainUI();
}

void summary(){
  
}

void logbook(){
  
}

void mainUI(){
  
  if(mouseX > sleepAssistX && mouseX < 158 && mouseY > toolbarY && mouseY < 938){
    image(sleepHover, 0, 0);
  }else if(mouseX > summaryX && mouseX < 316 && mouseY > toolbarY && mouseY < 938){
    image(summaryHover, 0, 0);
  }else if(mouseX > logbookX && mouseX < 520 && mouseY > toolbarY && mouseY < 938){
    image(lexiconHover, 0, 0);
  }else{
    image(mainUI, 0, 0);
  }
}
void mousePressed() {
  if (buttonOver1 == true) {
    option1 ++;
    userNumber ++;
  } 
  if (buttonOver2 == true) {
    option2 ++;
    userNumber ++;
  }
  if (buttonOver3 == true) { 
    option3 ++;
    userNumber ++;
  }
}
void buttonMouseOverStatus() {
  if (overButton1(buttonX1, buttonY1, buttonWidth, buttonHeight)) {
    buttonOver1 = true;
  } else if (overButton2(buttonX1, buttonY2, buttonWidth, buttonHeight)) {
    buttonOver2 = true;
  } else if (overButton3(buttonX1, buttonY3, buttonWidth, buttonHeight)) {
    buttonOver3 = true;
  } else if (overButton4(buttonX1, buttonY4, buttonWidth, buttonHeight)) {
  }
}
boolean overButton1(int x, int y, int width, int height) { //When this function is called, all it needs is the button's x- and y-value, as well as its width and height.
  if (mouseX >= x-width/2 && mouseX <= x+width/2 && mouseY >= y-height/2 && mouseY <= y+height/2) { //If the mouse is within the coordinates generated from this,
    return true; //The function will return true,
  } else { //If not,
    return false; //It will return false.
  }
}

boolean overButton2(int x, int y, int width, int height) {
  if (mouseX > x-width/2 && mouseX < x+width/2 && mouseY > y-height/2 && mouseY < y+height/2) {
    return true;
  } else {
    return false;
  }
}

boolean overButton3(int x, int y, int width, int height) {
  if (mouseX > x-width/2 && mouseX < x+width/2 && mouseY > y-height/2 && mouseY < y+height/2) {
    return true;
  } else {
    return false;
  }
}
