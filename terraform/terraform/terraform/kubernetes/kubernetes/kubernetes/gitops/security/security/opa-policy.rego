package kubernetes.admission

deny[msg] {
  input.request.kind.kind == "Pod"
  input.request.object.spec.containers[_].securityContext.runAsUser == 0
  msg = "Containers must not run as root"
}
