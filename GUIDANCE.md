# FastAPI on Wodby

What this service adds to the Python service it is based on.

## Variables the service sets

| Variable | Meaning |
| --- | --- |
| `GUNICORN_APP` | `main:app`: the ASGI application is the object `app` in `main.py` at the root of the repository. Change the variable on the service when it lives elsewhere. |
| `GUNICORN_WORKER_CLASS` | `uvicorn_worker.UvicornWorker`. Gunicorn stays the process manager and runs the application through Uvicorn workers. |
| `WORKSPACE_PYTHON_COMMAND` | The start command of a development workspace, see below. |

The worker class comes from the `uvicorn-worker` package. The image does not include it, nor Gunicorn: both must be among the application's dependencies. Without `uvicorn-worker` Gunicorn fails to start.

Do not add a `uvicorn` start command to the Dockerfile and do not change the port: the container still starts Gunicorn on port 8080, as described for the Python service. The number of workers is `GUNICORN_WORKERS`.

## Linked services

The service adds no link variables. The database, mail and Redis or Valkey variables of the Python service apply unchanged, and the application reads them itself. FastAPI has no settings convention of its own: the names to read are exactly the ones listed for the Python service.

## In a development workspace

The application is started with Uvicorn instead of Gunicorn:

```
python -m uvicorn "$GUNICORN_APP" --host "$HOST" --port "$PORT" --reload
```

`uvicorn` is installed by workspace preparation as a dependency of `uvicorn-worker`. Its reloader picks up a saved Python file without a restart; `WATCHFILES_FORCE_POLLING` is set, so the `watchfiles` reloader polls when that package is installed. A change to dependencies needs workspace preparation again.

## Check the result

- `curl -s localhost:8080/openapi.json` from the container returns the generated schema when the application is up, unless the project disabled it.
