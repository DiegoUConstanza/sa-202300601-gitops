{{/*
Expand the name of the chart.
*/}}
{{- define "inscripciones-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "inscripciones-service.fullname" -}}
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
{{- define "inscripciones-service.labels" -}}
helm.sh/chart: {{ include "inscripciones-service.name" . }}-{{ .Chart.Version | replace "+" "_" }}
{{ include "inscripciones-service.selectorLabels" . }}
app.kubernetes.io/version: {{ .Values.image.tag | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "inscripciones-service.selectorLabels" -}}
app: {{ include "inscripciones-service.name" . }}
app.kubernetes.io/name: {{ include "inscripciones-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
