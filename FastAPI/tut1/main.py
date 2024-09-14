from fastapi import FastAPI

app  = FastAPI()

@app.get("/")
def index():
    return "Hello from Stackup :D Answer is A"