# Python (FastAPI) service for Kubernetes on Wodby

Build and run Python (FastAPI) applications on Kubernetes with Wodby.

This repository defines the Wodby service manifests and operational
configuration for Python (FastAPI).

- [Browse Wodby services](https://wodby.com/services)
- [Wodby service documentation](https://wodby.com/docs/2.0/services/)
- [Service manifest reference](https://wodby.com/docs/2.0/services/template/)

## Start with a template

Use one of the source templates exposed by this service to start with
compatible build configuration and Wodby CI:

- [FastAPI boilerplate](https://github.com/wodby/fastapi-boilerplate)

## Wodby stacks using this service

- [FastAPI application stack](https://github.com/wodby/stack-fastapi)

## Service overview

| Property | Manifest configuration |
| --- | --- |
| Service name | `fastapi` |
| Type | Application service |
| Inherits from | [`python`](https://github.com/wodby/service-python) with version constraint `^1.0.0` |
| Application build | Git source connection enabled; Dockerfile: `Dockerfile`; starters: FastAPI boilerplate |

## Use this service

Use this service through [FastAPI application stack](https://github.com/wodby/stack-fastapi), or reference `fastapi` from a
custom Wodby stack.

A service is a reusable component and does not deploy by itself. The stack
defines its links, settings, versions, resources, and relationship to the rest
of the application.

## Maintain a custom version

1. Fork this repository.
2. Edit the service manifest and referenced files.
3. Import the repository as a [Git-backed service](https://wodby.com/docs/2.0/services/create/#create-a-git-backed-service).
4. Reference the service from a stack manifest.

Keep service, workload, container, endpoint, link, volume, config, and
derivative names stable unless dependent stacks and app-level overrides are
updated at the same time.

Validate the manifests with:

```bash
wodby service validate-manifest service.yml --org <org-id>
```

See the [service manifest reference](https://wodby.com/docs/2.0/services/template/) and the [managed services index](https://github.com/wodby/services).
