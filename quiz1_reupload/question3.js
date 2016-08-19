var majorCities = {BC: ["Vancouver","Victoria","Prince George"], AB: ["Edmonton", "Calgary"]};

for (var province in majorCities) {
  console.log(province + " has " + majorCities[province].length + " major cities.");
}
