// RUN: %zapccxx -fsyntax-only -std=c++11 -debug-only=zapcc-files-list %s 2>&1 | FileCheck %s -allow-empty
// RUN: %zapccxx -fsyntax-only -std=c++11 -debug-only=zapcc-files-list %s 2>&1 | FileCheck %s -allow-empty
// CHECK-NOT: bug1549c.h U
#include "bug1549c.h"
struct Bug1549c_FileFn;
Bug1549c___wrap_iter<Bug1549c_FileFn> begin() { Bug1549c_begin1(); }
