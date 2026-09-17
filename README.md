# Repositorio GitOps — sa-202300601-gitops

Repositorio de manifiestos y configuracion declarativa para el despliegue de microservicios con GitOps (ArgoCD, Argo Rollouts, Helm, Kyverno y SealedSecrets).

## Estructura

- `charts/`: Charts de Helm independientes por cada microservicio (`auth-service`, `cursos-service`, `inscripciones-service`, `progreso-service`, `gateway`).
- `argocd/`: Manifiestos de ArgoCD bajo patron App of Apps.
- `policies/`: Politicas de seguridad de clúster con Kyverno.
- `sealed-secrets/`: Secretos sellados y encriptados de forma segura con SealedSecrets.
