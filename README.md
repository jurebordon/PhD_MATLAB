# Jure Bordon PhD MATLAB code and models

This repository contains refined MATLAB code and models from my research. The code is split into two chapters (two chapters of my PhD, two different publications), Chapter 6 (pub: ACM\IEEE Transactions on Computational Biology and Bioinformatics) and Chapter 7 (pub: Fundamenta Informaticae). 

## Chapter 6

Folder contains two separate models of a 3-gene represillator and an analysis suite for modelling the process of transcription.

### Conventnional model

'ODE' folder contains the conventional ordinary differential model of repressilator. In order to simulate the model, run the script `sim_run_Strelkowa_ODE.m` in MATLAB. Script `fft_Strelkowa_ODE.m` runs the FFT analysis of the simulation (it runs the sim beforehand). Script `evaluation_ODE.m` runs the parameter robustness test. The Simulink model is in the file `strelkowa_rep3_ODE.slx`.

### Fuzzy logic model

'FuzzyTransk' folder contains the model of repressilator where we used fuzzy logic to model transcription. In order to simulate the model, run the script `sim_run_Strelkowa_FLTransk.m` in MATLAB. Script `fft_Strelkowa_FLTransk.m` runs the FFT analysis of the simulation (it runs the sim beforehand). Script `evaluation_FL.m` runs the parameter robustness test. The Simulink model is in the file `strelkowa_rep3_FLtransk.slx`. The FIS for Fuzzy logic model is in the folder FIS.

### Transcription analysis

This folder contains analysis scripts/models for testing transcription process for different input functions (response, pulse, full model). We test 6 different models (3 ODE and 3 FL), to see how well our fuzzy logic model describes the transcription process.

## Chapter 7

Contains models and init scripts for all models (7 Fuzzy logic and 1 pure ODE). Each fuzzy logic model has one or more processes described with fuzzy logic. The names of files convey which processes are swapped.