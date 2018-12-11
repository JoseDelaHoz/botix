#!/bin/bash

factorial()
{
   ls -1 process/usuarios |sed 's/.json//g' > process/ruts 
   gtimeout 40 babel-node process/Download_Updates.js
   factorial
}
factorial