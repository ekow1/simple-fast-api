from fastapi import FastAPI

app = FastAPI(
    title="Fast API App",
    description="A simple Fast API application",
    version="1.0.0",
)

@app.get("/")
def read_root():
    return {"message": "Hello from FastAPI using uv"}

@app.get("/health")
def health_check():
    return {"status": "ok"}