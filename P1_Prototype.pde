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
PImage infoIcon;
PImage background;

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
  infoIcon = loadImage("infoIcon.png");
  background = loadImage("background.png");
  
  
  size(480, 853);
}


void draw() {
  
  switch(PAGE){
    case "sleep assist":
      sleepAssist();
      break;    
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
  
  if(mouseX > 0 && mouseX < 158 && mouseY > 710 && mouseY < 938){
    image(sleepHover, 0, 0);
  }else if(mouseX > 158 && mouseX < 316 && mouseY > 710 && mouseY < 938){
    image(summaryHover, 0, 0);
  }else if(mouseX > 320 && mouseX < 520 && mouseY > 710 && mouseY < 938){
    image(lexiconHover, 0, 0);
  }else{
    image(mainUI, 0, 0);
  }
}
