def create_profile():
    from selenium import webdriver
    fp = webdriver.FirefoxProfile()
    fp.set_preference("dom.webnotifications.enabled", False)
    fp.update_preferences()
    return fp.path