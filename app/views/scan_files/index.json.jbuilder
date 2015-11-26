json.array!(@scan_files) do |scan_file|
  json.extract! scan_file, :id, :result
  json.url scan_file_url(scan_file, format: :json)
end
