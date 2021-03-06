int state=0;//0-title page, 1-choose your weapon, 2-animate the battle, 3-stats, 4-game over
PImage easy, hard;
PImage paper;//1
PImage rock;//3
PImage scissor;//2
PImage paperSad, rockSad, scissorSad;
PImage paperTie, rockTie, scissorTie;
PImage home, playAgain, stats, quit;
PImage exploW, exploL, exploT;
PImage winner, loser, tied;
int pChoice, cChoice;
float deltaXtr, deltaXtp, deltaXts; //change in X of images on title page
float deltaXp=0, deltaXc=displayWidth; //change in X of images on animated battle page
int deltaEw=0, deltaEh=0; //change in explosion displayWidth & displayHeight
int deltaWbw, deltaWbl, deltaWbt; //change in width of banner
int win=0, lose=0, tie=0;
float total, winp, tiep, losep;
int r=0, p=0, s=0;//# of times each is chosen
boolean sketchFullScreen() {
  return true;}

void setup() {
  size(displayWidth, displayHeight);
  background(240); 
  easy=loadImage("easy.png");
  hard=loadImage("hard.png");
  home=loadImage("HomeIcon.png");
  playAgain=loadImage("PlayAgain.png");
  stats=loadImage("Stats.png");
  exploW=loadImage("ExplosionWint.png");
  exploL=loadImage("ExplosionLoset.png");
  exploT=loadImage("exploT.png");
  paper=loadImage("Paper2.png");//1-paper
  rock=loadImage("Rock.png");//3-Rock
  scissor=loadImage("Scissors.png");//2-Scissor
  paperSad=loadImage("PaperSad.png");
  rockSad=loadImage("RockSad.png");
  scissorSad=loadImage("scissorSad.png");
  paperTie=loadImage("paperTie.png");
  rockTie=loadImage("rockTie.png");
  scissorTie=loadImage("scissorTie.png");
  winner=loadImage("winner.png");
  loser=loadImage("loser.png");
  tied=loadImage("tied.png");
  quit=loadImage("Quit.png");
}

void draw() {

  //////////////////////////////////////////////////////////// STATE 0 - Title Page ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 

  if (state==0) {
    if (deltaXts<4*displayWidth/5)
      deltaXts+=displayWidth/50;
    if (deltaXtp<displayWidth/2)
      deltaXtp+=displayWidth/50;
    if (deltaXtr<displayWidth/5)
      deltaXtr+=displayWidth/50;
    background(0, 100, 255);
    textSize(displayWidth/14);
    fill(255);
    text("Rock, Paper, Scissor!" + "\nClick button to begin!", displayWidth/7, displayHeight/4);
    imageMode(CORNER);
    image(quit, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//quit button
    imageMode(CENTER);
    image(easy, 6*displayWidth/18, 6*displayHeight/10, displayWidth/4, displayHeight/4);//easy
    image(hard, 12*displayWidth/18, 6*displayHeight/10, displayWidth/4, displayHeight/4);//hard
    image(scissor, deltaXts, 17*displayHeight/20, displayWidth/7, displayHeight/4);//2-scissor
    image(paper, deltaXtp, 17*displayHeight/20, displayWidth/6, displayHeight/4);//1-paper
    image(rock, deltaXtr, 17*displayHeight/20, displayWidth/5, displayHeight/4);//3-rock
  }

  //////////////////////////////////////////////////////////// STATE 1 - Choose your weapon /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 

  else if (state==1) {
    background (0, 100, 255);
    fill(255);
    imageMode(CORNER);
    image(home, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//home button
    textSize(displayWidth/14);
    text("\"Rock, Paper, Scissor\"", displayWidth/5, displayHeight/8);
    imageMode(CENTER);
    image(paper, displayWidth/2, 3*displayHeight/5, displayWidth/5, displayWidth/4);//1-paper
    image(rock, displayWidth/5, 3*displayHeight/5, displayWidth/4, displayWidth/4);//3-rock
    image(scissor, 4*displayWidth/5, 3*displayHeight/5, displayWidth/7, displayWidth/4);//2-scissor
  }

  //////////////////////////////////////////////////////////// STATE 2 - Animate the Battle //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 

  else if (state==2) {
    background (0, 100, 255);
    imageMode(CORNER);
    image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
    image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
    imageMode(CENTER);
    noStroke();
    if (deltaEw<displayWidth)
      deltaEw+=displayWidth/35;
    if (deltaEh<displayHeight)
      deltaEh+=displayHeight/35;
    if (deltaXp<displayWidth/4)
      deltaXp+=displayWidth/130;
    if (deltaXc>3*displayWidth/4)
      deltaXc-=displayWidth/130;
    if (pChoice==cChoice) {
      if (cChoice==1 && pChoice==1) {  
        fill (0, 140, 0);
        rect(displayWidth/2, 0, displayWidth/2, displayHeight);
        imageMode(CENTER);
        image(exploT, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
        image(paperTie, deltaXp, 3*displayHeight/5, displayWidth/5, displayWidth/4);//1-paper
        image(paperTie, deltaXc, 3*displayHeight/5, displayWidth/5, displayWidth/4);//1-paper
        imageMode(CORNER);
        image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
        image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
      }
      else if (cChoice==2 && pChoice==2) {
        fill (0, 140, 0);
        rect(displayWidth/2, 0, displayWidth/2, displayHeight);
        imageMode(CENTER);
        image(exploT, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
        image(scissorTie, deltaXp, 3*displayHeight/5, displayWidth/7, displayWidth/4);//2-scissor
        image(scissorTie, deltaXc, 3*displayHeight/5, displayWidth/7, displayWidth/4);//2-scissor
        imageMode(CORNER);
        image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
        image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
      }
      else if (cChoice==3 && cChoice==3) {
        fill (0, 140, 0);
        rect(displayWidth/2, 0, displayWidth/2, displayHeight);
        imageMode(CENTER);
        image(exploT, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
        image(rockTie, deltaXp, 3*displayHeight/5, displayWidth/4, displayWidth/4);//3-rock
        image(rockTie, deltaXc, 3*displayHeight/5, displayWidth/4, displayWidth/4);//3-rock
        imageMode(CORNER);
        image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
        image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
      }
    }
    else
      if (pChoice==1) {
        if (cChoice==2) {
          fill (0, 140, 0);
          rect(displayWidth/2, 0, displayWidth/2, displayHeight);
          imageMode(CORNER);
          image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
          image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
          imageMode(CENTER);
          image(exploL, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
          image(paperSad, deltaXp, 3*displayHeight/5, displayWidth/6, displayWidth/5);//1-paper
          image(scissor, deltaXc, 3*displayHeight/5, displayWidth/8, displayWidth/5);//2-scissor
        }
        else if (cChoice==3) {
          fill (0, 140, 0);
          rect(displayWidth/2, 0, displayWidth/2, displayHeight);
          imageMode(CORNER);
          image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
          image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
          imageMode(CENTER);
          image(exploW, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
          image(paper, deltaXp, 3*displayHeight/5, displayWidth/6, displayWidth/5);//1-paper
          image(rockSad, deltaXc, 3*displayHeight/5, displayWidth/5, displayWidth/5);//3-rock
        }
      }
      else if (pChoice==2) {
        if (cChoice==1) {
          fill (0, 140, 0);
          rect(displayWidth/2, 0, displayWidth/2, displayHeight);
          imageMode(CORNER);
          image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
          image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
          imageMode(CENTER);
          image(exploW, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
          image(scissor, deltaXp, 3*displayHeight/5, displayWidth/8, displayWidth/5);//2-scissor
          image(paperSad, deltaXc, 3*displayHeight/5, displayWidth/6, displayWidth/5);//1-paper
        }
        else if (cChoice==3) {
          fill (0, 140, 0);
          rect(displayWidth/2, 0, displayWidth/2, displayHeight);
          imageMode(CORNER);
          image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
          image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
          imageMode(CENTER);
          image(exploL, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
          image(scissorSad, deltaXp, 3*displayHeight/5, displayWidth/8, displayWidth/5);//2-scissor
          image(rock, deltaXc, 3*displayHeight/5, displayWidth/5, displayWidth/5);//3-rock
        }
      }
      else if (pChoice==3) {
        if (cChoice==1) {
          fill (0, 140, 0);
          rect(displayWidth/2, 0, displayWidth/2, displayHeight);
          imageMode(CORNER);
          image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
          image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
          imageMode(CENTER);
          image(exploL, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
          image(rockSad, deltaXp, 3*displayHeight/5, displayWidth/5, displayWidth/5);//3-rock
          image(paper, deltaXc, 3*displayHeight/5, displayWidth/6, displayWidth/5);//1-paper
        }
        else if (cChoice==2) {
          fill (0, 140, 0);
          rect(displayWidth/2, 0, displayWidth/2, displayHeight);
          imageMode(CORNER);
          image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
          image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
          imageMode(CENTER);
          image(exploW, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
          image(rock, deltaXp, 3*displayHeight/5, displayWidth/5, displayWidth/5);//3-rock
          image(scissorSad, deltaXc, 3*displayHeight/5, displayWidth/8, displayWidth/5);//2-scissor
        }
      }
  }

  //////////////////////////////////////////////////////////// STATE 3 - Stats /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  else if (state==3) {
    background (0, 100, 255);
    imageMode(CORNER);
    image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
    image(home, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//home button
    image(quit, 8*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//quit button
    total=win+lose+tie;
    winp=100*win/total;
    tiep=100*tie/total;
    losep=100*lose/total;
    if (deltaWbt<displayWidth/3)
      deltaWbt+=displayWidth/42;
    else if (deltaWbw<displayWidth/3)
      deltaWbw+=displayWidth/42;
    else if (deltaWbl<displayWidth/3)
      deltaWbl+=displayWidth/42;
    if (losep==winp)
      image(tied, 2*displayWidth/5, displayHeight/10-displayWidth/20, deltaWbt, displayWidth/8);//tie banner
    else if (winp>losep)
      image(winner, 2*displayWidth/5, displayHeight/10-displayWidth/20, deltaWbw, displayWidth/8);//win banner
    else if (losep>winp)
      image(loser, 2*displayWidth/5, displayHeight/10-displayWidth/20, deltaWbl, displayWidth/8);//lose banner
    fill(255);
    text("Stats!", displayWidth/5, displayHeight/8);
    textSize(displayWidth/30);
    String pw=nf(winp, 1, 2);
    String pl=nf(losep, 1, 2);
    String pt=nf(tiep, 1, 2);
    text("Player Stats" + "\nWins: " + win + "\nTies: " + tie + "\nLosses: " + lose + "\nWin %: " + pw + "\nTie %: " + pt + "\nLoss %: " + pl, 1*displayWidth/20, 3*displayHeight/10 );
    String cl=nf(winp, 1, 2);
    String cw=nf(losep, 1, 2);
    String ct=nf(tiep, 1, 2);
    text("Computer Stats" + "\nWins: " + lose + "\nTies: " + tie + "\nLosses: " + win + "\nWin %: " + cw + "\nTie %: " + ct + "\nLoss %: " + cl, 11*displayWidth/20, 3*displayHeight/10 );
  }

  //////////////////////////////////////////////////////////// STATE 4 - Hard - Choose Your Weapon /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  else if (state==4) {
    background (0, 100, 255);
    fill(255);
    imageMode(CORNER);
    image(home, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//home button
    textSize(displayWidth/14);
    text("\"Rock, Paper, Scissor\"", displayWidth/5, displayHeight/8);
    imageMode(CENTER);
    image(paper, displayWidth/2, 3*displayHeight/5, displayWidth/5, displayWidth/4);//1-paper
    image(rock, displayWidth/5, 3*displayHeight/5, displayWidth/4, displayWidth/4);//3-rock
    image(scissor, 4*displayWidth/5, 3*displayHeight/5, displayWidth/7, displayWidth/4);//2-scissor
  }

  //////////////////////////////////////////////////////////// STATE 5 - Hard - Animate the Battle ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  else if (state==5) {
    background (0, 100, 255);
    imageMode(CORNER);
    image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
    image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
    imageMode(CENTER);
    noStroke();
    if (deltaEw<displayWidth)
      deltaEw+=displayWidth/35;
    if (deltaEh<displayHeight)
      deltaEh+=displayHeight/35;
    if (deltaXp<displayWidth/4)
      deltaXp+=displayWidth/130;
    if (deltaXc>3*displayWidth/4)
      deltaXc-=displayWidth/130;
    if (pChoice==cChoice) {
      if (cChoice==1 && pChoice==1) {  
        fill (0, 140, 0);
        rect(displayWidth/2, 0, displayWidth/2, displayHeight);
        imageMode(CENTER);
        image(exploT, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
        image(paperTie, deltaXp, 3*displayHeight/5, displayWidth/5, displayWidth/4);//1-paper
        image(paperTie, deltaXc, 3*displayHeight/5, displayWidth/5, displayWidth/4);//1-paper
        imageMode(CORNER);
        image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
        image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
      }
      else if (cChoice==2 && pChoice==2) {
        fill (0, 140, 0);
        rect(displayWidth/2, 0, displayWidth/2, displayHeight);
        imageMode(CENTER);
        image(exploT, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
        image(scissorTie, deltaXp, 3*displayHeight/5, displayWidth/7, displayWidth/4);//2-scissor
        image(scissorTie, deltaXc, 3*displayHeight/5, displayWidth/7, displayWidth/4);//2-scissor
        imageMode(CORNER);
        image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
        image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
      }
      else if (cChoice==3 && cChoice==3) {
        fill (0, 140, 0);
        rect(displayWidth/2, 0, displayWidth/2, displayHeight);
        imageMode(CENTER);
        image(exploT, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
        image(rockTie, deltaXp, 3*displayHeight/5, displayWidth/4, displayWidth/4);//3-rock
        image(rockTie, deltaXc, 3*displayHeight/5, displayWidth/4, displayWidth/4);//3-rock
        imageMode(CORNER);
        image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
        image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
      }
    }
    else
      if (pChoice==1) {
        if (cChoice==2) {
          fill (0, 140, 0);
          rect(displayWidth/2, 0, displayWidth/2, displayHeight);
          imageMode(CORNER);
          image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
          image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
          imageMode(CENTER);
          image(exploL, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
          image(paperSad, deltaXp, 3*displayHeight/5, displayWidth/6, displayWidth/5);//1-paper
          image(scissor, deltaXc, 3*displayHeight/5, displayWidth/8, displayWidth/5);//2-scissor
        }
        else if (cChoice==3) {
          fill (0, 140, 0);
          rect(displayWidth/2, 0, displayWidth/2, displayHeight);
          imageMode(CORNER);
          image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
          image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
          imageMode(CENTER);
          image(exploW, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
          image(paper, deltaXp, 3*displayHeight/5, displayWidth/6, displayWidth/5);//1-paper
          image(rockSad, deltaXc, 3*displayHeight/5, displayWidth/5, displayWidth/5);//3-rock
        }
      }
      else if (pChoice==2) {
        if (cChoice==1) {
          fill (0, 140, 0);
          rect(displayWidth/2, 0, displayWidth/2, displayHeight);
          imageMode(CORNER);
          image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
          image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
          imageMode(CENTER);
          image(exploW, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
          image(scissor, deltaXp, 3*displayHeight/5, displayWidth/8, displayWidth/5);//2-scissor
          image(paperSad, deltaXc, 3*displayHeight/5, displayWidth/6, displayWidth/5);//1-paper
        }
        else if (cChoice==3) {
          fill (0, 140, 0);
          rect(displayWidth/2, 0, displayWidth/2, displayHeight);
          imageMode(CORNER);
          image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
          image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
          imageMode(CENTER);
          image(exploL, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
          image(scissorSad, deltaXp, 3*displayHeight/5, displayWidth/8, displayWidth/5);//2-scissor
          image(rock, deltaXc, 3*displayHeight/5, displayWidth/5, displayWidth/5);//3-rock
        }
      }
      else if (pChoice==3) {
        if (cChoice==1) {
          fill (0, 140, 0);
          rect(displayWidth/2, 0, displayWidth/2, displayHeight);
          imageMode(CORNER);
          image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
          image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
          imageMode(CENTER);
          image(exploL, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
          image(rockSad, deltaXp, 3*displayHeight/5, displayWidth/5, displayWidth/5);//3-rock
          image(paper, deltaXc, 3*displayHeight/5, displayWidth/6, displayWidth/5);//1-paper
        }
        else if (cChoice==2) {
          fill (0, 140, 0);
          rect(displayWidth/2, 0, displayWidth/2, displayHeight);
          imageMode(CORNER);
          image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
          image(stats, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//stats button
          imageMode(CENTER);
          image(exploW, displayWidth/2, displayHeight/2, deltaEw, deltaEh);
          image(rock, deltaXp, 3*displayHeight/5, displayWidth/5, displayWidth/5);//3-rock
          image(scissorSad, deltaXc, 3*displayHeight/5, displayWidth/8, displayWidth/5);//2-scissor
        }
      }
  }

  //////////////////////////////////////////////////////////// STATE 6 - Hard - Stats //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  else if (state==6) {
    background (0, 100, 255);
    imageMode(CORNER);
    image(playAgain, displayWidth/10-displayWidth/15, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//play again button
    image(home, 9*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//home button
    image(quit, 8*displayWidth/10, displayHeight/10-displayWidth/20, displayWidth/15, displayWidth/15);//quit button
    total=win+lose+tie;
    winp=100*win/total;
    tiep=100*tie/total;
    losep=100*lose/total;
    if (deltaWbt<displayWidth/3)
      deltaWbt+=displayWidth/42;
    else if (deltaWbw<displayWidth/3)
      deltaWbw+=displayWidth/42;
    else if (deltaWbl<displayWidth/3)
      deltaWbl+=displayWidth/42;
    if (losep==winp)
      image(tied, 2*displayWidth/5, displayHeight/10-displayWidth/20, deltaWbt, displayWidth/8);//tie banner
    else if (winp>losep)
      image(winner, 2*displayWidth/5, displayHeight/10-displayWidth/20, deltaWbw, displayWidth/8);//win banner
    else if (losep>winp)
      image(loser, 2*displayWidth/5, displayHeight/10-displayWidth/20, deltaWbl, displayWidth/8);//lose banner
    fill(255);
    text("Stats!", displayWidth/5, displayHeight/8);
    textSize(displayWidth/30);
    String pw=nf(winp, 1, 2);
    String pl=nf(losep, 1, 2);
    String pt=nf(tiep, 1, 2);
    text("Player Stats" + "\nWins: " + win + "\nTies: " + tie + "\nLosses: " + lose + "\nWin %: " + pw + "\nTie %: " + pt + "\nLoss %: " + pl, 1*displayWidth/20, 3*displayHeight/10 );
    String cl=nf(winp, 1, 2);
    String cw=nf(losep, 1, 2);
    String ct=nf(tiep, 1, 2);
    text("Computer Stats" + "\nWins: " + lose + "\nTies: " + tie + "\nLosses: " + win + "\nWin %: " + cw + "\nTie %: " + ct + "\nLoss %: " + cl, 11*displayWidth/20, 3*displayHeight/10 );
  }
}

////////////////////////////////////////////////////////////Mouse Clicked////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 

void mouseClicked() {
  if (state==0) {
    if (mouseX>(6*displayWidth/18-displayWidth/8) && mouseX<(6*displayWidth/18+displayWidth/8) && mouseY>(6*displayHeight/10-displayWidth/12) && mouseY<(6*displayHeight/10+displayWidth/12)) {//easy
      state=1;
      deltaEw=0;
      deltaEh=0;
      win=0;
      lose=0;
      tie=0;
      r=0;
      s=0;
      p=0;
    }
    if (mouseX>(displayWidth/10-displayWidth/15) && mouseX<displayWidth/10 && mouseY>(displayHeight/10-displayWidth/20) && mouseY<(displayHeight/10-displayWidth/20+displayWidth/15))//quit
      exit();
    else if (mouseX>(12*displayWidth/18-displayWidth/8) && mouseX<(12*displayWidth/18+displayWidth/8) && mouseY>(6*displayHeight/10-displayWidth/12) && mouseY<(6*displayHeight/10+displayWidth/12)) { //hard
      state=4;
      deltaEw=0;
      deltaEh=0;
      win=0;
      lose=0;
      tie=0;
      r=0;
      s=0;
      p=0;
    }
  }
  else if (state==1) {
    if (mouseX>(displayWidth/10-displayWidth/15) && mouseX<displayWidth/10 && mouseY>(displayHeight/10-displayWidth/20) && mouseY<(displayHeight/10-displayWidth/20+displayWidth/15)) {//home
      state=0;
      win=0;
      lose=0;
      tie=0;
      r=0;
      s=0;
      p=0;
    }
    else if (mouseX>(displayWidth/2-displayWidth/10) && mouseX<(displayWidth/2+displayWidth/10) && mouseY>(3*displayHeight/5-displayWidth/8) && mouseY<(3*displayHeight/5+displayWidth/8)) {//paper
      state=2;
      pChoice=1;
      deltaXp=0; 
      deltaXc=displayWidth;
      cChoice=(int)random(1, 4);
      if (cChoice==1)
        tie+=1;
      else if (cChoice==2)
        lose+=1;
      else if (cChoice==3)
        win+=1;
    }
    else if (mouseX>(displayWidth/5-displayWidth/8) && mouseX<(displayWidth/5+displayWidth/8) && mouseY>(3*displayHeight/5-displayWidth/8) && mouseY<(3*displayHeight/5+displayWidth/8)) {//rock
      state=2;
      pChoice=3;
      deltaXp=0;
      deltaXc=displayWidth;
      cChoice=(int)random(1, 4);
      if (cChoice==1)
        lose+=1;
      else if (cChoice==2)
        win+=1;
      else if (cChoice==3)
        tie+=1;
    }
    else if (mouseX>(4*displayWidth/5-displayWidth/14) && mouseX<(4*displayWidth/5+displayWidth/14) && mouseY>(3*displayHeight/5-displayWidth/8) && mouseY<(3*displayHeight/5+displayWidth/8)) {//scissor
      state=2;
      pChoice=2;
      deltaXp=0;
      deltaXc=displayWidth;
      cChoice=(int)random(1, 4);
      if (cChoice==1)
        win+=1;
      else if (cChoice==2)
        tie+=1;
      else if (cChoice==3)
        lose+=1;
    }
  }
  else if (state==2) {
    if (mouseX>(displayWidth/10-displayWidth/15) && mouseX<displayWidth/10 && mouseY>(displayHeight/10-displayWidth/20) && mouseY<(displayHeight/10-displayWidth/20+displayWidth/15)) {//playAgain
      state=1;
      deltaEw=0;
      deltaEh=0;
    }
    if (mouseX>9*displayWidth/10 && mouseX<(9*displayWidth/10+displayWidth/15) && mouseY>(displayHeight/10-displayWidth/20) && mouseY<(displayHeight/10-displayWidth/20+displayWidth/15))//stats button
      state=3;
    deltaWbt=0;
    deltaWbw=0;
    deltaWbl=0;
  }

  else if (state==3) {
    if (mouseX>(displayWidth/10-displayWidth/15) && mouseX<displayWidth/10 && mouseY>(displayHeight/10-displayWidth/20) && mouseY<(displayHeight/10-displayWidth/20+displayWidth/15)) {//playAgain
      state=1;
      deltaEw=0;
      deltaEh=0;
    }
    if (mouseX>9*displayWidth/10 && mouseX<(9*displayWidth/10+displayWidth/15) && mouseY>(displayHeight/10-displayWidth/20) && mouseY<(displayHeight/10-displayWidth/20+displayWidth/15))//home button
      state=0;
    deltaXtr=0;
    deltaXtp=0;
    deltaXts=0;
    if (mouseX>8*displayWidth/10 && mouseX<((8*displayWidth/10)+displayWidth/15) && mouseY>(displayHeight/10-displayWidth/20) && mouseY<((displayHeight/10-displayWidth/20)+displayWidth/15))//quit
      exit();
  }
  else if (state==4) {
    if (s==p && s==r)
      cChoice=(int)random(1, 4);
    else if ((p>r && p>s) || (s==r && s>p))
      cChoice=2;
    else if ((r>p && r>s) || (p==s && p>r))
      cChoice=1;
    else if ((s>p && s>r) || (p==r && p>s))
      cChoice=3;
    else
      cChoice=(int)random(1, 4);
    if (mouseX>(displayWidth/10-displayWidth/15) && mouseX<displayWidth/10 && mouseY>(displayHeight/10-displayWidth/20) && mouseY<(displayHeight/10-displayWidth/20+displayWidth/15)) {//home
      state=0;
      win=0;
      lose=0;
      tie=0;
      r=0;
      s=0;
      p=0;
      deltaXtr=0;
      deltaXtp=0;
      deltaXts=0;
    }
    else if (mouseX>(displayWidth/2-displayWidth/10) && mouseX<(displayWidth/2+displayWidth/10) && mouseY>(3*displayHeight/5-displayWidth/8) && mouseY<(3*displayHeight/5+displayWidth/8)) {//paper
      p++;
      state=5;
      pChoice=1;
      deltaXp=0;
      deltaXc=displayWidth;
      if (cChoice==1)
        tie+=1;
      else if (cChoice==2)
        lose+=1;
      else if (cChoice==3)
        win+=1;
    }
    else if (mouseX>(displayWidth/5-displayWidth/8) && mouseX<(displayWidth/5+displayWidth/8) && mouseY>(3*displayHeight/5-displayWidth/8) && mouseY<(3*displayHeight/5+displayWidth/8)) {//rock
      r++;
      state=5;
      pChoice=3;
      deltaXp=0;
      deltaXc=displayWidth;
      if (cChoice==1)
        lose+=1;
      else if (cChoice==2)
        win+=1;
      else if (cChoice==3)
        tie+=1;
    }
    else if (mouseX>(4*displayWidth/5-displayWidth/14) && mouseX<(4*displayWidth/5+displayWidth/14) && mouseY>(3*displayHeight/5-displayWidth/8) && mouseY<(3*displayHeight/5+displayWidth/8)) {//scissor
      s++;
      state=5;
      pChoice=2;
      deltaXp=0;
      deltaXc=displayWidth;
      if (cChoice==1)
        win+=1;
      else if (cChoice==2)
        tie+=1;
      else if (cChoice==3)
        lose+=1;
    }
  }
  else if (state==5) {
    if (mouseX>(displayWidth/10-displayWidth/15) && mouseX<displayWidth/10 && mouseY>(displayHeight/10-displayWidth/20) && mouseY<(displayHeight/10-displayWidth/20+displayWidth/15)) {//playAgain
      state=4;
      deltaEw=0;
      deltaEh=0;
    }
    if (mouseX>9*displayWidth/10 && mouseX<(9*displayWidth/10+displayWidth/15) && mouseY>(displayHeight/10-displayWidth/20) && mouseY<(displayHeight/10-displayWidth/20+displayWidth/15))//stats button
      state=6;
    deltaWbt=0;
    deltaWbw=0;
    deltaWbl=0;
  }
  else if (state==6) {
    if (mouseX>(displayWidth/10-displayWidth/15) && mouseX<displayWidth/10 && mouseY>(displayHeight/10-displayWidth/20) && mouseY<(displayHeight/10-displayWidth/20+displayWidth/15)) {//playAgain
      state=4;
      deltaEw=0;
      deltaEh=0;
    }
    if (mouseX>9*displayWidth/10 && mouseX<(9*displayWidth/10+displayWidth/15) && mouseY>(displayHeight/10-displayWidth/20) && mouseY<(displayHeight/10-displayWidth/20+displayWidth/15))//home button
      state=0;
    deltaXtr=0;
    deltaXtp=0;
    deltaXts=0;
    if (mouseX>8*displayWidth/10 && mouseX<((8*displayWidth/10)+displayWidth/15) && mouseY>(displayHeight/10-displayWidth/20) && mouseY<((displayHeight/10-displayWidth/20)+displayWidth/15))//quit
      exit();
  }
}

