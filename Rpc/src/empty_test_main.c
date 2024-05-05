/*==============================================================================
  Copyright (c) 2012-2013 Qualcomm Technologies, Inc.
  All rights reserved. Qualcomm Proprietary and Confidential.
==============================================================================*/

#include <stdio.h>
#include "verify.h"

#include "empty.h"
#include "empty_test.h"

#ifndef CALC_EXPORT
#define CALC_EXPORT
#endif /*CALC_EXPORT*/

#if defined(_WIN32) && !defined(_ARM_)
#include "ptl_remote_invoke.h"
CALC_EXPORT int init(pfn_getSymbol GetSymbol)
{
   return remote_invoke_stub_init(GetSymbol);
}
#endif

CALC_EXPORT int main(void)
{
   int nErr  =  0;
   nErr=empty_test(1, 256);
   nErr+=empty_test(0, 256);

   return nErr;
}
