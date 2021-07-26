from selenium import webdriver 
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

options = webdriver.ChromeOptions()
#options.add_argument("--disable-extensions")
#options.add_argument("--disable-gpu")
options.add_argument("--no-sandbox")
#options.add_argument("--headless")

driver = webdriver.Remote(
    command_executor='http://selenium-hub:4444',
    options=options,
    desired_capabilities=DesiredCapabilities.CHROME)
#    desired_capabilities=DesiredCapabilities.FIREFOX)

try:
    # get a HTML response
    driver.get("https://qiita.com/Syn256")
except:
    driver.close()
    exit(-1)
page = driver.page_source  # more sophisticated methods may be available
print(page)
 
driver.close()