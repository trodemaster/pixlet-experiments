load("render.star", "render")
load("http.star", "http")


def main():

  resp = http.get("https://westwoodland.net/current_minimal.json")
  if resp.status_code != 200:
    fail("Request failed %d, resp.status_code")
    print(resp.status_code)

  # get current temp
  current_temp = resp.json()["current"]["temperature"]["value"]
  current_temp = float(int(current_temp*10))/10
  current_temp_string = str(current_temp) + "F"

  return render.Root(
      delay = 500,
      child = render.Box(
          child = render.Text(
                      content = current_temp_string,
                      font = "6x13",
                  )
          ),
      )