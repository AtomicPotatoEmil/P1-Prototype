SaveData save;
LoadData load;

PImage sleepHover;
PImage sleepIcon;
PImage summaryHover;
PImage lightbulbIcon;
PImage lexiconHover;
PImage lexiconIcon;
PImage mainUI;
PImage background;
PImage arrow;


Logbook b1;
Suggestion suggestion;
Sleep_Assist sleep;

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

void setup() {

  save = new SaveData();
  load = new LoadData();
  b1 = new Logbook();
  suggestion = new Suggestion();
  sleep = new Sleep_Assist();
  

  
  sleepHover = loadImage("sleepHover.png");
  sleepIcon = loadImage("sleepIcon.png");
  summaryHover = loadImage("summaryHover.png");
  lightbulbIcon = loadImage("lightbulbIcon.png");
  lexiconHover = loadImage("lexiconHover.png");
  lexiconIcon = loadImage("lexiconIcon.png");
  mainUI = loadImage("mainUI.png");
  background = loadImage("background.png");
  arrow = loadImage("arrow.png");
  
  
  size(480, 853);
  
}


void draw() {
  
  switch(PAGE){
    case "sleep assist":
      sleepAssist();
      break;   
    case "logbook":
      logbook();
      break;
    case "suggestion":
      suggestion();
      break;
  }
  
}



void sleepAssist(){
  image(background, 0, 0);
  sleep.switchDisplay();
  mainUI();
  fill(0);
  textSize(40);
  textAlign(CENTER,CENTER);
  text("SLEEP ASSIST",width/2,height/30);
}

void suggestion(){
  image(background, 0, 0);
  suggestion.drawTips();
  mainUI();
  fill(0);
  textSize(40);
  textAlign(CENTER, CENTER);
  text("SUGGESTION", width/2, height/30);
}

void logbook(){
  image(background, 0, 0);
  mainUI();
  b1.logbookDraw();
}
 
 
boolean sleepIconPressed = false;
boolean lightbulbIconPressed = false;
boolean logbookIconPressed = false;


void mainUI(){
  
  if(PAGE == "sleep assist"){
    sleepIconPressed = true;
  }else{
    sleepIconPressed = false;
  }
  
  if(PAGE == "suggestion"){
    lightbulbIconPressed = true;
  }else{
    lightbulbIconPressed = false;
  }
  
  if(PAGE == "logbook"){
    logbookIconPressed = true;
  }else{
    logbookIconPressed = false;
  }
  
  if(sleepIconPressed == false && mouseX > 0 && mouseX < 158 && mouseY > 710 && mouseY < 938){
    image(sleepHover, 0, 0);
  }else if(lightbulbIconPressed == false && mouseX > 158 && mouseX < 316 && mouseY > 710 && mouseY < 938){
    image(summaryHover, 0, 0);
  }else if(logbookIconPressed == false && mouseX > 320 && mouseX < 520 && mouseY > 710 && mouseY < 938){
    image(lexiconHover, 0, 0);
  }else{
    image(mainUI, 0, 0);
  }
  
  if(sleepIconPressed == false){
    image(sleepIcon, -10, 730);
  }else{
    arrow.resize(300, 200);
    image(arrow, -75, 690);
  }
  
  if(lightbulbIconPressed == false){
    lightbulbIcon.resize(125, 125);
    image(lightbulbIcon, 170, 720);
  }else{
    arrow.resize(300, 200);
    image(arrow, 80, 690);
  }
  
  if(logbookIconPressed == false){
    lexiconIcon.resize(180, 130);
    image(lexiconIcon, 308, 720);
  }else{
    arrow.resize(300, 200);
    image(arrow, 240, 690);
  }
  
  if(mousePressed && mouseX > 0 && mouseX < 158 && mouseY > 710 && mouseY < 938){
    PAGE = "sleep assist";
  }
  if(lightbulbIconPressed == false && mousePressed && mouseX > 158 && mouseX < 316 && mouseY > 710 && mouseY < 938){
    suggestion.tipsIndex = int(random(suggestion.tips.length));
    PAGE = "suggestion";
  }
  if(mousePressed && mouseX > 320 && mouseX < 520 && mouseY > 710 && mouseY < 938){
    PAGE = "logbook";
  }
}
