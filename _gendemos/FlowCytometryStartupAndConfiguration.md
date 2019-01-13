---
title: "Flow Cytometry Startup Instructions"
main_author: FH Flow Core
last_modified_at: 2019-01-08
primary_reviewers: vortexing
---


## Changing the Sheath Tank Fluid and Waste
1. Check the fluid levels. This can be done by checking their weight or opening the lids. The weight of the sheath tank (looks like a box) when full (20L) is approximately 20 kg. Tanks should never run empty. There is a level indicator in the diva program on the cytometer window. 
2. WASTE: Disconnect waste tank and unscrew the large lid to pour out the waste into the lab sink.
3. SHEATH FLUID: Disconnect and unscrew the level sense probe to remove it.
4. Add 1x PBS (sheath fluid) to the tank and fill to the top weld line.
5. Replace and secure the lid by pressing the down the latch or screwing tight the fastener at the top.
6. Reattach the tank to the fluidics cart
7. Bleed the three fluid filters on the front of the fluidics cart by unscrewing the bleed port.  These are gravity fed and pressure from the tanks should force air out of the bleed ports.  Replace the plugs once the air is removed.


## Overview of the DIVA software
- Cytometer settings file (also known as instrument settings in older files): This file contains parameter voltage settings, threshold set point, and laser delay settings that are used to acquire data. Only the FS voltage, SSC voltage and the threshold are adjustable.  All other settings are predetermined in the control file.

- Cytometer settings file (Global vs tube): The global cytometer settings file is located directly under the experiment name. After collection this file is automatically copied to each tube run and is saved with each tube.

- Parameter usage: determining the detectors needed for each experiment and delete all parameters not being used in the experiment. This is located in the inspector window period.

- Creating a new experiment: Under the Experiments drop down select new experiment. This will bring up previously saved templates. Select your template or under the general tab find New Experiment with blank sample tube. _Experiments must be labeled with your hutch net ID first and then the days date (mmddyr)._

- Creating a new experimental template file: Templates must be labeled using your hutch net ID and then the name of your experiment.

- Export FCS v. 3.0 files: While other formats can be exported always export using this format.

## QC Bead Setup

### Cytometer Setup and Tracking (CST) Beads
  1. Under Cytometer select CST. This will open up a window for running a cytometer setup and tracking performance check.
  2. Remove the HTS coupler.
  3. Load a facs tube with the bead LOT number that corresponds to the bead lot set for this machine. If the LOT number is listed as 0000 check with the flow lab staff for the current bead lot number for that machine.
  4. Click Run to start the setup and tracking script.
  5. Hopefully, the CST performance check has passed. Then you click finish and exit out of the CST setup window. If the CST performance does not pass. Proceed to the Ultra Rainbow section below and check the CVs. If they are all \&lt;10 then it is fine to run your samples.
  6. A prompt will then appear asking what settings you would like to use. You will select `Use CST Settings` as you have just run a performance check that passed on the CST beads.
  7. Remove the CST beads from the cytometer.



### Ultra-Rainbow (UR) Beads 3.8
  1. Click the green arrow to the left of the date you have created after opening up the DIVA software.
  2. Load the UR 3.8 beads onto the cytometer and select `Run` and `low` for the speed. Keep the fine adjusted speed at 250.
  3. In the DIVA software click acquire. Ensure that the beads are falling within the set gates, then click Record.
  4. After the 10,000 events are recorded, unload the tube and record the values corresponding values for FSC, FITC etcetera in the cytometers binder.
  5. Once the UR values are recorded click File and select logout. This will bring you to the DIVA start screen. On the drop down Select FHCRC and enter. No password is needed.
  6. Create a new daily folder and label it with the current days date: mm/dd/yr.


## Connecting to your Fred Hutch User Account to Transfer Data

 1. Click on windows explorer, which is the file icon near the windows home icon (lower left corner)
 1. Right click on `Network` and select `map network drive…`
 1. A new window will appear. Select any letter drive and then select `\\homelink\homes`. Then check the box next to connect using different user.
 1. Enter the following to connect to your Fred Hutch account: `fhcrc.org\_your username_`, then `_Your password_`

 1. Right click on your experiment. Select export and fcs files. They should be `FCS v. 3.0` and the files should be in `linear` mode. Export to the file you want in your account that you just connected.
 1. Once transfer is complete, disconnect your account by again right clicking on `Network,` but now select `disconnect network drive…`
 1. Close your experiment and sign out of iLab.


## Canto II Instrument Setup and Operation
### Starting up the Cytometer

1. Start the cytometer by pressing the GREEN button on the side of the machine.
2. Turn on the computer and log on to the admin user for windows using the password (see Flow Core Staff for these).
3. Sign into iLab using your Hutch Net ID.
4. Open the DIVA software. Run the fluidics start up and Bead QC in the administrator profile. No password is needed.

### Fluidics

1. Be sure that the HTS coupler is connected to the probe before running setup. If not, slightly loosen the coupler and insert the probe until it is flush. Then screw tight the coupler to fasten it to the probe.
2. On the desktop left click on the Facs DIVA software. On the drop down Select Administrator and enter. No password is needed.
3. A prompt will then appear asking what settings you would like to use. You will select `Use CST Settings` as you have just run a performance check that passed on the CST beads.
4. Open the file for the current year for UR and select the experiment for current month. Expand out the specimen and add a new tube label this tube with the current days date: mm/dd/yr

#### Startup after turning on the lasers

1. From the drop down, menu at the top select Cytometer, then select Cleaning Modes and Prime Tank after Fill. A window will appear with three boxes that can be check marked. Check all three boxes, then select Run.  Perform this action twice.
```
[✓](https://en.wiktionary.org/wiki/%E2%9C%93) FACSFlow

[✓](https://en.wiktionary.org/wiki/%E2%9C%93) Shutdown Solution

[✓](https://en.wiktionary.org/wiki/%E2%9C%93) Cleaning Solution
```

2. From the drop down, menu at the top select Cytometer, then select Bubble Filter Purge and Degas Flow Cell. Perform this action twice.
3. From the drop down, menu at the top select Cytometer, then select Fluidics Startup. A window will appear notifying you that this action will take 10 minutes to complete. Click Run to proceed.
4. See Section on QC bead setup and continue with the alignment procedures using CST and Ultra rainbow beads before running.

#### Shutdown Specifics
  1. Be sure that the HTS coupler is connected to the probe before running setup. If not, slightly loosen the coupler and insert the probe until it is flush. Then screw tight the coupler to fasten it to the probe.
  2. From the drop down, menu at the top select Cytometer, then select Fluidics Shutdown. A window will appear notifying you that this action will take 5 minutes to complete. Click Run to proceed.
  3. Once completed. Click Ok Press the GREEN button on the side of the cytometer to turn off the machine.
  4. On the computer close all software and running programs, but DO NOT log out from iLab.
  5. Click the windows home icon and select shutdown. A window will appear asking if you want to force the shutdown while iLab is running. Select force shutdown. This will turn the computer and monitors off.



## LSR II Instrument Setup and Operation


### Starting up the Cytometer

1. Start the cytometer by pressing the GREEN button. Once the tank is pressurized bleed air from the filter attached to the sheath fluid line.
2. Turn on the computer and log on to the admin user for windows using the password: BDIS#1
3. Sign into iLab using your hutch net ID.
4. After powering on the cytometer by pressing the GREEN button, the red laser must be turned on. This is done by clicking on the `Fiber Laser` software application icon on the desktop. Clicking this will open up the application seen in Figure 1.
5. Press the `On` button in the application window to turn on the laser.
6. Set the power level to 200 by typing it in the `Power set` section. Then click `Activate.`
7. The current mA (milliamps) should increase, which indicates that the laser is powered on.  Fiber laser application for turning on the red laser. Power must be set to **200mW.**
1. If the current, power, and SHG temp. values are blank without green numbering, then you are not connected to the correct com port.
2. You must click the com port icon in the upper left-hand corner of the window and select **com serial port 1**.


### Fluidics

#### Startup after turning on the lasers

1. Prime the fluidics by pressing the PRIME button twice.
2. Place a facs tube with 40% Contrad onto the cytometer and run on high at a flow rate of 500 for 5 minutes. Do this by turning the black dial all the way clockwise.
3. Bleed the filters so that the lines are free of air bubbles.
4. Prime the fluidics by pressing the PRIME button twice.
5. Replace the tube containing contrad with a tube containing blue detergent (Coulter Clenz) and let run for 5 minutes.
6. Prime the fluidics by pressing the PRIME button twice.
7. Replace the tube containing detergent with a tube containing ethanol (EtOH) and let run for 5 minutes.
8. Replace the tube containing ethanol with a tube containing DI water and let run for 5 minutes.
9. Remove the tube and press prime while the stage is off to the side. Wait until the STANDBY button turns on (amber color).
10. See section III. for turning on appropriate lasers for running alignment and samples. See Section V. for QC bead setup and continue with the alignment procedures using CST and Ultra rainbow beads.

#### Shutdown

1. Place a facs tube with 10% bleach (NaOCl) onto the cytometer and run on high at a flow rate of 500 for 5 minutes.
2. Replace the tube containing bleach with a tube containing blue detergent (Coulter Clenz) and let run for 5 minutes.
3. Replace the tube containing detergent with a tube containing DI water and let run for 5 minutes.
4. Press the GREEN button on the front of the cytometer to turn off the machine.
5. On the computer close all software and running programs, but DO NOT log out from iLab.
6. Click the windows home icon and select shutdown. A window will appear asking if you want to force the shutdown while iLab is running. Select force shutdown. This will turn the computer and monitors off.


## Symphony and Fortessa X-50 Instrument Setup and Operation


### Starting up the Cytometer

1. Start the cytometer by pressing the GREEN button. Once the tank is pressurized bleed air from the filter attached to the sheath fluid line.
2. Turn on the computer and log on to the admin user for windows using the password: BDIS#1
3. Sign into iLab using your hutch net ID.
4. After powering on the cytometer by pressing the GREEN button, the red laser must be turned on. This is done by clicking on the `Fiber Laser` software application icon on the desktop. Clicking this will open up the application seen in Figure 1.
5. Press the `On` button in the application window to turn on the laser.
6. Set the power level to 200 by typing it in the `Power set` section. Then click `Activate.`
7. The current mA (milliamps) should increase, which indicates that the laser is powered on. Fiber laser application for turning on the red laser. Power must be set to **200mW.**
1. If the current, power, and SHG temp. values are blank without green numbering, then you are not connected to the correct com port.
2. You must click the com port icon in the upper left-hand corner of the window and select the appropriate com port ( **Symphony 1: 11, Symphony 2: 9 and Fortessa X-50: 6** ).  Fiber laser application with COM port number 11 selected.
1. Double click the BD Coherent icon on the desktop and the coherent software will open as seen in Figure 3.
2. The 355nm laser does not automatically start when opening the program and must be started manually.  Enter **65** as the mW power then click laser STOP and laser START. This should start the laser and all four should then be operational.

### Fluidics

#### Startup after turning on the lasers

1. Prime the fluidics by pressing the PRIME button twice.
2. Place a facs tube with 40% Contrad onto the cytometer and run on high at a flow rate of 500 for 5 minutes.
3. Bleed the filters so that the lines are free of air bubbles.
4. Prime the fluidics by pressing the PRIME button twice.
5. Replace the tube containing contrad with a tube containing blue detergent (Coulter Clenz) and let run for 5 minutes.
6. Prime the fluidics by pressing the PRIME button twice.
7. Replace the tube containing detergent with a tube containing ethanol (EtOH) and let run for 5 minutes.
8. Replace the tube containing ethanol with a tube containing DI water and let run for 5 minutes.
9. Remove the tube and press prime while the stage is off to the side. Wait until the STANDBY button turns on (amber color).
10. See section III. for turning on appropriate lasers for running alignment and samples. See Section V. for QC bead setup and continue with the alignment procedures using CST and Ultra rainbow beads.

#### Shutdown

1. Place a facs tube with 10% bleach (NaOCl) onto the cytometer and run on high at a flow rate of 500 for 5 minutes.
2. Replace the tube containing bleach with a tube containing blue detergent (Coulter Clenz) and let run for 5 minutes.
3. Replace the tube containing detergent with a tube containing DI water and let run for 5 minutes.
4. Press the GREEN button on the side of the cytometer to turn off the machine.
5. On the computer close all software and running programs, but DO NOT log out from iLab.
6. Click the windows home icon and select shutdown. A window will appear asking if you want to force the shutdown while iLab is running. Select force shutdown. This will turn off the computer and monitors. 
