void drawGrid()
{
  for (i=0; i<width/BlockSize; i++)
  {
    stroke(50, 50);
    noFill();
    for (j=0; j<height/BlockSize; j++)
    {
      rect(i*BlockSize,j*BlockSize, BlockSize, BlockSize);
    }
  }
}

void checkBorder()
{
  if(snakeHead.posX < 0 || snakeHead.posX > width-1)
  {
    background(255);
  }
  if(snakeHead.posY < 0 || snakeHead.posY > height-1)
  {
    background(255);
  }
}

void eatFood()
{
  if((foods.posX == snakeHead.posX) && (foods.posY == snakeHead.posY))
  {
    score++;
    tempX = foods.posX;
    tempY = foods.posY;
    foods.posX = (int)(random(0,width/BlockSize))*inc;
    foods.posY = (int)(random(0,height/BlockSize))*inc;
    
    addSnake();
  }
}

void addSnake()
{
  int x, y, listSize;
  listSize = snakeBody.size();
  if(score == 1)
  {
    x = snakeHead.posX;
    y = snakeHead.posY;
    println("addSnake: "+x, y);
  }
  else
  {
    x = snakeBody.get(snakeBody.size()-1).posX;
    y = snakeBody.get(snakeBody.size()-1).posY;
    x = tempX;
    y = tempY;
    println("addSnake: "+x, y);
  }
  snakeBody.add(new SnakeTail(x, y));
  println("arraylist:  ");
  //println(snakeBody.size());
}

void moveSnake()
{
  int x, y, listSize;
  SnakeTail trail;
  listSize = snakeBody.size();
  
  for(int i=listSize-1; i > 0; i--)
  {
    x = snakeBody.get(i-1).posX;
    y = snakeBody.get(i-1).posY;
    trail = new SnakeTail(x, y);
      snakeBody.set(i, trail);
  }
  x = snakeHead.posX;
  y = snakeHead.posY;
  trail = new SnakeTail(x, y);
  
  if(listSize != 0)
  {
    snakeBody.set(0, trail);
  }
  
  snakeHead.drawSnake();
  for(int i=0; i < snakeBody.size(); i++)
  {
    snakeBody.get(i).drawTail();
  }
  //if()
  {
    println("for:  ");
    for(int i=0; i < snakeBody.size(); i++)
    {
      println(i+":",snakeBody.get(i).posX,snakeBody.get(i).posY);
    }
  }
}