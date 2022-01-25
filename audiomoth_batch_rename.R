# Introduction

# Author Information 
# Adapted from: Tessa Rhinehart (https://github.com/rhine3)
# Author: Adam Grottoli
# Email: grottoli4@gmail.com

# Description: This code can be used to batch convert hexadecimal date/time to local time YYYYMMDD_HHMMSS 

# Change the directory to match the file path where the audio files are saved
top_dir <- "P:/Conservation_Research/Restricted/CRD/Research Projects/Chimney Swifts/Audiomoth/audiomoth data/APZ 2019 - Copy"
for (file in list.files(top_dir)){
  old_filepath <- paste(top_dir, file, sep="/")
  print(paste("Old filepath:", old_filepath))
  hex_code <- tools::file_path_sans_ext(basename(old_filepath))
  seconds <- strtoi(hex_code, base=16)
  
  true_time <- as.POSIXct(seconds, origin="1970-01-01")
  formatted <- strftime(true_time, "%Y%m%d_%H%M%S")
  new_filepath <- paste(top_dir, "/", formatted, ".WAV", sep="")
  print(paste("New filepath:", new_filepath))
  file.rename(from=old_filepath, to=new_filepath)
}
# Check to make sure file renaming worked before deleteing original files!!! 