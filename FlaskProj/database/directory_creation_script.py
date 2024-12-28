import os

# Step 1: Define the base directory and other parameters
base_directory = "match_history"
seasons = 6  # Number of seasons
years_per_season = 19  # Number of years per season

# Step 2: Define the months
months = ["January", "February", "March", "April", "May", "June",
          "July", "August", "September", "October", "November", "December"]

# Step 3: Create the directory structure
for season in range(1, seasons + 1):
    for year in range(1, years_per_season + 1):
        year_directory = os.path.join(base_directory, f"season_{season}", f"year_{year}")
        
        # Create the year directory if it doesn't exist
        os.makedirs(year_directory, exist_ok=True)
        
        # Create the monthly subfolders
        for month in months:
            month_directory = os.path.join(year_directory, month)
            os.makedirs(month_directory, exist_ok=True)

print("Directory structure created successfully.")
