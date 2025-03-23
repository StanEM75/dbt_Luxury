# Imports
import pandas as pd
import streamlit as st

# Load data
df = pd.read_csv('Select_Your_Hotel.csv')

# Replace 0/1 values with Yes
columns = ['SWIMMING_POOL','SPA','FITNESS_CENTRE','PET_FRIENDLY','FAMILY_FRIENDLY','BEACH','CINEMA','SHOPPING']

for col in columns:
    df[col] = df[col].replace({0: 'No', 1: 'Yes'})

# Remove Rank column
df = df.drop(columns=['RANK'])

# Rename columns
columns = ['Name', 'Place', 'Number of Rooms', 'Entry Price ($)', 'Swimming Pool', 
           'Spa', 'Fitness Centre', 'Pet-Friendly', 'Family-Friendly', 'Beach', 
           'Cinema', 'Shopping Places Around']

df.columns = columns

# Give a title
st.title("🔍 Tailor-Made Hotel Selection")

# Selection criteria
# City
locations = list(df["Place"].unique())  # 🔄 Convertit en liste

# Null option for City
locations.insert(0, "-- Select a city --")

selected_location = st.selectbox("City", sorted(locations))

# Max Price
max_price = st.slider("Your Budget (USD)", 
                      min_value=int(df["Entry Price ($)"].min()), 
                      max_value=int(df["Entry Price ($)"].max()), 
                      value=int(df["Entry Price ($)"].max()))

# Create columns
col1, col2 = st.columns(2)

# First range of filters
with col1:
    pool = st.checkbox("Swimming Pool")
    spa = st.checkbox("Spa")
    fitness = st.checkbox("Fitness Centre")
    beach = st.checkbox("Beach")

with col2:
    pets = st.checkbox("Pet-Friendly")
    family = st.checkbox("Family-Friendly")
    cinema = st.checkbox("Cinema")
    shopping = st.checkbox("Shopping Centers Around")

# Filter out
filtered_df = df[df["Place"] == selected_location]
filtered_df = filtered_df[filtered_df["Entry Price ($)"] <= max_price]

# Binary filters
if pool:
    filtered_df = filtered_df[filtered_df["Swimming Pool"] == 1]
if spa:
    filtered_df = filtered_df[filtered_df["Spa"] == 1]
if fitness:
    filtered_df = filtered_df[filtered_df["Fitness Centre"] == 1]
if pets:
    filtered_df = filtered_df[filtered_df["Pet-Friendly"] == 1]
if family:
    filtered_df = filtered_df[filtered_df["Family-Friendly"] == 1]
if beach:
    filtered_df = filtered_df[filtered_df["Beach"] == 1]
if cinema:
    filtered_df = filtered_df[filtered_df["Cinema"] == 1]
if shopping:
    filtered_df = filtered_df[filtered_df["Shopping Places Around"] == 1]

# Result
if not filtered_df.empty:
    st.success("Here is a hotel corresponding to your expectations:")
    st.dataframe(filtered_df.sample(1).reset_index(drop=True))
else:
    st.warning("No hotels match your criteria. Try other filters.")
