json.array!(@stops) do |stop|
  json.id           stop.id
  json.on_street    stop.on_street.titlecase
  json.cross_street stop.cross_street.titlecase
  json.stop_id      stop.stop_id
end