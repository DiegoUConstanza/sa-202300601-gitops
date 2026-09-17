{{/*
Expand the name of the chart.
*/}}
{{- define "cursos-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "cursos-service.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cursos-service.labels" -}}
helm.sh/chart: {{ include "cursos-service.name" . }}-{{ .Chart.Version | replace "+" "_" }}
{{ include "cursos-service.selectorLabels" . }}
app.kubernetes.io/version: {{ .Values.image.tag | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cursos-service.selectorLabels" -}}
app: {{ include "cursos-service.name" . }}
app.kubernetes.io/name: {{ include "cursos-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
