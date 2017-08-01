/*******************************************************************************
Copyright (c) 2004-2017, AMIQ Consulting srl. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
******************************************************************************/



/**
 * Problem: implement a tree structure using SystemVerilog.
 * Each node has the following fields:
 * - color (you can use color_t from previous examples)
 * - sibling index: indicates the node index inside the list of siblings 
 * The tree should have a depth of maximum 8 and each non-leaf node can have at most 4 children.
 * Once the tree structure is defined you should initialize&display trees for the following cases:
 * - depth = 5, only 2 child nodes / parent
 * - depth = 3, random number of child nodes
 * 
 * Each node should implement a 
 * - print_me() method that displays the current node 
 * - print_tree() method that displays recursively, top-bottom, the whole tree 
 * 
 * TODO: Solve the problem using a procedural approach 
 * 
 * TODO: Solve the problem using constraint random generation
 * 
 * 
 */
