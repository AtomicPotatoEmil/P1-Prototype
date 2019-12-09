class Sleep_Assist {
  SaveData s;
  LoadData l;

  PImage awake;
  PImage sleep;
  PImage goodnightBtn;
  PImage goodnightBtnHover;
  PImage goodmorningBtn;
  PImage goodmorningBtnHover;

  int monday, tuesday, wednesday, thursday, friday, saturday, sunday;
  int[] daysPoints = {0, 0, 0, 0, 0, 0, 0};
  int currentDay;

  int sequence = 1;

  int bottonX;
  int bottonY;
  int bottonW;
  int bottonH;


  Sleep_Assist() {
    s = new SaveData();
    l = new LoadData();

    currentDay = 0;


    awake = loadImage("smileyHappy.png");
    sleep = loadImage("smileySleep.png");
    goodnightBtn = loadImage("goodnightButton.png");
    goodnightBtnHover = loadImage("goodnightButtonHover.png");
    goodmorningBtn = loadImage("goodmorningBtn.png");
    goodmorningBtnHover = loadImage("goodmorningBtnHover.png");
  }

  void firstPage() {
    loadDays();
    if (currentDay >= 7) {
      currentDay = 0;
      for (int i = 0; i < daysPoints.length; i++) {
        daysPoints[i] = 0;
        saveDays();
      }
    }
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("Are you going to sleep now?", width/2, height/2 - 180);
    image(awake, 70, height/2-380);


    if (mouseX > 155 && mouseX < 320 && mouseY > 300 && mouseY < 390) {
      goodnightBtnHover.resize(300, 500);
      image(goodnightBtnHover, 90, 10);
    } else {
      goodnightBtn.resize(300, 500);
      image(goodnightBtn, 90, 10);
    }

    if (mousePressed && mouseX > 155 && mouseX < 320 && mouseY > 300 && mouseY < 390) {
      sequence = 2;
    }
  }

  void secondPage() {
    sleepPointsTracker();
    image(sleep, 70, height/2-380);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("Are you awake now?", width/2, height/2 - 180);

    fill(250, 0, 0, 50);
    rect(125, 440, 220, 90);

    if (mouseX > 125 && mouseX < 345 && mouseY > 440 && mouseY < 530) {
      goodmorningBtnHover.resize(300, 500);
      image(goodmorningBtnHover, 85, 150);
    } else {
      goodmorningBtn.resize(300, 500);
      image(goodmorningBtn, 85, 150);
    }

    if (mousePressed && mouseX > 125 && mouseX < 345 && mouseY > 440 && mouseY < 530) {
      assignPoints();
    }
  }

  void thirdPage() {
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("Are you awake?", width/2, height/2 + 75);

    image(sleep, 70, height/2-150);
    image(goodmorningBtn, 5, height/2-450);



    if (mousePressed && mouseX < bottonX && mouseX > bottonX + bottonW && mouseY < bottonY && mouseY > bottonY + bottonH) {
      sequence = 1;
    }
  }

  void switchDisplay() {
    switch(sequence) {
    case 1:
      firstPage();
      break;

    case 2:
      secondPage();
      break;

    case 3:
      thirdPage();
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

  void assignPoints() {
     currentDay += 1;
     saveDays();
    
  }

  void sleepPointsTracker() {
    int points = millis() / 1000;
    loadDays();
    if(currentDay == daysPoints.length){
      for(int i = 0; i < daysPoints.length; i++){
        daysPoints[i] = 0;
        saveDays();
      }
      currentDay = 0;
    }
    if (points < 1) {
      daysPoints[currentDay] = 0;
    } else if (points == 1) {
      daysPoints[currentDay] = 10;
    } else if (points == 2) {
      daysPoints[currentDay] = 20;
    } else if (points == 3) {
      daysPoints[currentDay] = 30;
    } else if (points == 4) {
      daysPoints[currentDay] = 40;
    } else if (points == 5) {
      daysPoints[currentDay] = 50;
    } else if (points == 6) {
      daysPoints[currentDay] = 60;
    } else if (points == 7) {
      daysPoints[currentDay] = 70;
    } else if (points == 8) {
      daysPoints[currentDay] = 80;
    } else if (points == 9) {
      daysPoints[currentDay] = 90;
    } else if (points >= 10) {
      daysPoints[currentDay] = 100;
    }

    println(points);
    println(daysPoints[currentDay]);
  }
}
