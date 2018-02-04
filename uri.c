#include <stdio.h>

void move(int row, int col)
{
  printf("\033[%d;%dH", row, col);
}

int main()
{
  int id = 42;
  char *url = "http://example.com/some/path";

  move(6, 5);
  printf("simple link marked");

  move(7, 5);
  printf("\033]8;id=%d;%s\007", id, url);
  fflush(stdout);
  printf(url);
  printf("\033]8;;\007");
  fflush(stdout);

  printf("\n\n\n\n");

  return 0;
}
