import heroku3

try:
    if Var.HEROKU_APP_NAME not in heroku3.from_key(Var.HEROKU_API_KEY).apps():
        raise Exception(f"Invalid HEROKU_APP_NAME  {Var.HEROKU_APP_NAME}")
except Exception as e:
    print(str(e))
