sort_string() {
  echo $1 | grep -o . | sort | tr -d '\n'
}