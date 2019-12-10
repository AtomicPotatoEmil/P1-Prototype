class Suggestion {
  PImage infoIcon;

  PImage [] tips = {loadImage("tip1.png"), loadImage("tip2.png"), loadImage("tip3.png"), loadImage("tip4.png"), loadImage("tip5.png")};
  int tipsIndex;
  Suggestion() {
    infoIcon = loadImage("infoIcon.png");

    tipsIndex = int(random(tips.length));
  }

  void drawTips() {
    textSize(30);
    text("Average points last week:", width/2, height/8);
    textSize(60);
    text("71", width/2, height/4);
    textSize(25);
    text("Try to sleep a bit more this week!", width/2,height/3+40);
      image(tips[tipsIndex], 0, 0);
  }
}
