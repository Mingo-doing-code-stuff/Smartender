# Verwende das offizielle Go-Image als Basis
FROM golang:1.20-alpine

# Setze das Arbeitsverzeichnis im Container
WORKDIR /app

# Kopiere die .env Datei (falls vorhanden)
COPY .env .

# Kopiere die Go-Modul-Dateien und installiere Abhängigkeiten
COPY go.mod go.sum ./
RUN go mod download

# Kopiere den gesamten Quellcode in das Arbeitsverzeichnis
COPY . .

# Baue das Go-Binary (sollte auf main.go zeigen)
RUN go build -o main .

# Exponiere den Port, auf dem der Service laufen wird
EXPOSE 8080

# Starte das Go-Programm
CMD ["./main"]