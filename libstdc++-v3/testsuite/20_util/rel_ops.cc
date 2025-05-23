// 2002-04-13  Paolo Carlini  <pcarlini@unitus.it>

// Copyright (C) 2002-2025 Free Software Foundation, Inc.
//
// This file is part of the GNU ISO C++ Library.  This library is free
// software; you can redistribute it and/or modify it under the
// terms of the GNU General Public License as published by the
// Free Software Foundation; either version 3, or (at your option)
// any later version.

// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License along
// with this library; see the file COPYING3.  If not see
// <http://www.gnu.org/licenses/>.

// { dg-options "-Wno-unused-result" }

// 20.2.1 Operators

#include <utility>
#include <vector>

using namespace std::rel_ops; // { dg-warning "deprecated" "" { target c++20 } }

// libstdc++/3628
void test01()
{
  std::vector<int> v;
  std::vector<int>::iterator vi;
  v.push_back(1);
  vi = v.end();
  vi != v.begin();
  vi > v.begin();
  vi <= v.begin();
  vi >= v.begin();
}

int main()
{
  test01();
  return 0;
}

