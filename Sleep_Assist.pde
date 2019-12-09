class Sleep_Assist {
  SaveData s;
  LoadData l;

  PImage awake;
  PImage sleep;
  PImage goodnightBtn;
  PImage goodnightBtnHover;

  int monday, tuesday, wednesday, thursday, friday, saturday, sunday;
  int[] daysPoints = {0, 0, 0, 0, 0, 0, 0};
  int currentDay;

  int [] transition = {1, 2, 3, 4};
  int transitionIndex = 0;

  int sequence;

  boolean firstPageCheck = false;
  boolean secondPageCheck = false;
  boolean thirdPageCheck = false;

  int bottonX;
  int bottonY;
  int bottonW;
  int bottonH;


  Sleep_Assist() {
    s = new SaveData();
    l = new LoadData();

    currentDay = 0;

    sequence = 1;

    awake = loadImage("smileyHappy.png");
    sleep = loadImage("smileySleep.png");
    goodnightBtn = loadImage("goodnightButton.png");
    goodnightBtnHover = loadImage("goodnightButton.png");
  }

  void firstPage() {
    bottonX = ;
    bottonY = ;
    bottonW = ;
    bottonH = ;

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("Are you going to sleep now?", width/2, height/2 + 75);
    image(awake, 70, height/2-150);

    if (mousePressed) {
      if (mouseX < bottonX && mouseX > bottonX + bottonW && mouseY < bottonY && mouseY > bottonY + bottonH) {
        background(255);
        mainUI();
        firstPageCheck = false;
        secondPageCheck = true;
        thirdPageCheck = false;
      }
    }
  }

  void secondPage() {
    bottonX = ;
    bottonY = ;
    bottonW = ;
    bottonH = ;

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("Great, Goodnight!", width/2, height/2 + 75);

    imageMode(CENTER);
    image(sleep, 75, height/2-150);

    if (mousePressed) {
      if (mouseX < bottonX && mouseX > bottonX + bottonW && mouseY < bottonY && mouseY > bottonY + bottonH) {
        background(255);
        mainUI();
        firstPageCheck = false;
        secondPageCheck = false;
        thirdPageCheck = true;
      }
    }
  }
  void thirdPage() {
    bottonX = ;
    bottonY = ;
    bottonW = ;
    bottonH = ;

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("Are you awake?", width/2, height/2 + 75);

    image(sleep, 70, height/2-150);

    if (mousePressed) {
      if (mouseX < bottonX && mouseX > bottonX + bottonW && mouseY < bottonY && mouseY > bottonY + bottonH) {
        background(255);
        mainUI();
        firstPageCheck = true;
        secondPageCheck = false;
        thirdPageCheck = false;
      }
    }
  }

  void switchDisplay() {
    switch(sequence) {
    case 1:
      firstPage();
      firstPageCheck = true;
      secondPageCheck = false;
      thirdPageCheck = false;
      break;

    case 2:
      secondPage();
      firstPageCheck = false;
      secondPageCheck = true;
      thirdPageCheck = false;
      break;

    case 3:
      thirdPage();
      firstPageCheck = false;
      secondPageCheck = false;
      thirdPageCheck = true;
      break;
    }
  }


  void saveDays() {
    monday = daysPoints[0];
    tuesday = daysPoints[1];
    wednesday = daysPoints[2];
    thursday = daysPoints[3];
    friday = daysPoints[4];
    saturday = daysPoints[5];
    sunday = daysPoints[6];

    s.saveInt("monday", monday);
    s.saveInt("tuesday", tuesday);
    s.saveInt("wednesday", wednesday);
    s.saveInt("thursday", thursday);
    s.saveInt("friday", friday);
    s.saveInt("saturday", saturday);
    s.saveInt("sunday", sunday);

    s.saveInt("current day", currentDay);
  }

  void loadDays() {
    if (l.loadJSON.isNull("monday")) {
      println("not found");
    } else {
      daysPoints[0] = l.loadJSON.getInt("monday");
    }
    if (l.loadJSON.isNull("tuesday")) {
      println("not found");
    } else {
      daysPoints[1] = l.loadJSON.getInt("tuesday");
    }
    if (l.loadJSON.isNull("wednesday")) {
      println("not found");
    } else {
      daysPoints[2] = l.loadJSON.getInt("wednesday");
    }
    if (l.loadJSON.isNull("thursday")) {
      println("not found");
    } else {
      daysPoints[3] = l.loadJSON.getInt("thursday");
    }
    if (l.loadJSON.isNull("friday")) {
      println("not found");
    } else {
      daysPoints[4] = l.loadJSON.getInt("friday");
    }
    if (l.loadJSON.isNull("saturday")) {
      println("not found");
    } else {
      daysPoints[5] = l.loadJSON.getInt("saturday");
    }
    if (l.loadJSON.isNull("sunday")) {
      println("not found");
    } else {
      daysPoints[6] = l.loadJSON.getInt("sunday");
    }

    if (l.loadJSON.isNull("current day")) {
      println("not found");
    } else {
      currentDay = l.loadJSON.getInt("current day");
    }
  }

  void assignPoints(int point) {
    loadDays();
    daysPoints[currentDay] = point;
    currentDay += 1;
    saveDays();
  }
}
