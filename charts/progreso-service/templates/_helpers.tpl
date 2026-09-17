{{/*
Expand the name of the chart.
*/}}
{{- define "progreso-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "progreso-service.fullname" -}}
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
{{- define "progreso-service.labels" -}}
helm.sh/chart: {{ include "progreso-service.name" . }}-{{ .Chart.Version | replace "+" "_" }}
{{ include "progreso-service.selectorLabels" . }}
app.kubernetes.io/version: {{ .Values.image.tag | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "progreso-service.selectorLabels" -}}
app: {{ include "progreso-service.name" . }}
app.kubernetes.io/name: {{ include "progreso-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
