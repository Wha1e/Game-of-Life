boolean points[][] = new boolean[100][100]; //<>// //<>//
boolean updPoints[][] = new boolean[100][100];
Boolean running = false;

void setup()
{
  frameRate(60);
  size(1000, 1000);
  background(255);
}

int numOfLiveNeighbors(int i, int j)
{
  int neighb = 0;
  if (i == 0 || i == 99 || j == 0 || j == 99)
  {
    return neighb;
  }
  
  if( points[i-1][j+1] == true )
  {
    neighb += 1;
  }
  if( points[i][j+1] == true )
  {
    neighb += 1;
  }
  if( points[i+1][j+1] == true )
  {
    neighb += 1;
  }
  if( points[i-1][j] == true )
  {
    neighb += 1;
  }
  if( points[i+1][j] == true )
  {
    neighb += 1;
  }
  if( points[i-1][j-1] == true )
  {
    neighb += 1;
  }
  if( points[i][j-1] == true )
  {
    neighb += 1;
  }
  if( points[i+1][j-1] == true )
  {
    neighb += 1;
  }
  return neighb;
}

boolean GameOfLife(int i, int j)
{
  if (i == 0 || i == 99 || j == 0 || j == 99)
  {
    return false;
  }
  if( points[i][j] == false && numOfLiveNeighbors(i, j) == 3 )
  {
    return true;
  }
  else if( points[i][j] == true && numOfLiveNeighbors(i, j) < 2 )
  {
    return false;
  }
  else if( points[i][j] == true && (numOfLiveNeighbors(i, j) == 2 || numOfLiveNeighbors(i, j) == 3) )
  {
    return true;
  }
  else if( points[i][j] == true && numOfLiveNeighbors(i, j) > 3 )
  {
    return false;
  }
  else
  {
    return false;
  }
}

void draw()
{
  if( running )
  {
    background(255);
    for( int grid = 0; grid < 1000; grid += 10 )
    {
      stroke(126);
      line(grid, 0, grid, 1000);
      stroke(126);
      line(0, grid, 1000, grid);
    }
    stroke(126);
    fill(0);
    rect(10, 10, 60, 30);
    textSize(20);
    fill(255);
    text("Stop", 15, 30);
    
    stroke(126);
    fill(0);
    rect(10, 40, 60, 30);
    textSize(20);
    fill(255);
    text("Reset", 15, 60);
    
    if( mousePressed && ( mouseButton == LEFT ) )
    {
      if( mouseX > 10 && mouseX < 70 && mouseY > 10 && mouseY < 40 )
      {
        running = false;
      }
      else if( mouseX > 10 && mouseX < 70 && mouseY > 40 && mouseY < 70 )
      {
        for( int i = 0; i < 100; i++ )
        {
          for ( int j = 0; j < 100; j++ )
          {
            points[i][j] = false;
          }
        }
      }
    }
    
    for( int i = 0; i < 100; i++ )
    {
      for ( int j = 0; j < 100; j++ )
      {
        if (points[i][j] == true)
        {
          stroke(0);
          fill(0);
          rect(j*10, i*10, 10, 10);
        }
        updPoints[i][j] = GameOfLife(i, j);
      }
    }
    for( int i = 0; i < 100; i++ )
    {
      for ( int j = 0; j < 100; j++ )
      {
        points[i][j] = updPoints[i][j];
      }
    }
  }
  else
  {
    background(255);
    for( int grid = 0; grid < 1000; grid += 10 )
    {
      stroke(126);
      line(grid, 0, grid, 1000);
      stroke(126);
      line(0, grid, 1000, grid);
    }
    stroke(126);
    fill(0);
    rect(10, 10, 60, 30);
    textSize(20);
    fill(255);
    text("Start", 20, 30);
    
    stroke(126);
    fill(0);
    rect(10, 40, 60, 30);
    textSize(20);
    fill(255);
    text("Reset", 15, 60);
    
    if( mousePressed && ( mouseButton == LEFT ) )
    {
      if( mouseX > 10 && mouseX < 70 && mouseY > 10 && mouseY < 40 )
      {
        running = true;
      }
      else if( mouseX > 10 && mouseX < 70 && mouseY > 40 && mouseY < 70 )
      {
        for( int i = 0; i < 100; i++ )
        {
          for ( int j = 0; j < 100; j++ )
          {
            points[i][j] = false;
          }
        }
      }
      else
      {
        if( points[mouseY/10][mouseX/10] == false)
        {
          points[mouseY/10][mouseX/10] = true;
        }
        else
        {
          points[mouseY/10][mouseX/10] = false;
        }
      }
    }
    for( int i = 0; i < 100; i++ )
    {
      for ( int j = 0; j < 100; j++ )
      {
        if (points[i][j] == true)
        {
          stroke(0);
          fill(0);
          rect(j*10, i*10, 10, 10);
        }
      }
    }
  }
}