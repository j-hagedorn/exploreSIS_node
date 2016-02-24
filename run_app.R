
## TRANSFORM DATA ##

  ## Define local source of SIS data
  sis_src <- "Paste/path/to/SIS/data/here"
  
  ## Transform using standard script
  source("https://raw.githubusercontent.com/j-hagedorn/exploreSIS/master/prep/readSIS.R")
  
  ## Map Medicaid IDs to current CMHSPs (and other vars) 
  ## Attribution file should be a pipe "|" delimited file containing 'mcaid_id',
  ## 'cmhsd_id' and 'as_of_dt' as the first 3 variables.
    attribution <- "Paste/path/to/attribution/file/here"
    
  ## Transform using standard script
  source("https://raw.githubusercontent.com/j-hagedorn/exploreSIS/master/prep/read_attribution.R")
  
  ## Apply any local transformations saved in PIHP-level script
  source("prep/housekeeping.R")
  
  ## Encrypt IDs and create scrubbed file for app!!!
  source("https://raw.githubusercontent.com/j-hagedorn/exploreSIS/master/prep/scrub.R")

  # Import total # needing assessment per CMHSP from local script
  source("prep/totals.R")
  
#####################################################################

## BUILD APP FROM CENTRAL REPO ##

  ## Download most recent global.R file and save in node repo
  download.file(url = "https://raw.githubusercontent.com/j-hagedorn/exploreSIS/master/global.R", 
                destfile = "global.R")
  
  ## Download most recent ui.R file and save in node repo
  download.file(url = "https://raw.githubusercontent.com/j-hagedorn/exploreSIS/master/ui.R", 
                destfile = "ui.R")
  
  ## Download most recent server.R file and save in node repo
  download.file(url = "https://github.com/j-hagedorn/exploreSIS/blob/master/server.R", 
                destfile = "server.R")

#####################################################################
  
## RUN APP
  
library(shiny)

# Change path to your local repo
runApp("../exploreSIS_node")
