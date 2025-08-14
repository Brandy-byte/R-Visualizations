### ggseg for visualization of the results 
library(ggseg)
library(dplyr)
library(ggplot2)
library(data.table)

#df <- fread("C:/Users/Brand/OneDrive/Documents/asymmetry_lm_results(1).csv")
set.seed(123)
df <- data.frame(
  region = ("_bankssts_thickness", "_caudalanteriorcingulate_thickness","_caudalmiddlefrontal_thickness", "_cuneus_thickness", "_entorhinal_thickness", "_fusiform_thickness", "_inferiorparietal_thickness", "_inferiortemporal_thickness", "_isthmuscingulate_thickness", "_lateraloccipital_thickness", "_lateralorbitofrontal_thickness", "_lingual_thickness", "_medialorbitofrontal_thickness", "_middletemporal_thickness", "_parahippocampal_thickness", "_paracentral_thickness", "_parsopercularis_thickness", "_parsorbitalis_thickness", "_parstriangularis_thickness", "_pericalcarine_thickness", "_postcentral_thickness", "_posteriorcingulate_thickness", "_precentral_thickness", "_precuneus_thickness", "_rostralanteriorcingulate_thickness", "_rostralmiddlefrontal_thickness", "_superiorfrontal_thickness", "_superiorparietal_thickness", "_superiortemporal_thickness", "_supramarginal_thickness", "_frontalpole_thickness", "_temporalpole_thickness", "_transversetemporal_thickness", "_insula_thickness", "_MeanThickness_thickness"),
  estimate = runif(38, -0.5, 0.5),
  p_adj = runif(38, 0.01, 0.2)
)

df <- data.frame(region_ai =df$region, estimate = df$estimate, p_adj = df$p_adj)


data_clean <- df %>%
  mutate(region_clean = paste0("lh_", gsub("^AI_|_thickness$", "", region_ai)))


sig_threshold <- 0.05
data_clean <- data_clean %>%
  mutate(sig = p_adj < sig_threshold)


ggseg_data <- data_clean %>%
  rename(label = region_clean, value = estimate)

# Step 4: Plot    #Main Plot Image
ggseg_data %>% 
  ggseg(mapping=aes(fill=ifelse(sig == "TRUE",value,0), size = I(0.05),color = sig), position="stacked") +
  scale_color_manual(values=c("black", "black"), guide = "none") +
  scale_fill_gradientn(colours=c("dodgerblue4","lightblue","white","firebrick","goldenrod"), limits = c(-0.1, 0.1)) +labs(fill = "Estimate") 


control<- subset(dr, Dx == "CONTROL")
cases<- subset(dr, Dx == "PATIENT-DEL")
mean(control$AI_pericalcarine_thickness) #significant difference / do mean for all brain regions
mean(cases$AI_pericalcarine_thickness)



#Region Means dataframe  CONTROL Mean Plot
library(tidyr)
region_means <- control[,84:118] %>%
  
  summarise(across(where(is.numeric), ~ mean(.x, na.rm = TRUE))) %>%
  
  pivot_longer(everything(), names_to = "region_ai", values_to = "mean_value")

#/////
df<-region_means
data_clean <- df %>%
  mutate(region_clean = paste0("lh_", gsub("^AI_|_thickness$", "", region_ai)))

ggseg_data <- data_clean %>%
  rename(label = region_clean, value = mean_value)

# Step 4: Plot
ggseg_data %>% 
  ggseg(mapping=aes(fill=value, size = I(0.05)), position="stacked") +
  scale_color_manual(values=c("black", "black"), guide = "none") +
  scale_fill_gradientn(colours=c("dodgerblue4","lightblue","white","firebrick","goldenrod"), limits = c(-0.1, 0.1)) +labs(fill = "Estimate") 



#/// Cases Mean Plot
library(tidyr)
region_means <- cases [,84:118] %>%
  
  summarise(across(where(is.numeric), ~ mean(.x, na.rm = TRUE))) %>%
  
  pivot_longer(everything(), names_to = "region_ai", values_to = "mean_value")

#/////
df<-region_means
data_clean <- df %>%
  mutate(region_clean = paste0("lh_", gsub("^AI_|_thickness$", "", region_ai)))

ggseg_data <- data_clean %>%
  rename(label = region_clean, value = mean_value)

# Step 4: Plot
ggseg_data %>% 
  ggseg(mapping=aes(fill=value, size = I(0.05)), position="stacked") +
  scale_color_manual(values=c("black", "black"), guide = "none") +
  scale_fill_gradientn(colours=c("dodgerblue4","lightblue","white","firebrick","goldenrod"), limits = c(-0.1, 0.1)) +labs(fill = "AI") 


