json.discoveredAppliances do
  json.array! Device.all do |device|
    json.extract! device, :applianceId, :manufacturerName, :modelName, :version, :friendlyName, :friendlyDescription
    json.isReachable true
    json.actions ['turnOn', 'turnOff']
  end
end