#API project : STARWARS API
#objective : API request
import requests as req
import time
import pandas as pd

planets = []

for i in range(10): #loop i from 0 to 4
    url = f"https://swapi.dev/api/planets/{i + 1}"
    resp = req.get(url)

    if resp.status_code == 200:
        json_data = resp.json()
        planets.append(
            (json_data["name"],
             json_data["climate"],
             json_data["population"],
             json_data["terrain"]) #append as tuple
            )
    time.sleep(1) #break 1 sec before request API for proctect increase loading on server

# Convert list to a dataframe
df = pd.DataFrame(planets, columns=["name", "climate", "population", "terrain"])

# Clean missing values
df["population"] = df["population"].replace('unknown', np.nan)
df = df.dropna().reset_index()
df
