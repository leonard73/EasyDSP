#include "empty_test.h"
#include "rpcmem.h"
#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(int argc, char* argv[])
{
  int nErr = 0;
  int runLocal = 0;
  int num = 0;

  if (argc < 3) {
    nErr = 1;
    goto bail;
  }
  runLocal = atoi(argv[1]);
  num = atoi(argv[2]);
  setbuf(stdout,NULL);
  printf("\n---Starting empty test\n");

  nErr = empty_test(runLocal, num);

bail:
  if (nErr) {
    printf("\n---Usage: %s <1/0 run locally> <uint32 size>\n\n", argv[0]);
  } else {
    printf("---Success\n\n");
  }

  return nErr;
}
