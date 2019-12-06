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
PImage background;

int sleepAssistX = 0;
int summaryX = 158;
int logbookX = 320;
int toolbarY = 710;

Logbook b1;
Summary summary;

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


String PAGE = "summary";

void setup() {

  save = new SaveData();
  load = new LoadData();
  b1 = new Logbook();
  summary = new Summary();

  
  save.saveInt("test variable", 5);
  
  sleepHover = loadImage("sleepHover.png");
  sleepIcon = loadImage("sleepIcon.png");
  summaryHover = loadImage("summaryHover.png");
  summaryIcon = loadImage("summaryIcon.png");
  lexiconHover = loadImage("lexiconHover.png");
  lexiconIcon = loadImage("lexiconIcon.png");
  mainUI = loadImage("mainUI.png");
  background = loadImage("background.png");
  
  
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
    case "summary":
      summary();
      break;
  }
  
}



void sleepAssist(){
  mainUI();
}

void summary(){
  summary.drawUI();
}

void logbook(){
  b1.logbookDraw();
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
