SaveData save;
LoadData load;

PImage mainButtons;
PImage sleepButtonHover;
PImage lexiconButtonHover;
PImage infoButtonHover;
PImage header;
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


String PAGE = "start";

void setup() {
  save = new SaveData();
  load = new LoadData();
  
  mainButtons = loadImage("mainButtons.png");
  sleepButtonHover = loadImage("sleepButtonHover.png");
  lexiconButtonHover = loadImage("lexiconButtonHover.png");
  infoButtonHover = loadImage("infoButtonHover.png");
  header = loadImage("header.png");
  
  size(480, 853);
}


void draw() {
  
  switch(PAGE){
    case "start":
      startPage();
      break;    
  }
  
}


void startPage(){
  mainButtons();
  
  fill(250 ,0 ,0);
  //rect(320, 738, 158, 200);
  header("");
}

void mainButtons(){
  
  if(mouseX > 0 && mouseX < 158 && mouseY > 738 && mouseY < 938){
    image(sleepButtonHover, 0, 0);
  }else if(mouseX > 158 && mouseX < 316 && mouseY > 738 && mouseY < 938){
    image(lexiconButtonHover, 0, 0);
  }else if(mouseX > 320 && mouseX < 520 && mouseY > 738 && mouseY < 938){
    image(infoButtonHover, 0, 0);
  }else{
    image(mainButtons, 0, 0);
  }
}

void header(String name){
  fill(0);
  image(header, 0, 0);
}
